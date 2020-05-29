package ivgroup.master.database.dao.schema;

import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.geoMapPlotting.EnquiryGeoMapPlotting;

public interface EnquiryGeoMapPlottingDAO 
{
	public List<EnquiryGeoMapPlotting>	getEnquiryGeoMapPlottingByOwnerId(Long ownerId)														throws SQLException,ClassNotFoundException;
	public List<EnquiryGeoMapPlotting>	getEnquryGeoMapPlottingByCompanyId(Long companyId)													throws SQLException,ClassNotFoundException;
	public List<EnquiryGeoMapPlotting>	getEnquiryGeoMapPlottingByCountry(Long ownerId,Long countryId)										throws SQLException,ClassNotFoundException;
	public List<EnquiryGeoMapPlotting>	getEnquiryGeoMapPlottingByState(Long ownerId,Long countryId,Long stateId)							throws SQLException,ClassNotFoundException;
	public List<EnquiryGeoMapPlotting>	getEnquiryGeoMapPlottingByCity(Long ownerId,Long countryId,Long stateId,Long cityId)				throws SQLException,ClassNotFoundException;
	public List<EnquiryGeoMapPlotting>	getEnquiryGeoMapPlottingByArea(Long ownerId,Long countryId,Long stateId,Long cityId,Long areaId)	throws SQLException,ClassNotFoundException;
	public List<EnquiryGeoMapPlotting>	getEnquiryGeoMapPlottingByCompanyExecutive(Long companyExecutiveId)									throws SQLException,ClassNotFoundException;
}
