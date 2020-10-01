package ivgroup.master.database;

public class Constants {
	
	//General Details
	public final static String URL_TO_REQUEST="<URL_TO_REQUEST>";
	public final static String URL_PUBLIC_REQUEST="*";
	
	//Server Details
	public final static String HOSTNAME="<HOSTNAME>";
	public final static String PORTNUMBER="";//:8080
	
	//Storage Details
	public final static String STORAGE_ROOT="E:";
	
	//Database Details
	public final static String DATABASE_HOSTNAME="<DATABASE_HOSTNAME>";
	public final static String DATABSE_PORTNUMBER="<DATABSE_PORTNUMBER>";
	public final static String DATABASE_NAME="<DATABASE_NAME>";
	public final static String DATABASE_URL="jdbc:postgresql://"+DATABASE_HOSTNAME+":"+DATABSE_PORTNUMBER+"/"+DATABASE_NAME;
	public final static String DATABASE_USERNAME="<DATABASE_USERNAME>";
	public final static String DATABASE_PASSWORD="<DATABASE_PASSWORD>";
	
	//Email Details
	public final static String EMAIL_ID="<EMAIL_ID>";
	public final static String EMAIL_PASSWORD="<EMAIL_PASSWORD>";
}
