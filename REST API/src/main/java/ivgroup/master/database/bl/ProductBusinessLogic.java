package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.aspect.EmailAspect;
import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.ClientDAOImpl;
import ivgroup.master.database.dao.impl.ProductDAOImpl;
import ivgroup.master.database.dto.client.ClientSelect;
import ivgroup.master.database.dto.product.ProductInsert;
import ivgroup.master.database.dto.product.ProductSelect;
import ivgroup.master.database.dto.product.ProductUpdate;

@Service
public class ProductBusinessLogic{

	@Autowired
	ProductDAOImpl pdi;
	
	@Autowired
	ClientDAOImpl cdi;
	
	Logger logger =LoggerFactory.getLogger(ProductBusinessLogic.class);
	
	public ResponseEntity<List<ProductSelect>> selectProducts()  {
		List<ProductSelect> lps=new ArrayList<ProductSelect>();
		try {
			lps=pdi.selectProducts();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lps.isEmpty()) {
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.OK);
	}

	public ResponseEntity<List<ProductSelect>> selectProductsByCompanyId(Long companyId)  {
		List<ProductSelect> lps=new ArrayList<ProductSelect>();
		if(companyId==null)
		{
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.BAD_REQUEST);
		}
		try {
			lps=pdi.selectProductsByCompanyId(companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lps.isEmpty()) {
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.OK);
	}
	
