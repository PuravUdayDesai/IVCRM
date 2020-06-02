package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.ProductBusinessLogic;
import ivgroup.master.database.dto.product.ProductInsert;
import ivgroup.master.database.dto.product.ProductSelect;
import ivgroup.master.database.dto.product.ProductUpdate;

@RestController
@RequestMapping("/product")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class ProductController {

	@Autowired
	ProductBusinessLogic pbl;
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ProductSelect>> selectProducts()  
	{
		return pbl.selectProducts();
	}
	@GetMapping(path="/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ProductSelect>> selectProductsByCompanyId(@PathVariable @NotNull Long companyId)  
	{
		return pbl.selectProductsByCompanyId(companyId);
	}
	
	@GetMapping(path="/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ProductSelect>> selectProductsByOwnerId(@PathVariable @NotNull Long ownerId)  
	{
		return pbl.selectProductsByOwnerId(ownerId);
	}
	
	@GetMapping(path="/{productId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<@Valid ProductSelect> selectProductsByProductId(@PathVariable @NotNull Long productId)  
	{
		return pbl.selectProductsByProductId(productId);
	}
	
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addProduct(@RequestBody @Valid ProductInsert pi)  
	{
		return pbl.addProduct(pi);
	}
	@DeleteMapping(path="/{productId}")
	public ResponseEntity<Void> deleteProduct(@PathVariable @NotNull Long productId)  
	{
		return pbl.deleteProduct(productId);
	}
	@PutMapping(path = "/{productId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateProductFields(@PathVariable @NotNull Long productId,@RequestBody @Valid ProductUpdate pu)
	{	
		return pbl.updateProductFields(productId, pu);
	}
	
	
}
