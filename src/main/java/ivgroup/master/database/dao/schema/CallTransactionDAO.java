package ivgroup.master.database.dao.schema;

import java.io.IOException;
import java.net.MalformedURLException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ivgroup.master.database.dto.callTransaction.CallTransactionInsert;
import ivgroup.master.database.dto.callTransaction.CallTransactionSelect;

import org.springframework.core.io.Resource;

public interface CallTransactionDAO {

	public String storeFile(MultipartFile file,CallTransactionInsert cti)															throws IOException;
	public Boolean addCallTransaction(CallTransactionInsert cti,String fileURL,String qualifiedFilePath)							throws SQLException,ClassNotFoundException;
	public Resource loadFile(String fileURL)																						throws MalformedURLException;
	public List<CallTransactionSelect> selectCallTransactionsByCompanyExecutiveId(Long companyExecutiveId)							throws SQLException,ClassNotFoundException;
	public List<CallTransactionSelect> selectCallTransactionsByCompanyExecutiveIdAndCallDate(Long companyExecutiveId,Date callDate)	throws SQLException,ClassNotFoundException;
}
