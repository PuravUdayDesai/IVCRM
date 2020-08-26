package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.CompanyBranchAddressDetailsDAOImpl;
import ivgroup.master.database.dto.companyBranchAddressDetails.CompanyBranchAddressDetailsSelect;
import ivgroup.master.database.dto.companyBranchAddressDetails.CompanyBranchAddressDetailsUpdate;

@Service
public class CompanyBranchAddressDetailsBusinessLogic {
	
@Autowired
CompanyBranchAddressDetailsDAOImpl cabi;

Logger logger =LoggerFactory.getLogger(CompanyBranchAddressDetailsBusinessLogic.class);

public ResponseEntity<List<CompanyBranchAddressDetailsSelect>> selectCompanyBranchAddressDetails() {
	List<CompanyBranchAddressDetailsSelect> lcs=new ArrayList<CompanyBranchAddressDetailsSelect>();
	try {
	lcs=cabi.selectCompanyBranchAddressDetails();
	} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
		return new ResponseEntity<List<CompanyBranchAddressDetailsSelect>>(lcs,HttpStatus.NOT_FOUND);
	} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
		
		return new ResponseEntity<List<CompanyBranchAddressDetailsSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
	}
	if(lcs.isEmpty()) {
		return new ResponseEntity<List<CompanyBranchAddressDetailsSelect>>(lcs,HttpStatus.NO_CONTENT);
	}
	return new ResponseEntity<List<CompanyBranchAddressDetailsSelect>>(lcs,HttpStatus.OK);
}

		public ResponseEntity<Void> deleteCompanyBranchAddressDetails(Long companyBranchAddressId)
		{
			if(companyBranchAddressId==null)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.deleteCompanyBranchAddressDetails(companyBranchAddressId);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsAddressLine1(Connection c,Long companyBranchAddressId,String addressLine1){
			if(companyBranchAddressId==null||addressLine1==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsAddressLine1(c,companyBranchAddressId, addressLine1);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsAddressLine2(Connection c,Long companyBranchAddressId,String addressLine2){
			if(companyBranchAddressId==null||addressLine2==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsAddressLine2(c,companyBranchAddressId, addressLine2);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsAddressLine3(Connection c,Long companyBranchAddressId,String addressLine3){
			if(companyBranchAddressId==null||addressLine3==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsAddressLine3(c,companyBranchAddressId, addressLine3);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsCityId(Connection c,Long companyBranchAddressId,Long cityId){
			if(companyBranchAddressId==null||cityId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsCityId(c,companyBranchAddressId, cityId);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsStateId(Connection c,Long companyBranchAddressId,Long stateId){
			if(companyBranchAddressId==null||stateId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsStateId(c,companyBranchAddressId, stateId);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsCountryId(Connection c,Long companyBranchAddressId,Long countryId){
			if(companyBranchAddressId==null||countryId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsCountryId(c,companyBranchAddressId, countryId);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsLatitude(Connection c,Long companyBranchAddressId,String latitude){
			if(companyBranchAddressId==null||latitude==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsLatitude(c,companyBranchAddressId, latitude);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsLongitude(Connection c,Long companyBranchAddressId,String longitude){
			if(companyBranchAddressId==null||longitude==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsLongitude(c,companyBranchAddressId, longitude);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsGeoLocation(Connection c,Long companyBranchAddressId,String geoLocation){
			if(companyBranchAddressId==null||geoLocation==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsGeoLocation(c,companyBranchAddressId, geoLocation);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsPincode(Connection c,Long companyBranchAddressId,Long pincode){
			if(companyBranchAddressId==null||pincode==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsPincode(c,companyBranchAddressId, pincode);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsLastEditOn(Connection c,Long companyBranchAddressId,Timestamp lastEditOn){
			if(companyBranchAddressId==null||lastEditOn==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsLastEditOn(c,companyBranchAddressId, lastEditOn);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsLastEditBy(Connection c,Long companyBranchAddressId,Long lastEditBy){
			if(companyBranchAddressId==null||lastEditBy==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsLastEditBy(c,companyBranchAddressId, lastEditBy);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
		private ResponseEntity<Void> updateCompanyBranchAddressDetailsLastEditDeviceType(Connection c,Long companyBranchAddressId,Integer lastEditDeviceType){
			if(companyBranchAddressId==null||lastEditDeviceType==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyBranchAddressDetailsLastEditDeviceType(c,companyBranchAddressId, lastEditDeviceType);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(rs) {
				return new ResponseEntity<Void>(HttpStatus.OK);
			}
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		//-------------------------------------------------------------------------------------------------------------------------------
	public ResponseEntity<Void> updateCompanyBranchAddressDetails(Long companyBranchAddressDetailId,CompanyBranchAddressDetailsUpdate cbu){
		
		String latitude="";
		String longitude="";
		try {
			latitude=cabi.getLatitude(companyBranchAddressDetailId);
			longitude=cabi.getLongitude(companyBranchAddressDetailId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		Connection c=null;
			try {
				 c=ConnectionProvider.getConnection();
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			ResponseEntity<Void> rs=null;
			Boolean wentIn=false;
			if(cbu.getAddressLine1()!=null) {
				rs=updateCompanyBranchAddressDetailsAddressLine1(c,companyBranchAddressDetailId, cbu.getAddressLine1());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getAddressLine2()!=null) {
				rs=updateCompanyBranchAddressDetailsAddressLine2(c,companyBranchAddressDetailId, cbu.getAddressLine2());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getAddressLine3()!=null) {
				rs=updateCompanyBranchAddressDetailsAddressLine3(c,companyBranchAddressDetailId, cbu.getAddressLine3());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getCityId()!=null) {
				rs=updateCompanyBranchAddressDetailsCityId(c,companyBranchAddressDetailId,cbu.getCityId());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getStateId()!=null) {
				rs=updateCompanyBranchAddressDetailsStateId(c,companyBranchAddressDetailId,cbu.getStateId());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getCountryId()!=null) {
				rs=updateCompanyBranchAddressDetailsCountryId(c,companyBranchAddressDetailId,cbu.getCountryId());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			Boolean rsLatitude=false;
			Boolean rsLongitude=false;
			if(cbu.getLatitude()!=null&&cbu.getLatitude()!=latitude) {
				rs=updateCompanyBranchAddressDetailsLatitude(c,companyBranchAddressDetailId,cbu.getLatitude());
				if(rs.getStatusCode()==HttpStatus.OK) {
					latitude=cbu.getLatitude();
				}
				rsLatitude=true;
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLongitude()!=null&&cbu.getLongitude()!=longitude) {
				rs=updateCompanyBranchAddressDetailsLongitude(c,companyBranchAddressDetailId,cbu.getLongitude());
				if(rs.getStatusCode()==HttpStatus.OK) {
					longitude=cbu.getLongitude();
				}
				rsLongitude=true;
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getPincode()!=null) {
				rs=updateCompanyBranchAddressDetailsPincode(c,companyBranchAddressDetailId,cbu.getPincode());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLastEditOn()!=null) {
				rs=updateCompanyBranchAddressDetailsLastEditOn(c,companyBranchAddressDetailId,cbu.getLastEditOn());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLastEditBy()!=null) {
				rs=updateCompanyBranchAddressDetailsLastEditBy(c,companyBranchAddressDetailId,cbu.getLastEditBy());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLastEditDeviceType()!=null) {
				rs=updateCompanyBranchAddressDetailsLastEditDeviceType(c,companyBranchAddressDetailId,cbu.getLastEditDeviceType());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;
			if(rsLatitude||rsLongitude) {
				rs=updateCompanyBranchAddressDetailsGeoLocation(c,companyBranchAddressDetailId,latitude+","+longitude);
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			try {
				c.close();
			}catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseEntity<Void>(HttpStatus.OK); 
	
	}

}
