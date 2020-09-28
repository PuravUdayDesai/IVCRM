package ivgroup.master.database.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;

@RestController
@RequestMapping("/oauth2")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class OAuthEndpointController
{
	@GetMapping(path="/callback",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> oauthCallaback()
	{
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
