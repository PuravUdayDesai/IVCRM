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
import ivgroup.master.database.dao.impl.CompanyAddressDetailsDAOImpl;
import ivgroup.master.database.dto.companyAddressDetails.CompanyAddressDetailsSelect;
import ivgroup.master.database.dto.companyAddressDetails.CompanyAddressDetailsUpdate;

@Service
public class CompanyAddressDetailsBusinessLogic {
	
@Autowired
CompanyAddressDetailsDAOImpl cabi;

Logger logger =LoggerFactory.getLogger(CompanyAddressDetailsBusinessLogic.class);
	
public ResponseEntity<List<CompanyAddressDetailsSelect>> selectCompanyAddressDetails() {
	List<CompanyAddressDetailsSelect> lcs=new ArrayList<CompanyAddressDetailsSelect>();
	try {
	lcs=cabi.selectCompanyAddressDetails();
	} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
		return new ResponseEntity<List<CompanyAddressDetailsSelect>>(lcs,HttpStatus.NOT_FOUND);
	} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
		return new ResponseEntity<List<CompanyAddressDetailsSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
	}
	if(lcs.isEmpty()) {
		return new ResponseEntity<List<CompanyAddressDetailsSelect>>(lcs,HttpStatus.NO_CONTENT);
	}
	return new ResponseEntity<List<CompanyAddressDetailsSelect>>(lcs,HttpStatus.OK);
}

		public ResponseEntity<Void> deleteCompanyAddressDetails(Long companyAddressId) {
			if(companyAddressId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.deleteCompanyAddressDetails(companyAddressId);
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

		private ResponseEntity<Void> updateCompanyAddressDetailsAddressLine1(Connection c,Long companyAddressId,String addressLine1){
			if(companyAddressId==null||addressLine1==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsAddressLine1(c,companyAddressId, addressLine1);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsAddressLine2(Connection c,Long companyAddressId,String addressLine2){
			if(companyAddressId==null||addressLine2==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsAddressLine2(c,companyAddressId, addressLine2);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsAddressLine3(Connection c,Long companyAddressId,String addressLine3){
			if(companyAddressId==null||addressLine3==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsAddressLine3(c,companyAddressId, addressLine3);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsCityId(Connection c,Long companyAddressId,Long cityId){
			if(companyAddressId==null||cityId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsCityId(c,companyAddressId, cityId);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsStateId(Connection c,Long companyAddressId,Long stateId){
			if(companyAddressId==null||stateId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsStateId(c,companyAddressId, stateId);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsCountryId(Connection c,Long companyAddressId,Long countryId){
			if(companyAddressId==null||countryId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsCountryId(c,companyAddressId, countryId);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsLatitude(Connection c,Long companyAddressId,String latitude){
			if(companyAddressId==null||latitude==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsLatitude(c,companyAddressId, latitude);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsLongitude(Connection c,Long companyAddressId,String longitude){
			if(companyAddressId==null||longitude==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsLongitude(c,companyAddressId, longitude);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsGeoLocation(Connection c,Long companyAddressId,String geoLocation){
			if(companyAddressId==null||geoLocation==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsGeoLocation(c,companyAddressId, geoLocation);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsPincode(Connection c,Long companyAddressId,Long pincode){
			if(companyAddressId==null||pincode==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsPincode(c,companyAddressId, pincode);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsLastEditOn(Connection c,Long companyAddressId,Timestamp lastEditOn){
			if(companyAddressId==null||lastEditOn==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsLastEditOn(c,companyAddressId, lastEditOn);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsLastEditBy(Connection c,Long companyAddressId,Long lastEditBy){
			if(companyAddressId==null||lastEditBy==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsLastEditBy(c,companyAddressId, lastEditBy);
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
		private ResponseEntity<Void> updateCompanyAddressDetailsLastEditDeviceType(Connection c,Long companyAddressId,Integer lastEditDeviceType){
			if(companyAddressId==null||lastEditDeviceType==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			Boolean rs;
			try {
				rs = cabi.updateCompanyAddressDetailsLastEditDeviceType(c,companyAddressId, lastEditDeviceType);
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
	public ResponseEntity<Void> updateCompanyAddressDetails(Long companyAddressDetailId,CompanyAddressDetailsUpdate cbu){
		
		String latitude="";
		String longitude="";
		try {
			latitude=cabi.getLatitude(companyAddressDetailId);
			longitude=cabi.getLongitude(companyAddressDetailId);
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
				rs=updateCompanyAddressDetailsAddressLine1(c,companyAddressDetailId, cbu.getAddressLine1());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getAddressLine2()!=null) {
				rs=updateCompanyAddressDetailsAddressLine2(c,companyAddressDetailId, cbu.getAddressLine2());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getAddressLine3()!=null) {
				rs=updateCompanyAddressDetailsAddressLine3(c,companyAddressDetailId, cbu.getAddressLine3());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getCityId()!=null) {
				rs=updateCompanyAddressDetailsCityId(c,companyAddressDetailId,cbu.getCityId());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getStateId()!=null) {
				rs=updateCompanyAddressDetailsStateId(c,companyAddressDetailId,cbu.getStateId());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getCountryId()!=null) {
				rs=updateCompanyAddressDetailsCountryId(c,companyAddressDetailId,cbu.getCountryId());
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
				rs=updateCompanyAddressDetailsLatitude(c,companyAddressDetailId,cbu.getLatitude());
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
				rs=updateCompanyAddressDetailsLongitude(c,companyAddressDetailId,cbu.getLongitude());
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
				rs=updateCompanyAddressDetailsPincode(c,companyAddressDetailId,cbu.getPincode());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLastEditOn()!=null) {
				rs=updateCompanyAddressDetailsLastEditOn(c,companyAddressDetailId,cbu.getLastEditOn());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLastEditBy()!=null) {
				rs=updateCompanyAddressDetailsLastEditBy(c,companyAddressDetailId,cbu.getLastEditBy());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
			wentIn=false;
			return rs;
			}
			rs=null;
			if(cbu.getLastEditDeviceType()!=null) {
				rs=updateCompanyAddressDetailsLastEditDeviceType(c,companyAddressDetailId,cbu.getLastEditDeviceType());
				wentIn=true;
			}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;
			if(rsLatitude||rsLongitude) {
				rs=updateCompanyAddressDetailsGeoLocation(c,companyAddressDetailId,latitude+","+longitude);
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
