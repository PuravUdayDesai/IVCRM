package ivgroup.master.database.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.people.v1.PeopleService;
import com.google.api.services.people.v1.PeopleServiceScopes;
import com.google.api.services.people.v1.model.EmailAddress;
import com.google.api.services.people.v1.model.Name;
import com.google.api.services.people.v1.model.Person;
import com.google.api.services.people.v1.model.PhoneNumber;

import ivgroup.master.database.dto.google.people.api.GooglePeopleAPICredentials;
import ivgroup.master.database.dto.owner.OwnerInsert;

@Service
public class GooglePeoplesAPIService 
{
    private static final String APPLICATION_NAME = "Google People API IVCRM";
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private static final String TOKENS_DIRECTORY_PATH = "tokens";
    
    private static final List<String> SCOPES = Arrays.asList(PeopleServiceScopes.CONTACTS);
    private static final String CREDENTIALS_FILE_PATH = "credentials.json";
	
    private static Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
        // Load client secrets.
        InputStream in = GooglePeoplesAPIService.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
        if (in == null) {
            throw new FileNotFoundException("Resource not found: " + CREDENTIALS_FILE_PATH);
        }
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(new java.io.File(TOKENS_DIRECTORY_PATH)))
                .setAccessType("offline")
                .build();
        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
        return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
    }
    
    
    public GooglePeopleAPICredentials addGooglePeople(OwnerInsert oi)throws IOException, GeneralSecurityException
    {
    	GooglePeopleAPICredentials googlePeopleCredentials=new GooglePeopleAPICredentials();
        
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
        Person person=new Person();
        
        /*
         * Setting Name
         */
        Name name=new Name();
        name.setGivenName(oi.getOwnerUserName());
        name.setFamilyName("["+oi.getOwnerName()+"]");
        List<Name> nameList=new ArrayList<Name>();
        nameList.add(name);
        person.setNames(nameList);
        
       /*
        * Setting EmailAddress
        */
        EmailAddress emailAddress=new EmailAddress();
        emailAddress.setDisplayName(oi.getOwnerUserName());
        emailAddress.setValue(oi.getOwnerEmail());
        List<EmailAddress> emailAddressList=new ArrayList<EmailAddress>();
        emailAddressList.add(emailAddress);
        person.setEmailAddresses(emailAddressList);
        
        /*
         * Setting PhoneNumber
         */
        PhoneNumber phoneNumber=new PhoneNumber();
        phoneNumber.setValue(oi.getOwnerContact());
        List<PhoneNumber> phoneNumberList=new ArrayList<PhoneNumber>();
        phoneNumberList.add(phoneNumber);
        person.setPhoneNumbers(phoneNumberList);
        
        
        Person returns=service.people().createContact(person).execute();
        String resourceName=returns.getResourceName();
        String eTag=returns.getEtag();
        System.out.println("Resource Name: ["+resourceName+"]");
        System.out.println("ETag: ["+eTag+"]");
        
    	googlePeopleCredentials.setResourceName(resourceName);
    	googlePeopleCredentials.seteTag(eTag);
    	
    	return googlePeopleCredentials;
    }

    public void updateGooglePeopleOwnerUserName(GooglePeopleAPICredentials googlePeopleApiCredentials,String userName)throws IOException, GeneralSecurityException
    {
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
    	Person personUpdate=new Person();
    	
        /*
         * Setting Name
         */
        Name name=new Name();
        name.setGivenName(userName);
        List<Name> nameList=new ArrayList<Name>();
        nameList.add(name);
        personUpdate.setNames(nameList);
        
        personUpdate.setEtag(googlePeopleApiCredentials.geteTag());
        service.people().updateContact(googlePeopleApiCredentials.getResourceName(),personUpdate ).setUpdatePersonFields("names").execute();	
    }

    public void updateGooglePeopleOwnerName(GooglePeopleAPICredentials googlePeopleApiCredentials,String ownerName)throws IOException, GeneralSecurityException
    {
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
    	Person personUpdate=new Person();
    	
        /*
         * Setting Name
         */
        Name name=new Name();
        name.setFamilyName("[ "+ownerName+" ]");
        List<Name> nameList=new ArrayList<Name>();
        nameList.add(name);
        personUpdate.setNames(nameList);
        
        personUpdate.setEtag(googlePeopleApiCredentials.geteTag());
        service.people().updateContact(googlePeopleApiCredentials.getResourceName(),personUpdate ).setUpdatePersonFields("names").execute();	
    }
    
    public void updateGooglePeopleOwnerContactNumber(GooglePeopleAPICredentials googlePeopleApiCredentials,String ownerContactNumber)throws IOException, GeneralSecurityException
    {	
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
    	Person personUpdate=new Person();
    	
        /*
         * Setting PhoneNumber
         */
        PhoneNumber phoneNumber=new PhoneNumber();
        phoneNumber.setValue(ownerContactNumber);
        List<PhoneNumber> phoneNumberList=new ArrayList<PhoneNumber>();
        phoneNumberList.add(phoneNumber);
        personUpdate.setPhoneNumbers(phoneNumberList);
        
        personUpdate.setEtag(googlePeopleApiCredentials.geteTag());
        service.people().updateContact(googlePeopleApiCredentials.getResourceName(),personUpdate ).setUpdatePersonFields("phoneNumbers").execute();	
    
    }

    public void updateGooglePeopleOwnerEmailAddress(GooglePeopleAPICredentials googlePeopleApiCredentials,String ownerEmailAddress)throws IOException, GeneralSecurityException
    {
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
    	Person personUpdate=new Person();
    	
        /*
         * Setting EmailAddress
         */
        EmailAddress emailAddressUpdate=new EmailAddress();
        emailAddressUpdate.setValue(ownerEmailAddress);
        List<EmailAddress> emailAddressListUpdate=new ArrayList<EmailAddress>();
        emailAddressListUpdate.add(emailAddressUpdate);
        personUpdate.setEmailAddresses(emailAddressListUpdate);
        
        personUpdate.setEtag(googlePeopleApiCredentials.geteTag());
        service.people().updateContact(googlePeopleApiCredentials.getResourceName(),personUpdate ).setUpdatePersonFields("emailAddresses").execute();	
    }
    
    public void deleteGooglePeople(GooglePeopleAPICredentials googlePeopleApiCredentials)throws IOException, GeneralSecurityException
    {
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
    	Person personUpdate=new Person();
        
        personUpdate.setEtag(googlePeopleApiCredentials.geteTag());
        service.people().deleteContact(googlePeopleApiCredentials.getResourceName()).execute();	
    }
    
    public String getETag(String resourceName)throws IOException, GeneralSecurityException
    {
    	/*
    	 * Established Connection
    	 */
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        PeopleService service = new PeopleService.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();
        
        /*
         * Creating a Person
         */
    	Person person=service.people().get(resourceName).setPersonFields("emailAddresses").execute();
    	return person.getEtag();
    }
    
}
