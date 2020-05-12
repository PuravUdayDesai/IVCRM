package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.StatusDAOImpl;
import ivgroup.master.database.dto.status.StatusInsert;
import ivgroup.master.database.dto.status.StatusSelect;
import ivgroup.master.database.dto.status.StatusUpdate;

@Service
public class StatusBusinessLogic
{
	@Autowired
	StatusDAOImpl sdi;

	
	public ResponseEntity<List<StatusSelect>> selectStatusByCompanyId(Long companyId) 
	{
		List<StatusSelect> lss=new ArrayList<StatusSelect>();
		if(companyId==null)
		{
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.BAD_REQUEST);
		}
		try {
			lss=sdi.selectStatusByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lss.isEmpty())
		{
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.OK);
	}
	
	public ResponseEntity<List<StatusSelect>> selectStatusByOwnerId(Long ownerId) 
	{
		List<StatusSelect> lss=new ArrayList<StatusSelect>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.BAD_REQUEST);
		}
		try {
			lss=sdi.selectStatusByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lss.isEmpty())
		{
			return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<StatusSelect>>(lss,HttpStatus.OK);
	}

	
	public ResponseEntity<Void> addStatus(StatusInsert si)
	{
		if(si==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.addStatus(si);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<Void> deleteStatus(Long statusId) 
	{
		if(statusId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.deleteStatus(statusId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateStatusStatusName(Connection c, Long statusId, String statusName)
	{
		if(statusId==null||statusName==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.updateStatusStatusName(c, statusId, statusName);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			System.out.println("StatusName");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStatusStatusColorCode(Connection c, Long statusId, String statusColorCode)
	{
		if(statusId==null||statusColorCode==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.updateStatusStatusColorCode(c, statusId, statusColorCode);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			System.out.println("StatusColorCode");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStatusWorkProgress(Connection c, Long statusId, Integer workProgress)
	{
		if(statusId==null||workProgress==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.updateStatusWorkProgress(c, statusId, workProgress);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			System.out.println("WorkProgress");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStatusCompanyId(Connection c, Long statusId, Long companyId)
	{
		if(statusId==null||companyId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.updateStatusCompanyId(c, statusId, companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			System.out.println("Company");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStatusLastEditBy(Connection c, Long statusId, Long lastEditBy)
	{
		if(statusId==null||lastEditBy==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.updateStatusLastEditBy(c, statusId, lastEditBy);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			System.out.println("LastEditBy");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStatusLastEditOn(Connection c, Long statusId, Timestamp lastEditOn)
	{
		if(statusId==null||lastEditOn==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=sdi.updateStatusLastEditOn(c, statusId, lastEditOn);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			System.out.println("LastEditOn");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> updateStatusFields(Long statusId,StatusUpdate su)
	{
		if(statusId==null||su==null)
		{
			System.out.println("Here");
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c=null;
		try {
			 c=ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs=null;
		Boolean wentIn=false;
		if(su.getStatusName()!=null) {
			rs=updateStatusStatusName(c, statusId,su.getStatusName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(su.getStatusColorCode()!=null) {
			rs=updateStatusStatusColorCode(c, statusId,su.getStatusColorCode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(su.getWorkProgress()!=null) {
			rs=updateStatusWorkProgress(c, statusId,su.getWorkProgress());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(su.getCompanyId()!=null) {
			rs=updateStatusCompanyId(c, statusId,su.getCompanyId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(su.getLastEditBy()!=null) {
			rs=updateStatusLastEditBy(c, statusId,su.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(su.getLastEditOn()!=null) {
			rs=updateStatusLastEditOn(c, statusId,su.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		try {
			c.close();
		}catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Void>(HttpStatus.OK); 
		
	}
}
