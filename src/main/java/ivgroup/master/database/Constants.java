package ivgroup.master.database;

public class Constants {
	
	//General Details
	public final static String URL_TO_REQUEST="http://localhost:8080";
	public final static String URL_PUBLIC_REQUEST="*";
	
	//Server Details
	public final static String HOSTNAME="c0cddff1cb37.ngrok.io";
	public final static String PORTNUMBER="";//:8080
	
	//Storage Details
	public final static String STORAGE_ROOT="E:";
	
	//Database Details
	public final static String DATABASE_HOSTNAME="localhost";
	public final static String DATABSE_PORTNUMBER="5432";
	public final static String DATABASE_NAME="crm";
	public final static String DATABASE_URL="jdbc:postgresql://"+DATABASE_HOSTNAME+":"+DATABSE_PORTNUMBER+"/"+DATABASE_NAME;
	public final static String DATABASE_USERNAME="postgres";
	public final static String DATABASE_PASSWORD="purav";
	
	//Email Details
	public final static String EMAIL_ID="crm.groupproject@gmail.com";
	public final static String EMAIL_PASSWORD="CRMapj2001@iv";
}
