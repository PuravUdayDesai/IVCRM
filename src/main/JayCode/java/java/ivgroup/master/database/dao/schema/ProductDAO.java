package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.product.ProductInsert;
import ivgroup.master.database.dto.product.ProductSelect;

public interface ProductDAO {

	public List<ProductSelect> 	selectProducts()																			throws SQLException,ClassNotFoundException;
	public List<ProductSelect> 	selectProductsByCompanyId(Long companyId)													throws SQLException,ClassNotFoundException;
	public ProductSelect 		selectProductsByProductId(Long productId)													throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductProductName(Connection c,String productName,Long productId)					throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductProductDescription(Connection c,String productDescription,Long productId)		throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductCost(Connection c,Double cost,Long productId)									throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductIsActive(Connection c,Boolean isActive,Long productId)							throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductCompanyId(Connection c,Long companyId,Long productId)							throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductLastEditOn(Connection c,Timestamp lastEditOn,Long productId)					throws SQLException,ClassNotFoundException;
	public Boolean 				updateProductLastEditBy(Connection c,Long lastEditBy,Long productId)						throws SQLException,ClassNotFoundException;
	public Boolean 				addProduct(ProductInsert pi)																throws SQLException,ClassNotFoundException;
	public Boolean 				deleteProduct(Long productId)																throws SQLException,ClassNotFoundException;
	
}
