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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.NotificationBusinessLogic;
import ivgroup.master.database.dto.notification.NotificationInsert;
import ivgroup.master.database.dto.notification.NotificationSelect;
import ivgroup.master.database.dto.notification.NotificationUpdate;

@RestController
@RequestMapping("/notification")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class NotificationController {

	@Autowired
	NotificationBusinessLogic nbl;

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path = "/{companyExecutiveID}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid NotificationSelect>> selectNotifications(
			@PathVariable @NotNull Long companyExecutiveID) {
		return nbl.selectNotifications(companyExecutiveID);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addNotification(@Valid @RequestBody NotificationInsert n_ins) {
		return nbl.addNotification(n_ins);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/{notificationID}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateNotification(@PathVariable @NotNull Long notificationID,
			@Valid @RequestBody NotificationUpdate nupd) {
		return nbl.updateNotification(notificationID, nupd);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path = "/{notificationID}")
	public ResponseEntity<Void> deleteNotification(@PathVariable @NotNull Long notificationID) {
		return nbl.deleteNotification(notificationID);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PatchMapping(path = "revoke/{notificationID}")
	public ResponseEntity<Void> revokeNotification(@PathVariable @NotNull Long notificationID) {
		return nbl.revokeNotification(notificationID);
	}
}
