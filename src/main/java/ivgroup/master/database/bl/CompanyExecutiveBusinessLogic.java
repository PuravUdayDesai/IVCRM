package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.CompanyExecutiveDAOImpl;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveInsert;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveLogin;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveSelect;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveUpdate;
import ivgroup.master.database.service.IVUserDetailsService;
import ivgroup.master.database.util.JwtUtil;

@Service
public class CompanyExecutiveBusinessLogic {
	
	@Autowired
	CompanyExecutiveDAOImpl cdi;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
    @Autowired
    private AuthenticationManager authenticationManager;
    
    @Autowired
    private JwtUtil jwtUtil;
	
    @Autowired
    private IVUserDetailsService ivUserDetailsService;
    
	public ResponseEntity<Void> addCompanyExecutive(CompanyExecutiveInsert cei)
	{
		if(cei==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			cei.setPassword(bCryptPasswordEncoder.encode(cei.getPassword()));
		 rs=cdi.addCompanyExecutive(cei);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}
	
	public ResponseEntity<Void> deleteCompanyExecutive(Long companyExecutiveId,Long companyId)
	{
		Long check=(long)-1;
		Boolean rs=false;
		try {
		check=cdi.checkCompanyExecutiveDeleteStatus(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(check>1)
		{
		Long checkDependency=(long)-1;
		try {
			checkDependency=cdi.checkCompanyExecutiveDeleteDependency(companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		Boolean rsSub=false;
		if(checkDependency==0)
		{
			try {
				rsSub=cdi.deleteCompanyExecutive(companyExecutiveId);
				} catch (ClassNotFoundException e) {
					return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
				} catch (SQLException e) {
					return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			if(!rsSub)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			else
			{
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
		}
		else
		{
			return new ResponseEntity<Void>(HttpStatus.FAILED_DEPENDENCY);
		}
		
		}
		else
		{
			try {
			rs=cdi.deleteCompanyExecutive(companyExecutiveId);
			} catch (ClassNotFoundException e) {
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException e) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		if(!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	
	public ResponseEntity<List<CompanyExecutiveSelect>> selectCompanyExecutive()
	{
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		try {
			lce=cdi.selectCompanyExecutive();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lce.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.OK);
		
	}
	public ResponseEntity<CompanyExecutiveSelect> selectCompanyByCompanyExecutiveId(Long companyExecutiveID)
	{
		CompanyExecutiveSelect ces=new CompanyExecutiveSelect();
		try {
			ces=cdi.selectCompanyExecutiveByCompanyExecutiveId(companyExecutiveID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<CompanyExecutiveSelect>(ces,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<CompanyExecutiveSelect>(ces,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ces.getExecutiveId()==null||ces==null)
		{
			return new ResponseEntity<CompanyExecutiveSelect>(ces,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CompanyExecutiveSelect>(ces,HttpStatus.OK);
		
	}	
	public ResponseEntity<List<CompanyExecutiveSelect>> selectCompanyExecutiveByCompanyId(Long companyId)
	{
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		if(companyId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.BAD_REQUEST);
		}
		try {
			lce=cdi.selectCompanyExecutiveByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lce.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.OK);
	}
	

	public ResponseEntity<List<CompanyExecutiveSelect>> selectCompanyExecutiveByOwnerId(Long ownerId) 
	{
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.BAD_REQUEST);
		}
		try {
			lce=cdi.selectCompanyExecutiveByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lce.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyExecutiveSelect>> selectCompanyExecutiveByCompanyBranchId(Long companyBranchId)
	{
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		if(companyBranchId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.BAD_REQUEST);
		}
		try {
			lce=cdi.selectCompanyExecutiveByCompanyBranchId(companyBranchId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lce.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutiveSelect>> selectCompanyExecutiveOfSubPosition(Long companyExecutiveId)
	{
		List<CompanyExecutiveSelect> lce=new ArrayList<CompanyExecutiveSelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.BAD_REQUEST);
		}
		try {
			lce=cdi.selectCompanyExecutiveOfSubPosition(companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lce.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveSelect>>(lce,HttpStatus.OK);
	}
	
	private  ResponseEntity<Void>  updateCompanyExecutiveExecutiveName(Connection c, Long companyExecutiveId, String executiveName)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveExecutiveName(c, companyExecutiveId, executiveName);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveLoginID(Connection c, Long companyExecutiveId, String loginID)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveLoginID(c, companyExecutiveId, loginID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutivePassword(Connection c, Long companyExecutiveId, String password)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutivePassword(c, companyExecutiveId, password);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveCompanyBranchID(Connection c, Long companyExecutiveId, Long companyBranchID)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveCompanyBranchID(c, companyExecutiveId, companyBranchID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveBaseCityID(Connection c, Long companyExecutiveId, Long baseCityID)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveBaseCityID(c, companyExecutiveId, baseCityID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveCompanyID(Connection c, Long companyExecutiveId, Long companyID)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveCompanyID(c, companyExecutiveId, companyID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveContactNumber(Connection c, Long companyExecutiveId, String contactNumber)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveContactNumber(c, companyExecutiveId, contactNumber);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveIsActive(Connection c, Long companyExecutiveId, Boolean isActive)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveIsActive(c, companyExecutiveId, isActive);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveLastEditOn(Connection c, Long companyExecutiveId, Timestamp lastEditOn)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveLastEditOn(c, companyExecutiveId, lastEditOn);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveLastEditBy(Connection c, Long companyExecutiveId, Long lastEditBy)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveLastEditBy(c, companyExecutiveId, lastEditBy);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	private  ResponseEntity<Void>  updateCompanyExecutiveLastEditDeviceType(Connection c, Long companyExecutiveId, Integer lastEditDeviceType)
	{
		Boolean rs=false;
		try {
			 rs=cdi.updateCompanyExecutiveLastEditDeviceType(c, companyExecutiveId, lastEditDeviceType);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	
	}
	
	public ResponseEntity<Void> updateCompanyExecutiveFields(Long companyExecutiveId,CompanyExecutiveUpdate cu) {
		if(cu==null) {
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

if(cu.getExecutiveName()!=null) {
			rs=updateCompanyExecutiveExecutiveName(c, companyExecutiveId, cu.getExecutiveName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getLoginId()!=null) {
			rs=updateCompanyExecutiveLoginID(c, companyExecutiveId, cu.getLoginId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getPassword()!=null) {
			rs=updateCompanyExecutivePassword(c, companyExecutiveId, cu.getPassword());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getCompanyBranchId()!=null) {
			rs=updateCompanyExecutiveCompanyBranchID(c, companyExecutiveId, cu.getCompanyBranchId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getBaseCityId()!=null) {
			rs=updateCompanyExecutiveBaseCityID(c, companyExecutiveId, cu.getBaseCityId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getCompanyId()!=null) {
			rs=updateCompanyExecutiveCompanyID(c, companyExecutiveId, cu.getCompanyId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getContactNumber()!=null) {
			rs=updateCompanyExecutiveContactNumber(c, companyExecutiveId, cu.getContactNumber());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getIsActive()!=null) {
			rs=updateCompanyExecutiveIsActive(c, companyExecutiveId, cu.getIsActive());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getLastEditOn()!=null) {
			rs=updateCompanyExecutiveLastEditOn(c, companyExecutiveId, cu.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getLastEditBy()!=null) {
			rs=updateCompanyExecutiveLastEditBy(c, companyExecutiveId, cu.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
if(cu.getLastEditDeviceType()!=null) {
			rs=updateCompanyExecutiveLastEditDeviceType(c, companyExecutiveId, cu.getLastEditDeviceType());
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
	
	public ResponseEntity<CompanyExecutiveLogin> loginCompanyExecutive(String loginId, String password) 
	{
		CompanyExecutiveLogin cel=null;
		if(loginId==null||password==null)
		{
			return new ResponseEntity<CompanyExecutiveLogin>(cel,HttpStatus.BAD_REQUEST);
		}
	       try
	        {
	            authenticationManager.authenticate(
	                    new UsernamePasswordAuthenticationToken(
	                           loginId,
	                           password
	                    ) );
	        }
	        catch (BadCredentialsException badCredentialsException)
	        {
	            throw new BadCredentialsException("Incorrect UserName And Password");
	        }
		try {
			cel=cdi.loginCompanyExecutive(loginId);
			
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<CompanyExecutiveLogin>(cel,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<CompanyExecutiveLogin>(cel,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(cel==null)
		{
			return new ResponseEntity<CompanyExecutiveLogin>(cel,HttpStatus.NO_CONTENT);
		}
        final UserDetails userDetails=ivUserDetailsService.loadUserByUsername( loginId );
        final String token=jwtUtil.generateToken( userDetails );
		cel.setAccessToken(token);
		return new ResponseEntity<CompanyExecutiveLogin>(cel,HttpStatus.OK);
	}


}
