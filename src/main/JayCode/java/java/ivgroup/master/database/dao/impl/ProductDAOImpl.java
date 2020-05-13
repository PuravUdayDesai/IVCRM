package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.ProductDAO;
import ivgroup.master.database.dto.product.ProductInsert;
import ivgroup.master.database.dto.product.ProductSelect;

@Service
public class ProductDAOImpl implements ProductDAO{

	@Override
	public List<ProductSelect> selectProducts() throws SQLException, ClassNotFoundException 
	{
		List<ProductSelect> lps=new ArrayList<ProductSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"product\".\"fn_selectProduct\"();");
		ResultSet rs=stmt.executeQuery();
		
		while(rs.next())
		{
		lps.add(new ProductSelect(
				rs.getLong("id"),
				rs.getString("productName"),
				rs.getString("productDescription"),
				rs.getLong("companyId"),
				rs.getString("companyName"),
				rs.getDouble("cost"),
				rs.getLong("createdBy"),
				rs.getTimestamp("createdOn"),
				rs.getLong("lastEditBy"),
				rs.getTimestamp("lastEditOn"),
				rs.getBoolean("isActive")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
				
		return lps;
	}

	@Override
	public List<ProductSelect> selectProductsByCompanyId(Long companyId) throws SQLException, ClassNotFoundException 
	{
		List<ProductSelect> lps=new ArrayList<ProductSelect>();
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"product\".\"fn_selectProductByCompanyId\"(?);");
		stmt.setLong(1, companyId);
		ResultSet rs=stmt.executeQuery();
		
		while(rs.next())
		{
		lps.add(new ProductSelect(
				rs.getLong("id"),
				rs.getString("productName"),
				rs.getString("productDescription"),
				rs.getLong("companyId"),
				rs.getString("companyName"),
				rs.getDouble("cost"),
				rs.getLong("createdBy"),
				rs.getTimestamp("createdOn"),
				rs.getLong("lastEditBy"),
				rs.getTimestamp("lastEditOn"),
				rs.getBoolean("isActive")
				));	
		}
		rs.close();
		stmt.close();
		c.close();
				
		return lps;
	}

	@Override
	public ProductSelect selectProductsByProductId(Long productId) throws SQLException, ClassNotFoundException 
	{
		ProductSelect ps=null;
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"product\".\"fn_selectProductByProductId\"(?);");
		stmt.setLong(1, productId);
		ResultSet rs=stmt.executeQuery();
		
		while(rs.next())
		{
		ps=new ProductSelect(
				rs.getLong("id"),
				rs.getString("productName"),
				rs.getString("productDescription"),
				rs.getLong("companyId"),
				rs.getString("companyName"),
				rs.getDouble("cost"),
				rs.getLong("createdBy"),
				rs.getTimestamp("createdOn"),
				rs.getLong("lastEditBy"),
				rs.getTimestamp("lastEditOn"),
				rs.getBoolean("isActive")
				);	
		}
		rs.close();
		stmt.close();
		c.close();
				
		return ps;
	}

	@Override
	public Boolean updateProductProductName(Connection c,String productName, Long productId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductproductName\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setString(2,productName);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductproductName");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateProductProductDescription(Connection c,String productDescription, Long productId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductproductDescription\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setString(2,productDescription);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductproductDescription");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateProductCost(Connection c,Double cost, Long productId) throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductcost\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setDouble(2,cost);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductcost");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateProductIsActive(Connection c,Boolean isActive, Long productId) throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductisActive\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setBoolean(2,isActive);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductisActive");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateProductCompanyId(Connection c,Long companyId, Long productId) throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductcompanyId\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setLong(2,companyId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductcompanyId");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateProductLastEditOn(Connection c,Timestamp lastEditOn, Long productId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductLastEditOn\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setTimestamp(2,lastEditOn);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductLastEditOn");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean updateProductLastEditBy(Connection c,Long lastEditBy, Long productId)throws SQLException, ClassNotFoundException 
	{
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_updateProductLastEditBy\"(?,?)");
		stmt.setLong(1, productId);
		stmt.setLong(2,lastEditBy);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_updateProductLastEditBy");
		}
		rs.close();
		stmt.close();
		return rsMain;
	}

	@Override
	public Boolean addProduct(ProductInsert pi) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_insertProduct\"(?, ?, ?, ?, ?, ?);");
		stmt.setString(1,pi.getProductName());
		stmt.setString(2, pi.getProductDescription());
		stmt.setLong(3, pi.getCompanyId());
		stmt.setDouble(4, pi.getCost());
		stmt.setLong(5, pi.getCreatedBy());
		stmt.setTimestamp(6, pi.getCreatedOn());
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_insertProduct");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public Boolean deleteProduct(Long productId) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT product.\"fn_deleteProduct\"(?)");
		stmt.setLong(1, productId);
		ResultSet rs=stmt.executeQuery();
		c.commit();
		Boolean rsMain=false;
		if(rs.next()) {
			rsMain=rs.getBoolean("fn_deleteProduct");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

}
