package ivgroup.master.database.dao.impl;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import ivgroup.master.database.bl.CallTransactionBusinessLogic;
import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CallTransactionDAO;
import ivgroup.master.database.dto.callTransaction.CallTransactionInsert;
import ivgroup.master.database.dto.callTransaction.CallTransactionSelect;
import ivgroup.master.database.execption.FileStorageException;

@Service
public class CallTransactionDAOImpl implements CallTransactionDAO{

	@Override
	public String storeFile(MultipartFile file,CallTransactionInsert cti) throws IOException 
	{
        	String fileName = StringUtils.cleanPath(file.getOriginalFilename());

            if(fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }
            String path="E:/callTransaction/"+cti.getCompanyExecutiveId()+"/"+cti.getClientId()+"/"+CallTransactionBusinessLogic.replaceColonToPeriod(cti.getCallTime());
            File f=new File(path);
            if(!f.exists())
            {
            Boolean b=f.mkdirs();
            if(!b)
            {
            	throw new IOException("Cannot Create Director Specified: "+path);
            }
            }
            String qualifiedPath=path+"/"+fileName;
            Path targetLocation = Paths.get(qualifiedPath);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
            return qualifiedPath;
	}

	@Override
	public Boolean addCallTransaction(CallTransactionInsert cti,String fileURL,String qualifiedFilePath) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT \"callTransactions\".\"fn_insertCallTransaction\"(?,?,?,?,?,?,?,?,?);");
		stmt.setLong(1, cti.getClientId());
		stmt.setLong(2, cti.getCompanyExecutiveId());
		stmt.setString(3, cti.getClientNameOnCompanyExecutiveList());
		stmt.setString(4, cti.getClientContactNumber());
		stmt.setInt(5, cti.getCallType());
		stmt.setLong(6, cti.getTalkDuration());
		stmt.setTimestamp(7, cti.getCallTime());
		stmt.setString(8,fileURL);
		stmt.setString(9, qualifiedFilePath);
		ResultSet rs=stmt.executeQuery();
		Boolean rsMain=false;
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertCallTransaction");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Resource loadFile(String qualifiedFilePath) throws MalformedURLException {
        Path filePath = Paths.get(qualifiedFilePath);
        Resource resource = new UrlResource(filePath.toUri());
        return resource;
	}

	@Override
	public List<CallTransactionSelect> selectCallTransactionsByCompanyExecutiveId(
			Long companyExecutiveId) throws SQLException, ClassNotFoundException {
		
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"callTransactions\".\"fn_selectCallTransactionByCompanyExecutiveId\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		List<CallTransactionSelect> lr=new ArrayList<CallTransactionSelect>();
		while(rs.next())
		{
				lr.add(
					new CallTransactionSelect(
												rs.getLong("CallTransactionId"),
												rs.getLong("ClientId"),
												rs.getLong("CompanyExecutiveId"),
												rs.getString("ClientNameOnExecutiveContactList"),
												rs.getString("ClientContactNumber"),
												rs.getInt("CallType"),
												rs.getDouble("TalkDuration"),
												rs.getTimestamp("CallTime"),
												rs.getString("FileURL"),
												"PRIVATE FILE PATH"
												//rs.getString("FilePath").replace("\\","/")
											)
				);

		}
		rs.close();
		stmt.close();
		c.close();
		return lr;
	}

	@Override
	public List<CallTransactionSelect> selectCallTransactionsByCompanyExecutiveIdAndCallDate(Long companyExecutiveId,
			Date callDate) throws SQLException, ClassNotFoundException {
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"callTransactions\".\"fn_selectCallTransactionByCompanyExecutiveIdAndCallDate\"(?,?);");
		stmt.setLong(1, companyExecutiveId);
		stmt.setDate(2,callDate);
		ResultSet rs=stmt.executeQuery();
		List<CallTransactionSelect> lr=new ArrayList<CallTransactionSelect>();
		while(rs.next())
		{
				lr.add(
					new CallTransactionSelect(
												rs.getLong("CallTransactionId"),
												rs.getLong("ClientId"),
												rs.getLong("CompanyExecutiveId"),
												rs.getString("ClientNameOnExecutiveContactList"),
												rs.getString("ClientContactNumber"),
												rs.getInt("CallType"),
												rs.getDouble("TalkDuration"),
												rs.getTimestamp("CallTime"),
												rs.getString("FileURL"),
												"PRIVATE FILE PATH"
												//rs.getString("FilePath").replace("\\","/")
											)
				);

		}
		rs.close();
		stmt.close();
		c.close();
		return lr;
	}

}
