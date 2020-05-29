package ivgroup.master.database.dao.schema;

import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.geoMapPlotting.CompanyExecutiveGeoMapPlotting;

public interface CompanyExecutiveGeoMapPlottingDAO 
{
	public List<CompanyExecutiveGeoMapPlotting>		getCompanyExecutiveGeoMapByOwnerId(Long ownerId)											throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoMapPlotting>		getCompanyExecutiveGeoMapByCompanyId(Long companyId)										throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoMapPlotting>		getCompanyExecutiveGeoMapByCountryId(Long ownerId,Long countryId)							throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoMapPlotting>		getCompanyExecutiveGeoMapByStateId(Long ownerId,Long countryId,Long stateId)				throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoMapPlotting>		getCompanyExecutiveGeoMapByCityId(Long ownerId,Long countryId,Long stateId,Long cityId)		throws SQLException,ClassNotFoundException;
}
