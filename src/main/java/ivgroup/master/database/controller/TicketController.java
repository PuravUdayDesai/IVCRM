package ivgroup.master.database.controller;

import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.TicketBusinessLogic;
import ivgroup.master.database.dto.ticket.NonAccessibleExecutiveListSelect;
import ivgroup.master.database.dto.ticket.TicketAccessListInsert;
import ivgroup.master.database.dto.ticket.TicketAccessListSelect;
import ivgroup.master.database.dto.ticket.TicketDetailsSelect;
import ivgroup.master.database.dto.ticket.TicketFilterSelect;
import ivgroup.master.database.dto.ticket.TicketFollowupDateInsert;
import ivgroup.master.database.dto.ticket.TicketFollowupDateSelect;
import ivgroup.master.database.dto.ticket.TicketInsert;
import ivgroup.master.database.dto.ticket.TicketStatusInsert;
import ivgroup.master.database.dto.ticket.TicketStatusLogSelect;
import ivgroup.master.database.dto.ticket.TicketUpdate;

@RestController
@RequestMapping("/ticket")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class TicketController 
{
	@Autowired
	TicketBusinessLogic tbl;
	
	//REMOVE
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Long> addTicket(@Valid @RequestBody TicketInsert ti)
	{
		return tbl.addTicket(ti);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(path="/ticketStatus" , consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addTicketStatus(@Valid @RequestBody TicketStatusInsert ti)
	{
		return tbl.addTicketStatus(ti);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(path="/ticketFollowupDate" , consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addFollowupDateInsert(@Valid @RequestBody TicketFollowupDateInsert ti) 
	{
		return tbl.addFollowupDateInsert(ti);
	}
		
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(path="/ticketAccessList" , consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addTicketAccessList(@Valid @RequestBody TicketAccessListInsert ti) 
	{
		return tbl.addTicketAccessList(ti);
	}

	//REMOVE
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path="/{ticketId}")
	public ResponseEntity<Void> deleteMainTicket(@PathVariable @NotNull Long ticketId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return tbl.deleteMainTicket(ticketId,companyExecutiveId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path="/ticketAccessList/{ticketAccessListId}")
	public ResponseEntity<Void> deleteTicketAccessList(@PathVariable @NotNull Long ticketAccessListId,@RequestParam("ticketId") Long ticketId,@RequestParam("companyExecutiveId") Long companyExecutiveId) 
	{
		return tbl.deleteTicketAccessList(ticketAccessListId,ticketId,companyExecutiveId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path="/ticketFollowupDate/{ticketFollowupDateId}")
	public ResponseEntity<Void> deleteTicketFollowupDate(@PathVariable @NotNull Long ticketFollowupDateId,@RequestParam("ticketId") Long ticketId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return tbl.deleteTicketFollowupDate(ticketFollowupDateId,ticketId,companyExecutiveId);
	}

	//REMOVE
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/enquiryRemarks/{ticketId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateEnquiryRemarks(@PathVariable @NotNull Long ticketId,@RequestParam("enquiryRemarks") String enquiryRemarks,@RequestParam("companyExecutiveId") Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		return tbl.updateEnquiryRemarks(ticketId, enquiryRemarks,companyExecutiveId);
	}

	//REMOVE
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/ticketType/{ticketId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateTicketType(@PathVariable @NotNull Long ticketId,@RequestParam("ticketType") Long ticketType,@RequestParam("companyExecutiveId") Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		return tbl.updateTicketType(ticketId, ticketType,companyExecutiveId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/{ticketId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateTicketFields(@PathVariable @NotNull Long ticketId,@Valid @RequestBody TicketUpdate tu)
	{
		return tbl.updateTicketFields(ticketId, tu);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid TicketDetailsSelect>> selectTicketDetailsByCompanyExecutiveId(@PathVariable @NotNull Long companyExecutiveId)
	{
		return tbl.selectTicketDetailsByCompanyExecutiveId(companyExecutiveId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/ticketFollowupDate/{ticketId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid TicketFollowupDateSelect>> selectTicketFollowupDates(@PathVariable @NotNull Long ticketId)
	{
		return tbl.selectTicketFollowupDates(ticketId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(path="/master",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid TicketDetailsSelect>> selectTicketByFilter(@Valid @RequestBody TicketFilterSelect tfs)
	{
		return tbl.selectTicketByFilter(tfs);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/ticketAccessList/{ticketId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid TicketAccessListSelect>> selectTicketAccessListByTicketId(@PathVariable @NotNull Long ticketId)
	{
		return tbl.selectTicketAccessListByTicketId(ticketId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/ticketStatus/{ticketId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid TicketStatusLogSelect>> selectTicketStatusLogbyTicketId(@PathVariable @NotNull Long ticketId)
	{
		return tbl.selectTicketStatusLogbyTicketId(ticketId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/ticketNonAccessibleExecutives/{ticketId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid NonAccessibleExecutiveListSelect>> selectNonAccessibleExecutivesOfTicket(@PathVariable @NotNull Long ticketId)
	{
		return tbl.selectNonAccessibleExecutivesOfTicket(ticketId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/ticketNonAccessibleExecutives/companyExecutive/{ticketId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid NonAccessibleExecutiveListSelect>> selectNonAccessibleExecutivesOfTicketByCompanyExecutive(@PathVariable @NotNull Long ticketId,@RequestParam("companyExecutiveId") @NotNull Long companyExecutiveId)
	{
		return tbl.selectNonAccessibleExecutivesOfTicketByCompanyExecutive(ticketId, companyExecutiveId);
	}

}