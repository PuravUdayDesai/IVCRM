package ivgroup.master.database.dao.schema;

import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.geoMapPlotting.CompanyGeoMapPlotting;

public interface CompanyGeoMapPlottingDAO
{
	public List<CompanyGeoMapPlotting>	getComapnyByOwnerId(Long ownerId)											throws SQLException,ClassNotFoundException;
	public List<CompanyGeoMapPlotting>	getCompanyByCountry(Long ownerId,Long countryId)							throws SQLException,ClassNotFoundException;
	public List<CompanyGeoMapPlotting>	getCompanyByState(Long ownerId,Long countryId,Long stateId)					throws SQLException,ClassNotFoundException;
	public List<CompanyGeoMapPlotting>	getCompanyByCity(Long ownerId,Long countryId,Long stateId,Long cityId)		throws SQLException,ClassNotFoundException;
}
