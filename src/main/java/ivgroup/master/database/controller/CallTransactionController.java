package ivgroup.master.database.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CallTransactionBusinessLogic;
import ivgroup.master.database.dto.callTransaction.CallTransactionInsert;
import ivgroup.master.database.dto.callTransaction.CallTransactionSelect;

@RestController
@RequestMapping("/callTransaction")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CallTransactionController {

	@Autowired
	CallTransactionBusinessLogic ctbl;
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping
	 public ResponseEntity<Void> uploadFile(@RequestPart("file") MultipartFile file,
			 								@RequestPart("data") @Valid CallTransactionInsert cti)
	 {
		return ctbl.addCallTransaction(file, cti);
	 }
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="{companyExecutiveId}")
	public ResponseEntity<List<@Valid CallTransactionSelect>> selectCallTransactionsByCompanyExecutiveId(@PathVariable @NotNull Long companyExecutiveId)
	{
		return ctbl.selectCallTransactionsByCompanyExecutiveId(companyExecutiveId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping
	public ResponseEntity<List<@Valid CallTransactionSelect>> selectCallTransactionsByCompanyExecutiveIdAndCallDate(
			@RequestParam(name="companyExecutiveId") @NotNull Long companyExecutiveId,
			@RequestParam(name="callDate")@JsonFormat(pattern = "yyyy-MM-dd", timezone = "IST") @NotNull Date callDate)
	{
		return ctbl.selectCallTransactionsByCompanyExecutiveIdAndCallDate(companyExecutiveId,callDate);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(path="/file")
	public ResponseEntity<Resource> loadFile(@RequestBody @NotNull Path filePath, HttpServletRequest request)
	{
		return ctbl.loadFile(filePath.toString(),request);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@RequestMapping("/fileView")
	public void viewFile(HttpServletRequest request, 
									HttpServletResponse response,
									@RequestParam("filePath") String filePath, 
									@RequestParam("fileName") String fileName) throws IOException {
		
		 ctbl.viewFile(request, response, filePath, fileName);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@RequestMapping("/fileDownload")
	public void downloadFile(HttpServletRequest request, 
									HttpServletResponse response,
									@RequestParam("filePath") String filePath, 
									@RequestParam("fileName") String fileName) throws IOException {
		
		 ctbl.downloadFile(request, response, filePath, fileName);
	}
	
	
	
}
