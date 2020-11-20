package ivgroup.master.database.dao.schema;

import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.geoMapPlotting.CompanyBranchGeoMapPlotting;

public interface CompanyBranchGeoMapPlottingDAO
{
	public List<CompanyBranchGeoMapPlotting>	getCompaynBranchByOwnerId(Long ownerId)												throws SQLException,ClassNotFoundException;
	public List<CompanyBranchGeoMapPlotting>	getCompanyBranchByCompanyId(Long companyId)											throws SQLException,ClassNotFoundException;
	public List<CompanyBranchGeoMapPlotting>	getCompanyBranchByCountryId(Long ownerId,Long countryId)							throws SQLException,ClassNotFoundException;
	public List<CompanyBranchGeoMapPlotting>	getCompanyBranchByStateId(Long ownerId,Long countryId,Long stateId)					throws SQLException,ClassNotFoundException;
	public List<CompanyBranchGeoMapPlotting>	getCompanyBranchByCityId(Long ownerId,Long countryId,Long stateId,Long cityId)		throws SQLException,ClassNotFoundException;
}
