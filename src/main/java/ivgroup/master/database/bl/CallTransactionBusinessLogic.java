package ivgroup.master.database.bl;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URLConnection;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import ivgroup.master.database.dao.impl.CallTransactionDAOImpl;
import ivgroup.master.database.dto.callTransaction.CallTransactionInsert;
import ivgroup.master.database.dto.callTransaction.CallTransactionSelect;

@Service
public class CallTransactionBusinessLogic {

	@Autowired
	CallTransactionDAOImpl ctdi;
	
	Logger logger =LoggerFactory.getLogger(CallTransactionBusinessLogic.class);
	
	private static final String EXTERNAL_FILE_PATH = "{this.server.storage.root}"+"\\callTransaction\\";

	public static String fileGenere(String fileType) {
		String fileGenere="";
		for(int i=0;i<fileType.length();i++) {
			if(fileType.charAt(i)=='/') {
				break;
			}
			fileGenere+=(""+fileType.charAt(i));
		}
		return fileGenere;
	}
	
	private static String urlCreator(String filePath,String fileName) {
		//http://localhost:8080/fileDownload/view?filePath=member/documents/1/9&fileName=JSP complete reference.pdf
		String protocol="http://";
		String host="{this.server.hostname}";
		String portNumber="{this.server.portnumber}";
		String basePath="/callTransaction/fileView";
		String url=protocol+host+":"+portNumber+basePath+"?filePath="+filePath.replace("\\", "/")+"&fileName="+fileName;
		return url;
	}

	public static String replaceColonToPeriod(Timestamp t)
	{
		String str=t.toString();
		String newStr=str.replace(':', '.');
		return newStr;
	}
	
	public ResponseEntity<Void> addCallTransaction(MultipartFile file,CallTransactionInsert cti)
	{
		if(fileGenere(file.getContentType()).equalsIgnoreCase("audio")) {
		String fileURL="NEGATIVE";
		try {
			fileURL=ctdi.storeFile(file, cti);
		} catch (IOException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(fileURL.equals("NEGATIVE")||fileURL.isEmpty()||fileURL==null)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		String filePath=fileURL;
		fileURL=urlCreator("callTransaction/"+cti.getCompanyExecutiveId()+"/"+cti.getClientId()+"/"+CallTransactionBusinessLogic.replaceColonToPeriod(cti.getCallTime()),StringUtils.cleanPath(file.getOriginalFilename()));
		Boolean rs=false;
		try {
			rs=ctdi.addCallTransaction(cti, fileURL,filePath);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	
	public ResponseEntity<Resource> loadFile(String qualifiedFilePath, HttpServletRequest request)
	{
		Resource file=null;
		if(qualifiedFilePath==null)
		{
			return new ResponseEntity<Resource>(file,HttpStatus.BAD_REQUEST);
		}
		try {
			file=ctdi.loadFile(qualifiedFilePath);
		} catch (MalformedURLException e) {
			return new ResponseEntity<Resource>(file,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(file==null)
		{
			return new ResponseEntity<Resource>(file,HttpStatus.NO_CONTENT);
		}
		  String contentType = null;
	        try {
	            contentType = request.getServletContext().getMimeType(file.getFile().getAbsolutePath());
	        } catch (IOException ex) {
	        	return new ResponseEntity<Resource>(file,HttpStatus.INTERNAL_SERVER_ERROR);
	        }

	        if(contentType == null) {
	            contentType = "application/octet-stream";
	        }
	        return ResponseEntity.ok()
	                			.contentType(MediaType.parseMediaType(contentType))
	                			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
	                			.body(file);
	}
	
	public ResponseEntity<List<CallTransactionSelect>> selectCallTransactionsByCompanyExecutiveId(Long companyExecutiveId)
	{
		List<CallTransactionSelect> lr=new ArrayList<CallTransactionSelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.BAD_REQUEST);
		}
		try {
			lr=ctdi.selectCallTransactionsByCompanyExecutiveId(companyExecutiveId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lr.isEmpty()||lr==null)
		{
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CallTransactionSelect>> selectCallTransactionsByCompanyExecutiveIdAndCallDate(Long companyExecutiveId,Date callDate)
	{
		List<CallTransactionSelect> lr=new ArrayList<CallTransactionSelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.BAD_REQUEST);
		}
		try {
			lr=ctdi.selectCallTransactionsByCompanyExecutiveIdAndCallDate(companyExecutiveId,callDate);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lr.isEmpty()||lr==null)
		{
			return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CallTransactionSelect>>(lr,HttpStatus.OK);
	}
	
	public void viewFile(HttpServletRequest request, 
			HttpServletResponse response,
			String filePath, 
			String fileName){
			File file = new File(EXTERNAL_FILE_PATH + filePath + "\\" + fileName);
			
			if (file.exists()) {
				try {
				String mimeType = URLConnection.guessContentTypeFromName(file.getName());
				if (mimeType == null) {
					mimeType = "application/octet-stream";
				}
				//AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(file);
				//AudioFormat format = audioInputStream.getFormat();
				//long frames = audioInputStream.getFrameLength();
				//durationInSeconds = (frames+0.0) / format.getFrameRate();  
				//System.out.println("Duration: "+durationInSeconds);
				
				response.setContentType(mimeType);

				response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

				response.setContentLength((int) file.length());

				InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

				
					FileCopyUtils.copy(inputStream, response.getOutputStream());
				} catch (IOException e) {
					
				}
			}
	}
	
	public void downloadFile(HttpServletRequest request, 
			HttpServletResponse response,
			String filePath, 
			String fileName){
		try {
			File file = new File(EXTERNAL_FILE_PATH + filePath + "\\" + fileName);
			if (file.exists()) {
				String mimeType = URLConnection.guessContentTypeFromName(file.getName());
				if (mimeType == null) {
					mimeType = "application/octet-stream";
				}

				response.setContentType(mimeType);

				response.setHeader("Content-Disposition", String.format("attachment;filename=\"" + file.getName() + "\""));

				response.setContentLength((int) file.length());

				
				InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

				FileCopyUtils.copy(inputStream, response.getOutputStream());
			}
			
		}
		catch(IOException e) {
			
		}
	}
}
