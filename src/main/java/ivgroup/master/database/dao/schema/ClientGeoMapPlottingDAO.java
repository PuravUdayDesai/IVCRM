package ivgroup.master.database.dao.schema;

import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.geoMapPlotting.ClientGeoMapPlotting;

public interface ClientGeoMapPlottingDAO 
{

	public List<ClientGeoMapPlotting>	getClientGeoMapByOwnerId(Long ownerId)															throws SQLException,ClassNotFoundException;
	public List<ClientGeoMapPlotting>	getClientGeoMapByCompanyId(Long companyId)														throws SQLException,ClassNotFoundException;
	public List<ClientGeoMapPlotting>	getClientGeoMapByCountryId(Long ownerId,Long countryId)											throws SQLException,ClassNotFoundException;
	public List<ClientGeoMapPlotting>	getClientGeoMapByStateId(Long ownerId,Long countryId,Long stateId)								throws SQLException,ClassNotFoundException;
	public List<ClientGeoMapPlotting>	getClientGeoMapByCityId(Long ownerId,Long countryId,Long stateId,Long cityId)					throws SQLException,ClassNotFoundException;
	public List<ClientGeoMapPlotting>	getClientGeoMapByAreaId(Long ownerId,Long countryId,Long stateId,Long cityId,Long areaId)		throws SQLException,ClassNotFoundException;
	
}