	public ResponseEntity<List<ProductSelect>> selectProductsByOwnerId(Long ownerId)  {
		List<ProductSelect> lps=new ArrayList<ProductSelect>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.BAD_REQUEST);
		}
		try {
			lps=pdi.selectProductsByOwnerId(ownerId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lps.isEmpty()) {
			return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ProductSelect>>(lps,HttpStatus.OK);
	}
	

	public ResponseEntity<ProductSelect> selectProductsByProductId(Long productId)  {
		ProductSelect ps=new ProductSelect();
		if(productId==null)
		{
			return new ResponseEntity<ProductSelect>(ps,HttpStatus.BAD_REQUEST);
		}
		try {
			ps=pdi.selectProductsByProductId(productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<ProductSelect>(ps,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<ProductSelect>(ps,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ps==null) {
			return new ResponseEntity<ProductSelect>(ps,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<ProductSelect>(ps,HttpStatus.OK);
	}
	
	public ResponseEntity<Void> addProduct(ProductInsert pi)  
	{
		if(pi==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.addProduct(pi);
			 List<ClientSelect> clientList=cdi.selectClientByCompanyId(pi.getCompanyId());
			 Iterator<ClientSelect> iterator=clientList.iterator();
			 while(iterator.hasNext())
			 {
				 ClientSelect client=iterator.next();
				
				  try {
					EmailAspect.sendEmailWithoutAttachment(client.getEmailId(), "TO",
					  "IVCRM: New Product Added",
					  "    <div id=\"BodyContents\" style=\"width: 100%;height: 55%;\">\r\n" + 
					  "        <div id=\"Placeholder\" style=\"width: 100%;height: 2%;\"></div>\r\n" + 
					  "        <div id=\"MainDiv\" style=\" width: 100%;height: 100%;align-self: center; background-image: linear-gradient(to bottom right, rgba(255, 255, 255, 0.3),rgba(255, 255, 255, 0.3), rgba(241, 118, 36, 0.3))\">\r\n" + 
					  "            <div id=\"Text \" style=\"font-size: large;color:rgb(71, 70, 70);font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif; \">\r\n" + 
					  "                Hello "+client.getContactPerson()+",\r\n" + 
					  "                <BR />A New Product has been added by "+client.getCompanyName()+"\r\n" + 
					  "                <BR />A Person from "+client.getCompanyName()+" will contact you soon.\r\n" + 
					  "                <BR />\r\n" + 
					  "                <BR />\r\n" + 
					  "                <strong>Details Of Product:</strong>\r\n" + 
					  "                <BR />\r\n" + 
					  "                <table style=\"border: 1px solid black;border-collapse: collapse;\">\r\n" + 
					  "                    <tr style=\"border: 1px solid black;\">\r\n" + 
					  "                        <td style=\"border: 1px solid black;padding:15px;padding-left: 20px;padding-right: 20px;\">Product Name: </td>\r\n" + 
					  "                        <td style=\"border: 1px solid black;padding:15px;padding-left: 20px;padding-right: 20px;\">"+pi.getProductName()+"</td>\r\n" + 
					  "                    </tr>\r\n" + 
					  "                    <tr style=\"border: 1px solid black;\">\r\n" + 
					  "                        <td style=\"border: 1px solid black;padding:15px;padding-left: 20px;padding-right: 20px;\">Product Description: </td>\r\n" + 
					  "                        <td style=\"border: 1px solid black;padding:15px;padding-left: 20px;padding-right: 20px;\">"+pi.getProductDescription()+"</td>\r\n" + 
					  "                    </tr>\r\n" + 
					  "                    <tr style=\"border: 1px solid black;\">\r\n" + 
					  "                        <td style=\"border: 1px solid black;padding:15px;padding-left: 20px;padding-right: 20px;\">Product Cost: </td>\r\n" + 
					  "                        <td style=\"border: 1px solid black;padding:15px;padding-left: 20px;padding-right: 20px;\">"+pi.getCost()+"\r\n" + 
					  "                            <font color=\"#FFD700\"><strong>&#8377;</strong></font>\r\n" + 
					  "                        </td>\r\n" + 
					  "                    </tr>\r\n" + 
					  "                </table>\r\n" + 
					  "                <BR />\r\n" + 
					  "                <font size=\"3px\">You can lookup for more details in IVCRM App</font>\r\n" + 
					  "                <BR />\r\n" + 
					  "                <BR />Thank you for beeing with us,\r\n" + 
					  "                <BR /><strong>IVCRM</strong>\r\n" + 
					  "            </div>\r\n" + 
					  "\r\n" + 
					  "        </div>\r\n" + 
					  "    </div>",
					  "text/html");
				} catch (MessagingException e) {
					logger.error("Exception: "+e.getMessage());
					return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
				 
			 }
		} catch (ClassNotFoundException e) { 
			logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { 
			logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<Void> deleteProduct(Long productId)  
	{
		if(productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.deleteProduct(productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	

	private ResponseEntity<Void> updateProductProductName(Connection c,String productName, Long productId)
	{
		if(productName==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductProductName(c,productName, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateProductProductDescription(Connection c,String productDescription, Long productId)
	{
		if(productDescription==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductProductDescription(c,productDescription, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateProductCost(Connection c,Double cost, Long productId)  
	{
		if(cost==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductCost(c,cost, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateProductIsActive(Connection c,Boolean isActive, Long productId)  
	{
		if(isActive==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductIsActive(c,isActive, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateProductCompanyId(Connection c,Long companyId, Long productId)  
	{
		if(companyId==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductCompanyId(c,companyId, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateProductLastEditOn(Connection c,Timestamp lastEditOn, Long productId)
	{
		if(lastEditOn==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductLastEditOn(c,lastEditOn, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateProductLastEditBy(Connection c,Long lastEditBy, Long productId)
	{
		if(lastEditBy==null||productId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=pdi.updateProductLastEditBy(c,lastEditBy, productId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}


	public ResponseEntity<Void> updateProductFields(Long productId,ProductUpdate pu)
	{
		if(productId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
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
		if(pu.getProductName()!=null) {
			rs=updateProductProductName(c,pu.getProductName(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(pu.getProductDescription()!=null) {
			rs=updateProductProductDescription(c,pu.getProductDescription(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(pu.getIsActive()!=null) {
			rs=updateProductIsActive(c,pu.getIsActive(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(pu.getCompanyId()!=null) {
			rs=updateProductCompanyId(c,pu.getCompanyId(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(pu.getCost()!=null) {
			rs=updateProductCost(c,pu.getCost(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;	
		if(pu.getLastEditBy()!=null) {
			rs=updateProductLastEditBy(c,pu.getLastEditBy(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(pu.getLastEditOn()!=null) {
			rs=updateProductLastEditOn(c,pu.getLastEditOn(),productId);
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
						
		try {
				c.close();
			}catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
					return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
	return new ResponseEntity<Void>(HttpStatus.OK); 						
	}
	
	

}
