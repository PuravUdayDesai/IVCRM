PGDMP     9    "                x            crm    11.5    12.4 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49856    crm    DATABASE     �   CREATE DATABASE crm WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE crm;
                postgres    false                        2615    50921    callTransactions    SCHEMA     "   CREATE SCHEMA "callTransactions";
     DROP SCHEMA "callTransactions";
                postgres    false                        2615    67551    client    SCHEMA        CREATE SCHEMA client;
    DROP SCHEMA client;
                postgres    false            	            2615    49857    company    SCHEMA        CREATE SCHEMA company;
    DROP SCHEMA company;
                postgres    false                        2615    68221    companyExecutiveGeoLocation    SCHEMA     -   CREATE SCHEMA "companyExecutiveGeoLocation";
 +   DROP SCHEMA "companyExecutiveGeoLocation";
                postgres    false                        2615    59409    enquiry    SCHEMA        CREATE SCHEMA enquiry;
    DROP SCHEMA enquiry;
                postgres    false                        2615    78708    geoMapPlotting    SCHEMA         CREATE SCHEMA "geoMapPlotting";
    DROP SCHEMA "geoMapPlotting";
                postgres    false                        2615    77910    location    SCHEMA        CREATE SCHEMA location;
    DROP SCHEMA location;
                postgres    false                        2615    78672    notification    SCHEMA        CREATE SCHEMA notification;
    DROP SCHEMA notification;
                postgres    false            
            2615    59532    owner    SCHEMA        CREATE SCHEMA owner;
    DROP SCHEMA owner;
                postgres    false                        2615    67414    position    SCHEMA        CREATE SCHEMA "position";
    DROP SCHEMA "position";
                postgres    false                        2615    67749    priority    SCHEMA        CREATE SCHEMA priority;
    DROP SCHEMA priority;
                postgres    false                        2615    59410    product    SCHEMA        CREATE SCHEMA product;
    DROP SCHEMA product;
                postgres    false                        2615    75851    purposes    SCHEMA        CREATE SCHEMA purposes;
    DROP SCHEMA purposes;
                postgres    false                        2615    78660    report    SCHEMA        CREATE SCHEMA report;
    DROP SCHEMA report;
                postgres    false                        2615    67677    status    SCHEMA        CREATE SCHEMA status;
    DROP SCHEMA status;
                postgres    false                        2615    67763    ticket    SCHEMA        CREATE SCHEMA ticket;
    DROP SCHEMA ticket;
                postgres    false                       1255    120487 x   fn_insertCallTransaction(bigint, bigint, text, text, integer, double precision, timestamp without time zone, text, text)    FUNCTION     A  CREATE FUNCTION "callTransactions"."fn_insertCallTransaction"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint, "ClientNameOnExecutiveContactListIn" text, "ClientContactNumberIn" text, "CallTypeIn" integer, "TalkDurationIn" double precision, "CallTimeIn" timestamp without time zone, "FileURLIn" text, "FilePathIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

INSERT INTO "callTransactions"."CallTransaction"( 
    "ClientId",
    "CompanyExecutiveId",
    "ClientNameOnExecutiveContactList",
    "ClientContactNumber",
    "CallType",
    "TalkDuration",
    "CallTime",
	"FileURL",
	"FilePath")
				VALUES(
                        "ClientIdIn",
                        "CompanyExecutiveIdIn",
                        "ClientNameOnExecutiveContactListIn",
                        "ClientContactNumberIn",
                        "CallTypeIn",
                        "TalkDurationIn",
                        "CallTimeIn",
	                    "FileURLIn",
						"FilePathIn"
						);
								
	RETURN true;
	EXCEPTION WHEN OTHERS THEN 
	RETURN false;
	ROLLBACK;
END
$$;
 B  DROP FUNCTION "callTransactions"."fn_insertCallTransaction"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint, "ClientNameOnExecutiveContactListIn" text, "ClientContactNumberIn" text, "CallTypeIn" integer, "TalkDurationIn" double precision, "CallTimeIn" timestamp without time zone, "FileURLIn" text, "FilePathIn" text);
       callTransactions          postgres    false    20                       1255    120488 4   fn_selectCallTransactionByCompanyExecutiveId(bigint)    FUNCTION       CREATE FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("CallTransactionId" bigint, "ClientId" bigint, "CompanyExecutiveId" bigint, "ClientNameOnExecutiveContactList" text, "ClientContactNumber" text, "CallType" integer, "TalkDuration" double precision, "CallTime" timestamp without time zone, "FileURL" text, "FilePath" text)
    LANGUAGE sql
    AS $$
SELECT 
    "CallTransactionId", 
    "ClientId", 
    "CompanyExecutiveId", 
    "ClientNameOnExecutiveContactList", 
    "ClientContactNumber", 
    "CallType", 
    "TalkDuration", 
    "CallTime", 
    "FileURL",
    "FilePath"
	FROM "callTransactions"."CallTransaction"
    WHERE "MarkForDelete"=false
    AND "CompanyExecutiveId"="CompanyExecutiveIdIn";
$$;
 p   DROP FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint);
       callTransactions          postgres    false    20                       1255    120489 E   fn_selectCallTransactionByCompanyExecutiveIdAndCallDate(bigint, date)    FUNCTION     Y  CREATE FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveIdAndCallDate"("CompanyExecutiveIdIn" bigint, "CallDateIn" date) RETURNS TABLE("CallTransactionId" bigint, "ClientId" bigint, "CompanyExecutiveId" bigint, "ClientNameOnExecutiveContactList" text, "ClientContactNumber" text, "CallType" integer, "TalkDuration" double precision, "CallTime" timestamp without time zone, "FileURL" text, "FilePath" text)
    LANGUAGE sql
    AS $$
SELECT 
    "CallTransactionId", 
    "ClientId", 
    "CompanyExecutiveId", 
    "ClientNameOnExecutiveContactList", 
    "ClientContactNumber", 
    "CallType", 
    "TalkDuration", 
    "CallTime", 
    "FileURL",
    "FilePath"
	FROM "callTransactions"."CallTransaction"
    WHERE "MarkForDelete"=false
    AND "CompanyExecutiveId"="CompanyExecutiveIdIn"
    AND date("CallTime")="CallDateIn";
$$;
 �   DROP FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveIdAndCallDate"("CompanyExecutiveIdIn" bigint, "CallDateIn" date);
       callTransactions          postgres    false    20            �           1255    103576 )   fn_checkClientContactNumber(text, bigint)    FUNCTION     �  CREATE FUNCTION client."fn_checkClientContactNumber"("ClientContactNumberIn" text, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint, "ClientId" bigint, "ContactName" text)
    LANGUAGE sql
    AS $$
SELECT 	COUNT(client."Client"."ClientId"),
		client."Client"."ClientId",
		client."Client"."ContactName"
FROM
		client."Client"
WHERE
		client."Client"."ContactNumber"="ClientContactNumberIn"
AND
		client."Client"."CompanyId" IN(
		SELECT 
			company."CompanyExecutive"."CompanyID"
		FROM
			company."CompanyExecutive"
		WHERE 
			company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"
		)
GROUP BY client."Client"."ClientId"
$$;
 q   DROP FUNCTION client."fn_checkClientContactNumber"("ClientContactNumberIn" text, "CompanyExecutiveIdIn" bigint);
       client          postgres    false    19            Y           1255    67605    fn_deleteClient(bigint)    FUNCTION       CREATE FUNCTION client."fn_deleteClient"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "MarkForDelete" = true WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 7   DROP FUNCTION client."fn_deleteClient"("idIn" bigint);
       client          postgres    false    19            �           1255    67597    fn_deleteClientLocation(bigint)    FUNCTION        CREATE FUNCTION client."fn_deleteClientLocation"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "MarkForDelete" = true WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ?   DROP FUNCTION client."fn_deleteClientLocation"("idIn" bigint);
       client          postgres    false    19            �           1255    67644 (   fn_getClientLocationIdByClientId(bigint)    FUNCTION     �   CREATE FUNCTION client."fn_getClientLocationIdByClientId"("ClientIDIn" bigint) RETURNS bigint
    LANGUAGE sql
    AS $$
SELECT "ClientLocationId" FROM "client"."Client" WHERE "ClientId"="ClientIDIn";
$$;
 N   DROP FUNCTION client."fn_getClientLocationIdByClientId"("ClientIDIn" bigint);
       client          postgres    false    19            L           1255    67575 �   fn_insertClient(text, text, text, text, bigint, bigint, bigint, bigint, bigint, text, text, text, text, text, text, timestamp without time zone, bigint)    FUNCTION       CREATE FUNCTION client."fn_insertClient"("ContactNameIn" text, "ContactPersonIn" text, "EmailIdIn" text, "ContactNumberIn" text, "CompanyIdIn" bigint, "CountryIn" bigint, "StateIn" bigint, "CityIn" bigint, "AreaIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "pincodeIn" text, "latitudeIn" text, "longitudeIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
WITH "ClientLocationGetId" AS
(
	INSERT INTO "client"."ClientLocation" 
	(
		"Country",
		"State",
		"City",
		"Area",
		"AddressLine1",
		"AddressLine2",
		"AddressLine3",
		"pincode",
		"latitude",
		"longitude",
		"CreatedOn",
		"LastEditOn",
		"CreatedBy",
		"LastEditBy"
	)
VALUES
	(
			"CountryIn",
			"StateIn",
			"CityIn",
			"AreaIn",
			"AddressLine1In",
			"AddressLine2In",
			"AddressLine3In",
			"pincodeIn",
			"latitudeIn",
			"longitudeIn",
			"CreatedOnIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedByIn"
	)RETURNING "ClientLocationId"
)
	INSERT INTO "client"."Client" 
	(
		"ContactName",
		"ContactPerson",
		"EmailId",
		"ContactNumber",
		"CompanyId",
		"ClientLocationId",
		"CreatedOn",
		"LastEditOn",
		"CreatedBy",
		"LastEditBy"
	)
VALUES
	(
			"ContactNameIn",
			"ContactPersonIn",
			"EmailIdIn",
			"ContactNumberIn",
			"CompanyIdIn",
			(SELECT "ClientLocationId" FROM "ClientLocationGetId"),
			"CreatedOnIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedByIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �  DROP FUNCTION client."fn_insertClient"("ContactNameIn" text, "ContactPersonIn" text, "EmailIdIn" text, "ContactNumberIn" text, "CompanyIdIn" bigint, "CountryIn" bigint, "StateIn" bigint, "CityIn" bigint, "AreaIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "pincodeIn" text, "latitudeIn" text, "longitudeIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint);
       client          postgres    false    19            �           1255    67637    fn_selectClient()    FUNCTION     #  CREATE FUNCTION client."fn_selectClient"() RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 *   DROP FUNCTION client."fn_selectClient"();
       client          postgres    false    19            �           1255    67641    fn_selectClientByArea(bigint)    FUNCTION     i  CREATE FUNCTION client."fn_selectClientByArea"("AreaIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "client"."ClientLocation"."Area"="AreaIdIn"
AND "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 A   DROP FUNCTION client."fn_selectClientByArea"("AreaIdIn" bigint);
       client          postgres    false    19            �           1255    67640    fn_selectClientByCity(bigint)    FUNCTION     k  CREATE FUNCTION client."fn_selectClientByCity"("CityIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "client"."ClientLocation"."City"="CityIdIn" 
AND "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 A   DROP FUNCTION client."fn_selectClientByCity"("CityIdIn" bigint);
       client          postgres    false    19            �           1255    67642     fn_selectClientByCompany(bigint)    FUNCTION     r  CREATE FUNCTION client."fn_selectClientByCompany"("CompanyIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "company"."Company"."CompanyId"="CompanyIdIn"
AND "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 G   DROP FUNCTION client."fn_selectClientByCompany"("CompanyIdIn" bigint);
       client          postgres    false    19            �           1255    67638     fn_selectClientByCountry(bigint)    FUNCTION     v  CREATE FUNCTION client."fn_selectClientByCountry"("CountryIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "client"."ClientLocation"."Country"="CountryIdIn"
AND "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 G   DROP FUNCTION client."fn_selectClientByCountry"("CountryIdIn" bigint);
       client          postgres    false    19            �           1255    67643    fn_selectClientByOwner(bigint)    FUNCTION     q  CREATE FUNCTION client."fn_selectClientByOwner"("OwnerIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "company"."Company"."OwnerContactId"="OwnerIdIn"
AND "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 C   DROP FUNCTION client."fn_selectClientByOwner"("OwnerIdIn" bigint);
       client          postgres    false    19            �           1255    67639    fn_selectClientByState(bigint)    FUNCTION     n  CREATE FUNCTION client."fn_selectClientByState"("StateIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
    LANGUAGE sql
    AS $$SELECT
		"client"."Client"."ClientId",
		"client"."Client"."ContactName",
		"client"."Client"."ContactPerson",
		"client"."Client"."EmailId",
		"client"."Client"."ContactNumber",
		"client"."Client"."CompanyId",
		"company"."Company"."CompanyName",
		"client"."ClientLocation"."Country",
		"location"."countryinfo"."CountryName",
		"client"."ClientLocation"."State",
		"location"."stateinfo"."StateName",
		"client"."ClientLocation"."City",
		"location"."cityinfo"."CityName",
		"client"."ClientLocation"."Area",
		"location"."areainfo"."AreaName",
		"client"."ClientLocation"."AddressLine1",
		"client"."ClientLocation"."AddressLine2",
		"client"."ClientLocation"."AddressLine3",
		"client"."ClientLocation"."pincode",
		"client"."ClientLocation"."latitude",
		"client"."ClientLocation"."longitude",
		"client"."Client"."CreatedOn",
		"client"."Client"."LastEditOn",
		"client"."Client"."CreatedBy",
		"client"."Client"."LastEditBy",
		"client"."Client"."isActive",
		"client"."ClientLocation"."CreatedOn",
		"client"."ClientLocation"."LastEditOn",
		"client"."ClientLocation"."CreatedBy",
		"client"."ClientLocation"."LastEditBy",
		"client"."ClientLocation"."isActive"
FROM "client"."Client"
	JOIN "client"."ClientLocation" ON "client"."ClientLocation"."ClientLocationId"="client"."Client"."ClientLocationId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="client"."Client"."CompanyId"
	JOIN "location"."countryinfo" ON "location"."countryinfo"."CountryID"="client"."ClientLocation"."Country"
	JOIN "location"."stateinfo" ON "location"."stateinfo"."StateID"="client"."ClientLocation"."State"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"="client"."ClientLocation"."City"
	JOIN "location"."businessAreaForCompany" ON "location"."businessAreaForCompany"."BusinessAreaForCompanyID"="client"."ClientLocation"."Area"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN "location"."areainfo" ON "location"."areainfo"."AreaID"="location"."businessAreaForCompany"."AreaID"
WHERE "client"."ClientLocation"."State"="StateIdIn"
AND "client"."Client"."MarkForDelete"=false
AND "client"."ClientLocation"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
$$;
 C   DROP FUNCTION client."fn_selectClientByState"("StateIdIn" bigint);
       client          postgres    false    19            Q           1255    67580 (   fn_updateClientCompanyId(bigint, bigint)    FUNCTION     ,  CREATE FUNCTION client."fn_updateClientCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "CompanyId" = "CompanyIdIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 V   DROP FUNCTION client."fn_updateClientCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       client          postgres    false    19            M           1255    67576 (   fn_updateClientContactName(bigint, text)    FUNCTION     2  CREATE FUNCTION client."fn_updateClientContactName"("idIn" bigint, "ContactNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "ContactName" = "ContactNameIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 X   DROP FUNCTION client."fn_updateClientContactName"("idIn" bigint, "ContactNameIn" text);
       client          postgres    false    19            P           1255    67579 *   fn_updateClientContactNumber(bigint, text)    FUNCTION     :  CREATE FUNCTION client."fn_updateClientContactNumber"("idIn" bigint, "ContactNumberIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "ContactNumber" = "ContactNumberIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION client."fn_updateClientContactNumber"("idIn" bigint, "ContactNumberIn" text);
       client          postgres    false    19            N           1255    67577 *   fn_updateClientContactPerson(bigint, text)    FUNCTION     :  CREATE FUNCTION client."fn_updateClientContactPerson"("idIn" bigint, "ContactPersonIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "ContactPerson" = "ContactPersonIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION client."fn_updateClientContactPerson"("idIn" bigint, "ContactPersonIn" text);
       client          postgres    false    19            O           1255    67578 $   fn_updateClientEmailId(bigint, text)    FUNCTION     "  CREATE FUNCTION client."fn_updateClientEmailId"("idIn" bigint, "EmailIdIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "EmailId" = "EmailIdIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 P   DROP FUNCTION client."fn_updateClientEmailId"("idIn" bigint, "EmailIdIn" text);
       client          postgres    false    19            X           1255    67607 (   fn_updateClientIsActive(bigint, boolean)    FUNCTION     )  CREATE FUNCTION client."fn_updateClientIsActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "isActive" = "isActiveIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 U   DROP FUNCTION client."fn_updateClientIsActive"("idIn" bigint, "isActiveIn" boolean);
       client          postgres    false    19            S           1255    67583 )   fn_updateClientLastEditBy(bigint, bigint)    FUNCTION     0  CREATE FUNCTION client."fn_updateClientLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "LastEditBy" = "LastEditByIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 X   DROP FUNCTION client."fn_updateClientLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       client          postgres    false    19            R           1255    67582 >   fn_updateClientLastEditOn(bigint, timestamp without time zone)    FUNCTION     E  CREATE FUNCTION client."fn_updateClientLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."Client" SET "LastEditOn" = "LastEditOnIn" WHERE "ClientId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 m   DROP FUNCTION client."fn_updateClientLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       client          postgres    false    19            C           1255    67588 1   fn_updateClientLocationAddressLine1(bigint, text)    FUNCTION     N  CREATE FUNCTION client."fn_updateClientLocationAddressLine1"("idIn" bigint, "AddressLine1In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "AddressLine1" = "AddressLine1In" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 b   DROP FUNCTION client."fn_updateClientLocationAddressLine1"("idIn" bigint, "AddressLine1In" text);
       client          postgres    false    19            D           1255    67589 1   fn_updateClientLocationAddressLine2(bigint, text)    FUNCTION     N  CREATE FUNCTION client."fn_updateClientLocationAddressLine2"("idIn" bigint, "AddressLine2In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "AddressLine2" = "AddressLine2In" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 b   DROP FUNCTION client."fn_updateClientLocationAddressLine2"("idIn" bigint, "AddressLine2In" text);
       client          postgres    false    19            E           1255    67590 1   fn_updateClientLocationAddressLine3(bigint, text)    FUNCTION     N  CREATE FUNCTION client."fn_updateClientLocationAddressLine3"("idIn" bigint, "AddressLine3In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "AddressLine3" = "AddressLine3In" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 b   DROP FUNCTION client."fn_updateClientLocationAddressLine3"("idIn" bigint, "AddressLine3In" text);
       client          postgres    false    19            W           1255    67587 +   fn_updateClientLocationArea(bigint, bigint)    FUNCTION     0  CREATE FUNCTION client."fn_updateClientLocationArea"("idIn" bigint, "AreaIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "Area" = "AreaIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 T   DROP FUNCTION client."fn_updateClientLocationArea"("idIn" bigint, "AreaIn" bigint);
       client          postgres    false    19            V           1255    67586 +   fn_updateClientLocationCity(bigint, bigint)    FUNCTION     0  CREATE FUNCTION client."fn_updateClientLocationCity"("idIn" bigint, "CityIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "City" = "CityIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 T   DROP FUNCTION client."fn_updateClientLocationCity"("idIn" bigint, "CityIn" bigint);
       client          postgres    false    19            T           1255    67584 .   fn_updateClientLocationCountry(bigint, bigint)    FUNCTION     <  CREATE FUNCTION client."fn_updateClientLocationCountry"("idIn" bigint, "CountryIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "Country" = "CountryIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION client."fn_updateClientLocationCountry"("idIn" bigint, "CountryIn" bigint);
       client          postgres    false    19            J           1255    67595 1   fn_updateClientLocationLastEditBy(bigint, bigint)    FUNCTION     H  CREATE FUNCTION client."fn_updateClientLocationLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "LastEditBy" = "LastEditByIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 `   DROP FUNCTION client."fn_updateClientLocationLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       client          postgres    false    19            I           1255    67594 F   fn_updateClientLocationLastEditOn(bigint, timestamp without time zone)    FUNCTION     ]  CREATE FUNCTION client."fn_updateClientLocationLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "LastEditOn" = "LastEditOnIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 u   DROP FUNCTION client."fn_updateClientLocationLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       client          postgres    false    19            U           1255    67585 ,   fn_updateClientLocationState(bigint, bigint)    FUNCTION     4  CREATE FUNCTION client."fn_updateClientLocationState"("idIn" bigint, "StateIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "State" = "StateIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 V   DROP FUNCTION client."fn_updateClientLocationState"("idIn" bigint, "StateIn" bigint);
       client          postgres    false    19            K           1255    67596 0   fn_updateClientLocationisActive(bigint, boolean)    FUNCTION     A  CREATE FUNCTION client."fn_updateClientLocationisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "isActive" = "isActiveIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ]   DROP FUNCTION client."fn_updateClientLocationisActive"("idIn" bigint, "isActiveIn" boolean);
       client          postgres    false    19            G           1255    67592 -   fn_updateClientLocationlatitude(bigint, text)    FUNCTION     >  CREATE FUNCTION client."fn_updateClientLocationlatitude"("idIn" bigint, "latitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "latitude" = "latitudeIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION client."fn_updateClientLocationlatitude"("idIn" bigint, "latitudeIn" text);
       client          postgres    false    19            H           1255    67593 .   fn_updateClientLocationlongitude(bigint, text)    FUNCTION     B  CREATE FUNCTION client."fn_updateClientLocationlongitude"("idIn" bigint, "longitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "longitude" = "longitudeIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION client."fn_updateClientLocationlongitude"("idIn" bigint, "longitudeIn" text);
       client          postgres    false    19            F           1255    67591 ,   fn_updateClientLocationpincode(bigint, text)    FUNCTION     :  CREATE FUNCTION client."fn_updateClientLocationpincode"("idIn" bigint, "pincodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "client"."ClientLocation" SET "pincode" = "pincodeIn" WHERE "ClientLocationId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 X   DROP FUNCTION client."fn_updateClientLocationpincode"("idIn" bigint, "pincodeIn" text);
       client          postgres    false    19            #           1255    137087 '   fn_checkCompanyAreaDeleteStatus(bigint)    FUNCTION       CREATE FUNCTION company."fn_checkCompanyAreaDeleteStatus"("CompanyAreaIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") 
FROM company."CompanyBranch"
WHERE "MarkForDelete"=false AND "CompanyAreaID"="CompanyAreaIdIn";
$$;
 S   DROP FUNCTION company."fn_checkCompanyAreaDeleteStatus"("CompanyAreaIdIn" bigint);
       company          postgres    false    9            (           1255    50915 )   fn_checkCompanyBranchDeleteStatus(bigint)    FUNCTION       CREATE FUNCTION company."fn_checkCompanyBranchDeleteStatus"("CompanyBranchIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyExecutiveID") FROM company."CompanyExecutive" WHERE "MarkForDelete"=false AND "CompanyBranchID"="CompanyBranchIdIn";
$$;
 W   DROP FUNCTION company."fn_checkCompanyBranchDeleteStatus"("CompanyBranchIdIn" bigint);
       company          postgres    false    9            '           1255    50914 #   fn_checkCompanyDeleteStatus(bigint)    FUNCTION       CREATE FUNCTION company."fn_checkCompanyDeleteStatus"("CompanyIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") FROM company."CompanyBranch" WHERE "MarkForDelete"=false AND "CompanyID"="CompanyIdIn";
$$;
 K   DROP FUNCTION company."fn_checkCompanyDeleteStatus"("CompanyIdIn" bigint);
       company          postgres    false    9            +           1255    50919 0   fn_checkCompanyExecutiveDeleteDependency(bigint)    FUNCTION       CREATE FUNCTION company."fn_checkCompanyExecutiveDeleteDependency"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") FROM company."CompanyBranch" WHERE "CompanyBranchPrimaryContactID"="CompanyExecutiveIdIn";
$$;
 a   DROP FUNCTION company."fn_checkCompanyExecutiveDeleteDependency"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            ,           1255    50920 ,   fn_checkCompanyExecutiveDeleteStatus(bigint)    FUNCTION       CREATE FUNCTION company."fn_checkCompanyExecutiveDeleteStatus"("CompanyIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") FROM company."CompanyExecutive" WHERE "CompanyID"="CompanyIdIn" AND "MarkForDelete"=false;
$$;
 T   DROP FUNCTION company."fn_checkCompanyExecutiveDeleteStatus"("CompanyIdIn" bigint);
       company          postgres    false    9            )           1255    50916 )   fn_checkCompanyRegionDeleteStatus(bigint)    FUNCTION       CREATE FUNCTION company."fn_checkCompanyRegionDeleteStatus"("CompanyRegionIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyAreaID") FROM company."CompanyArea" WHERE "MarkForDelete"=false AND "CompanyRegionID"="CompanyRegionIdIn";
$$;
 W   DROP FUNCTION company."fn_checkCompanyRegionDeleteStatus"("CompanyRegionIdIn" bigint);
       company          postgres    false    9            *           1255    50917    fn_deleteCompany(bigint)    FUNCTION     	  CREATE FUNCTION company."fn_deleteCompany"("CompanyIdIn" bigint) RETURNS TABLE("CompanyAddressId" bigint)
    LANGUAGE sql
    AS $$

UPDATE company."Company" 	SET "MarkForDelete"=true 
							WHERE "CompanyId"="CompanyIdIn"
							RETURNING "CompanyAddress";

$$;
 @   DROP FUNCTION company."fn_deleteCompany"("CompanyIdIn" bigint);
       company          postgres    false    9            K           1255    49972 &   fn_deleteCompanyAddressDetails(bigint)    FUNCTION     G  CREATE FUNCTION company."fn_deleteCompanyAddressDetails"("CompanyAddressIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "MarkForDelete"=true WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 U   DROP FUNCTION company."fn_deleteCompanyAddressDetails"("CompanyAddressIdIn" bigint);
       company          postgres    false    9            g           1255    50043    fn_deleteCompanyArea(bigint)    FUNCTION     *  CREATE FUNCTION company."fn_deleteCompanyArea"("CompanyAreaIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "MarkForDelete"=true WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 H   DROP FUNCTION company."fn_deleteCompanyArea"("CompanyAreaIDIn" bigint);
       company          postgres    false    9            p           1255    50098    fn_deleteCompanyBranch(bigint)    FUNCTION     4  CREATE FUNCTION company."fn_deleteCompanyBranch"("CompanyBranchIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "MarkForDelete"=true WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 L   DROP FUNCTION company."fn_deleteCompanyBranch"("CompanyBranchIDIn" bigint);
       company          postgres    false    9            $           1255    50905 ,   fn_deleteCompanyBranchAddressDetails(bigint)    FUNCTION     e  CREATE FUNCTION company."fn_deleteCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "MarkForDelete"=true WHERE "CompanyBranchAddressID"="CompanyBranchAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 a   DROP FUNCTION company."fn_deleteCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint);
       company          postgres    false    9            b           1255    67718 "   fn_deleteCompanyBranchType(bigint)    FUNCTION     *  CREATE FUNCTION company."fn_deleteCompanyBranchType"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "company"."CompanyBranchType" SET "MarkForDelete" = true WHERE"CompanyBranchTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 C   DROP FUNCTION company."fn_deleteCompanyBranchType"("idIn" bigint);
       company          postgres    false    9            �           1255    50124 !   fn_deleteCompanyExecutive(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_deleteCompanyExecutive"("CompanyExecutiveIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE company."CompanyExecutive" SET  "MarkForDelete"=true WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
UPDATE "public"."CRMAccessList" SET "MarkForDelete" = TRUE WHERE "CorrespondingId" = "CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 R   DROP FUNCTION company."fn_deleteCompanyExecutive"("CompanyExecutiveIDIn" bigint);
       company          postgres    false    9            R           1255    50002    fn_deleteCompanyRegion(bigint)    FUNCTION     4  CREATE FUNCTION company."fn_deleteCompanyRegion"("CompanyRegionIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "MarkForDelete"=true WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 L   DROP FUNCTION company."fn_deleteCompanyRegion"("CompanyRegionIDIn" bigint);
       company          postgres    false    9            �           1255    78375 "   fn_getOwnerIdByExecutiveId(bigint)    FUNCTION     Y  CREATE FUNCTION company."fn_getOwnerIdByExecutiveId"("companyExecutiveId" bigint) RETURNS TABLE("OwnerId" bigint)
    LANGUAGE sql
    AS $$
SELECT "OwnerContactId" 
FROM company."Company" 
WHERE "CompanyId" IN( 
						SELECT "CompanyId" 
						FROM company."CompanyExecutive" 
						WHERE "CompanyExecutiveID"="companyExecutiveId" 
					);
$$;
 Q   DROP FUNCTION company."fn_getOwnerIdByExecutiveId"("companyExecutiveId" bigint);
       company          postgres    false    9            �           1255    50214   fn_insertCompany(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, integer, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �   CREATE FUNCTION company."fn_insertCompany"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
    LANGUAGE sql
    AS $$
WITH "CompanyAddressDetailsSelect" AS(
INSERT INTO company."CompanyAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyAddressID" AS "CompanyAddressDetailsID" ),
"CompanySelect" AS(
    INSERT INTO company."Company"(
                            "CompanyCode", 
							"CompanyName", 
							"OwnerContactId", 
							"CompanyAddress", 
						    "CityId", 
							"CreatedOn", 
							"CreatedBy", 
							"DeviceType", 
							"LastEditedOn",
							"LastEditedBy", 
							"LastEditDeviceType")
	VALUES (
    "CompanyCodeIn", 
	"CompanyNameIn", 
	"OwnerContactIdIn", 
	(SELECT "CompanyAddressDetailsID" FROM "CompanyAddressDetailsSelect"), 
	"CityIDIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
    )RETURNING "CompanyId" AS "CompanyID"
),
"CompanyRegionSelect" AS(

INSERT INTO company."CompanyRegion"(
	                        "CompanyRegionName", 
	                        "CompanyRegionCode", 
	                        "CompanyRegionDescription", 
	                        "CompanyID",  
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyRegionNameIn",
	"CompanyRegionCodeIn", 
	"CompanyRegionDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanySelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyID" AS "CompanyID"

),
"CompanyAreaSelect" AS(

    INSERT INTO company."CompanyArea"(
	                        "CompanyAreaName", 
	                        "CompanyAreaCode", 
	                        "CompanyAreaDescription", 
	                        "CompanyID",  
                            "CompanyRegionID",
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyAreaNameIn",
	"CompanyAreaCodeIn", 
	"CompanyAreaDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanyRegionSelect"),
    (SELECT "CompanyRegionID" FROM "CompanyRegionSelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyAreaID" AS "CompanyAreaID" ,"CompanyID" AS "CompanyID"
),
"CompanyBranchAddressDetailsSelect" AS(
INSERT INTO company."CompanyBranchAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyBranchAddressID" AS "CompanyBranchAddressDetailsID" 
),
"CompanyBranchSelect" AS(

      
        INSERT INTO company."CompanyBranch"(
	                        "CompanyBranchName",
	                        "CompanyBranchCode",
	                        "CompanyRegionID",
	                        "CompanyAreaID",
	                        "CompanyID", 
	                        "CompanyBranchType", 
	                        "CompanyBranchAddressID", 
	                        "CreatedOn",
	                        "CreatedBy",
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"CompanyBranchNameIn",
	"CompanyBranchCodeIn",
	(SELECT "CompanyRegionID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyAreaID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyID" FROM "CompanyAreaSelect"), 
	"CompanyBranchTypeIn", 
	(SELECT "CompanyBranchAddressDetailsID" FROM "CompanyBranchAddressDetailsSelect"), 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn")RETURNING "CompanyBranchID" AS "CompanyBranchID","CompanyID" AS "CompanyID"
),
"CompanyExecutiveSelect" AS(
INSERT INTO company."CompanyExecutive"(
                            "ExecutiveName", 
                            "LoginID", 
                            "Password", 
                            "CompanyBranchID", 
                            "BaseCityID", 
                            "CompanyID", 
                            "ContactNumber", 
                            "CreatedOn", 
                            "CreatedBy", 
                            "DeviceType", 
                            "LastEditOn",
                            "LastEditBy", 
                            "LastEditDeviceType")
	VALUES (
    "ExecutiveNameIn", 
    "LoginIDIn", 
    "PasswordIn", 
    (SELECT "CompanyBranchID" FROM "CompanyBranchSelect"), 
    "CityIDIn", 
    (SELECT "CompanyID" FROM "CompanyBranchSelect"), 
    "ContactNumberIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
) RETURNING "CompanyBranchID" ,"CompanyExecutiveID"
),
"FinalReturns" AS(
	INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect"),
			"ExecutiveNameIn",
			"LoginIDIn",
			"DeviceTypeIn",
			"ContactNumberIn",
			"PasswordIn",
			false
	)RETURNING 	(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect") AS "CompanyExecutiveID",
				(SELECT "CompanyBranchID" FROM "CompanyExecutiveSelect") AS "CompanyBranchID"
)
SELECT "CompanyExecutiveID","CompanyBranchID" FROM "FinalReturns";
$$;
 \  DROP FUNCTION company."fn_insertCompany"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    50408 �   fn_insertCompanyArea(text, text, text, bigint, bigint, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �  CREATE FUNCTION company."fn_insertCompanyArea"("CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$

BEGIN
INSERT INTO company."CompanyArea"(
	"CompanyAreaName", 
	"CompanyAreaCode", 
	"CompanyAreaDescription", 
	"CompanyID", 
	"CompanyRegionID",
	"CreatedOn", 
	"CreatedBy", 
	"DeviceType", 
	"LastEditOn", 
	"LastEditBy", 
	"LastEditDeviceType")
	VALUES ( 
	"CompanyAreaNameIn", 
	"CompanyAreaCodeIn", 
	"CompanyAreaDescriptionIn", 
	"CompanyIDIn", 
	"CompanyRegionIDIn",
	"CreatedOnIn", 
	"CreatedByIn", 
	"DeviceTypeIn", 
	"LastEditOnIn", 
	"LastEditByIn", 
	"LastEditDeviceTypeIn");
	
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 q  DROP FUNCTION company."fn_insertCompanyArea"("CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    50414 �   fn_insertCompanyBranch(text, text, text, bigint, bigint, bigint, bigint, text, text, text, bigint, bigint, bigint, text, text, integer, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �  CREATE FUNCTION company."fn_insertCompanyBranch"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CompanyAreaIDIn" bigint, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
    LANGUAGE sql
    AS $$
WITH "CompanyBranchAddressDetailsSelect" AS(
INSERT INTO company."CompanyBranchAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyBranchAddressID" AS "CompanyBranchAddressDetailsID" 
),
"CompanyBranchSelect" AS(

      
        INSERT INTO company."CompanyBranch"(
	                        "CompanyBranchName",
	                        "CompanyBranchCode",
	                        "CompanyRegionID",
	                        "CompanyAreaID",
	                        "CompanyID", 
	                        "CompanyBranchType", 
	                        "CompanyBranchAddressID", 
	                        "CreatedOn",
	                        "CreatedBy",
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"CompanyBranchNameIn",
	"CompanyBranchCodeIn",
	"CompanyRegionIDIn",
	"CompanyAreaIDIn",
	"CompanyIDIn", 
	"CompanyBranchTypeIn", 
	(SELECT "CompanyBranchAddressDetailsID" FROM "CompanyBranchAddressDetailsSelect"), 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn")RETURNING "CompanyBranchID" AS "CompanyBranchID","CompanyID" AS "CompanyID"
),
"CompanyExecutiveSelect" AS(
INSERT INTO company."CompanyExecutive"(
                            "ExecutiveName", 
                            "LoginID", 
                            "Password", 
                            "CompanyBranchID", 
                            "BaseCityID", 
                            "CompanyID", 
                            "ContactNumber", 
                            "CreatedOn", 
                            "CreatedBy", 
                            "DeviceType", 
                            "LastEditOn",
                            "LastEditBy", 
                            "LastEditDeviceType")
	VALUES (
    "ExecutiveNameIn", 
    "LoginIDIn", 
    "PasswordIn", 
    (SELECT "CompanyBranchID" FROM "CompanyBranchSelect"), 
    "CityIDIn", 
    "CompanyIDIn", 
    "ContactNumberIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
) RETURNING "CompanyBranchID" ,"CompanyExecutiveID"
),
"FinalReturns" AS(
	INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect"),
			"ExecutiveNameIn",
			"LoginIDIn",
			"DeviceTypeIn",
			"ContactNumberIn",
			"PasswordIn",
			false
	)RETURNING 	(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect") AS "CompanyExecutiveID",
				(SELECT "CompanyBranchID" FROM "CompanyExecutiveSelect") AS "CompanyBranchID"
)
SELECT "CompanyExecutiveID","CompanyBranchID" FROM "FinalReturns";
$$;
 �  DROP FUNCTION company."fn_insertCompanyBranch"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CompanyAreaIDIn" bigint, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            \           1255    67712 V   fn_insertCompanyBranchType(text, bigint, integer, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION company."fn_insertCompanyBranchType"("CompanyBranchTypeNameIn" text, "CompanyIdIn" bigint, "CompanyBranchPositionIn" integer, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "company"."CompanyBranchType" 
	(
		"CompanyBranchTypeName",
		"CompanyId",
		"CompanyBranchPosition",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"CompanyBranchTypeNameIn",
			"CompanyIdIn",
			"CompanyBranchPositionIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION company."fn_insertCompanyBranchType"("CompanyBranchTypeNameIn" text, "CompanyIdIn" bigint, "CompanyBranchPositionIn" integer, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone);
       company          postgres    false    9            �           1255    50436 w   fn_insertCompanyExecutive(text, text, text, bigint, bigint, bigint, text, timestamp without time zone, bigint, integer)    FUNCTION     1  CREATE FUNCTION company."fn_insertCompanyExecutive"("ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "CompanyBranchIDIn" bigint, "BaseCityIDIn" bigint, "CompanyIDIn" bigint, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
WITH "CompanyExecutiveSelect" AS(
    INSERT INTO company."CompanyExecutive"(
    "ExecutiveName",
    "LoginID", 
    "Password", 
    "CompanyBranchID", 
    "BaseCityID", 
    "CompanyID", 
    "ContactNumber",
    "CreatedOn", 
    "CreatedBy",
    "DeviceType", 
    "LastEditOn", 
    "LastEditBy", 
    "LastEditDeviceType")
	VALUES ( 
            "ExecutiveNameIn",
            "LoginIDIn", 
            "PasswordIn", 
            "CompanyBranchIDIn", 
            "BaseCityIDIn", 
            "CompanyIDIn", 
            "ContactNumberIn",
            "CreatedOnIn", 
            "CreatedByIn",
            "DeviceTypeIn", 
            "CreatedOnIn", 
            "CreatedByIn",
            "DeviceTypeIn"
            )RETURNING "CompanyExecutiveID"
)
	INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect"),
			"ExecutiveNameIn",
			"LoginIDIn",
			"DeviceTypeIn",
			"ContactNumberIn",
			"PasswordIn",
			false
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 *  DROP FUNCTION company."fn_insertCompanyExecutive"("ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "CompanyBranchIDIn" bigint, "BaseCityIDIn" bigint, "CompanyIDIn" bigint, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer);
       company          postgres    false    9            0           1255    59586 I   fn_insertCompanyExecutivePL(bigint, integer, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION company."fn_insertCompanyExecutivePL"("executiveIdIn" bigint, "PLRateIn" integer, "dateOfEntryIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "company"."CompanyExecutivePL" 
	(
		"executiveId",
		"PLRate",
		"dateOfEntry"
	)
VALUES
	(
			"executiveIdIn",
			"PLRateIn",
			"dateOfEntryIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION company."fn_insertCompanyExecutivePL"("executiveIdIn" bigint, "PLRateIn" integer, "dateOfEntryIn" timestamp without time zone);
       company          postgres    false    9            {           1255    50378 �   fn_insertCompanyRegion(text, text, text, bigint, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �  CREATE FUNCTION company."fn_insertCompanyRegion"("CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$

BEGIN
INSERT INTO company."CompanyRegion"(
	"CompanyRegionName", 
	"CompanyRegionCode", 
	"CompanyRegionDescription", 
	"CompanyID", 
	"CreatedOn", 
	"CreatedBy", 
	"DeviceType", 
	"LastEditOn", 
	"LastEditBy", 
	"LastEditDeviceType")
	VALUES ( 
	"CompanyRegionNameIn", 
	"CompanyRegionCodeIn", 
	"CompanyRegionDescriptionIn", 
	"CompanyIDIn", 
	"CreatedOnIn", 
	"CreatedByIn", 
	"DeviceTypeIn", 
	"LastEditOnIn", 
	"LastEditByIn", 
	"LastEditDeviceTypeIn");
	
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 ]  DROP FUNCTION company."fn_insertCompanyRegion"("CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    78245 0  fn_insertCompanyWithCompanyBranchType(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, text, integer, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �"  CREATE FUNCTION company."fn_insertCompanyWithCompanyBranchType"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
    LANGUAGE sql
    AS $$
WITH "CompanyAddressDetailsSelect" AS(
INSERT INTO company."CompanyAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyAddressID" AS "CompanyAddressDetailsID" ),
"CompanySelect" AS(
    INSERT INTO company."Company"(
                            "CompanyCode", 
							"CompanyName", 
							"OwnerContactId", 
							"CompanyAddress", 
						    "CityId", 
							"CreatedOn", 
							"CreatedBy", 
							"DeviceType", 
							"LastEditedOn",
							"LastEditedBy", 
							"LastEditDeviceType")
	VALUES (
    "CompanyCodeIn", 
	"CompanyNameIn", 
	"OwnerContactIdIn", 
	(SELECT "CompanyAddressDetailsID" FROM "CompanyAddressDetailsSelect"), 
	"CityIDIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
    )RETURNING "CompanyId" AS "CompanyID"
	
),
"CompanyRegionSelect" AS(

INSERT INTO company."CompanyRegion"(
	                        "CompanyRegionName", 
	                        "CompanyRegionCode", 
	                        "CompanyRegionDescription", 
	                        "CompanyID",  
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyRegionNameIn",
	"CompanyRegionCodeIn", 
	"CompanyRegionDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanySelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyID" AS "CompanyID"

),
"CompanyAreaSelect" AS(

    INSERT INTO company."CompanyArea"(
	                        "CompanyAreaName", 
	                        "CompanyAreaCode", 
	                        "CompanyAreaDescription", 
	                        "CompanyID",  
                            "CompanyRegionID",
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyAreaNameIn",
	"CompanyAreaCodeIn", 
	"CompanyAreaDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanyRegionSelect"),
    (SELECT "CompanyRegionID" FROM "CompanyRegionSelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyAreaID" AS "CompanyAreaID" ,"CompanyID" AS "CompanyID"
),
"CompanyBranchTypeSelect" AS(
	INSERT INTO "company"."CompanyBranchType" 
	(
		"CompanyBranchTypeName",
		"CompanyId",
		"CompanyBranchPosition",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"CompanyBranchTypeNameIn",
			(SELECT "CompanyID" FROM "CompanyAreaSelect"),
			"CompanyBranchPositionIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	)RETURNING "CompanyBranchTypeId"
),
"CompanyBranchAddressDetailsSelect" AS(
INSERT INTO company."CompanyBranchAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyBranchAddressID" AS "CompanyBranchAddressDetailsID" 
),
"CompanyBranchSelect" AS(

      
        INSERT INTO company."CompanyBranch"(
	                        "CompanyBranchName",
	                        "CompanyBranchCode",
	                        "CompanyRegionID",
	                        "CompanyAreaID",
	                        "CompanyID", 
	                        "CompanyBranchType", 
	                        "CompanyBranchAddressID", 
	                        "CreatedOn",
	                        "CreatedBy",
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"CompanyBranchNameIn",
	"CompanyBranchCodeIn",
	(SELECT "CompanyRegionID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyAreaID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyID" FROM "CompanyAreaSelect"), 
	(SELECT "CompanyBranchTypeId" FROM "CompanyBranchTypeSelect"), 
	(SELECT "CompanyBranchAddressDetailsID" FROM "CompanyBranchAddressDetailsSelect"), 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn")RETURNING "CompanyBranchID" AS "CompanyBranchID","CompanyID" AS "CompanyID"
),
"CompanyExecutiveSelect" AS(
INSERT INTO company."CompanyExecutive"(
                            "ExecutiveName", 
                            "LoginID", 
                            "Password", 
                            "CompanyBranchID", 
                            "BaseCityID", 
                            "CompanyID", 
                            "ContactNumber", 
                            "CreatedOn", 
                            "CreatedBy", 
                            "DeviceType", 
                            "LastEditOn",
                            "LastEditBy", 
                            "LastEditDeviceType")
	VALUES (
    "ExecutiveNameIn", 
    "LoginIDIn", 
    "PasswordIn", 
    (SELECT "CompanyBranchID" FROM "CompanyBranchSelect"), 
    "CityIDIn", 
    (SELECT "CompanyID" FROM "CompanyBranchSelect"), 
    "ContactNumberIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
) RETURNING "CompanyBranchID" ,"CompanyExecutiveID"
),
"FinalReturns" AS(
	INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect"),
			"ExecutiveNameIn",
			"LoginIDIn",
			"DeviceTypeIn",
			"ContactNumberIn",
			"PasswordIn",
			false
	)RETURNING 	(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect") AS "CompanyExecutiveID",
				(SELECT "CompanyBranchID" FROM "CompanyExecutiveSelect") AS "CompanyBranchID"
)
SELECT "CompanyExecutiveID","CompanyBranchID" FROM "FinalReturns";
$$;
 �  DROP FUNCTION company."fn_insertCompanyWithCompanyBranchType"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    78646 �  fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, text, integer, text, text, text, text, text, integer, text, text, text, text, text, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �'  CREATE FUNCTION company."fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
    LANGUAGE sql
    AS $$
WITH "CompanyAddressDetailsSelect" AS(
INSERT INTO company."CompanyAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyAddressID" AS "CompanyAddressDetailsID" ),
"CompanySelect" AS(
    INSERT INTO company."Company"(
                            "CompanyCode", 
							"CompanyName", 
							"OwnerContactId", 
							"CompanyAddress", 
						    "CityId", 
							"CreatedOn", 
							"CreatedBy", 
							"DeviceType", 
							"LastEditedOn",
							"LastEditedBy", 
							"LastEditDeviceType")
	VALUES (
    "CompanyCodeIn", 
	"CompanyNameIn", 
	"OwnerContactIdIn", 
	(SELECT "CompanyAddressDetailsID" FROM "CompanyAddressDetailsSelect"), 
	"CityIDIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
    )RETURNING "CompanyId" AS "CompanyID"
	
),
"CompanyRegionSelect" AS(

INSERT INTO company."CompanyRegion"(
	                        "CompanyRegionName", 
	                        "CompanyRegionCode", 
	                        "CompanyRegionDescription", 
	                        "CompanyID",  
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyRegionNameIn",
	"CompanyRegionCodeIn", 
	"CompanyRegionDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanySelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyID" AS "CompanyID"

),
"CompanyAreaSelect" AS(

    INSERT INTO company."CompanyArea"(
	                        "CompanyAreaName", 
	                        "CompanyAreaCode", 
	                        "CompanyAreaDescription", 
	                        "CompanyID",  
                            "CompanyRegionID",
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyAreaNameIn",
	"CompanyAreaCodeIn", 
	"CompanyAreaDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanyRegionSelect"),
    (SELECT "CompanyRegionID" FROM "CompanyRegionSelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyAreaID" AS "CompanyAreaID" ,"CompanyID" AS "CompanyID"
),
"CompanyBranchTypeSelect" AS(
	INSERT INTO "company"."CompanyBranchType" 
	(
		"CompanyBranchTypeName",
		"CompanyId",
		"CompanyBranchPosition",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"CompanyBranchTypeNameIn",
			(SELECT "CompanyID" FROM "CompanyAreaSelect"),
			"CompanyBranchPositionIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	)RETURNING "CompanyBranchTypeId"
),
"CompanyBranchAddressDetailsSelect" AS(
INSERT INTO company."CompanyBranchAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
	"CreatedOnIn",
	"CreatedByIn",
	"DeviceTypeIn",
	"LastEditOnIn",
	"LastEditByIn",
	"LastEditDeviceTypeIn"
	)RETURNING "CompanyBranchAddressID" AS "CompanyBranchAddressDetailsID" 
),
"CompanyBranchSelect" AS(

      
        INSERT INTO company."CompanyBranch"(
	                        "CompanyBranchName",
	                        "CompanyBranchCode",
	                        "CompanyRegionID",
	                        "CompanyAreaID",
	                        "CompanyID", 
	                        "CompanyBranchType", 
	                        "CompanyBranchAddressID", 
	                        "CreatedOn",
	                        "CreatedBy",
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"CompanyBranchNameIn",
	"CompanyBranchCodeIn",
	(SELECT "CompanyRegionID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyAreaID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyID" FROM "CompanyAreaSelect"), 
	(SELECT "CompanyBranchTypeId" FROM "CompanyBranchTypeSelect"), 
	(SELECT "CompanyBranchAddressDetailsID" FROM "CompanyBranchAddressDetailsSelect"), 
	"CreatedOnIn",
	"CreatedByIn",
	"DeviceTypeIn",
	"LastEditOnIn",
	"LastEditByIn",
	"LastEditDeviceTypeIn")RETURNING "CompanyBranchID" AS "CompanyBranchID","CompanyID" AS "CompanyID"
),
 "CompanyExecutiveMasterAccess" AS(
    INSERT INTO "position"."CompanyExecutiveMasterList" 
	(
		"Company",
		"CompanyBranch",
		"CompanyExecutive",
		"Client",
		"Product",
		"Location",
		"Enquiry",
		"Ticket",
		"Position"
	)
VALUES
	(
			"CompanyGrantIn",
			"CompanyBranchGrantIn",
			"CompanyExecutiveGrantIn",
			"ClientGrantIn",
			"ProductGrantIn",
			"LocationGrantIn",
			"EnquiryGrantIn",
			"TicketGrantIn",
			"PositionGrantIn"
	)RETURNING id AS "idForAccess"
),
"PositionSelect" AS(
	INSERT INTO "position"."Positions" 
	(
		"PositionName",
		"PositionPriority",
		"CompanyId",
		"ExecutiveMasterId",
		"LastEditBy",
		"LastEditOn",
		"CreatedBy",
		"CreatedOn"
	)
VALUES
	(
			"PositionNameIn",
			"PositionPriorityIn",
			(SELECT "CompanyID" FROM "CompanyBranchSelect"),
			(SELECT "idForAccess" FROM "CompanyExecutiveMasterAccess"),
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	)RETURNING position."Positions".id AS "PositionId"
),
"CompanyExecutiveSelect" AS(
INSERT INTO company."CompanyExecutive"(
                            "ExecutiveName", 
                            "LoginID", 
                            "Password", 
                            "CompanyBranchID", 
                            "BaseCityID", 
                            "CompanyID", 
                            "ContactNumber", 
                            "CreatedOn", 
                            "CreatedBy", 
                            "DeviceType", 
                            "LastEditOn",
                            "LastEditBy", 
                            "LastEditDeviceType")
	VALUES (
    "ExecutiveNameIn", 
    "LoginIDIn", 
    "PasswordIn", 
    (SELECT "CompanyBranchID" FROM "CompanyBranchSelect"), 
    "CityIDIn", 
    (SELECT "CompanyID" FROM "CompanyBranchSelect"), 
    "ContactNumberIn", 
	"CreatedOnIn",
	"CreatedByIn",
	(SELECT "PositionId" FROM "PositionSelect"),
	"LastEditOnIn",
	"LastEditByIn",
	(SELECT "PositionId" FROM "PositionSelect")
) RETURNING "CompanyBranchID" ,"CompanyExecutiveID"
),
"FinalReturns" AS(
INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect"),
			"ExecutiveNameIn",
			"LoginIDIn",
			"DeviceTypeIn",
			"ContactNumberIn",
			"PasswordIn",
			false
	)RETURNING 	(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect") AS "CompanyExecutiveID",
				(SELECT "CompanyBranchID" FROM "CompanyExecutiveSelect") AS "CompanyBranchID"
)
SELECT "CompanyExecutiveID","CompanyBranchID" FROM "FinalReturns";
$$;
 �  DROP FUNCTION company."fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    119972 o  fn_insertCompanyWithExecutivePosition(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, integer, text, text, text, text, text, integer, text, text, text, text, text, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �%  CREATE FUNCTION company."fn_insertCompanyWithExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
    LANGUAGE sql
    AS $$
WITH "CompanyAddressDetailsSelect" AS(
INSERT INTO company."CompanyAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyAddressID" AS "CompanyAddressDetailsID" ),
"CompanySelect" AS(
    INSERT INTO company."Company"(
                            "CompanyCode", 
							"CompanyName", 
							"OwnerContactId", 
							"CompanyAddress", 
						    "CityId", 
							"CreatedOn", 
							"CreatedBy", 
							"DeviceType", 
							"LastEditedOn",
							"LastEditedBy", 
							"LastEditDeviceType")
	VALUES (
    "CompanyCodeIn", 
	"CompanyNameIn", 
	"OwnerContactIdIn", 
	(SELECT "CompanyAddressDetailsID" FROM "CompanyAddressDetailsSelect"), 
	"CityIDIn", 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
    )RETURNING "CompanyId" AS "CompanyID"
),
"CompanyRegionSelect" AS(

INSERT INTO company."CompanyRegion"(
	                        "CompanyRegionName", 
	                        "CompanyRegionCode", 
	                        "CompanyRegionDescription", 
	                        "CompanyID",  
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyRegionNameIn",
	"CompanyRegionCodeIn", 
	"CompanyRegionDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanySelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyID" AS "CompanyID"

),
"CompanyAreaSelect" AS(

    INSERT INTO company."CompanyArea"(
	                        "CompanyAreaName", 
	                        "CompanyAreaCode", 
	                        "CompanyAreaDescription", 
	                        "CompanyID",  
                            "CompanyRegionID",
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy",
	                        "LastEditDeviceType")
			VALUES (
	"CompanyAreaNameIn",
	"CompanyAreaCodeIn", 
	"CompanyAreaDescriptionIn", 
	(SELECT "CompanyID" FROM "CompanyRegionSelect"),
    (SELECT "CompanyRegionID" FROM "CompanyRegionSelect"),
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
				   )RETURNING "CompanyRegionID" AS "CompanyRegionID", "CompanyAreaID" AS "CompanyAreaID" ,"CompanyID" AS "CompanyID"
),
"CompanyBranchAddressDetailsSelect" AS(
INSERT INTO company."CompanyBranchAddressDetails"(
	                        "AddressLine1", 
	                        "AddressLine2", 
	                        "AddressLine3", 
	                        "Pincode", 
	                        "CityID", 
	                        "StateID", 
	                        "CountryID", 
	                        "Latitude", 
	                        "Longitude", 
	                        "GeoLocation", 
	                        "CreatedOn", 
	                        "CreatedBy", 
	                        "CreatedDeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"AddressLine1In",
	"AddressLine2In",
	"AddressLine3In",
	"PincodeIn",
	"CityIDIn",
	"StateIDIn",
	"CountryIDIn",
	"LatitudeIn",
	"LongitudeIn",
	"GeoLocationIn",
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn"
	)RETURNING "CompanyBranchAddressID" AS "CompanyBranchAddressDetailsID" 
),
"CompanyBranchSelect" AS(

      
        INSERT INTO company."CompanyBranch"(
	                        "CompanyBranchName",
	                        "CompanyBranchCode",
	                        "CompanyRegionID",
	                        "CompanyAreaID",
	                        "CompanyID", 
	                        "CompanyBranchType", 
	                        "CompanyBranchAddressID", 
	                        "CreatedOn",
	                        "CreatedBy",
	                        "DeviceType", 
	                        "LastEditOn", 
	                        "LastEditBy", 
	                        "LastEditDeviceType")
	VALUES (
	"CompanyBranchNameIn",
	"CompanyBranchCodeIn",
	(SELECT "CompanyRegionID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyAreaID" FROM "CompanyAreaSelect"),
	(SELECT "CompanyID" FROM "CompanyAreaSelect"), 
	"CompanyBranchTypeIn", 
	(SELECT "CompanyBranchAddressDetailsID" FROM "CompanyBranchAddressDetailsSelect"), 
"CreatedOnIn",
"CreatedByIn",
"DeviceTypeIn",
"LastEditOnIn",
"LastEditByIn",
"LastEditDeviceTypeIn")RETURNING "CompanyBranchID" AS "CompanyBranchID","CompanyID" AS "CompanyID"
),
 "CompanyExecutiveMasterAccess" AS(
    INSERT INTO "position"."CompanyExecutiveMasterList" 
	(
		"Company",
		"CompanyBranch",
		"CompanyExecutive",
		"Client",
		"Product",
		"Location",
		"Enquiry",
		"Ticket",
		"Position"
	)
VALUES
	(
			"CompanyGrantIn",
			"CompanyBranchGrantIn",
			"CompanyExecutiveGrantIn",
			"ClientGrantIn",
			"ProductGrantIn",
			"LocationGrantIn",
			"EnquiryGrantIn",
			"TicketGrantIn",
			"PositionGrantIn"
	)RETURNING id AS "idForAccess"
),
"PositionSelect" AS(
	INSERT INTO "position"."Positions" 
	(
		"PositionName",
		"PositionPriority",
		"CompanyId",
		"ExecutiveMasterId",
		"LastEditBy",
		"LastEditOn",
		"CreatedBy",
		"CreatedOn"
	)
VALUES
	(
			"PositionNameIn",
			"PositionPriorityIn",
			(SELECT "CompanyID" FROM "CompanyBranchSelect"),
			(SELECT "idForAccess" FROM "CompanyExecutiveMasterAccess"),
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	)RETURNING position."Positions".id AS "PositionId"
),
"CompanyExecutiveSelect" AS(
INSERT INTO company."CompanyExecutive"(
                            "ExecutiveName", 
                            "LoginID", 
                            "Password", 
                            "CompanyBranchID", 
                            "BaseCityID", 
                            "CompanyID", 
                            "ContactNumber", 
                            "CreatedOn", 
                            "CreatedBy", 
                            "DeviceType", 
                            "LastEditOn",
                            "LastEditBy", 
                            "LastEditDeviceType")
	VALUES (
    "ExecutiveNameIn", 
    "LoginIDIn", 
    "PasswordIn", 
    (SELECT "CompanyBranchID" FROM "CompanyBranchSelect"), 
    "CityIDIn", 
    (SELECT "CompanyID" FROM "CompanyBranchSelect"), 
    "ContactNumberIn", 
	"CreatedOnIn",
	"CreatedByIn",
	(SELECT "PositionId" FROM "PositionSelect"),
	"LastEditOnIn",
	"LastEditByIn",
	(SELECT "PositionId" FROM "PositionSelect")
) RETURNING "CompanyBranchID" ,"CompanyExecutiveID"
),
"FinalReturns" AS(
	INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect"),
			"ExecutiveNameIn",
			"LoginIDIn",
			"DeviceTypeIn",
			"ContactNumberIn",
			"PasswordIn",
			false
	)RETURNING 	(SELECT "CompanyExecutiveID" FROM "CompanyExecutiveSelect") AS "CompanyExecutiveID",
				(SELECT "CompanyBranchID" FROM "CompanyExecutiveSelect") AS "CompanyBranchID"
)
SELECT "CompanyExecutiveID","CompanyBranchID" FROM "FinalReturns";
$$;
 �  DROP FUNCTION company."fn_insertCompanyWithExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    120450    fn_loginCompanyExecutive(text)    FUNCTION     �  CREATE FUNCTION company."fn_loginCompanyExecutive"("LoginIdIn" text) RETURNS TABLE("CompanyExecutiveId" bigint, "OwnerId" bigint, "CompanyId" bigint, "Company" text, "CompanyBranch" text, "CompanyExecutive" text, "Client" text, "Product" text, "Location" text, "Enquiry" text, "Ticket" text, "Position" text, "NotificationCountToBeRead" bigint, "NotificationCountForNew" bigint, "ImmediateStatusTicketCount" bigint, "HighStatusTicketCount" bigint, "NormalStatusTicketCount" bigint, "LowStatusTicketCount" bigint)
    LANGUAGE sql
    AS $$
SELECT 
		"company"."CompanyExecutive"."CompanyExecutiveID",
		"company"."Company"."OwnerContactId",
		"company"."Company"."CompanyId",
		"position"."CompanyExecutiveMasterList"."Company",
		"position"."CompanyExecutiveMasterList"."CompanyBranch",
		"position"."CompanyExecutiveMasterList"."CompanyExecutive",
		"position"."CompanyExecutiveMasterList"."Client",
		"position"."CompanyExecutiveMasterList"."Product",
		"position"."CompanyExecutiveMasterList"."Location",
		"position"."CompanyExecutiveMasterList"."Enquiry",
		"position"."CompanyExecutiveMasterList"."Ticket",
		"position"."CompanyExecutiveMasterList"."Position",
		(
		/*SELECT count of notifications which are to be read*/
			SELECT COUNT(notification."Notification"."NotificationID")
			FROM notification."Notification"
			WHERE "MarkForDelete"=FALSE
			AND "CompanyExecutiveID"=("company"."CompanyExecutive"."CompanyExecutiveID")
			AND "ReadIndex"=FALSE
			AND "JustArrived"=FALSE
		),
		(
		/*SELECT count of notifications which are new*/
			SELECT COUNT(notification."Notification"."NotificationID")
			FROM notification."Notification"
			WHERE "MarkForDelete"=FALSE
			AND "CompanyExecutiveID"=("company"."CompanyExecutive"."CompanyExecutiveID")
			AND "ReadIndex"=FALSE
			AND "JustArrived"=TRUE
		),
		(
		/*SELECT count of Immediate Status Tickets*/
			SELECT COUNT(ticket."TicketAccessList"."TicketId")
			FROM ticket."TicketAccessList"
			JOIN ticket."TicketMetaData"
			ON ticket."TicketMetaData"."TicketId"=ticket."TicketAccessList"."TicketId"
			WHERE "MarkForDelete"=FALSE
			AND "CompanyExecutiveId"=("company"."CompanyExecutive"."CompanyExecutiveID")
			AND ticket."TicketMetaData"."TicketPriority"=4
		),
		(
		/*SELECT count of High Status Tickets*/
			SELECT COUNT(ticket."TicketAccessList"."TicketId")
			FROM ticket."TicketAccessList"
			JOIN ticket."TicketMetaData"
			ON ticket."TicketMetaData"."TicketId"=ticket."TicketAccessList"."TicketId"
			WHERE "MarkForDelete"=FALSE
			AND "CompanyExecutiveId"=("company"."CompanyExecutive"."CompanyExecutiveID")
			AND ticket."TicketMetaData"."TicketPriority"=3
		),
		(
		/*SELECT count of Normal Status Tickets*/
			SELECT COUNT(ticket."TicketAccessList"."TicketId")
			FROM ticket."TicketAccessList"
			JOIN ticket."TicketMetaData"
			ON ticket."TicketMetaData"."TicketId"=ticket."TicketAccessList"."TicketId"
			WHERE "MarkForDelete"=FALSE
			AND "CompanyExecutiveId"=("company"."CompanyExecutive"."CompanyExecutiveID")
			AND ticket."TicketMetaData"."TicketPriority"=2
		),
		(
		/*SELECT count of Low Status Tickets*/
			SELECT COUNT(ticket."TicketAccessList"."TicketId")
			FROM ticket."TicketAccessList"
			JOIN ticket."TicketMetaData"
			ON ticket."TicketMetaData"."TicketId"=ticket."TicketAccessList"."TicketId"
			WHERE "MarkForDelete"=FALSE
			AND "CompanyExecutiveId"=("company"."CompanyExecutive"."CompanyExecutiveID")
			AND ticket."TicketMetaData"."TicketPriority"=1
		)
FROM "company"."CompanyExecutive" 
JOIN "company"."Company" 
	ON "company"."Company"."CompanyId"="company"."CompanyExecutive"."CompanyID"
JOIN "position"."Positions" 
	ON "position"."Positions"."id"="company"."CompanyExecutive"."DeviceType"
JOIN "position"."CompanyExecutiveMasterList" 
	ON "position"."CompanyExecutiveMasterList"."id"="position"."Positions"."ExecutiveMasterId"
WHERE 	"LoginID"="LoginIdIn"
AND "company"."CompanyExecutive"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=false
AND "position"."Positions"."MarkForDelete"=false;
$$;
 D   DROP FUNCTION company."fn_loginCompanyExecutive"("LoginIdIn" text);
       company          postgres    false    9            <           1255    49911    fn_revokeCompany(bigint)    FUNCTION       CREATE FUNCTION company."fn_revokeCompany"("CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "MarkForDelete"=false WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 @   DROP FUNCTION company."fn_revokeCompany"("CompanyIdIn" bigint);
       company          postgres    false    9            L           1255    49973 &   fn_revokeCompanyAddressDetails(bigint)    FUNCTION     H  CREATE FUNCTION company."fn_revokeCompanyAddressDetails"("CompanyAddressIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "MarkForDelete"=false WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 U   DROP FUNCTION company."fn_revokeCompanyAddressDetails"("CompanyAddressIdIn" bigint);
       company          postgres    false    9            h           1255    50044    fn_revokeCompanyArea(bigint)    FUNCTION     +  CREATE FUNCTION company."fn_revokeCompanyArea"("CompanyAreaIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "MarkForDelete"=false WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 H   DROP FUNCTION company."fn_revokeCompanyArea"("CompanyAreaIDIn" bigint);
       company          postgres    false    9            q           1255    50099    fn_revokeCompanyBranch(bigint)    FUNCTION     5  CREATE FUNCTION company."fn_revokeCompanyBranch"("CompanyBranchIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "MarkForDelete"=false WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 L   DROP FUNCTION company."fn_revokeCompanyBranch"("CompanyBranchIDIn" bigint);
       company          postgres    false    9            %           1255    50906 ,   fn_revokeCompanyBranchAddressDetails(bigint)    FUNCTION     f  CREATE FUNCTION company."fn_revokeCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "MarkForDelete"=false WHERE "CompanyBranchAddressID"="CompanyBranchAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 a   DROP FUNCTION company."fn_revokeCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint);
       company          postgres    false    9            �           1255    50125 !   fn_revokeCompanyExecutive(bigint)    FUNCTION     C  CREATE FUNCTION company."fn_revokeCompanyExecutive"("CompanyExecutiveIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "MarkForDelete"=false WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 R   DROP FUNCTION company."fn_revokeCompanyExecutive"("CompanyExecutiveIDIn" bigint);
       company          postgres    false    9            S           1255    50003    fn_revokeCompanyRegion(bigint)    FUNCTION     5  CREATE FUNCTION company."fn_revokeCompanyRegion"("CompanyRegionIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "MarkForDelete"=false WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 L   DROP FUNCTION company."fn_revokeCompanyRegion"("CompanyRegionIDIn" bigint);
       company          postgres    false    9            �           1255    50369    fn_selectCompany()    FUNCTION     e  CREATE FUNCTION company."fn_selectCompany"() RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$SELECT 	"CompanyId",
		"CompanyCode", 
		"CompanyName", 
		"OwnerContactId", 
		"CompanyAddress", 
        company."CompanyAddressDetails"."AddressLine1",
        company."CompanyAddressDetails"."AddressLine2",
        company."CompanyAddressDetails"."AddressLine3",
        company."CompanyAddressDetails"."Pincode",
		"CityId", 
        location.cityinfo."CityName",
        company."CompanyAddressDetails"."StateID",
        company."CompanyAddressDetails"."CountryID",
        company."CompanyAddressDetails"."Latitude",
        company."CompanyAddressDetails"."Longitude",
		company."Company"."IsActive"
	FROM company."Company"
        JOIN company."CompanyAddressDetails" ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
       	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."Company"."CityId"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
        JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
         JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
	WHERE company."Company"."MarkForDelete"=false
	AND company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false;
$$;
 ,   DROP FUNCTION company."fn_selectCompany"();
       company          postgres    false    9            �           1255    50911     fn_selectCompanyAddressDetails()    FUNCTION     t  CREATE FUNCTION company."fn_selectCompanyAddressDetails"() RETURNS TABLE("CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "StateName" text, "CountryID" bigint, "CountryName" text, "Latitude" text, "Longitude" text)
    LANGUAGE sql
    AS $$SELECT 
"CompanyAddressID",
"AddressLine1",
"AddressLine2",
"AddressLine3",
"Pincode",
company."CompanyAddressDetails"."CityID",
location.cityinfo."CityName",
company."CompanyAddressDetails"."StateID",
location.stateinfo."StateName",
company."CompanyAddressDetails"."CountryID",
location.countryinfo."CountryName",
"Latitude",
"Longitude"
FROM company."CompanyAddressDetails"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
	JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
WHERE company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false
	

$$;
 :   DROP FUNCTION company."fn_selectCompanyAddressDetails"();
       company          postgres    false    9            �           1255    50399    fn_selectCompanyArea()    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyArea"() RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyArea"."CompanyAreaID",
	company."CompanyArea"."CompanyAreaName",
	company."CompanyArea"."CompanyAreaCode",
	company."CompanyArea"."CompanyAreaDescription",
	company."CompanyArea"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
    company."CompanyArea"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
	company."CompanyArea"."IsActive"
	FROM company."CompanyArea"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyArea"."CompanyID"
		JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyArea"."CompanyRegionID"
	WHERE company."CompanyArea"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyRegion"."MarkForDelete"=false;
$$;
 0   DROP FUNCTION company."fn_selectCompanyArea"();
       company          postgres    false    9            �           1255    50403 +   fn_selectCompanyAreaByCompanyAreaID(bigint)    FUNCTION       CREATE FUNCTION company."fn_selectCompanyAreaByCompanyAreaID"("CompanyAreaIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyArea"."CompanyAreaID",
	company."CompanyArea"."CompanyAreaName",
	company."CompanyArea"."CompanyAreaCode",
	company."CompanyArea"."CompanyAreaDescription",
	company."CompanyArea"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
    company."CompanyArea"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
	company."CompanyArea"."IsActive"
	FROM company."CompanyArea"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyArea"."CompanyID"
		JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyArea"."CompanyRegionID"
	WHERE company."CompanyArea"."CompanyAreaID"="CompanyAreaIdIn"
    AND company."CompanyArea"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyRegion"."MarkForDelete"=false;
$$;
 W   DROP FUNCTION company."fn_selectCompanyAreaByCompanyAreaID"("CompanyAreaIdIn" bigint);
       company          postgres    false    9            �           1255    50400 '   fn_selectCompanyAreaByCompanyID(bigint)    FUNCTION       CREATE FUNCTION company."fn_selectCompanyAreaByCompanyID"("CompanyIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyArea"."CompanyAreaID",
	company."CompanyArea"."CompanyAreaName",
	company."CompanyArea"."CompanyAreaCode",
	company."CompanyArea"."CompanyAreaDescription",
	company."CompanyArea"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
    company."CompanyArea"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
	company."CompanyArea"."IsActive"
	FROM company."CompanyArea"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyArea"."CompanyID"
		JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyArea"."CompanyRegionID"
	WHERE company."CompanyArea"."CompanyID"="CompanyIdIn"
    AND company."CompanyArea"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyRegion"."MarkForDelete"=false;
$$;
 O   DROP FUNCTION company."fn_selectCompanyAreaByCompanyID"("CompanyIdIn" bigint);
       company          postgres    false    9            �           1255    50404 -   fn_selectCompanyAreaByCompanyRegionID(bigint)    FUNCTION     "  CREATE FUNCTION company."fn_selectCompanyAreaByCompanyRegionID"("CompanyRegionIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyArea"."CompanyAreaID",
	company."CompanyArea"."CompanyAreaName",
	company."CompanyArea"."CompanyAreaCode",
	company."CompanyArea"."CompanyAreaDescription",
	company."CompanyArea"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
    company."CompanyArea"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
	company."CompanyArea"."IsActive"
	FROM company."CompanyArea"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyArea"."CompanyID"
		JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyArea"."CompanyRegionID"
	WHERE company."CompanyRegion"."CompanyRegionID"="CompanyRegionIdIn"
    AND company."CompanyArea"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyRegion"."MarkForDelete"=false;
$$;
 [   DROP FUNCTION company."fn_selectCompanyAreaByCompanyRegionID"("CompanyRegionIdIn" bigint);
       company          postgres    false    9            .           1255    59574 %   fn_selectCompanyAreaByOwnerID(bigint)    FUNCTION       CREATE FUNCTION company."fn_selectCompanyAreaByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyArea"."CompanyAreaID",
	company."CompanyArea"."CompanyAreaName",
	company."CompanyArea"."CompanyAreaCode",
	company."CompanyArea"."CompanyAreaDescription",
	company."CompanyArea"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
    company."CompanyArea"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
	company."CompanyArea"."IsActive"
	FROM company."CompanyArea"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyArea"."CompanyID"
		JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyArea"."CompanyRegionID"
	WHERE company."Company"."OwnerContactId"="OwnerIdIn"
    AND company."CompanyArea"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyRegion"."MarkForDelete"=false;
$$;
 K   DROP FUNCTION company."fn_selectCompanyAreaByOwnerID"("OwnerIdIn" bigint);
       company          postgres    false    9            �           1255    120457    fn_selectCompanyBranch()    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranch"() RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyBranch"."CompanyBranchID",
    company."CompanyBranch"."CompanyBranchName",
    company."CompanyBranch"."CompanyBranchCode",
    company."CompanyBranch"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
     company."CompanyBranch"."CompanyAreaID",
    company."CompanyArea"."CompanyAreaName",
    company."CompanyArea"."CompanyAreaCode",
    company."CompanyBranch"."CompanyBranchType",
    company."CompanyBranch"."CompanyID", 
    company."Company"."CompanyName",
    company."Company"."CompanyCode", 
	company."CompanyBranchAddressDetails"."CompanyBranchAddressID",
    company."CompanyBranchAddressDetails"."AddressLine1", 
    company."CompanyBranchAddressDetails"."AddressLine2", 
    company."CompanyBranchAddressDetails"."AddressLine3", 
    company."CompanyBranchAddressDetails"."Pincode", 
    company."CompanyBranchAddressDetails"."CityID", 
    location.cityinfo."CityName", 
    company."CompanyBranchAddressDetails"."StateID", 
    company."CompanyBranchAddressDetails"."CountryID", 
    company."CompanyBranchAddressDetails"."Latitude", 
    company."CompanyBranchAddressDetails"."Longitude", 
	company."CompanyBranch"."CompanyBranchPrimaryContactID",
    company."CompanyExecutive"."ExecutiveName",
    company."CompanyExecutive"."ContactNumber",
    company."CompanyBranch"."IsActive" 
FROM company."CompanyBranch"
    JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyBranch"."CompanyRegionID"
    JOIN company."CompanyArea" ON company."CompanyArea"."CompanyAreaID"=company."CompanyBranch"."CompanyAreaID"
    JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
    JOIN company."CompanyBranchAddressDetails" ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
    JOIN company."CompanyExecutive" ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyBranch"."CompanyBranchPrimaryContactID"
    JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
WHERE company."CompanyBranch"."MarkForDelete"=false 
        AND company."CompanyRegion"."MarkForDelete"=false 
        AND company."CompanyArea"."MarkForDelete"=false 
        AND company."Company"."MarkForDelete"=false 
        AND company."CompanyBranchAddressDetails"."MarkForDelete"=false 
        AND company."CompanyExecutive"."MarkForDelete"=false 
        AND location.cityinfo."MarkForDelete"=false;
$$;
 2   DROP FUNCTION company."fn_selectCompanyBranch"();
       company          postgres    false    9            �           1255    50913 &   fn_selectCompanyBranchAddressDetails()    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranchAddressDetails"() RETURNS TABLE("CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "StateName" text, "CountryID" bigint, "CountryName" text, "Latitude" text, "Longitude" text)
    LANGUAGE sql
    AS $$SELECT 
"CompanyBranchAddressID",
"AddressLine1",
"AddressLine2",
"AddressLine3",
"Pincode",
company."CompanyBranchAddressDetails"."CityID",
location.cityinfo."CityName",
company."CompanyBranchAddressDetails"."StateID",
location.stateinfo."StateName",
company."CompanyBranchAddressDetails"."CountryID",
location.countryinfo."CountryName",
"Latitude",
"Longitude"
FROM company."CompanyBranchAddressDetails"
	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
	JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyBranchAddressDetails"."StateID"
	JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyBranchAddressDetails"."CountryID"
WHERE company."CompanyBranchAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false
	

$$;
 @   DROP FUNCTION company."fn_selectCompanyBranchAddressDetails"();
       company          postgres    false    9            �           1255    120458 -   fn_selectCompanyBranchByCompanyAreaId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranchByCompanyAreaId"("CompanyAreaIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyBranch"."CompanyBranchID",
    company."CompanyBranch"."CompanyBranchName",
    company."CompanyBranch"."CompanyBranchCode",
    company."CompanyBranch"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
     company."CompanyBranch"."CompanyAreaID",
    company."CompanyArea"."CompanyAreaName",
    company."CompanyArea"."CompanyAreaCode",
    company."CompanyBranch"."CompanyBranchType",
    company."CompanyBranch"."CompanyID", 
    company."Company"."CompanyName",
    company."Company"."CompanyCode", 
	company."CompanyBranchAddressDetails"."CompanyBranchAddressID",
    company."CompanyBranchAddressDetails"."AddressLine1", 
    company."CompanyBranchAddressDetails"."AddressLine2", 
    company."CompanyBranchAddressDetails"."AddressLine3", 
    company."CompanyBranchAddressDetails"."Pincode", 
    company."CompanyBranchAddressDetails"."CityID", 
    location.cityinfo."CityName", 
    company."CompanyBranchAddressDetails"."StateID", 
    company."CompanyBranchAddressDetails"."CountryID", 
    company."CompanyBranchAddressDetails"."Latitude", 
    company."CompanyBranchAddressDetails"."Longitude", 
	company."CompanyBranch"."CompanyBranchPrimaryContactID",
    company."CompanyExecutive"."ExecutiveName",
    company."CompanyExecutive"."ContactNumber",
    company."CompanyBranch"."IsActive" 
FROM company."CompanyBranch"
    JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyBranch"."CompanyRegionID"
    JOIN company."CompanyArea" ON company."CompanyArea"."CompanyAreaID"=company."CompanyBranch"."CompanyAreaID"
    JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
    JOIN company."CompanyBranchAddressDetails" ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
    JOIN company."CompanyExecutive" ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyBranch"."CompanyBranchPrimaryContactID"
   	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
WHERE company."CompanyBranch"."CompanyAreaID"="CompanyAreaIdIn"
		AND company."CompanyBranch"."MarkForDelete"=false 
        AND company."CompanyRegion"."MarkForDelete"=false 
        AND company."CompanyArea"."MarkForDelete"=false 
        AND company."Company"."MarkForDelete"=false 
        AND company."CompanyBranchAddressDetails"."MarkForDelete"=false 
        AND company."CompanyExecutive"."MarkForDelete"=false 
        AND location.cityinfo."MarkForDelete"=false;
$$;
 Y   DROP FUNCTION company."fn_selectCompanyBranchByCompanyAreaId"("CompanyAreaIdIn" bigint);
       company          postgres    false    9            �           1255    120459 /   fn_selectCompanyBranchByCompanyBranchId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranchByCompanyBranchId"("CompanyBranchIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyBranch"."CompanyBranchID",
    company."CompanyBranch"."CompanyBranchName",
    company."CompanyBranch"."CompanyBranchCode",
    company."CompanyBranch"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
     company."CompanyBranch"."CompanyAreaID",
    company."CompanyArea"."CompanyAreaName",
    company."CompanyArea"."CompanyAreaCode",
    company."CompanyBranch"."CompanyBranchType",
    company."CompanyBranch"."CompanyID", 
    company."Company"."CompanyName",
    company."Company"."CompanyCode", 
	company."CompanyBranchAddressDetails"."CompanyBranchAddressID",
    company."CompanyBranchAddressDetails"."AddressLine1", 
    company."CompanyBranchAddressDetails"."AddressLine2", 
    company."CompanyBranchAddressDetails"."AddressLine3", 
    company."CompanyBranchAddressDetails"."Pincode", 
    company."CompanyBranchAddressDetails"."CityID", 
    location.cityinfo."CityName", 
    company."CompanyBranchAddressDetails"."StateID", 
    company."CompanyBranchAddressDetails"."CountryID", 
    company."CompanyBranchAddressDetails"."Latitude", 
    company."CompanyBranchAddressDetails"."Longitude", 
	company."CompanyBranch"."CompanyBranchPrimaryContactID",
    company."CompanyExecutive"."ExecutiveName",
    company."CompanyExecutive"."ContactNumber",
    company."CompanyBranch"."IsActive" 
FROM company."CompanyBranch"
    JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyBranch"."CompanyRegionID"
    JOIN company."CompanyArea" ON company."CompanyArea"."CompanyAreaID"=company."CompanyBranch"."CompanyAreaID"
    JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
    JOIN company."CompanyBranchAddressDetails" ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
    JOIN company."CompanyExecutive" ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyBranch"."CompanyBranchPrimaryContactID"
  	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
WHERE company."CompanyBranch"."CompanyBranchID"="CompanyBranchIdIn"
		AND company."CompanyBranch"."MarkForDelete"=false 
        AND company."CompanyRegion"."MarkForDelete"=false 
        AND company."CompanyArea"."MarkForDelete"=false 
        AND company."Company"."MarkForDelete"=false 
        AND company."CompanyBranchAddressDetails"."MarkForDelete"=false 
        AND company."CompanyExecutive"."MarkForDelete"=false 
        AND location.cityinfo."MarkForDelete"=false;
$$;
 ]   DROP FUNCTION company."fn_selectCompanyBranchByCompanyBranchId"("CompanyBranchIdIn" bigint);
       company          postgres    false    9            �           1255    120460 )   fn_selectCompanyBranchByCompanyId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranchByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyBranch"."CompanyBranchID",
    company."CompanyBranch"."CompanyBranchName",
    company."CompanyBranch"."CompanyBranchCode",
    company."CompanyBranch"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
    company."CompanyBranch"."CompanyAreaID",
    company."CompanyArea"."CompanyAreaName",
    company."CompanyArea"."CompanyAreaCode",
    company."CompanyBranch"."CompanyBranchType",
    company."CompanyBranch"."CompanyID", 
    company."Company"."CompanyName",
    company."Company"."CompanyCode", 
	company."CompanyBranchAddressDetails"."CompanyBranchAddressID",
    company."CompanyBranchAddressDetails"."AddressLine1", 
    company."CompanyBranchAddressDetails"."AddressLine2", 
    company."CompanyBranchAddressDetails"."AddressLine3", 
    company."CompanyBranchAddressDetails"."Pincode", 
    company."CompanyBranchAddressDetails"."CityID", 
    location.cityinfo."CityName", 
    company."CompanyBranchAddressDetails"."StateID", 
    company."CompanyBranchAddressDetails"."CountryID", 
    company."CompanyBranchAddressDetails"."Latitude", 
    company."CompanyBranchAddressDetails"."Longitude", 
	company."CompanyBranch"."CompanyBranchPrimaryContactID",
    company."CompanyExecutive"."ExecutiveName",
    company."CompanyExecutive"."ContactNumber",
    company."CompanyBranch"."IsActive" 
FROM company."CompanyBranch"
    JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyBranch"."CompanyRegionID"
    JOIN company."CompanyArea" ON company."CompanyArea"."CompanyAreaID"=company."CompanyBranch"."CompanyAreaID"
    JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
    JOIN company."CompanyBranchAddressDetails" ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
    JOIN company."CompanyExecutive" ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyBranch"."CompanyBranchPrimaryContactID"
   	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
WHERE company."CompanyBranch"."CompanyID"="CompanyIdIn"
		AND company."CompanyBranch"."MarkForDelete"=false 
        AND company."CompanyRegion"."MarkForDelete"=false 
        AND company."CompanyArea"."MarkForDelete"=false 
        AND company."Company"."MarkForDelete"=false 
        AND company."CompanyBranchAddressDetails"."MarkForDelete"=false 
        AND company."CompanyExecutive"."MarkForDelete"=false 
        AND location.cityinfo."MarkForDelete"=false;
$$;
 Q   DROP FUNCTION company."fn_selectCompanyBranchByCompanyId"("CompanyIdIn" bigint);
       company          postgres    false    9            �           1255    120462 /   fn_selectCompanyBranchByCompanyRegionId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranchByCompanyRegionId"("CompanyRegionIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyBranch"."CompanyBranchID",
    company."CompanyBranch"."CompanyBranchName",
    company."CompanyBranch"."CompanyBranchCode",
    company."CompanyBranch"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
     company."CompanyBranch"."CompanyAreaID",
    company."CompanyArea"."CompanyAreaName",
    company."CompanyArea"."CompanyAreaCode",
    company."CompanyBranch"."CompanyBranchType",
    company."CompanyBranch"."CompanyID", 
    company."Company"."CompanyName",
    company."Company"."CompanyCode", 
	company."CompanyBranchAddressDetails"."CompanyBranchAddressID",
    company."CompanyBranchAddressDetails"."AddressLine1", 
    company."CompanyBranchAddressDetails"."AddressLine2", 
    company."CompanyBranchAddressDetails"."AddressLine3", 
    company."CompanyBranchAddressDetails"."Pincode", 
    company."CompanyBranchAddressDetails"."CityID", 
    location.cityinfo."CityName", 
    company."CompanyBranchAddressDetails"."StateID", 
    company."CompanyBranchAddressDetails"."CountryID", 
    company."CompanyBranchAddressDetails"."Latitude", 
    company."CompanyBranchAddressDetails"."Longitude", 
	company."CompanyBranch"."CompanyBranchPrimaryContactID",
    company."CompanyExecutive"."ExecutiveName",
    company."CompanyExecutive"."ContactNumber",
    company."CompanyBranch"."IsActive" 
FROM company."CompanyBranch"
    JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyBranch"."CompanyRegionID"
    JOIN company."CompanyArea" ON company."CompanyArea"."CompanyAreaID"=company."CompanyBranch"."CompanyAreaID"
    JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
    JOIN company."CompanyBranchAddressDetails" ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
    JOIN company."CompanyExecutive" ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyBranch"."CompanyBranchPrimaryContactID"
   	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
WHERE company."CompanyBranch"."CompanyRegionID"="CompanyRegionIdIn"
		AND company."CompanyBranch"."MarkForDelete"=false 
        AND company."CompanyRegion"."MarkForDelete"=false 
        AND company."CompanyArea"."MarkForDelete"=false 
        AND company."Company"."MarkForDelete"=false 
        AND company."CompanyBranchAddressDetails"."MarkForDelete"=false 
        AND company."CompanyExecutive"."MarkForDelete"=false 
        AND location.cityinfo."MarkForDelete"=false;
$$;
 ]   DROP FUNCTION company."fn_selectCompanyBranchByCompanyRegionId"("CompanyRegionIdIn" bigint);
       company          postgres    false    9                       1255    120464 '   fn_selectCompanyBranchByOwnerID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyBranchByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyBranch"."CompanyBranchID",
    company."CompanyBranch"."CompanyBranchName",
    company."CompanyBranch"."CompanyBranchCode",
    company."CompanyBranch"."CompanyRegionID",
    company."CompanyRegion"."CompanyRegionName",
    company."CompanyRegion"."CompanyRegionCode",
    company."CompanyBranch"."CompanyAreaID",
    company."CompanyArea"."CompanyAreaName",
    company."CompanyArea"."CompanyAreaCode",
    company."CompanyBranch"."CompanyBranchType",
    company."CompanyBranch"."CompanyID", 
    company."Company"."CompanyName",
    company."Company"."CompanyCode", 
	company."CompanyBranchAddressDetails"."CompanyBranchAddressID",
    company."CompanyBranchAddressDetails"."AddressLine1", 
    company."CompanyBranchAddressDetails"."AddressLine2", 
    company."CompanyBranchAddressDetails"."AddressLine3", 
    company."CompanyBranchAddressDetails"."Pincode", 
    company."CompanyBranchAddressDetails"."CityID", 
    location.cityinfo."CityName", 
    company."CompanyBranchAddressDetails"."StateID", 
    company."CompanyBranchAddressDetails"."CountryID", 
    company."CompanyBranchAddressDetails"."Latitude", 
    company."CompanyBranchAddressDetails"."Longitude", 
	company."CompanyBranch"."CompanyBranchPrimaryContactID",
    company."CompanyExecutive"."ExecutiveName",
    company."CompanyExecutive"."ContactNumber",
    company."CompanyBranch"."IsActive" 
FROM company."CompanyBranch"
    JOIN company."CompanyRegion" ON company."CompanyRegion"."CompanyRegionID"=company."CompanyBranch"."CompanyRegionID"
    JOIN company."CompanyArea" ON company."CompanyArea"."CompanyAreaID"=company."CompanyBranch"."CompanyAreaID"
    JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
    JOIN company."CompanyBranchAddressDetails" ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
    JOIN company."CompanyExecutive" ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyBranch"."CompanyBranchPrimaryContactID"
  	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyBranchAddressDetails"."CityID"
	JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
WHERE company."Company"."OwnerContactId"="OwnerIdIn"
		AND company."CompanyBranch"."MarkForDelete"=false 
        AND company."CompanyRegion"."MarkForDelete"=false 
        AND company."CompanyArea"."MarkForDelete"=false 
        AND company."Company"."MarkForDelete"=false 
        AND company."CompanyBranchAddressDetails"."MarkForDelete"=false 
        AND company."CompanyExecutive"."MarkForDelete"=false 
        AND location.cityinfo."MarkForDelete"=false;
$$;
 M   DROP FUNCTION company."fn_selectCompanyBranchByOwnerID"("OwnerIdIn" bigint);
       company          postgres    false    9                        1255    67725 -   fn_selectCompanyBranchTypeByCompanyId(bigint)    FUNCTION     i  CREATE FUNCTION company."fn_selectCompanyBranchTypeByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("CompanyBranchTypeId" bigint, "CompanyBranchTypeName" text, "CompanyId" bigint, "CompanyName" text, "CompanyBranchPosition" integer, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$SELECT
		"company"."CompanyBranchType"."CompanyBranchTypeId",
		"company"."CompanyBranchType"."CompanyBranchTypeName",
		"company"."CompanyBranchType"."CompanyId",
		"company"."Company"."CompanyName",
		"company"."CompanyBranchType"."CompanyBranchPosition",
		"company"."CompanyBranchType"."CreatedBy",
		"company"."CompanyBranchType"."CreatedOn",
		"company"."CompanyBranchType"."LastEditBy",
		"company"."CompanyBranchType"."LastEditOn"
FROM "company"."CompanyBranchType"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="company"."CompanyBranchType"."CompanyId"
WHERE "company"."CompanyBranchType"."CompanyId"= "CompanyIdIn"
AND "company"."CompanyBranchType"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 U   DROP FUNCTION company."fn_selectCompanyBranchTypeByCompanyId"("CompanyIdIn" bigint);
       company          postgres    false    9            
           1255    120471 +   fn_selectCompanyBranchTypeByOwnerId(bigint)    FUNCTION     9  CREATE FUNCTION company."fn_selectCompanyBranchTypeByOwnerId"("OwnerIdIn" bigint) RETURNS TABLE("CompanyBranchTypeId" bigint, "CompanyBranchTypeName" text, "CompanyId" bigint, "CompanyName" text, "CompanyBranchPosition" integer, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"company"."CompanyBranchType"."CompanyBranchTypeId",
		"company"."CompanyBranchType"."CompanyBranchTypeName",
		"company"."CompanyBranchType"."CompanyId",
		"company"."Company"."CompanyName",
		"company"."CompanyBranchType"."CompanyBranchPosition",
		"company"."CompanyBranchType"."CreatedBy",
		"company"."CompanyBranchType"."CreatedOn",
		"company"."CompanyBranchType"."LastEditBy",
		"company"."CompanyBranchType"."LastEditOn"
FROM "company"."CompanyBranchType"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="company"."CompanyBranchType"."CompanyId"
	JOIN "owner"."OwnerContact" ON company."Company"."OwnerContactId"="owner"."OwnerContact"."id"
WHERE "company"."CompanyBranchType"."CompanyId" IN (SELECT "CompanyId" FROM company."Company" WHERE "OwnerContactId"="OwnerIdIn")
AND "owner"."OwnerContact"."MarkForDelete"=FALSE
AND "company"."CompanyBranchType"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 Q   DROP FUNCTION company."fn_selectCompanyBranchTypeByOwnerId"("OwnerIdIn" bigint);
       company          postgres    false    9                       1255    50373 0   fn_selectCompanyByCityID(bigint, bigint, bigint)    FUNCTION     Z  CREATE FUNCTION company."fn_selectCompanyByCityID"("CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$SELECT 	"CompanyId",
		"CompanyCode", 
		"CompanyName", 
		"OwnerContactId", 
		"CompanyAddress", 
        company."CompanyAddressDetails"."AddressLine1",
        company."CompanyAddressDetails"."AddressLine2",
        company."CompanyAddressDetails"."AddressLine3",
        company."CompanyAddressDetails"."Pincode",
		"CityId", 
        location.cityinfo."CityName",
        company."CompanyAddressDetails"."StateID",
        company."CompanyAddressDetails"."CountryID",
        company."CompanyAddressDetails"."Latitude",
        company."CompanyAddressDetails"."Longitude",
		company."Company"."IsActive"
	FROM company."Company"
        JOIN company."CompanyAddressDetails" ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
        JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."Company"."CityId"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
        JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
        JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
	WHERE company."CompanyAddressDetails"."CountryID"="CountryIdIn"
	AND company."CompanyAddressDetails"."StateID"="StateIdIn"
	AND company."CompanyAddressDetails"."CityID"="CityIdIn"
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false;
$$;
 o   DROP FUNCTION company."fn_selectCompanyByCityID"("CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint);
       company          postgres    false    9            �           1255    50370 #   fn_selectCompanyByCompanyID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyByCompanyID"("CompanyIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$SELECT 	"CompanyId",
		"CompanyCode", 
		"CompanyName", 
		"OwnerContactId", 
		"CompanyAddress", 
        company."CompanyAddressDetails"."AddressLine1",
        company."CompanyAddressDetails"."AddressLine2",
        company."CompanyAddressDetails"."AddressLine3",
        company."CompanyAddressDetails"."Pincode",
		"CityId", 
        location.cityinfo."CityName",
        company."CompanyAddressDetails"."StateID",
        company."CompanyAddressDetails"."CountryID",
        company."CompanyAddressDetails"."Latitude",
        company."CompanyAddressDetails"."Longitude",
		company."Company"."IsActive"
	FROM company."Company"
        JOIN company."CompanyAddressDetails" ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
       	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."Company"."CityId"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
        JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
        JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
	WHERE company."Company"."CompanyId"="CompanyIdIn"
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false;
$$;
 K   DROP FUNCTION company."fn_selectCompanyByCompanyID"("CompanyIdIn" bigint);
       company          postgres    false    9            �           1255    50371 #   fn_selectCompanyByCountryID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyByCountryID"("CountryIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$SELECT 	"CompanyId",
		"CompanyCode", 
		"CompanyName", 
		"OwnerContactId", 
		"CompanyAddress", 
        company."CompanyAddressDetails"."AddressLine1",
        company."CompanyAddressDetails"."AddressLine2",
        company."CompanyAddressDetails"."AddressLine3",
        company."CompanyAddressDetails"."Pincode",
		"CityId", 
        location.cityinfo."CityName",
        company."CompanyAddressDetails"."StateID",
        company."CompanyAddressDetails"."CountryID",
        company."CompanyAddressDetails"."Latitude",
        company."CompanyAddressDetails"."Longitude",
		company."Company"."IsActive"
	FROM company."Company"
        JOIN company."CompanyAddressDetails" ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
        JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."Company"."CityId"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
        JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
        JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
	WHERE company."CompanyAddressDetails"."CountryID"="CountryIdIn"
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false;
$$;
 K   DROP FUNCTION company."fn_selectCompanyByCountryID"("CountryIdIn" bigint);
       company          postgres    false    9            /           1255    59572 !   fn_selectCompanyByOwnerID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$SELECT 	"CompanyId",
		"CompanyCode", 
		"CompanyName", 
		"OwnerContactId", 
		"CompanyAddress", 
        company."CompanyAddressDetails"."AddressLine1",
        company."CompanyAddressDetails"."AddressLine2",
        company."CompanyAddressDetails"."AddressLine3",
        company."CompanyAddressDetails"."Pincode",
		"CityId", 
        location.cityinfo."CityName",
        company."CompanyAddressDetails"."StateID",
        company."CompanyAddressDetails"."CountryID",
        company."CompanyAddressDetails"."Latitude",
        company."CompanyAddressDetails"."Longitude",
		company."Company"."IsActive"
	FROM company."Company"
        JOIN company."CompanyAddressDetails" ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
       	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."Company"."CityId"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
        JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
        JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
	WHERE company."Company"."OwnerContactId"="OwnerIdIn"
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false;
$$;
 G   DROP FUNCTION company."fn_selectCompanyByOwnerID"("OwnerIdIn" bigint);
       company          postgres    false    9            �           1255    50372 )   fn_selectCompanyByStateID(bigint, bigint)    FUNCTION       CREATE FUNCTION company."fn_selectCompanyByStateID"("CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$SELECT 	"CompanyId",
		"CompanyCode", 
		"CompanyName", 
		"OwnerContactId", 
		"CompanyAddress", 
        company."CompanyAddressDetails"."AddressLine1",
        company."CompanyAddressDetails"."AddressLine2",
        company."CompanyAddressDetails"."AddressLine3",
        company."CompanyAddressDetails"."Pincode",
		"CityId", 
        location.cityinfo."CityName",
        company."CompanyAddressDetails"."StateID",
        company."CompanyAddressDetails"."CountryID",
        company."CompanyAddressDetails"."Latitude",
        company."CompanyAddressDetails"."Longitude",
		company."Company"."IsActive"
	FROM company."Company"
        JOIN company."CompanyAddressDetails" ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
       	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."Company"."CityId"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
        JOIN location.stateinfo ON location.stateinfo."StateID"=company."CompanyAddressDetails"."StateID"
        JOIN location.countryinfo ON location.countryinfo."CountryID"=company."CompanyAddressDetails"."CountryID"
	WHERE company."CompanyAddressDetails"."CountryID"="CountryIdIn"
	AND company."CompanyAddressDetails"."StateID"="StateIdIn"
	AND company."Company"."MarkForDelete"=false
	AND company."CompanyAddressDetails"."MarkForDelete"=false
	AND location.cityinfo."MarkForDelete"=false
	AND location.stateinfo."MarkForDelete"=false
	AND location.countryinfo."MarkForDelete"=false;
$$;
 ]   DROP FUNCTION company."fn_selectCompanyByStateID"("CountryIdIn" bigint, "StateIdIn" bigint);
       company          postgres    false    9                       1255    120473    fn_selectCompanyExecutive()    FUNCTION     K  CREATE FUNCTION company."fn_selectCompanyExecutive"() RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
    LANGUAGE sql
    AS $$
SELECT    
	company."CompanyExecutive"."CompanyExecutiveID" ,
    company."CompanyExecutive"."ExecutiveName" ,
    company."CompanyExecutive"."LoginID" ,
    company."CompanyExecutive"."Password" ,
    company."CompanyExecutive"."CompanyBranchID" ,
    company."CompanyBranch"."CompanyBranchName" ,
    company."CompanyBranch"."CompanyBranchCode" ,
    company."CompanyExecutive"."BaseCityID" ,
    location.cityinfo."CityName" ,
    company."CompanyExecutive"."CompanyID" ,
    company."Company"."CompanyName" ,
    company."Company"."CompanyCode" ,
    company."CompanyExecutive"."ContactNumber" ,
    company."CompanyExecutive"."IsActive" ,
    company."CompanyExecutive"."LastEditDeviceType"
    FROM company."CompanyExecutive"
        JOIN company."CompanyBranch" ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
        JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
      	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyExecutive"."BaseCityID"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
    WHERE company."CompanyExecutive"."MarkForDelete"=false
            AND company."CompanyBranch"."MarkForDelete"=false
            AND company."Company"."MarkForDelete"=false
            AND location.cityinfo."MarkForDelete"=false
$$;
 5   DROP FUNCTION company."fn_selectCompanyExecutive"();
       company          postgres    false    9                       1255    120474 2   fn_selectCompanyExecutiveByCompanyBranchId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutiveByCompanyBranchId"("CompanyBranchIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
    LANGUAGE sql
    AS $$
SELECT    
	company."CompanyExecutive"."CompanyExecutiveID" ,
    company."CompanyExecutive"."ExecutiveName" ,
    company."CompanyExecutive"."LoginID" ,
    company."CompanyExecutive"."Password" ,
    company."CompanyExecutive"."CompanyBranchID" ,
    company."CompanyBranch"."CompanyBranchName" ,
    company."CompanyBranch"."CompanyBranchCode" ,
    company."CompanyExecutive"."BaseCityID" ,
    location.cityinfo."CityName" ,
    company."CompanyExecutive"."CompanyID" ,
    company."Company"."CompanyName" ,
    company."Company"."CompanyCode" ,
    company."CompanyExecutive"."ContactNumber" ,
    company."CompanyExecutive"."IsActive" ,
    company."CompanyExecutive"."LastEditDeviceType"
    FROM company."CompanyExecutive"
        JOIN company."CompanyBranch" ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
        JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
        JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyExecutive"."BaseCityID"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
    WHERE company."CompanyExecutive"."CompanyBranchID"="CompanyBranchIdIn"
            AND company."CompanyExecutive"."MarkForDelete"=false
            AND company."CompanyBranch"."MarkForDelete"=false
            AND company."Company"."MarkForDelete"=false
            AND location.cityinfo."MarkForDelete"=false
$$;
 `   DROP FUNCTION company."fn_selectCompanyExecutiveByCompanyBranchId"("CompanyBranchIdIn" bigint);
       company          postgres    false    9                       1255    120475 5   fn_selectCompanyExecutiveByCompanyExecutiveId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutiveByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
    LANGUAGE sql
    AS $$
SELECT    
	company."CompanyExecutive"."CompanyExecutiveID" ,
    company."CompanyExecutive"."ExecutiveName" ,
    company."CompanyExecutive"."LoginID" ,
    company."CompanyExecutive"."Password" ,
    company."CompanyExecutive"."CompanyBranchID" ,
    company."CompanyBranch"."CompanyBranchName" ,
    company."CompanyBranch"."CompanyBranchCode" ,
    company."CompanyExecutive"."BaseCityID" ,
    location.cityinfo."CityName" ,
    company."CompanyExecutive"."CompanyID" ,
    company."Company"."CompanyName" ,
    company."Company"."CompanyCode" ,
    company."CompanyExecutive"."ContactNumber" ,
    company."CompanyExecutive"."IsActive" ,
    company."CompanyExecutive"."LastEditDeviceType"
    FROM company."CompanyExecutive"
        JOIN company."CompanyBranch" ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
        JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
       	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyExecutive"."BaseCityID"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
    WHERE company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"
            AND company."CompanyExecutive"."MarkForDelete"=false
            AND company."CompanyBranch"."MarkForDelete"=false
            AND company."Company"."MarkForDelete"=false
            AND location.cityinfo."MarkForDelete"=false
$$;
 f   DROP FUNCTION company."fn_selectCompanyExecutiveByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9                       1255    120476 ,   fn_selectCompanyExecutiveByCompanyId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutiveByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
    LANGUAGE sql
    AS $$
SELECT    
	company."CompanyExecutive"."CompanyExecutiveID" ,
    company."CompanyExecutive"."ExecutiveName" ,
    company."CompanyExecutive"."LoginID" ,
    company."CompanyExecutive"."Password" ,
    company."CompanyExecutive"."CompanyBranchID" ,
    company."CompanyBranch"."CompanyBranchName" ,
    company."CompanyBranch"."CompanyBranchCode" ,
    company."CompanyExecutive"."BaseCityID" ,
    location.cityinfo."CityName" ,
    company."CompanyExecutive"."CompanyID" ,
    company."Company"."CompanyName" ,
    company."Company"."CompanyCode" ,
    company."CompanyExecutive"."ContactNumber" ,
    company."CompanyExecutive"."IsActive" ,
    company."CompanyExecutive"."LastEditDeviceType"
    FROM company."CompanyExecutive"
        JOIN company."CompanyBranch" ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
        JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
       	JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyExecutive"."BaseCityID"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
    WHERE company."CompanyExecutive"."CompanyID"="CompanyIdIn"
            AND company."CompanyExecutive"."MarkForDelete"=false
            AND company."CompanyBranch"."MarkForDelete"=false
            AND company."Company"."MarkForDelete"=false
            AND location.cityinfo."MarkForDelete"=false
$$;
 T   DROP FUNCTION company."fn_selectCompanyExecutiveByCompanyId"("CompanyIdIn" bigint);
       company          postgres    false    9                       1255    120477 *   fn_selectCompanyExecutiveByOwnerID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutiveByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
    LANGUAGE sql
    AS $$
SELECT    
	company."CompanyExecutive"."CompanyExecutiveID" ,
    company."CompanyExecutive"."ExecutiveName" ,
    company."CompanyExecutive"."LoginID" ,
    company."CompanyExecutive"."Password" ,
    company."CompanyExecutive"."CompanyBranchID" ,
    company."CompanyBranch"."CompanyBranchName" ,
    company."CompanyBranch"."CompanyBranchCode" ,
    company."CompanyExecutive"."BaseCityID" ,
    location.cityinfo."CityName" ,
    company."CompanyExecutive"."CompanyID" ,
    company."Company"."CompanyName" ,
    company."Company"."CompanyCode" ,
    company."CompanyExecutive"."ContactNumber" ,
    company."CompanyExecutive"."IsActive" ,
    company."CompanyExecutive"."LastEditDeviceType"
    FROM company."CompanyExecutive"
        JOIN company."CompanyBranch" ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
        JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
        JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyExecutive"."BaseCityID"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
    WHERE company."Company"."OwnerContactId"="OwnerIdIn"
            AND company."CompanyExecutive"."MarkForDelete"=false
            AND company."CompanyBranch"."MarkForDelete"=false
            AND company."Company"."MarkForDelete"=false
            AND location.cityinfo."MarkForDelete"=false
$$;
 P   DROP FUNCTION company."fn_selectCompanyExecutiveByOwnerID"("OwnerIdIn" bigint);
       company          postgres    false    9                       1255    67913 0   fn_selectCompanyExecutiveOfLowerPosition(bigint)    FUNCTION     >
  CREATE FUNCTION company."fn_selectCompanyExecutiveOfLowerPosition"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
    SELECT    
    company."CompanyExecutive"."CompanyExecutiveID" ,
    company."CompanyExecutive"."ExecutiveName" ,
    company."CompanyExecutive"."LoginID" ,
    company."CompanyExecutive"."Password" ,
    company."CompanyExecutive"."CompanyBranchID" ,
    company."CompanyBranch"."CompanyBranchName" ,
    company."CompanyBranch"."CompanyBranchCode" ,
    company."CompanyExecutive"."BaseCityID" ,
    location.cityinfo."CityName" ,
    company."CompanyExecutive"."CompanyID" ,
    company."Company"."CompanyName" ,
    company."Company"."CompanyCode" ,
    company."CompanyExecutive"."ContactNumber" ,
    company."CompanyExecutive"."IsActive" 
    FROM company."CompanyExecutive"
        JOIN company."CompanyBranch" ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
        JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
        JOIN "location"."businessCityForCompany" ON "location"."businessCityForCompany"."BusinessCityForCompanyID"=company."CompanyExecutive"."BaseCityID"
		JOIN "location"."cityinfo" ON "location"."cityinfo"."CityID"="location"."businessCityForCompany"."CityID"
		JOIN "position"."Positions" ON company."CompanyExecutive"."DeviceType"="position"."Positions"."id"
    WHERE "position"."Positions"."PositionPriority" <(
	SELECT "position"."Positions"."PositionPriority" FROM company."CompanyExecutive"
	JOIN "position"."Positions" ON company."CompanyExecutive"."DeviceType"="position"."Positions"."id"
	WHERE company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"
	AND company."CompanyExecutive"."CompanyID" IN(
		SELECT "CompanyID" FROM company."CompanyExecutive" 
		WHERE company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"))
            AND company."CompanyExecutive"."MarkForDelete"=false
            AND company."CompanyBranch"."MarkForDelete"=false
            AND company."Company"."MarkForDelete"=false
			AND (SELECT COUNT("CompanyExecutiveID") 
				 FROM "company"."CompanyExecutive"
				 WHERE "CompanyExecutiveID"="CompanyExecutiveIdIn"
				 AND "MarkForDelete"=true)=0
            AND location.cityinfo."MarkForDelete"=false
$$;
 a   DROP FUNCTION company."fn_selectCompanyExecutiveOfLowerPosition"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            B           1255    67489 -   fn_selectCompanyExecutivePLByAllYears(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutivePLByAllYears"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PLRate" numeric, "Year" double precision)
    LANGUAGE sql
    AS $$
SELECT AVG("PLRate"),extract(year from "dateOfEntry") FROM company."CompanyExecutivePL"
WHERE "executiveId"="CompanyExecutiveIdIn"
GROUP BY extract(year from "dateOfEntry")
ORDER BY extract(year from "dateOfEntry");
$$;
 ^   DROP FUNCTION company."fn_selectCompanyExecutivePLByAllYears"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            1           1255    59587 0   fn_selectCompanyExecutivePLByExecutiveId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutivePLByExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE(id bigint, "executiveId" bigint, "PLRate" integer, "dateOfEntry" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"id",
		"executiveId",
		"PLRate",
		"dateOfEntry"
FROM "company"."CompanyExecutivePL"
WHERE "company"."CompanyExecutivePL"."executiveId"="CompanyExecutiveIdIn"
$$;
 a   DROP FUNCTION company."fn_selectCompanyExecutivePLByExecutiveId"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            2           1255    59588 =   fn_selectCompanyExecutivePLByExecutiveIdAndDate(bigint, date)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "dateForSearch" date) RETURNS TABLE(id bigint, "executiveId" bigint, "PLRate" integer, "dateOfEntry" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"id",
		"executiveId",
		"PLRate",
		"dateOfEntry"
FROM "company"."CompanyExecutivePL"
WHERE "company"."CompanyExecutivePL"."executiveId"="CompanyExecutiveIdIn"
AND date("company"."CompanyExecutivePL"."dateOfEntry")="dateForSearch"
$$;
 ~   DROP FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "dateForSearch" date);
       company          postgres    false    9            �           1255    59589 G   fn_selectCompanyExecutivePLByExecutiveIdBetweenDate(bigint, date, date)    FUNCTION     r  CREATE FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdBetweenDate"("CompanyExecutiveIdIn" bigint, "dateForSearchStart" date, "dateForSearchEnd" date) RETURNS TABLE(id bigint, "executiveId" bigint, "PLRate" integer, "dateOfEntry" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"id",
		"executiveId",
		"PLRate",
		"dateOfEntry"
FROM "company"."CompanyExecutivePL"
WHERE "company"."CompanyExecutivePL"."executiveId"="CompanyExecutiveIdIn"
AND date("company"."CompanyExecutivePL"."dateOfEntry") >= "dateForSearchStart"
AND date("company"."CompanyExecutivePL"."dateOfEntry") <= "dateForSearchEnd"
$$;
 �   DROP FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdBetweenDate"("CompanyExecutiveIdIn" bigint, "dateForSearchStart" date, "dateForSearchEnd" date);
       company          postgres    false    9            	           1255    59603 <   fn_selectCompanyExecutivePLByMonth(bigint, integer, integer)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutivePLByMonth"("CompanyExecutiveIdIn" bigint, "MonthId" integer, "YearId" integer) RETURNS TABLE("PLRate" numeric, "Date" date)
    LANGUAGE sql
    AS $$
SELECT AVG("PLRate"),date("dateOfEntry") FROM company."CompanyExecutivePL"
WHERE extract(month from "dateOfEntry")="MonthId"
AND extract(year from "dateOfEntry")="YearId"
AND "executiveId"="CompanyExecutiveIdIn"
GROUP BY date("dateOfEntry") 
ORDER BY date("dateOfEntry");
$$;
 �   DROP FUNCTION company."fn_selectCompanyExecutivePLByMonth"("CompanyExecutiveIdIn" bigint, "MonthId" integer, "YearId" integer);
       company          postgres    false    9                       1255    59608 2   fn_selectCompanyExecutivePLByYear(bigint, integer)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyExecutivePLByYear"("CompanyExecutiveIdIn" bigint, "YearId" integer) RETURNS TABLE("PLRate" numeric, "Month" double precision)
    LANGUAGE sql
    AS $$
SELECT AVG("PLRate"),extract(month from "dateOfEntry") FROM company."CompanyExecutivePL"
WHERE extract(year from "dateOfEntry")="YearId"
AND "executiveId"="CompanyExecutiveIdIn"
GROUP BY extract(month from "dateOfEntry")
ORDER BY extract(month from "dateOfEntry")
$$;
 l   DROP FUNCTION company."fn_selectCompanyExecutivePLByYear"("CompanyExecutiveIdIn" bigint, "YearId" integer);
       company          postgres    false    9                       1255    78693 .   fn_selectCompanyExecutivePLLastPLEntry(bigint)    FUNCTION     #  CREATE FUNCTION company."fn_selectCompanyExecutivePLLastPLEntry"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PLRate" integer)
    LANGUAGE sql
    AS $$
SELECT "PLRate" 
FROM company."CompanyExecutivePL"
WHERE "executiveId"="CompanyExecutiveIdIn" 
ORDER BY "dateOfEntry" DESC LIMIT 1;
$$;
 _   DROP FUNCTION company."fn_selectCompanyExecutivePLLastPLEntry"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            @           1255    67491 1   fn_selectCompanyExecutivePositionPriority(bigint)    FUNCTION     0  CREATE FUNCTION company."fn_selectCompanyExecutivePositionPriority"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PositionPriority" integer)
    LANGUAGE sql
    AS $$SELECT "CorrespondingPosition" 
FROM public."CRMAccessList" 
WHERE "CorrespondingId"="CompanyExecutiveIdIn"
AND "MarkForDelete"=FALSE$$;
 b   DROP FUNCTION company."fn_selectCompanyExecutivePositionPriority"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            �           1255    50383    fn_selectCompanyRegion()    FUNCTION     Q  CREATE FUNCTION company."fn_selectCompanyRegion"() RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyRegion"."CompanyRegionID",
	company."CompanyRegion"."CompanyRegionName",
	company."CompanyRegion"."CompanyRegionCode",
	company."CompanyRegion"."CompanyRegionDescription",
	company."CompanyRegion"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
	company."CompanyRegion"."IsActive"
	FROM company."CompanyRegion"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyRegion"."CompanyID"
	WHERE company."CompanyRegion"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false;
$$;
 2   DROP FUNCTION company."fn_selectCompanyRegion"();
       company          postgres    false    9            �           1255    50386 )   fn_selectCompanyRegionByCompanyID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyRegionByCompanyID"("CompanyIdIn" bigint) RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyRegion"."CompanyRegionID",
	company."CompanyRegion"."CompanyRegionName",
	company."CompanyRegion"."CompanyRegionCode",
	company."CompanyRegion"."CompanyRegionDescription",
	company."CompanyRegion"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
	company."CompanyRegion"."IsActive"
	FROM company."CompanyRegion"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyRegion"."CompanyID"
	WHERE company."CompanyRegion"."CompanyID"="CompanyIdIn"
	AND company."CompanyRegion"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false;
$$;
 Q   DROP FUNCTION company."fn_selectCompanyRegionByCompanyID"("CompanyIdIn" bigint);
       company          postgres    false    9            �           1255    50384 /   fn_selectCompanyRegionByCompanyRegionID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyRegionByCompanyRegionID"("CompanyRegionIdIn" bigint) RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyRegion"."CompanyRegionID",
	company."CompanyRegion"."CompanyRegionName",
	company."CompanyRegion"."CompanyRegionCode",
	company."CompanyRegion"."CompanyRegionDescription",
	company."CompanyRegion"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
	company."CompanyRegion"."IsActive"
	FROM company."CompanyRegion"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyRegion"."CompanyID"
	WHERE company."CompanyRegion"."CompanyRegionID"="CompanyRegionIdIn"
	AND company."CompanyRegion"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false;
$$;
 ]   DROP FUNCTION company."fn_selectCompanyRegionByCompanyRegionID"("CompanyRegionIdIn" bigint);
       company          postgres    false    9            -           1255    59573 '   fn_selectCompanyRegionByOwnerID(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectCompanyRegionByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	company."CompanyRegion"."CompanyRegionID",
	company."CompanyRegion"."CompanyRegionName",
	company."CompanyRegion"."CompanyRegionCode",
	company."CompanyRegion"."CompanyRegionDescription",
	company."CompanyRegion"."CompanyID",
	company."Company"."CompanyName",
	company."Company"."CompanyCode",
	company."CompanyRegion"."IsActive"
	FROM company."CompanyRegion"
		JOIN company."Company" ON company."Company"."CompanyId"=company."CompanyRegion"."CompanyID"
	WHERE company."Company"."OwnerContactId"="OwnerIdIn"
	AND company."CompanyRegion"."MarkForDelete"=false
	AND company."Company"."MarkForDelete"=false;
$$;
 M   DROP FUNCTION company."fn_selectCompanyRegionByOwnerID"("OwnerIdIn" bigint);
       company          postgres    false    9            3           1255    59596 )   fn_selectLatestCompanyExecutivePL(bigint)    FUNCTION     ]  CREATE FUNCTION company."fn_selectLatestCompanyExecutivePL"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PLRate" integer)
    LANGUAGE sql
    AS $$
SELECT
		"PLRate"
FROM "company"."CompanyExecutivePL"
WHERE "company"."CompanyExecutivePL"."executiveId"="CompanyExecutiveIdIn"
ORDER BY "company"."CompanyExecutivePL"."dateOfEntry" DESC LIMIT 1
$$;
 Z   DROP FUNCTION company."fn_selectLatestCompanyExecutivePL"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            �           1255    68282 ,   fn_selectOwnerIdByCompanyExecutiveId(bigint)    FUNCTION     �  CREATE FUNCTION company."fn_selectOwnerIdByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("OwnerId" bigint)
    LANGUAGE sql
    AS $$
SELECT company."Company"."OwnerContactId"
FROM company."CompanyExecutive"
	JOIN company."Company"
		ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"
AND company."Company"."MarkForDelete"=FALSE
AND company."Company"."MarkForDelete"=FALSE;
$$;
 ]   DROP FUNCTION company."fn_selectOwnerIdByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint);
       company          postgres    false    9            A           1255    49959 8   fn_updateCompanyAddressDetailsAddressLine1(bigint, text)    FUNCTION     u  CREATE FUNCTION company."fn_updateCompanyAddressDetailsAddressLine1"("CompanyAddressIdIn" bigint, "AddressLine1In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "AddressLine1"="AddressLine1In" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 x   DROP FUNCTION company."fn_updateCompanyAddressDetailsAddressLine1"("CompanyAddressIdIn" bigint, "AddressLine1In" text);
       company          postgres    false    9            >           1255    49960 8   fn_updateCompanyAddressDetailsAddressLine2(bigint, text)    FUNCTION     u  CREATE FUNCTION company."fn_updateCompanyAddressDetailsAddressLine2"("CompanyAddressIdIn" bigint, "AddressLine2In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "AddressLine2"="AddressLine2In" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 x   DROP FUNCTION company."fn_updateCompanyAddressDetailsAddressLine2"("CompanyAddressIdIn" bigint, "AddressLine2In" text);
       company          postgres    false    9            ?           1255    49961 8   fn_updateCompanyAddressDetailsAddressLine3(bigint, text)    FUNCTION     u  CREATE FUNCTION company."fn_updateCompanyAddressDetailsAddressLine3"("CompanyAddressIdIn" bigint, "AddressLine3In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "AddressLine3"="AddressLine3In" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 x   DROP FUNCTION company."fn_updateCompanyAddressDetailsAddressLine3"("CompanyAddressIdIn" bigint, "AddressLine3In" text);
       company          postgres    false    9            B           1255    49963 4   fn_updateCompanyAddressDetailsCityID(bigint, bigint)    FUNCTION     _  CREATE FUNCTION company."fn_updateCompanyAddressDetailsCityID"("CompanyAddressIdIn" bigint, "CityIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "CityID"="CityIDIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 n   DROP FUNCTION company."fn_updateCompanyAddressDetailsCityID"("CompanyAddressIdIn" bigint, "CityIDIn" bigint);
       company          postgres    false    9            C           1255    49965 7   fn_updateCompanyAddressDetailsCountryID(bigint, bigint)    FUNCTION     k  CREATE FUNCTION company."fn_updateCompanyAddressDetailsCountryID"("CompanyAddressIdIn" bigint, "CountryIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "CountryID"="CountryIDIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 t   DROP FUNCTION company."fn_updateCompanyAddressDetailsCountryID"("CompanyAddressIdIn" bigint, "CountryIDIn" bigint);
       company          postgres    false    9            D           1255    49968 7   fn_updateCompanyAddressDetailsGeoLocation(bigint, text)    FUNCTION     q  CREATE FUNCTION company."fn_updateCompanyAddressDetailsGeoLocation"("CompanyAddressIdIn" bigint, "GeoLocationIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "GeoLocation"="GeoLocationIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 v   DROP FUNCTION company."fn_updateCompanyAddressDetailsGeoLocation"("CompanyAddressIdIn" bigint, "GeoLocationIn" text);
       company          postgres    false    9            E           1255    49970 8   fn_updateCompanyAddressDetailsLastEditBy(bigint, bigint)    FUNCTION     o  CREATE FUNCTION company."fn_updateCompanyAddressDetailsLastEditBy"("CompanyAddressIdIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "LastEditBy"="LastEditByIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 v   DROP FUNCTION company."fn_updateCompanyAddressDetailsLastEditBy"("CompanyAddressIdIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9            F           1255    49971 A   fn_updateCompanyAddressDetailsLastEditDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyAddressDetailsLastEditDeviceType"("CompanyAddressIdIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyAddressDetailsLastEditDeviceType"("CompanyAddressIdIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            G           1255    49969 M   fn_updateCompanyAddressDetailsLastEditOn(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyAddressDetailsLastEditOn"("CompanyAddressIdIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "LastEditOn"="LastEditOnIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyAddressDetailsLastEditOn"("CompanyAddressIdIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            @           1255    49966 4   fn_updateCompanyAddressDetailsLatitude(bigint, text)    FUNCTION     e  CREATE FUNCTION company."fn_updateCompanyAddressDetailsLatitude"("CompanyAddressIdIn" bigint, "LatitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "Latitude"="LatitudeIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 p   DROP FUNCTION company."fn_updateCompanyAddressDetailsLatitude"("CompanyAddressIdIn" bigint, "LatitudeIn" text);
       company          postgres    false    9            H           1255    49967 5   fn_updateCompanyAddressDetailsLongitude(bigint, text)    FUNCTION     i  CREATE FUNCTION company."fn_updateCompanyAddressDetailsLongitude"("CompanyAddressIdIn" bigint, "LongitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "Longitude"="LongitudeIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 r   DROP FUNCTION company."fn_updateCompanyAddressDetailsLongitude"("CompanyAddressIdIn" bigint, "LongitudeIn" text);
       company          postgres    false    9            I           1255    49962 5   fn_updateCompanyAddressDetailsPincode(bigint, bigint)    FUNCTION     c  CREATE FUNCTION company."fn_updateCompanyAddressDetailsPincode"("CompanyAddressIdIn" bigint, "PincodeIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "Pincode"="PincodeIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 p   DROP FUNCTION company."fn_updateCompanyAddressDetailsPincode"("CompanyAddressIdIn" bigint, "PincodeIn" bigint);
       company          postgres    false    9            J           1255    49964 5   fn_updateCompanyAddressDetailsStateID(bigint, bigint)    FUNCTION     c  CREATE FUNCTION company."fn_updateCompanyAddressDetailsStateID"("CompanyAddressIdIn" bigint, "StateIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyAddressDetails" SET "StateID"="StateIDIn" WHERE "CompanyAddressID"="CompanyAddressIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 p   DROP FUNCTION company."fn_updateCompanyAddressDetailsStateID"("CompanyAddressIdIn" bigint, "StateIDIn" bigint);
       company          postgres    false    9            b           1255    50035 1   fn_updateCompanyAreaCompanyAreaCode(bigint, text)    FUNCTION     d  CREATE FUNCTION company."fn_updateCompanyAreaCompanyAreaCode"("CompanyAreaIDIn" bigint, "CompanyAreaCodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "CompanyAreaCode"="CompanyAreaCodeIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 q   DROP FUNCTION company."fn_updateCompanyAreaCompanyAreaCode"("CompanyAreaIDIn" bigint, "CompanyAreaCodeIn" text);
       company          postgres    false    9            c           1255    50036 8   fn_updateCompanyAreaCompanyAreaDescription(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyAreaCompanyAreaDescription"("CompanyAreaIDIn" bigint, "CompanyAreaDescriptionIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "CompanyAreaDescription"="CompanyAreaDescriptionIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
    DROP FUNCTION company."fn_updateCompanyAreaCompanyAreaDescription"("CompanyAreaIDIn" bigint, "CompanyAreaDescriptionIn" text);
       company          postgres    false    9            a           1255    50034 1   fn_updateCompanyAreaCompanyAreaName(bigint, text)    FUNCTION     d  CREATE FUNCTION company."fn_updateCompanyAreaCompanyAreaName"("CompanyAreaIDIn" bigint, "CompanyAreaNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "CompanyAreaName"="CompanyAreaNameIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 q   DROP FUNCTION company."fn_updateCompanyAreaCompanyAreaName"("CompanyAreaIDIn" bigint, "CompanyAreaNameIn" text);
       company          postgres    false    9            d           1255    50037 -   fn_updateCompanyAreaCompanyID(bigint, bigint)    FUNCTION     N  CREATE FUNCTION company."fn_updateCompanyAreaCompanyID"("CompanyAreaIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "CompanyID"="CompanyIDIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 g   DROP FUNCTION company."fn_updateCompanyAreaCompanyID"("CompanyAreaIDIn" bigint, "CompanyIDIn" bigint);
       company          postgres    false    9            f           1255    50042 3   fn_updateCompanyAreaCompanyRegionID(bigint, bigint)    FUNCTION     f  CREATE FUNCTION company."fn_updateCompanyAreaCompanyRegionID"("CompanyAreaIDIn" bigint, "CompanyRegionIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "CompanyRegionID"="CompanyRegionIDIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 s   DROP FUNCTION company."fn_updateCompanyAreaCompanyRegionID"("CompanyAreaIDIn" bigint, "CompanyRegionIDIn" bigint);
       company          postgres    false    9            e           1255    50038 -   fn_updateCompanyAreaIsActive(bigint, boolean)    FUNCTION     K  CREATE FUNCTION company."fn_updateCompanyAreaIsActive"("CompanyAreaIDIn" bigint, "IsActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "IsActive"="IsActiveIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 f   DROP FUNCTION company."fn_updateCompanyAreaIsActive"("CompanyAreaIDIn" bigint, "IsActiveIn" boolean);
       company          postgres    false    9            j           1255    50046 .   fn_updateCompanyAreaLastEditBy(bigint, bigint)    FUNCTION     R  CREATE FUNCTION company."fn_updateCompanyAreaLastEditBy"("CompanyAreaIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "LastEditBy"="LastEditByIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 i   DROP FUNCTION company."fn_updateCompanyAreaLastEditBy"("CompanyAreaIDIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9            k           1255    50047 7   fn_updateCompanyAreaLastEditDeviceType(bigint, integer)    FUNCTION     s  CREATE FUNCTION company."fn_updateCompanyAreaLastEditDeviceType"("CompanyAreaIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 z   DROP FUNCTION company."fn_updateCompanyAreaLastEditDeviceType"("CompanyAreaIDIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            i           1255    50045 C   fn_updateCompanyAreaLastEditOn(bigint, timestamp without time zone)    FUNCTION     g  CREATE FUNCTION company."fn_updateCompanyAreaLastEditOn"("CompanyAreaIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyArea" SET "LastEditOn"="LastEditOnIn" WHERE "CompanyAreaID"="CompanyAreaIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 ~   DROP FUNCTION company."fn_updateCompanyAreaLastEditOn"("CompanyAreaIDIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            �           1255    50152 >   fn_updateCompanyBranchAddressDetailsAddressLine1(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine1"("CompanyBranchAddressIDIn" bigint, "AddressLine1In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "AddressLine1"="AddressLine1In" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine1"("CompanyBranchAddressIDIn" bigint, "AddressLine1In" text);
       company          postgres    false    9            �           1255    50153 >   fn_updateCompanyBranchAddressDetailsAddressLine2(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine2"("CompanyBranchAddressIDIn" bigint, "AddressLine2In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "AddressLine2"="AddressLine2In" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine2"("CompanyBranchAddressIDIn" bigint, "AddressLine2In" text);
       company          postgres    false    9            �           1255    50154 >   fn_updateCompanyBranchAddressDetailsAddressLine3(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine3"("CompanyBranchAddressIDIn" bigint, "AddressLine3In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "AddressLine3"="AddressLine3In" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine3"("CompanyBranchAddressIDIn" bigint, "AddressLine3In" text);
       company          postgres    false    9            W           1255    50155 :   fn_updateCompanyBranchAddressDetailsCityID(bigint, bigint)    FUNCTION     }  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsCityID"("CompanyBranchAddressIDIn" bigint, "CityIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "CityID"="CityIDIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 z   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsCityID"("CompanyBranchAddressIDIn" bigint, "CityIDIn" bigint);
       company          postgres    false    9            X           1255    50156 =   fn_updateCompanyBranchAddressDetailsCountryID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsCountryID"("CompanyBranchAddressIDIn" bigint, "CountryIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "CountryID"="CountryIDIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsCountryID"("CompanyBranchAddressIDIn" bigint, "CountryIDIn" bigint);
       company          postgres    false    9            Y           1255    50157 =   fn_updateCompanyBranchAddressDetailsGeoLocation(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsGeoLocation"("CompanyBranchAddressIDIn" bigint, "GeoLocationIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "GeoLocation"="GeoLocationIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsGeoLocation"("CompanyBranchAddressIDIn" bigint, "GeoLocationIn" text);
       company          postgres    false    9            Z           1255    50158 >   fn_updateCompanyBranchAddressDetailsLastEditBy(bigint, bigint)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditBy"("CompanyBranchAddressIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "LastEditBy"="LastEditByIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditBy"("CompanyBranchAddressIDIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9            [           1255    50159 G   fn_updateCompanyBranchAddressDetailsLastEditDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditDeviceType"("CompanyBranchAddressIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditDeviceType"("CompanyBranchAddressIDIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            \           1255    50160 S   fn_updateCompanyBranchAddressDetailsLastEditOn(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditOn"("CompanyBranchAddressIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "LastEditOn"="LastEditOnIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditOn"("CompanyBranchAddressIDIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            ]           1255    50161 :   fn_updateCompanyBranchAddressDetailsLatitude(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLatitude"("CompanyBranchAddressIDIn" bigint, "LatitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "Latitude"="LatitudeIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 |   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsLatitude"("CompanyBranchAddressIDIn" bigint, "LatitudeIn" text);
       company          postgres    false    9            ^           1255    50162 ;   fn_updateCompanyBranchAddressDetailsLongitude(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLongitude"("CompanyBranchAddressIDIn" bigint, "LongitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "Longitude"="LongitudeIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 ~   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsLongitude"("CompanyBranchAddressIDIn" bigint, "LongitudeIn" text);
       company          postgres    false    9            _           1255    50163 ;   fn_updateCompanyBranchAddressDetailsPincode(bigint, bigint)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsPincode"("CompanyBranchAddressIDIn" bigint, "PincodeIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "Pincode"="PincodeIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 |   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsPincode"("CompanyBranchAddressIDIn" bigint, "PincodeIn" bigint);
       company          postgres    false    9            l           1255    50164 ;   fn_updateCompanyBranchAddressDetailsStateID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsStateID"("CompanyBranchAddressIDIn" bigint, "StateIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranchAddressDetails" SET "StateID"="StateIDIn" WHERE "CompanyBranchAddressID"="CompanyBranchAddressIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 |   DROP FUNCTION company."fn_updateCompanyBranchAddressDetailsStateID"("CompanyBranchAddressIDIn" bigint, "StateIDIn" bigint);
       company          postgres    false    9            r           1255    50089 3   fn_updateCompanyBranchCompanyAreaID(bigint, bigint)    FUNCTION     h  CREATE FUNCTION company."fn_updateCompanyBranchCompanyAreaID"("CompanyBranchIDIn" bigint, "CompanyAreaIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyAreaID"="CompanyAreaIDIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 s   DROP FUNCTION company."fn_updateCompanyBranchCompanyAreaID"("CompanyBranchIDIn" bigint, "CompanyAreaIDIn" bigint);
       company          postgres    false    9            s           1255    50092 <   fn_updateCompanyBranchCompanyBranchAddressID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchAddressID"("CompanyBranchIDIn" bigint, "CompanyBranchAddressIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyBranchAddressID"="CompanyBranchAddressIDIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchCompanyBranchAddressID"("CompanyBranchIDIn" bigint, "CompanyBranchAddressIDIn" bigint);
       company          postgres    false    9            t           1255    50087 5   fn_updateCompanyBranchCompanyBranchCode(bigint, text)    FUNCTION     v  CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchCode"("CompanyBranchIDIn" bigint, "CompanyBranchCodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyBranchCode"="CompanyBranchCodeIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 y   DROP FUNCTION company."fn_updateCompanyBranchCompanyBranchCode"("CompanyBranchIDIn" bigint, "CompanyBranchCodeIn" text);
       company          postgres    false    9            u           1255    50086 5   fn_updateCompanyBranchCompanyBranchName(bigint, text)    FUNCTION     v  CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchName"("CompanyBranchIDIn" bigint, "CompanyBranchNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyBranchName"="CompanyBranchNameIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 y   DROP FUNCTION company."fn_updateCompanyBranchCompanyBranchName"("CompanyBranchIDIn" bigint, "CompanyBranchNameIn" text);
       company          postgres    false    9            v           1255    50093 C   fn_updateCompanyBranchCompanyBranchPrimaryContactID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchPrimaryContactID"("CompanyBranchIDIn" bigint, "CompanyBranchPrimaryContactIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyBranchPrimaryContactID"="CompanyBranchPrimaryContactIDIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchCompanyBranchPrimaryContactID"("CompanyBranchIDIn" bigint, "CompanyBranchPrimaryContactIDIn" bigint);
       company          postgres    false    9            w           1255    50091 8   fn_updateCompanyBranchCompanyBranchType(bigint, integer)    FUNCTION     y  CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchType"("CompanyBranchIDIn" bigint, "CompanyBranchTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyBranchType"="CompanyBranchTypeIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 |   DROP FUNCTION company."fn_updateCompanyBranchCompanyBranchType"("CompanyBranchIDIn" bigint, "CompanyBranchTypeIn" integer);
       company          postgres    false    9            x           1255    50090 /   fn_updateCompanyBranchCompanyID(bigint, bigint)    FUNCTION     X  CREATE FUNCTION company."fn_updateCompanyBranchCompanyID"("CompanyBranchIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyID"="CompanyIDIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 k   DROP FUNCTION company."fn_updateCompanyBranchCompanyID"("CompanyBranchIDIn" bigint, "CompanyIDIn" bigint);
       company          postgres    false    9            y           1255    50088 5   fn_updateCompanyBranchCompanyRegionID(bigint, bigint)    FUNCTION     p  CREATE FUNCTION company."fn_updateCompanyBranchCompanyRegionID"("CompanyBranchIDIn" bigint, "CompanyRegionIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "CompanyRegionID"="CompanyRegionIDIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 w   DROP FUNCTION company."fn_updateCompanyBranchCompanyRegionID"("CompanyBranchIDIn" bigint, "CompanyRegionIDIn" bigint);
       company          postgres    false    9            z           1255    50094 /   fn_updateCompanyBranchIsActive(bigint, boolean)    FUNCTION     U  CREATE FUNCTION company."fn_updateCompanyBranchIsActive"("CompanyBranchIDIn" bigint, "IsActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "IsActive"="IsActiveIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 j   DROP FUNCTION company."fn_updateCompanyBranchIsActive"("CompanyBranchIDIn" bigint, "IsActiveIn" boolean);
       company          postgres    false    9            n           1255    50096 0   fn_updateCompanyBranchLastEditBy(bigint, bigint)    FUNCTION     \  CREATE FUNCTION company."fn_updateCompanyBranchLastEditBy"("CompanyBranchIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "LastEditBy"="LastEditByIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 m   DROP FUNCTION company."fn_updateCompanyBranchLastEditBy"("CompanyBranchIDIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9            o           1255    50097 9   fn_updateCompanyBranchLastEditDeviceType(bigint, integer)    FUNCTION     }  CREATE FUNCTION company."fn_updateCompanyBranchLastEditDeviceType"("CompanyBranchIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 ~   DROP FUNCTION company."fn_updateCompanyBranchLastEditDeviceType"("CompanyBranchIDIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            m           1255    50095 E   fn_updateCompanyBranchLastEditOn(bigint, timestamp without time zone)    FUNCTION     q  CREATE FUNCTION company."fn_updateCompanyBranchLastEditOn"("CompanyBranchIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyBranch" SET "LastEditOn"="LastEditOnIn" WHERE "CompanyBranchID"="CompanyBranchIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyBranchLastEditOn"("CompanyBranchIDIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            _           1255    67715 @   fn_updateCompanyBranchTypeCompanyBranchPosition(bigint, integer)    FUNCTION       CREATE FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchPosition"("idIn" bigint, "CompanyBranchPositionIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "company"."CompanyBranchType" SET "CompanyBranchPosition" = "CompanyBranchPositionIn" WHERE"CompanyBranchTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 {   DROP FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchPosition"("idIn" bigint, "CompanyBranchPositionIn" integer);
       company          postgres    false    9            ]           1255    67713 =   fn_updateCompanyBranchTypeCompanyBranchTypeName(bigint, text)    FUNCTION     |  CREATE FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchTypeName"("idIn" bigint, "CompanyBranchTypeNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "company"."CompanyBranchType" SET "CompanyBranchTypeName" = "CompanyBranchTypeNameIn" WHERE"CompanyBranchTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 x   DROP FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchTypeName"("idIn" bigint, "CompanyBranchTypeNameIn" text);
       company          postgres    false    9            ^           1255    67714 3   fn_updateCompanyBranchTypeCompanyId(bigint, bigint)    FUNCTION     N  CREATE FUNCTION company."fn_updateCompanyBranchTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "company"."CompanyBranchType" SET "CompanyId" = "CompanyIdIn" WHERE"CompanyBranchTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 b   DROP FUNCTION company."fn_updateCompanyBranchTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       company          postgres    false    9            `           1255    67716 4   fn_updateCompanyBranchTypeLastEditBy(bigint, bigint)    FUNCTION     R  CREATE FUNCTION company."fn_updateCompanyBranchTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "company"."CompanyBranchType" SET "LastEditBy" = "LastEditByIn" WHERE"CompanyBranchTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 d   DROP FUNCTION company."fn_updateCompanyBranchTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9            a           1255    67717 H   fn_updateCompanyBranchTypeLatEditOn(bigint, timestamp without time zone)    FUNCTION     f  CREATE FUNCTION company."fn_updateCompanyBranchTypeLatEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "company"."CompanyBranchType" SET "LastEditOn" = "LastEditOnIn" WHERE"CompanyBranchTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 x   DROP FUNCTION company."fn_updateCompanyBranchTypeLatEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            '           1255    49905 &   fn_updateCompanyCityId(bigint, bigint)    FUNCTION     .  CREATE FUNCTION company."fn_updateCompanyCityId"("CompanyIdIn" bigint, "CityIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "CityId"="CityIdIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 Y   DROP FUNCTION company."fn_updateCompanyCityId"("CompanyIdIn" bigint, "CityIdIn" bigint);
       company          postgres    false    9            -           1255    49904 .   fn_updateCompanyCompanyAddress(bigint, bigint)    FUNCTION     N  CREATE FUNCTION company."fn_updateCompanyCompanyAddress"("CompanyIdIn" bigint, "CompanyAddressIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "CompanyAddress"="CompanyAddressIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 i   DROP FUNCTION company."fn_updateCompanyCompanyAddress"("CompanyIdIn" bigint, "CompanyAddressIn" bigint);
       company          postgres    false    9            :           1255    49901 )   fn_updateCompanyCompanyCode(bigint, text)    FUNCTION     @  CREATE FUNCTION company."fn_updateCompanyCompanyCode"("CompanyIdIn" bigint, "CompanyCodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "CompanyCode"="CompanyCodeIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 a   DROP FUNCTION company."fn_updateCompanyCompanyCode"("CompanyIdIn" bigint, "CompanyCodeIn" text);
       company          postgres    false    9            ;           1255    49902 )   fn_updateCompanyCompanyName(bigint, text)    FUNCTION     @  CREATE FUNCTION company."fn_updateCompanyCompanyName"("CompanyIdIn" bigint, "CompanyNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "CompanyName"="CompanyNameIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 a   DROP FUNCTION company."fn_updateCompanyCompanyName"("CompanyIdIn" bigint, "CompanyNameIn" text);
       company          postgres    false    9            �           1255    50130 3   fn_updateCompanyExecutiveBaseCityID(bigint, bigint)    FUNCTION     j  CREATE FUNCTION company."fn_updateCompanyExecutiveBaseCityID"("CompanyExecutiveIDIn" bigint, "BaseCityIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "BaseCityID"="BaseCityIDIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 s   DROP FUNCTION company."fn_updateCompanyExecutiveBaseCityID"("CompanyExecutiveIDIn" bigint, "BaseCityIDIn" bigint);
       company          postgres    false    9            �           1255    50129 8   fn_updateCompanyExecutiveCompanyBranchID(bigint, bigint)    FUNCTION     ~  CREATE FUNCTION company."fn_updateCompanyExecutiveCompanyBranchID"("CompanyExecutiveIDIn" bigint, "CompanyBranchIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "CompanyBranchID"="CompanyBranchIDIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 }   DROP FUNCTION company."fn_updateCompanyExecutiveCompanyBranchID"("CompanyExecutiveIDIn" bigint, "CompanyBranchIDIn" bigint);
       company          postgres    false    9            �           1255    50131 2   fn_updateCompanyExecutiveCompanyID(bigint, bigint)    FUNCTION     f  CREATE FUNCTION company."fn_updateCompanyExecutiveCompanyID"("CompanyExecutiveIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "CompanyID"="CompanyIDIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 q   DROP FUNCTION company."fn_updateCompanyExecutiveCompanyID"("CompanyExecutiveIDIn" bigint, "CompanyIDIn" bigint);
       company          postgres    false    9            �           1255    50132 4   fn_updateCompanyExecutiveContactNumber(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyExecutiveContactNumber"("CompanyExecutiveIDIn" bigint, "ContactNumberIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "ContactNumber"="ContactNumberIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
UPDATE public."CRMAccessList" SET "CorrespondingContactNumber"="ContactNumberIn" WHERE "CorrespondingId"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END;
$$;
 w   DROP FUNCTION company."fn_updateCompanyExecutiveContactNumber"("CompanyExecutiveIDIn" bigint, "ContactNumberIn" text);
       company          postgres    false    9            }           1255    50126 4   fn_updateCompanyExecutiveExecutiveName(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyExecutiveExecutiveName"("CompanyExecutiveIDIn" bigint, "ExecutiveNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "ExecutiveName"="ExecutiveNameIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
UPDATE public."CRMAccessList" SET "CorrespondingName"="ExecutiveNameIn" WHERE "CorrespondingId"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END;
$$;
 w   DROP FUNCTION company."fn_updateCompanyExecutiveExecutiveName"("CompanyExecutiveIDIn" bigint, "ExecutiveNameIn" text);
       company          postgres    false    9            �           1255    50134 3   fn_updateCompanyExecutiveLastEditBy(bigint, bigint)    FUNCTION     j  CREATE FUNCTION company."fn_updateCompanyExecutiveLastEditBy"("CompanyExecutiveIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "LastEditBy"="LastEditByIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 s   DROP FUNCTION company."fn_updateCompanyExecutiveLastEditBy"("CompanyExecutiveIDIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9                       1255    50135 <   fn_updateCompanyExecutiveLastEditDeviceType(bigint, integer)    FUNCTION       CREATE FUNCTION company."fn_updateCompanyExecutiveLastEditDeviceType"("CompanyExecutiveIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
UPDATE public."CRMAccessList" SET "CorrespondingPosition"="LastEditDeviceTypeIn" WHERE "CorrespondingId"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION company."fn_updateCompanyExecutiveLastEditDeviceType"("CompanyExecutiveIDIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            �           1255    50133 H   fn_updateCompanyExecutiveLastEditOn(bigint, timestamp without time zone)    FUNCTION       CREATE FUNCTION company."fn_updateCompanyExecutiveLastEditOn"("CompanyExecutiveIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "LastEditOn"="LastEditOnIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END; 
$$;
 �   DROP FUNCTION company."fn_updateCompanyExecutiveLastEditOn"("CompanyExecutiveIDIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            �           1255    50127 .   fn_updateCompanyExecutiveLoginID(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyExecutiveLoginID"("CompanyExecutiveIDIn" bigint, "LoginIDIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "LoginID"="LoginIDIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
UPDATE public."CRMAccessList" SET "CorrespondingEmailId"="LoginIDIn" WHERE "CorrespondingId"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END;
$$;
 k   DROP FUNCTION company."fn_updateCompanyExecutiveLoginID"("CompanyExecutiveIDIn" bigint, "LoginIDIn" text);
       company          postgres    false    9            ~           1255    50128 /   fn_updateCompanyExecutivePassword(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyExecutivePassword"("CompanyExecutiveIDIn" bigint, "PasswordIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE company."CompanyExecutive" SET  "Password"="PasswordIn" WHERE "CompanyExecutiveID"="CompanyExecutiveIDIn";
UPDATE public."CRMAccessList" SET "CorrespondingPassword"="PasswordIn" WHERE "CorrespondingId"="CompanyExecutiveIDIn";
RETURN true;
EXCEPTION WHEN OTHERS THEN
 RETURN false;
ROLLBACK;
END;
$$;
 m   DROP FUNCTION company."fn_updateCompanyExecutivePassword"("CompanyExecutiveIDIn" bigint, "PasswordIn" text);
       company          postgres    false    9            +           1255    49909 )   fn_updateCompanyIsActive(bigint, boolean)    FUNCTION     7  CREATE FUNCTION company."fn_updateCompanyIsActive"("CompanyIdIn" bigint, "IsActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "IsActive"="IsActiveIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 ^   DROP FUNCTION company."fn_updateCompanyIsActive"("CompanyIdIn" bigint, "IsActiveIn" boolean);
       company          postgres    false    9            *           1255    49908 3   fn_updateCompanyLastEditDeviceType(bigint, integer)    FUNCTION     _  CREATE FUNCTION company."fn_updateCompanyLastEditDeviceType"("CompanyIdIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 r   DROP FUNCTION company."fn_updateCompanyLastEditDeviceType"("CompanyIdIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            )           1255    49907 ,   fn_updateCompanyLastEditedBy(bigint, bigint)    FUNCTION     F  CREATE FUNCTION company."fn_updateCompanyLastEditedBy"("CompanyIdIn" bigint, "LastEditedByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "LastEditedBy"="LastEditedByIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 e   DROP FUNCTION company."fn_updateCompanyLastEditedBy"("CompanyIdIn" bigint, "LastEditedByIn" bigint);
       company          postgres    false    9            (           1255    49906 A   fn_updateCompanyLastEditedOn(bigint, timestamp without time zone)    FUNCTION     [  CREATE FUNCTION company."fn_updateCompanyLastEditedOn"("CompanyIdIn" bigint, "LastEditedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "LastEditedOn"="LastEditedOnIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 z   DROP FUNCTION company."fn_updateCompanyLastEditedOn"("CompanyIdIn" bigint, "LastEditedOnIn" timestamp without time zone);
       company          postgres    false    9            ,           1255    49903 .   fn_updateCompanyOwnerContactId(bigint, bigint)    FUNCTION     N  CREATE FUNCTION company."fn_updateCompanyOwnerContactId"("CompanyIdIn" bigint, "OwnerContactIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."Company" SET "OwnerContactId"="OwnerContactIdIn" WHERE "CompanyId"="CompanyIdIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 i   DROP FUNCTION company."fn_updateCompanyOwnerContactId"("CompanyIdIn" bigint, "OwnerContactIdIn" bigint);
       company          postgres    false    9            P           1255    49997 /   fn_updateCompanyRegionCompanyID(bigint, bigint)    FUNCTION     X  CREATE FUNCTION company."fn_updateCompanyRegionCompanyID"("CompanyRegionIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "CompanyID"="CompanyIDIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 k   DROP FUNCTION company."fn_updateCompanyRegionCompanyID"("CompanyRegionIDIn" bigint, "CompanyIDIn" bigint);
       company          postgres    false    9            N           1255    49995 5   fn_updateCompanyRegionCompanyRegionCode(bigint, text)    FUNCTION     v  CREATE FUNCTION company."fn_updateCompanyRegionCompanyRegionCode"("CompanyRegionIDIn" bigint, "CompanyRegionCodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "CompanyRegionCode"="CompanyRegionCodeIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 y   DROP FUNCTION company."fn_updateCompanyRegionCompanyRegionCode"("CompanyRegionIDIn" bigint, "CompanyRegionCodeIn" text);
       company          postgres    false    9            O           1255    49996 <   fn_updateCompanyRegionCompanyRegionDescription(bigint, text)    FUNCTION     �  CREATE FUNCTION company."fn_updateCompanyRegionCompanyRegionDescription"("CompanyRegionIDIn" bigint, "CompanyRegionDescriptionIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "CompanyRegionDescription"="CompanyRegionDescriptionIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyRegionCompanyRegionDescription"("CompanyRegionIDIn" bigint, "CompanyRegionDescriptionIn" text);
       company          postgres    false    9            M           1255    49994 5   fn_updateCompanyRegionCompanyRegionName(bigint, text)    FUNCTION     v  CREATE FUNCTION company."fn_updateCompanyRegionCompanyRegionName"("CompanyRegionIDIn" bigint, "CompanyRegionNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "CompanyRegionName"="CompanyRegionNameIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 y   DROP FUNCTION company."fn_updateCompanyRegionCompanyRegionName"("CompanyRegionIDIn" bigint, "CompanyRegionNameIn" text);
       company          postgres    false    9            Q           1255    49998 /   fn_updateCompanyRegionIsActive(bigint, boolean)    FUNCTION     U  CREATE FUNCTION company."fn_updateCompanyRegionIsActive"("CompanyRegionIDIn" bigint, "IsActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "IsActive"="IsActiveIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 j   DROP FUNCTION company."fn_updateCompanyRegionIsActive"("CompanyRegionIDIn" bigint, "IsActiveIn" boolean);
       company          postgres    false    9            T           1255    50000 0   fn_updateCompanyRegionLastEditBy(bigint, bigint)    FUNCTION     \  CREATE FUNCTION company."fn_updateCompanyRegionLastEditBy"("CompanyRegionIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "LastEditBy"="LastEditByIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 m   DROP FUNCTION company."fn_updateCompanyRegionLastEditBy"("CompanyRegionIDIn" bigint, "LastEditByIn" bigint);
       company          postgres    false    9            U           1255    50001 9   fn_updateCompanyRegionLastEditDeviceType(bigint, integer)    FUNCTION     }  CREATE FUNCTION company."fn_updateCompanyRegionLastEditDeviceType"("CompanyRegionIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "LastEditDeviceType"="LastEditDeviceTypeIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 ~   DROP FUNCTION company."fn_updateCompanyRegionLastEditDeviceType"("CompanyRegionIDIn" bigint, "LastEditDeviceTypeIn" integer);
       company          postgres    false    9            V           1255    49999 E   fn_updateCompanyRegionLastEditOn(bigint, timestamp without time zone)    FUNCTION     q  CREATE FUNCTION company."fn_updateCompanyRegionLastEditOn"("CompanyRegionIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE company."CompanyRegion" SET "LastEditOn"="LastEditOnIn" WHERE "CompanyRegionID"="CompanyRegionIDIn";

RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 

$$;
 �   DROP FUNCTION company."fn_updateCompanyRegionLastEditOn"("CompanyRegionIDIn" bigint, "LastEditOnIn" timestamp without time zone);
       company          postgres    false    9            n           1255    68265 �   fn_insertCompanyExecutiveGeoLocation(bigint, bigint, timestamp without time zone, text, text, text, text, text, text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION "companyExecutiveGeoLocation"."fn_insertCompanyExecutiveGeoLocation"("CompanyExecutiveIdIn" bigint, "CompanyIdIn" bigint, "EntryDateAndTimeIn" timestamp without time zone, "LatitudeIn" text, "LongitudeIn" text, "CountryIn" text, "StateIn" text, "CityIn" text, "AreaIn" text, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
WITH "CompanyExecutiveGeoLocationAddressIdSelect" AS
(
	INSERT INTO "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" 
	(
		"Country",
		"State",
		"City",
		"Area",
		"AddressLine1",
		"AddressLine2",
		"AddressLine3",
		"Pincode"
	)
VALUES
	(
			"CountryIn",
			"StateIn",
			"CityIn",
			"AreaIn",
			"AddressLine1In",
			"AddressLine2In",
			"AddressLine3In",
			"PincodeIn"
	)RETURNING "CompanyExecutiveGeoLocationAddressId"
)
	INSERT INTO "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" 
	(
		"Latitude",
		"Longitude",
		"CompanyExecutiveId",
		"CompanyExecutiveName",
		"CompanyId",
		"CompanyName",
		"EntryDateAndTime",
		"CompanyExecutiveGeoLocationAddressId"
	)
VALUES
	(
			"LatitudeIn",
			"LongitudeIn",
			"CompanyExecutiveIdIn",
			(SELECT "ExecutiveName" FROM "company"."CompanyExecutive" WHERE "CompanyExecutiveID"="CompanyExecutiveIdIn" AND "MarkForDelete"=FALSE LIMIT 1),
			"CompanyIdIn",
			(SELECT "CompanyName" FROM "company"."Company" WHERE "CompanyId"="CompanyIdIn" AND "MarkForDelete"=FALSE LIMIT 1),
			"EntryDateAndTimeIn",
			(SELECT "CompanyExecutiveGeoLocationAddressId" FROM "CompanyExecutiveGeoLocationAddressIdSelect")
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 y  DROP FUNCTION "companyExecutiveGeoLocation"."fn_insertCompanyExecutiveGeoLocation"("CompanyExecutiveIdIn" bigint, "CompanyIdIn" bigint, "EntryDateAndTimeIn" timestamp without time zone, "LatitudeIn" text, "LongitudeIn" text, "CountryIn" text, "StateIn" text, "CityIn" text, "AreaIn" text, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text);
       companyExecutiveGeoLocation          postgres    false    13            �           1255    68273 z   fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate(bigint, timestamp without time zone, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone) RETURNS TABLE("Country" text, "State" text, "City" text, "Area" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "EntryDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"Country",
		"State",
		"City",
		"Area",
		"AddressLine1",
		"AddressLine2",
		"AddressLine3",
		"Pincode",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"
FROM "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"
	JOIN "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" 
	ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddressId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"."CompanyExecutiveGeoLocationAddressId"
	JOIN "company"."CompanyExecutive" ON "company"."CompanyExecutive"."CompanyExecutiveID"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId"
WHERE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"	>= "StartDateIn" 
AND "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"<="EndDateIn"
AND "company"."CompanyExecutive"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 �   DROP FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone);
       companyExecutiveGeoLocation          postgres    false    13            �           1255    68272 ?   fn_selectCompanyExecutiveGeoLocationAddressByDate(bigint, date)    FUNCTION     �  CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByDate"("CompanyExecutiveIdIn" bigint, "DateIn" date) RETURNS TABLE("Country" text, "State" text, "City" text, "Area" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "EntryDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"Country",
		"State",
		"City",
		"Area",
		"AddressLine1",
		"AddressLine2",
		"AddressLine3",
		"Pincode",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"
FROM "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"
	JOIN "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" 
	ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddressId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"."CompanyExecutiveGeoLocationAddressId"
	JOIN "company"."CompanyExecutive" ON "company"."CompanyExecutive"."CompanyExecutiveID"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId"
WHERE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND DATE("companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime")="DateIn"
AND "company"."CompanyExecutive"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 �   DROP FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByDate"("CompanyExecutiveIdIn" bigint, "DateIn" date);
       companyExecutiveGeoLocation          postgres    false    13            �           1255    68271 z   fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate(bigint, timestamp without time zone, timestamp without time zone)    FUNCTION     |  CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone) RETURNS TABLE("CompanyExecutiveGeoLocationId" bigint, "Latitude" text, "Longitude" text, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CompanyId" bigint, "CompanyName" text, "EntryDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."Latitude",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."Longitude",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveName",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyName",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"
FROM "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
	JOIN "company"."CompanyExecutive" ON "company"."CompanyExecutive"."CompanyExecutiveID"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId"
WHERE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"	>= "StartDateIn"
AND "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime" <= "EndDateIn"
AND "company"."CompanyExecutive"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 �   DROP FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone);
       companyExecutiveGeoLocation          postgres    false    13            �           1255    68268 @   fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId(bigint)    FUNCTION     &  CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("CompanyExecutiveGeoLocationId" bigint, "Latitude" text, "Longitude" text, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CompanyId" bigint, "CompanyName" text, "EntryDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."Latitude",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."Longitude",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveName",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyName",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"
FROM "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
	JOIN "company"."CompanyExecutive" ON "company"."CompanyExecutive"."CompanyExecutiveID"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId"
WHERE "CompanyExecutiveId"="CompanyExecutiveIdIn"
AND "company"."CompanyExecutive"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 �   DROP FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint);
       companyExecutiveGeoLocation          postgres    false    13            �           1255    68269 M   fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(bigint, date)    FUNCTION     �  CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "DateIn" date) RETURNS TABLE("CompanyExecutiveGeoLocationId" bigint, "Latitude" text, "Longitude" text, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CompanyId" bigint, "CompanyName" text, "EntryDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."Latitude",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."Longitude",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveName",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyName",
		"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime"
FROM "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
	JOIN "company"."CompanyExecutive" ON "company"."CompanyExecutive"."CompanyExecutiveID"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyId"
WHERE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND DATE("companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."EntryDateAndTime")="DateIn"
AND "company"."CompanyExecutive"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
$$;
 �   DROP FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "DateIn" date);
       companyExecutiveGeoLocation          postgres    false    13                       1255    78452 .   fn_checkExecutiveEnquiryAccess(bigint, bigint)    FUNCTION     Z  CREATE FUNCTION enquiry."fn_checkExecutiveEnquiryAccess"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("EnquiryAccessListId") 
FROM enquiry."EnquiryAccessList"
JOIN public."CRMAccessList"
	ON public."CRMAccessList"."CorrespondingId"=enquiry."EnquiryAccessList"."CompanyExecutiveId"
WHERE enquiry."EnquiryAccessList"."EnquiryId"="EnquiryIdIn"
AND	enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND public."CRMAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
$$;
 m   DROP FUNCTION enquiry."fn_checkExecutiveEnquiryAccess"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    77483 "   fn_deleteEnquiryAccessList(bigint)    FUNCTION     *  CREATE FUNCTION enquiry."fn_deleteEnquiryAccessList"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryAccessList" SET "MarkForDelete" = TRUE WHERE "EnquiryAccessListId" = "idIn";
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 C   DROP FUNCTION enquiry."fn_deleteEnquiryAccessList"("idIn" bigint);
       enquiry          postgres    false    18            �           1255    68210 #   fn_deleteEnquiryProductList(bigint)    FUNCTION     .  CREATE FUNCTION enquiry."fn_deleteEnquiryProductList"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryProductList" SET "MarkForDelete" = true WHERE "EnquiryProductListId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 D   DROP FUNCTION enquiry."fn_deleteEnquiryProductList"("idIn" bigint);
       enquiry          postgres    false    18            y           1255    67743    fn_deleteEnquiryType(bigint)    FUNCTION       CREATE FUNCTION enquiry."fn_deleteEnquiryType"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryType" SET "MarkForDelete" = true WHERE"EnquiryTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 =   DROP FUNCTION enquiry."fn_deleteEnquiryType"("idIn" bigint);
       enquiry          postgres    false    18            �           1255    68215    fn_deleteMainEnquiry(bigint)    FUNCTION       CREATE FUNCTION enquiry."fn_deleteMainEnquiry"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."MainEnquiry" SET "MarkForDelete" = true WHERE "EnquiryId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 =   DROP FUNCTION enquiry."fn_deleteMainEnquiry"("idIn" bigint);
       enquiry          postgres    false    18            �           1255    68132 �   fn_insertEnquiry(bigint, text, bigint, bigint, bigint, bigint, bigint, bigint, text, text, text, text, text, text, timestamp without time zone, timestamp without time zone, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION enquiry."fn_insertEnquiry"("CompanyIdIn" bigint, "EnquiryRemarksIn" text, "EnquiryTypeIn" bigint, "ClientIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text, "LatitudeIn" text, "LongitudeIn" text, "startDateAndTimeIn" timestamp without time zone, "deadlineDateAndTimeIn" timestamp without time zone, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS TABLE("EnquiryId" bigint)
    LANGUAGE sql
    AS $$ 
WITH "MainEnquiryRegion" AS(
INSERT INTO "enquiry"."MainEnquiry" 
	(
		"CompanyId",
		"CompanyName",
		"EnquiryRemarks",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn",
		"EnquiryType", 
		"EnquiryTypeName"
	)
VALUES
	(
			"CompanyIdIn",
			(SELECT "CompanyName" FROM company."Company" WHERE "CompanyId"="CompanyIdIn" AND "MarkForDelete"=false LIMIT 1),
			"EnquiryRemarksIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn",
			"EnquiryTypeIn", 
			(SELECT "EnquiryTypeName" FROM enquiry."EnquiryType" WHERE "EnquiryTypeId"="EnquiryTypeIn" AND "MarkForDelete"=false LIMIT 1)
	)RETURNING "EnquiryId"
),
"SubEnquiryRegion1" AS(
INSERT INTO "enquiry"."EnquiryLocation" 
	(
		"EnquiryId",
		"CountryId",
		"CountryName",
		"StateId",
		"StateName",
		"CityId",
		"CityName",
		"AreaId",
		"AreaName",
		"AddressLine1",
		"AddressLine2",
		"AddressLine3",
		"Pincode",
		"Latitude",
		"Longitude"
	)
VALUES
	(
			(SELECT "EnquiryId" FROM "MainEnquiryRegion"),
			"CountryIdIn",
			(SELECT "CountryName" FROM location."countryinfo" WHERE "CountryID"="CountryIdIn" AND "MarkForDelete"=false LIMIT 1),
			"StateIdIn",
			(SELECT "StateName" FROM location."stateinfo" WHERE "StateID"="StateIdIn" AND "MarkForDelete"=false LIMIT 1),
			"CityIdIn",
			(SELECT "CityName" FROM location."cityinfo" WHERE "CityID" IN(SELECT "CityID" 
																		 FROM location."businessCityForCompany"
																		 WHERE "BusinessCityForCompanyID"="CityIdIn"
																		 LIMIT 1) AND "MarkForDelete"=false LIMIT 1),
			"AreaIdIn",
			(SELECT "AreaName" FROM location."areainfo" WHERE "AreaID" IN (SELECT "AreaID"
																		FROM location."businessAreaForCompany"
																		WHERE "BusinessAreaForCompanyID"="AreaIdIn"
																		LIMIT 1) AND "MarkForDelete"=false LIMIT 1),
			"AddressLine1In",
			"AddressLine2In",
			"AddressLine3In",
			"PincodeIn",
			"LatitudeIn",
			"LongitudeIn"
	)RETURNING "EnquiryId"
),
"SubEnquiryRegion2" AS(
INSERT INTO "enquiry"."EnquiryClient" 
	(
		"EnquiryId",
		"ClientName",
		"ContactPerson",
		"EmailId",
		"ContactNumber",
		"ClientId"
	)
VALUES
	(
			(SELECT "EnquiryId" FROM "SubEnquiryRegion1"),
			(SELECT "ContactName" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false LIMIT 1),
			(SELECT "ContactPerson" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false LIMIT 1),
			(SELECT "EmailId" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false LIMIT 1),
			(SELECT "ContactNumber" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false LIMIT 1),
			"ClientIdIn"
	)RETURNING "EnquiryId"
),
"SubEnquiryRegion3" AS(
INSERT INTO "enquiry"."EnquiryDateAndTimelines"
	(
		"EnquiryId",
		"startDateAndTime",
		"deadlineDateAndTime"
	)
VALUES
	(
		(SELECT "EnquiryId" FROM "SubEnquiryRegion2"),
		"startDateAndTimeIn",
		"deadlineDateAndTimeIn" 
	)RETURNING "EnquiryId"
)
SELECT "EnquiryId" FROM "SubEnquiryRegion3";
$$;
 �  DROP FUNCTION enquiry."fn_insertEnquiry"("CompanyIdIn" bigint, "EnquiryRemarksIn" text, "EnquiryTypeIn" bigint, "ClientIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text, "LatitudeIn" text, "LongitudeIn" text, "startDateAndTimeIn" timestamp without time zone, "deadlineDateAndTimeIn" timestamp without time zone, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone);
       enquiry          postgres    false    18            �           1255    77485 G   fn_insertEnquiryAccessList(bigint, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION enquiry."fn_insertEnquiryAccessList"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
	BEGIN
		INSERT INTO "enquiry"."EnquiryAccessList" 
		(
			"EnquiryId",
			"CompanyExecutiveId",
			"CompanyExecutiveName",
			"AccessApplicationTime"
		)
	VALUES
		(
				"EnquiryIdIn",
				"CompanyExecutiveIdIn",
				(SELECT "CorrespondingName" FROM public."CRMAccessList" 
				 WHERE "CorrespondingId"="CompanyExecutiveIdIn" 
				 AND public."CRMAccessList"."MarkForDelete"=false LIMIT 1),
				"AccessApplicationTimeIn"
		);
	RETURN true;

	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
	END;
	$$;
 �   DROP FUNCTION enquiry."fn_insertEnquiryAccessList"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone);
       enquiry          postgres    false    18            f           1255    68088 +   fn_insertEnquiryProductList(bigint, bigint)    FUNCTION     Z  CREATE FUNCTION enquiry."fn_insertEnquiryProductList"("EnquiryIdIn" bigint, "ProductIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
INSERT INTO "enquiry"."EnquiryProductList" 
	(
		"EnquiryId",
		"ProductId",
		"ProductName",
		"ProductCharges"
	)
VALUES
	(
			"EnquiryIdIn",
			"ProductIdIn",
			(SELECT "productName" FROM product."Product" WHERE "id"="ProductIdIn" AND "MarkForDelete"=false LIMIT 1),
			(SELECT "cost" FROM product."Product" WHERE "id"="ProductIdIn" AND "MarkForDelete"=false LIMIT 1)
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 a   DROP FUNCTION enquiry."fn_insertEnquiryProductList"("EnquiryIdIn" bigint, "ProductIdIn" bigint);
       enquiry          postgres    false    18            z           1255    67744 M   fn_insertEnquiryType(text, text, bigint, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION enquiry."fn_insertEnquiryType"("EnquiryTypeNameIn" text, "EnquiryTypeColorCodeIn" text, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "enquiry"."EnquiryType" 
	(
		"EnquiryTypeName",
		"EnquiryTypeColorCode",
		"CompanyId",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"EnquiryTypeNameIn",
			"EnquiryTypeColorCodeIn",
			"CompanyIdIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION enquiry."fn_insertEnquiryType"("EnquiryTypeNameIn" text, "EnquiryTypeColorCodeIn" text, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone);
       enquiry          postgres    false    18                       1255    78531 @   fn_selectCompanyExecutiveEnquiryAccessDependency(bigint, bigint)    FUNCTION     m  CREATE FUNCTION enquiry."fn_selectCompanyExecutiveEnquiryAccessDependency"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("EnquiryAccessListId") 
FROM enquiry."EnquiryAccessList"
WHERE "EnquiryId"="EnquiryIdIn"
AND "CompanyExecutiveId"="CompanyExecutiveIdIn"
AND	"MarkForDelete"=FALSE
$$;
    DROP FUNCTION enquiry."fn_selectCompanyExecutiveEnquiryAccessDependency"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78709 -   fn_selectEnquiryAccessListByEnquiryId(bigint)    FUNCTION     *  CREATE FUNCTION enquiry."fn_selectEnquiryAccessListByEnquiryId"("EnquiryIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "OwnerFlag" boolean, "AccessApplicationTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"enquiry"."EnquiryAccessList"."EnquiryAccessListId",
		"enquiry"."EnquiryAccessList"."EnquiryId",
		"enquiry"."EnquiryAccessList"."CompanyExecutiveId",
		"enquiry"."EnquiryAccessList"."CompanyExecutiveName",
		public."CRMAccessList"."OwnerFlag",
		"enquiry"."EnquiryAccessList"."AccessApplicationTime"
FROM "enquiry"."EnquiryAccessList"
	JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryAccessList"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
	JOIN
			public."CRMAccessList"
			ON public."CRMAccessList"."CorrespondingId"=enquiry."EnquiryAccessList"."CompanyExecutiveId"
WHERE "enquiry"."EnquiryAccessList"."EnquiryId"="EnquiryIdIn"
AND "enquiry"."EnquiryAccessList"."MarkForDelete"=FALSE
AND "enquiry"."MainEnquiry"."MarkForDelete"=FALSE
$$;
 U   DROP FUNCTION enquiry."fn_selectEnquiryAccessListByEnquiryId"("EnquiryIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68220 3   fn_selectEnquiryAndProductIdByProductListId(bigint)    FUNCTION     H  CREATE FUNCTION enquiry."fn_selectEnquiryAndProductIdByProductListId"("ProductIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "ProductId" bigint)
    LANGUAGE sql
    AS $$
SELECT 
		enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryProductList"."ProductId"
FROM 	enquiry."MainEnquiry"
JOIN	enquiry."EnquiryProductList"
ON 		enquiry."EnquiryProductList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE	enquiry."EnquiryProductList"."EnquiryProductListId"="ProductIdIn"
AND 	enquiry."EnquiryProductList"."MarkForDelete"=false
AND 	enquiry."MainEnquiry"."MarkForDelete"=false
$$;
 [   DROP FUNCTION enquiry."fn_selectEnquiryAndProductIdByProductListId"("ProductIdIn" bigint);
       enquiry          postgres    false    18            =           1255    78540 &   fn_selectEnquiryByArea(bigint, bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryByArea"("AreaIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryLocation"."AreaId"="AreaIDIn";
$$;
 b   DROP FUNCTION enquiry."fn_selectEnquiryByArea"("AreaIDIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            `           1255    78541 &   fn_selectEnquiryByCity(bigint, bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryByCity"("CityIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryLocation"."CityId"="CityIDIn";
$$;
 b   DROP FUNCTION enquiry."fn_selectEnquiryByCity"("CityIDIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            |           1255    78542 *   fn_selectEnquiryByClientId(bigint, bigint)    FUNCTION     |  CREATE FUNCTION enquiry."fn_selectEnquiryByClientId"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
    JOIN client."Client"
        ON client."Client"."ClientId"=enquiry."EnquiryClient"."ClientId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryClient"."ClientId"="ClientIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND client."Client"."MarkForDelete"=FALSE
$$;
 h   DROP FUNCTION enquiry."fn_selectEnquiryByClientId"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78543 ,   fn_selectEnquiryByCompanyExecutiveId(bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
$$;
 ]   DROP FUNCTION enquiry."fn_selectEnquiryByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78544 )   fn_selectEnquiryByCountry(bigint, bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryByCountry"("CountryIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryLocation"."CountryId"="CountryIDIn";
$$;
 h   DROP FUNCTION enquiry."fn_selectEnquiryByCountry"("CountryIDIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78545 /   fn_selectEnquiryByEnquiryTypeId(bigint, bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryByEnquiryTypeId"("EnquiryTypeIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
    JOIN enquiry."EnquiryType"
        ON enquiry."EnquiryType"."EnquiryTypeId"=enquiry."MainEnquiry"."EnquiryType"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."MainEnquiry"."EnquiryType"="EnquiryTypeIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryType"."MarkForDelete"=FALSE
$$;
 r   DROP FUNCTION enquiry."fn_selectEnquiryByEnquiryTypeId"("EnquiryTypeIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78546 +   fn_selectEnquiryByProductId(bigint, bigint)    FUNCTION     >  CREATE FUNCTION enquiry."fn_selectEnquiryByProductId"("ProductIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
    JOIN enquiry."EnquiryProductList"
        ON enquiry."EnquiryProductList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
    JOIN product."Product"
        ON product."Product"."id"=enquiry."EnquiryProductList"."ProductId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryProductList"."ProductId"="ProductIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryProductList"."MarkForDelete"=FALSE
AND product."Product"."MarkForDelete"=FALSE
$$;
 j   DROP FUNCTION enquiry."fn_selectEnquiryByProductId"("ProductIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78547 '   fn_selectEnquiryByState(bigint, bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryByState"("StateIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryAccessList"."EnquiryAccessListId",
	enquiry."MainEnquiry"."EnquiryId",
	enquiry."MainEnquiry"."CompanyId",
	enquiry."MainEnquiry"."CompanyName",
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."EnquiryTypeName",
	enquiry."EnquiryLocation"."EnquiryLocationId",
	enquiry."EnquiryLocation"."CountryId",
	enquiry."EnquiryLocation"."CountryName",
	enquiry."EnquiryLocation"."StateId",
	enquiry."EnquiryLocation"."StateName",
	enquiry."EnquiryLocation"."CityId",
	enquiry."EnquiryLocation"."CityName",
	enquiry."EnquiryLocation"."AreaId",
	enquiry."EnquiryLocation"."AreaName",
	enquiry."EnquiryLocation"."AddressLine1",
	enquiry."EnquiryLocation"."AddressLine2",
	enquiry."EnquiryLocation"."AddressLine3",
	enquiry."EnquiryLocation"."Pincode",
	enquiry."EnquiryLocation"."Latitude",
	enquiry."EnquiryLocation"."Longitude",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."EnquiryClient"."EnquiryClientId",
	enquiry."EnquiryClient"."ClientId",
	enquiry."EnquiryClient"."ClientName",
	enquiry."EnquiryClient"."ContactPerson",
	enquiry."EnquiryClient"."EmailId",
	enquiry."EnquiryClient"."ContactNumber",
	enquiry."MainEnquiry"."CreatedBy",
	enquiry."MainEnquiry"."CreatedOn",
	enquiry."MainEnquiry"."LastEditBy",
	enquiry."MainEnquiry"."LastEditOn"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryLocationId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryDateAndTimelines"
		ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
AND enquiry."EnquiryLocation"."StateId"="StateIDIn";
$$;
 d   DROP FUNCTION enquiry."fn_selectEnquiryByState"("StateIDIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            g           1255    68197 5   fn_selectEnquiryDetailsForProductTicketInsert(bigint)    FUNCTION       CREATE FUNCTION enquiry."fn_selectEnquiryDetailsForProductTicketInsert"("EnquiryIdIn" bigint) RETURNS TABLE("EnquiryRemarks" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryType" bigint, "CompanyId" bigint)
    LANGUAGE sql
    AS $$
SELECT
	enquiry."MainEnquiry"."EnquiryRemarks",
	enquiry."EnquiryDateAndTimelines"."startDateAndTime",
	enquiry."EnquiryDateAndTimelines"."deadlineDateAndTime",
	enquiry."MainEnquiry"."EnquiryType",
	enquiry."MainEnquiry"."CompanyId"
FROM enquiry."MainEnquiry"
	JOIN enquiry."EnquiryDateAndTimelines" 
	ON enquiry."EnquiryDateAndTimelines"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
WHERE enquiry."MainEnquiry"."MarkForDelete"=false
AND enquiry."MainEnquiry"."EnquiryId"="EnquiryIdIn"
$$;
 ]   DROP FUNCTION enquiry."fn_selectEnquiryDetailsForProductTicketInsert"("EnquiryIdIn" bigint);
       enquiry          postgres    false    18            	           1255    78454 (   fn_selectEnquiryNonAddedProducts(bigint)    FUNCTION       CREATE FUNCTION enquiry."fn_selectEnquiryNonAddedProducts"("EnquiryIdIn" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
    LANGUAGE sql
    AS $$
SELECT
		product."Product"."id",
		product."Product"."productName",
		product."Product"."productDescription",
		product."Product"."companyId",
		company."Company"."CompanyName",
		product."Product"."cost",
		product."Product"."LastEditBy",
		product."Product"."LastEditOn",
		product."Product"."CreatedBy",
		product."Product"."CreatedOn",
		product."Product"."isActive"
FROM "product"."Product"
	JOIN company."Company" ON product."Product"."companyId"=company."Company"."CompanyId"
WHERE "product"."Product"."MarkForDelete"=false
AND product."Product"."id" NOT IN(
SELECT "ProductId" FROM enquiry."EnquiryProductList"
	JOIN enquiry."MainEnquiry" 
		ON enquiry."MainEnquiry"."EnquiryId"=enquiry."EnquiryProductList"."EnquiryId"
WHERE enquiry."EnquiryProductList"."EnquiryId"="EnquiryIdIn"
AND	 enquiry."EnquiryProductList"."MarkForDelete"=FALSE
AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
)
$$;
 P   DROP FUNCTION enquiry."fn_selectEnquiryNonAddedProducts"("EnquiryIdIn" bigint);
       enquiry          postgres    false    18            
           1255    78460 #   fn_selectEnquiryProductList(bigint)    FUNCTION       CREATE FUNCTION enquiry."fn_selectEnquiryProductList"("EnquiryIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "EnquiryProductListId" bigint, "ProductId" bigint, "productName" text, "ProductCharges" double precision)
    LANGUAGE sql
    AS $$
SELECT 
	enquiry."EnquiryProductList"."EnquiryId",
	enquiry."EnquiryProductList"."EnquiryProductListId",
	enquiry."EnquiryProductList"."ProductId",
	enquiry."EnquiryProductList"."ProductName",
	enquiry."EnquiryProductList"."ProductCharges"
FROM enquiry."EnquiryProductList"
	JOIN enquiry."MainEnquiry"
		ON enquiry."MainEnquiry"."EnquiryId"=enquiry."EnquiryProductList"."EnquiryId"
WHERE enquiry."EnquiryProductList"."EnquiryId"="EnquiryIdIn"
AND enquiry."EnquiryProductList"."MarkForDelete"=FALSE
AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
$$;
 K   DROP FUNCTION enquiry."fn_selectEnquiryProductList"("EnquiryIdIn" bigint);
       enquiry          postgres    false    18            &           1255    67748 '   fn_selectEnquiryTypeByCompanyId(bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryTypeByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("EnquiryTypeId" bigint, "EnquiryTypeName" text, "EnquiryTypeColorCode" text, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"enquiry"."EnquiryType"."EnquiryTypeId",
		"enquiry"."EnquiryType"."EnquiryTypeName",
		"enquiry"."EnquiryType"."EnquiryTypeColorCode",
		"enquiry"."EnquiryType"."CompanyId",
		"company"."Company"."CompanyName",
		"enquiry"."EnquiryType"."CreatedBy",
		"enquiry"."EnquiryType"."CreatedOn",
		"enquiry"."EnquiryType"."LastEditBy",
		"enquiry"."EnquiryType"."LastEditOn"
FROM "enquiry"."EnquiryType"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="enquiry"."EnquiryType"."CompanyId"
WHERE "enquiry"."EnquiryType"."CompanyId"="CompanyIdIn"
AND "company"."Company"."MarkForDelete"=false
AND "enquiry"."EnquiryType"."MarkForDelete"=false
$$;
 O   DROP FUNCTION enquiry."fn_selectEnquiryTypeByCompanyId"("CompanyIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68274 %   fn_selectEnquiryTypeByOwnerId(bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectEnquiryTypeByOwnerId"("OwnerIdIn" bigint) RETURNS TABLE("EnquiryTypeId" bigint, "EnquiryTypeName" text, "EnquiryTypeColorCode" text, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"enquiry"."EnquiryType"."EnquiryTypeId",
		"enquiry"."EnquiryType"."EnquiryTypeName",
		"enquiry"."EnquiryType"."EnquiryTypeColorCode",
		"enquiry"."EnquiryType"."CompanyId",
		"company"."Company"."CompanyName",
		"enquiry"."EnquiryType"."CreatedBy",
		"enquiry"."EnquiryType"."CreatedOn",
		"enquiry"."EnquiryType"."LastEditBy",
		"enquiry"."EnquiryType"."LastEditOn"
FROM "enquiry"."EnquiryType"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="enquiry"."EnquiryType"."CompanyId"
WHERE "company"."Company"."OwnerContactId"="OwnerIdIn"
AND "company"."Company"."MarkForDelete"=false
AND "enquiry"."EnquiryType"."MarkForDelete"=false
$$;
 K   DROP FUNCTION enquiry."fn_selectEnquiryTypeByOwnerId"("OwnerIdIn" bigint);
       enquiry          postgres    false    18            �           1255    78707 6   fn_selectNonExistingCompanyExecutivesInEnquiry(bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiry"("EnquiryIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
    LANGUAGE sql
    AS $$
SELECT 
company."CompanyExecutive"."CompanyExecutiveID",
company."CompanyExecutive"."ExecutiveName",
company."CompanyExecutive"."ContactNumber",
company."CompanyExecutive"."CompanyID"
FROM company."CompanyExecutive"
	JOIN company."Company"
		ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE company."CompanyExecutive"."CompanyExecutiveID" NOT IN
(
	SELECT enquiry."EnquiryAccessList"."CompanyExecutiveId"
	FROM enquiry."EnquiryAccessList"
	JOIN enquiry."MainEnquiry"
		ON enquiry."MainEnquiry"."EnquiryId"=enquiry."EnquiryAccessList"."EnquiryId"
	WHERE enquiry."EnquiryAccessList"."EnquiryId"="EnquiryIdIn"
	AND enquiry."MainEnquiry"."EnquiryId"="EnquiryIdIn"
	AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
	AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
)
AND company."CompanyExecutive"."MarkForDelete"=FALSE
AND company."CompanyExecutive"."CompanyID" IN (SELECT "CompanyId" FROM enquiry."MainEnquiry" WHERE "EnquiryId"="EnquiryIdIn" LIMIT 1)
$$;
 ^   DROP FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiry"("EnquiryIdIn" bigint);
       enquiry          postgres    false    18            �           1255    86833 O   fn_selectNonExistingCompanyExecutivesInEnquiryByCompanyExecutiv(bigint, bigint)    FUNCTION       CREATE FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiryByCompanyExecutiv"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
    LANGUAGE sql
    AS $$
SELECT 
company."CompanyExecutive"."CompanyExecutiveID",
company."CompanyExecutive"."ExecutiveName",
company."CompanyExecutive"."ContactNumber",
company."CompanyExecutive"."CompanyID"
FROM company."CompanyExecutive"
	JOIN company."Company"
		ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE company."CompanyExecutive"."CompanyExecutiveID" NOT IN
(
	SELECT enquiry."EnquiryAccessList"."CompanyExecutiveId"
	FROM enquiry."EnquiryAccessList"
	JOIN enquiry."MainEnquiry"
		ON enquiry."MainEnquiry"."EnquiryId"=enquiry."EnquiryAccessList"."EnquiryId"
	WHERE enquiry."EnquiryAccessList"."EnquiryId"="EnquiryIdIn"
	AND enquiry."MainEnquiry"."EnquiryId"="EnquiryIdIn"
	AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
	AND enquiry."EnquiryAccessList"."MarkForDelete"=FALSE
)
AND company."CompanyExecutive"."MarkForDelete"=FALSE
AND company."CompanyExecutive"."CompanyID" IN (SELECT "CompanyId" FROM enquiry."MainEnquiry" WHERE "EnquiryId"="EnquiryIdIn" LIMIT 1)
AND company."CompanyExecutive"."DeviceType" IN(
SELECT company."CompanyExecutive"."DeviceType"
FROM company."CompanyExecutive"
	JOIN position."Positions"
	ON position."Positions"."id"=company."CompanyExecutive"."DeviceType"
AND position."Positions"."PositionPriority" > (
SELECT position."Positions"."PositionPriority"
FROM company."CompanyExecutive"
	JOIN position."Positions"
	ON position."Positions"."id"=company."CompanyExecutive"."DeviceType"
WHERE company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"
)
)
$$;
 �   DROP FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiryByCompanyExecutiv"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68199 &   fn_updateEnquiryClient(bigint, bigint)    FUNCTION     	
  CREATE FUNCTION enquiry."fn_updateEnquiryClient"("ClientIdIn" bigint, "EnquiryIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryClient" 
SET "ClientId" = "ClientIdIn"
WHERE "EnquiryClientId" = (
						SELECT "EnquiryClientId" 
						FROM "enquiry"."EnquiryClient" 
						JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryClient"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
						WHERE "enquiry"."EnquiryClient"."EnquiryId"="EnquiryIdIn"
						AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

UPDATE "enquiry"."EnquiryClient" 
SET "ContactNumber" = (SELECT "ContactNumber" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false)
WHERE "EnquiryClientId" = (
						SELECT "EnquiryClientId" 
						FROM "enquiry"."EnquiryClient" 
						JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryClient"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
						WHERE "enquiry"."EnquiryClient"."EnquiryId"="EnquiryIdIn"
						AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

UPDATE "enquiry"."EnquiryClient" 
SET "EmailId" = (SELECT "EmailId" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false)
WHERE "EnquiryClientId" = (
						SELECT "EnquiryClientId" 
						FROM "enquiry"."EnquiryClient" 
						JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryClient"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
						WHERE "enquiry"."EnquiryClient"."EnquiryId"="EnquiryIdIn"
						AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

UPDATE "enquiry"."EnquiryClient" 
SET "ContactPerson" =  (SELECT "ContactPerson" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false)
WHERE "EnquiryClientId" = (
						SELECT "EnquiryClientId" 
						FROM "enquiry"."EnquiryClient" 
						JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryClient"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
						WHERE "enquiry"."EnquiryClient"."EnquiryId"="EnquiryIdIn"
						AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

UPDATE "enquiry"."EnquiryClient" 
SET "ClientName" = (SELECT "ContactName" FROM client."Client" WHERE "ClientId"="ClientIdIn" AND "MarkForDelete"=false)
WHERE "EnquiryClientId" = (
						SELECT "EnquiryClientId" 
						FROM "enquiry"."EnquiryClient" 
						JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryClient"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
						WHERE "enquiry"."EnquiryClient"."EnquiryId"="EnquiryIdIn"
						AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 [   DROP FUNCTION enquiry."fn_updateEnquiryClient"("ClientIdIn" bigint, "EnquiryIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68204 2   fn_updateEnquiryLocationAddressLine1(bigint, text)    FUNCTION     �  CREATE FUNCTION enquiry."fn_updateEnquiryLocationAddressLine1"("idIn" bigint, "AddressLine1In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "AddressLine1" = "AddressLine1In"
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 d   DROP FUNCTION enquiry."fn_updateEnquiryLocationAddressLine1"("idIn" bigint, "AddressLine1In" text);
       enquiry          postgres    false    18            �           1255    68205 2   fn_updateEnquiryLocationAddressLine2(bigint, text)    FUNCTION     �  CREATE FUNCTION enquiry."fn_updateEnquiryLocationAddressLine2"("idIn" bigint, "AddressLine2In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "AddressLine2" = "AddressLine2In" 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 d   DROP FUNCTION enquiry."fn_updateEnquiryLocationAddressLine2"("idIn" bigint, "AddressLine2In" text);
       enquiry          postgres    false    18            �           1255    68206 2   fn_updateEnquiryLocationAddressLine3(bigint, text)    FUNCTION     �  CREATE FUNCTION enquiry."fn_updateEnquiryLocationAddressLine3"("idIn" bigint, "AddressLine3In" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "AddressLine3" = "AddressLine3In" 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 d   DROP FUNCTION enquiry."fn_updateEnquiryLocationAddressLine3"("idIn" bigint, "AddressLine3In" text);
       enquiry          postgres    false    18                       1255    68203 .   fn_updateEnquiryLocationAreaId(bigint, bigint)    FUNCTION     X  CREATE FUNCTION enquiry."fn_updateEnquiryLocationAreaId"("idIn" bigint, "AreaIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "AreaId" = "AreaIdIn" 
WHERE "EnquiryLocationId" =  (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

UPDATE "enquiry"."EnquiryLocation"
SET "AreaName" =(
					SELECT "AreaName" FROM location.areainfo
					WHERE location.areainfo."AreaID" IN (
							SELECT "AreaID" FROM location."businessAreaForCompany" 
							WHERE "BusinessAreaForCompanyID"="AreaIdIn"
							AND location."businessAreaForCompany"."MarkForDelete"=false
							LIMIT 1
					)
AND location.areainfo."MarkForDelete"=false) 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION enquiry."fn_updateEnquiryLocationAreaId"("idIn" bigint, "AreaIdIn" bigint);
       enquiry          postgres    false    18                       1255    68202 .   fn_updateEnquiryLocationCityId(bigint, bigint)    FUNCTION     H  CREATE FUNCTION enquiry."fn_updateEnquiryLocationCityId"("idIn" bigint, "CityIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "CityId" = "CityIdIn" 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);


UPDATE "enquiry"."EnquiryLocation" 
SET "CityName" = (
					SELECT "CityName" FROM location.cityinfo
					WHERE location.cityinfo."CityID" IN(
						SELECT "CityID" FROM location."businessCityForCompany"
						WHERE "BusinessCityForCompanyID"="CityIdIn"
					AND location."businessCityForCompany"."MarkForDelete"=false
				)
				AND location.cityinfo."MarkForDelete"=false) 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION enquiry."fn_updateEnquiryLocationCityId"("idIn" bigint, "CityIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68200 1   fn_updateEnquiryLocationCountryId(bigint, bigint)    FUNCTION     y  CREATE FUNCTION enquiry."fn_updateEnquiryLocationCountryId"("idIn" bigint, "CountryIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "CountryId" = "CountryIdIn"
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);


UPDATE "enquiry"."EnquiryLocation" 
SET "CountryName" = (
					SELECT "CountryName" 
					FROM location."countryinfo" 
					WHERE "CountryID"="CountryIdIn")
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 `   DROP FUNCTION enquiry."fn_updateEnquiryLocationCountryId"("idIn" bigint, "CountryIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68208 .   fn_updateEnquiryLocationLatitude(bigint, text)    FUNCTION     {  CREATE FUNCTION enquiry."fn_updateEnquiryLocationLatitude"("idIn" bigint, "LatitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "Latitude" = "LatitudeIn" 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION enquiry."fn_updateEnquiryLocationLatitude"("idIn" bigint, "LatitudeIn" text);
       enquiry          postgres    false    18            �           1255    68209 /   fn_updateEnquiryLocationLongitude(bigint, text)    FUNCTION       CREATE FUNCTION enquiry."fn_updateEnquiryLocationLongitude"("idIn" bigint, "LongitudeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "Longitude" = "LongitudeIn" 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ^   DROP FUNCTION enquiry."fn_updateEnquiryLocationLongitude"("idIn" bigint, "LongitudeIn" text);
       enquiry          postgres    false    18            �           1255    68207 -   fn_updateEnquiryLocationPincode(bigint, text)    FUNCTION     v  CREATE FUNCTION enquiry."fn_updateEnquiryLocationPincode"("idIn" bigint, "PincodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "Pincode" = "PincodeIn"
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION enquiry."fn_updateEnquiryLocationPincode"("idIn" bigint, "PincodeIn" text);
       enquiry          postgres    false    18            �           1255    68201 /   fn_updateEnquiryLocationStateId(bigint, bigint)    FUNCTION     h  CREATE FUNCTION enquiry."fn_updateEnquiryLocationStateId"("idIn" bigint, "StateIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryLocation" 
SET "StateId" = "StateIdIn" 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);

UPDATE "enquiry"."EnquiryLocation" 
SET "StateName" = (
					SELECT "StateName" 
					FROM location."stateinfo" 
					WHERE "StateID"="StateIdIn") 
WHERE "EnquiryLocationId" = (
								SELECT "EnquiryLocationId" 
								FROM "enquiry"."EnquiryLocation" 
								JOIN "enquiry"."MainEnquiry" ON "enquiry"."EnquiryLocation"."EnquiryId"="enquiry"."MainEnquiry"."EnquiryId"
								WHERE "enquiry"."EnquiryLocation"."EnquiryId"="idIn"
								AND  "enquiry"."MainEnquiry"."MarkForDelete"=FALSE);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION enquiry."fn_updateEnquiryLocationStateId"("idIn" bigint, "StateIdIn" bigint);
       enquiry          postgres    false    18            v           1255    67740 -   fn_updateEnquiryTypeCompanyId(bigint, bigint)    FUNCTION     <  CREATE FUNCTION enquiry."fn_updateEnquiryTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryType" SET "CompanyId" = "CompanyIdIn" WHERE"EnquiryTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION enquiry."fn_updateEnquiryTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       enquiry          postgres    false    18            u           1255    67739 6   fn_updateEnquiryTypeEnquiryTypeColorCode(bigint, text)    FUNCTION     f  CREATE FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeColorCode"("idIn" bigint, "EnquiryTypeColorCodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryType" SET "EnquiryTypeColorCode" = "EnquiryTypeColorCodeIn" WHERE"EnquiryTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 p   DROP FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeColorCode"("idIn" bigint, "EnquiryTypeColorCodeIn" text);
       enquiry          postgres    false    18            �           1255    67738 1   fn_updateEnquiryTypeEnquiryTypeName(bigint, text)    FUNCTION     R  CREATE FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeName"("idIn" bigint, "EnquiryTypeNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryType" SET "EnquiryTypeName" = "EnquiryTypeNameIn" WHERE"EnquiryTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 f   DROP FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeName"("idIn" bigint, "EnquiryTypeNameIn" text);
       enquiry          postgres    false    18            w           1255    67741 .   fn_updateEnquiryTypeLastEditBy(bigint, bigint)    FUNCTION     @  CREATE FUNCTION enquiry."fn_updateEnquiryTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryType" SET "LastEditBy" = "LastEditByIn" WHERE"EnquiryTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ^   DROP FUNCTION enquiry."fn_updateEnquiryTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       enquiry          postgres    false    18            x           1255    67742 C   fn_updateEnquiryTypeLastEditOn(bigint, timestamp without time zone)    FUNCTION     U  CREATE FUNCTION enquiry."fn_updateEnquiryTypeLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."EnquiryType" SET "LastEditOn" = "LastEditOnIn" WHERE"EnquiryTypeId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 s   DROP FUNCTION enquiry."fn_updateEnquiryTypeLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       enquiry          postgres    false    18            �           1255    68211 -   fn_updateMainEnquiryCompanyId(bigint, bigint)    FUNCTION     �  CREATE FUNCTION enquiry."fn_updateMainEnquiryCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."MainEnquiry" 
SET "CompanyId" = "CompanyIdIn" 
WHERE "EnquiryId" = "idIn";

UPDATE "enquiry"."MainEnquiry" 
SET "CompanyName" = (SELECT "CompanyName" FROM company."Company" WHERE "CompanyId"="CompanyIdIn" AND "MarkForDelete"=false)
WHERE "EnquiryId" = "idIn";


 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION enquiry."fn_updateMainEnquiryCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       enquiry          postgres    false    18            �           1255    68212 0   fn_updateMainEnquiryEnquiryRemarks(bigint, text)    FUNCTION     K  CREATE FUNCTION enquiry."fn_updateMainEnquiryEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."MainEnquiry" SET "EnquiryRemarks" = "EnquiryRemarksIn" WHERE "EnquiryId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 d   DROP FUNCTION enquiry."fn_updateMainEnquiryEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text);
       enquiry          postgres    false    18            �           1255    68217 /   fn_updateMainEnquiryEnquiryType(bigint, bigint)    FUNCTION     ,  CREATE FUNCTION enquiry."fn_updateMainEnquiryEnquiryType"("idIn" bigint, "EnquiryTypeIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."MainEnquiry" SET "EnquiryType" = "EnquiryTypeIn" WHERE "EnquiryId" = "idIn";

UPDATE "enquiry"."MainEnquiry" SET "EnquiryTypeName" = (
														SELECT "EnquiryTypeName" 
														FROM enquiry."EnquiryType" 
														WHERE "EnquiryTypeId"="EnquiryTypeIn" 
														AND "MarkForDelete"=false);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 `   DROP FUNCTION enquiry."fn_updateMainEnquiryEnquiryType"("idIn" bigint, "EnquiryTypeIn" bigint);
       enquiry          postgres    false    18            �           1255    68213 .   fn_updateMainEnquiryLastEditBy(bigint, bigint)    FUNCTION     =  CREATE FUNCTION enquiry."fn_updateMainEnquiryLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."MainEnquiry" SET "LastEditBy" = "LastEditByIn" WHERE "EnquiryId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ^   DROP FUNCTION enquiry."fn_updateMainEnquiryLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       enquiry          postgres    false    18            �           1255    68214 C   fn_updateMainEnquiryLastEditOn(bigint, timestamp without time zone)    FUNCTION     R  CREATE FUNCTION enquiry."fn_updateMainEnquiryLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "enquiry"."MainEnquiry" SET "LastEditOn" = "LastEditOnIn" WHERE "EnquiryId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 s   DROP FUNCTION enquiry."fn_updateMainEnquiryLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       enquiry          postgres    false    18            �           1255    78718 =   fn_selectClientByArea(bigint, bigint, bigint, bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectClientByArea"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$SELECT 
	client."Client"."ClientId",
    client."ClientLocation"."latitude",
	client."ClientLocation"."longitude",
	client."Client"."ContactName",
	client."Client"."ContactPerson",
	client."Client"."EmailId",
	client."Client"."ContactNumber",
	client."Client"."MarkForDelete"
FROM client."Client"
JOIN client."ClientLocation"
	ON client."ClientLocation"."ClientLocationId"=client."Client"."ClientLocationId"
JOIN company."Company"
    ON company."Company"."CompanyId"=client."Client"."CompanyId"

WHERE company."Company"."OwnerContactId"="OwnerContactIdIn"
AND company."Company"."MarkForDelete"=FALSE
AND client."ClientLocation"."Country"="CountryIdIn"
AND client."ClientLocation"."State"="StateIdIn"
AND client."ClientLocation"."City"="CityIdIn"
AND client."ClientLocation"."Area"="AreaIdIn"
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectClientByArea"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78717 5   fn_selectClientByCity(bigint, bigint, bigint, bigint)    FUNCTION     F  CREATE FUNCTION "geoMapPlotting"."fn_selectClientByCity"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$SELECT 
	client."Client"."ClientId",
    client."ClientLocation"."latitude",
	client."ClientLocation"."longitude",
	client."Client"."ContactName",
	client."Client"."ContactPerson",
	client."Client"."EmailId",
	client."Client"."ContactNumber",
	client."Client"."MarkForDelete"
FROM client."Client"
JOIN client."ClientLocation"
	ON client."ClientLocation"."ClientLocationId"=client."Client"."ClientLocationId"
JOIN company."Company"
    ON company."Company"."CompanyId"=client."Client"."CompanyId"
WHERE company."Company"."OwnerContactId"="OwnerContactIdIn"
AND company."Company"."MarkForDelete"=FALSE
AND client."ClientLocation"."Country"="CountryIdIn"
AND client."ClientLocation"."State"="StateIdIn"
AND client."ClientLocation"."City"="CityIdIn"
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectClientByCity"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78710     fn_selectClientByCompany(bigint)    FUNCTION     f  CREATE FUNCTION "geoMapPlotting"."fn_selectClientByCompany"("CompanyIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT 
	client."Client"."ClientId",
	client."ClientLocation"."latitude",
	client."ClientLocation"."longitude",
	client."Client"."ContactName",
	client."Client"."ContactPerson",
	client."Client"."EmailId",
	client."Client"."ContactNumber",
	client."Client"."MarkForDelete"
FROM client."Client"
JOIN client."ClientLocation"
	ON client."ClientLocation"."ClientLocationId"=client."Client"."ClientLocationId"
JOIN company."Company"
	ON company."Company"."CompanyId"=client."Client"."CompanyId"
WHERE client."Client"."CompanyId" =	"CompanyIdIn"
AND company."Company"."MarkForDelete"=FALSE
$$;
 Q   DROP FUNCTION "geoMapPlotting"."fn_selectClientByCompany"("CompanyIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78712 (   fn_selectClientByCountry(bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectClientByCountry"("OwnerContactIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$SELECT 
	client."Client"."ClientId",
    client."ClientLocation"."latitude",
	client."ClientLocation"."longitude",
	client."Client"."ContactName",
	client."Client"."ContactPerson",
	client."Client"."EmailId",
	client."Client"."ContactNumber",
	client."Client"."MarkForDelete"
FROM client."Client"
JOIN client."ClientLocation"
	ON client."ClientLocation"."ClientLocationId"=client."Client"."ClientLocationId"
JOIN company."Company"
    ON company."Company"."CompanyId"=client."Client"."CompanyId"
WHERE company."Company"."OwnerContactId"="OwnerContactIdIn"
AND company."Company"."MarkForDelete"=FALSE
AND client."ClientLocation"."Country"="CountryIdIn"
$$;
 l   DROP FUNCTION "geoMapPlotting"."fn_selectClientByCountry"("OwnerContactIdIn" bigint, "CountryIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78711    fn_selectClientByOwner(bigint)    FUNCTION     x  CREATE FUNCTION "geoMapPlotting"."fn_selectClientByOwner"("OwnerContactIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$SELECT 
    client."Client"."ClientId",
	client."ClientLocation"."latitude",
	client."ClientLocation"."longitude",
	client."Client"."ContactName",
	client."Client"."ContactPerson",
	client."Client"."EmailId",
	client."Client"."ContactNumber",
	client."Client"."MarkForDelete"
FROM client."Client"
JOIN client."ClientLocation"
	ON client."ClientLocation"."ClientLocationId"=client."Client"."ClientLocationId"
JOIN company."Company"
    ON company."Company"."CompanyId"=client."Client"."CompanyId"
WHERE company."Company"."OwnerContactId"="OwnerContactIdIn"
AND company."Company"."MarkForDelete"=FALSE
$$;
 T   DROP FUNCTION "geoMapPlotting"."fn_selectClientByOwner"("OwnerContactIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78713 .   fn_selectClientByState(bigint, bigint, bigint)    FUNCTION       CREATE FUNCTION "geoMapPlotting"."fn_selectClientByState"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$SELECT 
	client."Client"."ClientId",
    client."ClientLocation"."latitude",
	client."ClientLocation"."longitude",
	client."Client"."ContactName",
	client."Client"."ContactPerson",
	client."Client"."EmailId",
	client."Client"."ContactNumber",
	client."Client"."MarkForDelete"
FROM client."Client"
JOIN client."ClientLocation"
	ON client."ClientLocation"."ClientLocationId"=client."Client"."ClientLocationId"
JOIN company."Company"
    ON company."Company"."CompanyId"=client."Client"."CompanyId"
WHERE company."Company"."OwnerContactId"="OwnerContactIdIn"
AND company."Company"."MarkForDelete"=FALSE
AND client."ClientLocation"."Country"="CountryIdIn"
AND client."ClientLocation"."State"="StateIdIn"
$$;
 ~   DROP FUNCTION "geoMapPlotting"."fn_selectClientByState"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78751 <   fn_selectCompanyBranchByCity(bigint, bigint, bigint, bigint)    FUNCTION       CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."CompanyBranch"."CompanyBranchID",
		company."CompanyBranchAddressDetails"."Latitude",
		company."CompanyBranchAddressDetails"."Longitude",
		company."CompanyBranch"."CompanyBranchName",
		company."CompanyBranch"."CompanyBranchCode",
		company."Company"."CompanyName",
        company."CompanyBranch"."MarkForDelete"
FROM
		company."CompanyBranch"
JOIN
		company."CompanyBranchAddressDetails"
		ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		company."CompanyBranchAddressDetails"."CountryID"="CountryIdIn"
AND
		company."CompanyBranchAddressDetails"."StateID"="StateIdIn"
AND
		company."CompanyBranchAddressDetails"."CityID"="CityIdIn"		
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78749 '   fn_selectCompanyBranchByCompany(bigint)    FUNCTION       CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCompany"("CompanyIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."CompanyBranch"."CompanyBranchID",
		company."CompanyBranchAddressDetails"."Latitude",
		company."CompanyBranchAddressDetails"."Longitude",
		company."CompanyBranch"."CompanyBranchName",
		company."CompanyBranch"."CompanyBranchCode",
		company."Company"."CompanyName",
        company."CompanyBranch"."MarkForDelete"
FROM
		company."CompanyBranch"
JOIN
		company."CompanyBranchAddressDetails"
		ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
WHERE
		company."Company"."CompanyId"="CompanyIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
$$;
 X   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCompany"("CompanyIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78744 /   fn_selectCompanyBranchByCountry(bigint, bigint)    FUNCTION     ^  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."CompanyBranch"."CompanyBranchID",
		company."CompanyBranchAddressDetails"."Latitude",
		company."CompanyBranchAddressDetails"."Longitude",
		company."CompanyBranch"."CompanyBranchName",
		company."CompanyBranch"."CompanyBranchCode",
		company."Company"."CompanyName",
        company."CompanyBranch"."MarkForDelete"
FROM
		company."CompanyBranch"
JOIN
		company."CompanyBranchAddressDetails"
		ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		company."CompanyBranchAddressDetails"."CountryID"="CountryIdIn"
$$;
 l   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78748 %   fn_selectCompanyBranchByOwner(bigint)    FUNCTION        CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByOwner"("OwnerIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."CompanyBranch"."CompanyBranchID",
		company."CompanyBranchAddressDetails"."Latitude",
		company."CompanyBranchAddressDetails"."Longitude",
		company."CompanyBranch"."CompanyBranchName",
		company."CompanyBranch"."CompanyBranchCode",
		company."Company"."CompanyName",
        company."CompanyBranch"."MarkForDelete"
FROM
		company."CompanyBranch"
JOIN
		company."CompanyBranchAddressDetails"
		ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
$$;
 T   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByOwner"("OwnerIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78750 5   fn_selectCompanyBranchByState(bigint, bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."CompanyBranch"."CompanyBranchID",
		company."CompanyBranchAddressDetails"."Latitude",
		company."CompanyBranchAddressDetails"."Longitude",
		company."CompanyBranch"."CompanyBranchName",
		company."CompanyBranch"."CompanyBranchCode",
		company."Company"."CompanyName",
        company."CompanyBranch"."MarkForDelete"
FROM
		company."CompanyBranch"
JOIN
		company."CompanyBranchAddressDetails"
		ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=company."CompanyBranch"."CompanyID"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		company."CompanyBranchAddressDetails"."CountryID"="CountryIdIn"
AND
		company."CompanyBranchAddressDetails"."StateID"="StateIdIn"
$$;
 ~   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78733 6   fn_selectCompanyByCity(bigint, bigint, bigint, bigint)    FUNCTION     C  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."Company"."CompanyId",
		company."CompanyAddressDetails"."Latitude",
		company."CompanyAddressDetails"."Longitude",
		company."Company"."CompanyName",
		company."Company"."CompanyCode",
        company."Company"."MarkForDelete"
FROM
		company."Company"
JOIN
		company."CompanyAddressDetails"
		ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
WHERE 
		"OwnerContactId"="OwnerIdIn"
AND
		"CountryID"="CountryIdIn"
AND
		"StateID"="StateIdIn"
AND
		"CityID"="CityIdIn";
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78731 )   fn_selectCompanyByCountry(bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."Company"."CompanyId",
		company."CompanyAddressDetails"."Latitude",
		company."CompanyAddressDetails"."Longitude",
		company."Company"."CompanyName",
		company."Company"."CompanyCode",
        company."Company"."MarkForDelete"
FROM
		company."Company"
JOIN
		company."CompanyAddressDetails"
		ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
WHERE 
		"OwnerContactId"="OwnerIdIn"
AND
		"CountryID"="CountryIdIn";
$$;
 f   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78730    fn_selectCompanyByOwner(bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByOwner"("OwnerIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."Company"."CompanyId",
		company."CompanyAddressDetails"."Latitude",
		company."CompanyAddressDetails"."Longitude",
		company."Company"."CompanyName",
		company."Company"."CompanyCode",
        company."Company"."MarkForDelete"
FROM
		company."Company"
JOIN
		company."CompanyAddressDetails"
		ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
WHERE 
		"OwnerContactId"="OwnerIdIn";
$$;
 N   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyByOwner"("OwnerIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78732 /   fn_selectCompanyByState(bigint, bigint, bigint)    FUNCTION       CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT
        company."Company"."CompanyId",
		company."CompanyAddressDetails"."Latitude",
		company."CompanyAddressDetails"."Longitude",
		company."Company"."CompanyName",
		company."Company"."CompanyCode",
        company."Company"."MarkForDelete"
FROM
		company."Company"
JOIN
		company."CompanyAddressDetails"
		ON company."CompanyAddressDetails"."CompanyAddressID"=company."Company"."CompanyAddress"
WHERE 
		"OwnerContactId"="OwnerIdIn"
AND
		"CountryID"="CountryIdIn"
AND
		"StateID"="StateIdIn";
$$;
 x   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78725 B   fn_selectCompanyExecutiveGeoByCity(bigint, bigint, bigint, bigint)    FUNCTION     *  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$SELECT 
    company."CompanyExecutive"."CompanyExecutiveID",
	company."CompanyBranchAddressDetails"."Latitude",
	company."CompanyBranchAddressDetails"."Longitude",
	company."CompanyExecutive"."ExecutiveName",
	company."Company"."CompanyName",
	company."CompanyBranch"."CompanyBranchName",
	company."CompanyExecutive"."MarkForDelete"
FROM 
	company."CompanyExecutive"
JOIN
	company."CompanyBranch"
	ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
JOIN
	company."CompanyBranchAddressDetails"
	ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
	company."Company"
	ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE
	company."Company"."OwnerContactId"="OwnerIdIn"
AND 
    company."Company"."MarkForDelete"=FALSE
AND 
	company."CompanyExecutive"."BaseCityID" IN	(
													SELECT
															location."businessCityForCompany"."BusinessCityForCompanyID"
													FROM 
															location."businessCityForCompany"
													JOIN
															location.cityinfo
															ON location.cityinfo."CityID"=location."businessCityForCompany"."CityID"
													JOIN
															location.stateinfo
															ON location.stateinfo."StateID"=location.cityinfo."StateID"
													JOIN
															location.countryinfo
															ON location.countryinfo."CountryID"=location.stateinfo."CountryID"
													WHERE 
															location.countryinfo."CountryID"="CountryIdIn"
													AND
															location.stateinfo."StateID"="StateIdIn"
													AND
															location."businessCityForCompany"."BusinessCityForCompanyID"="CityIdIn"
												)
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78721 -   fn_selectCompanyExecutiveGeoByCompany(bigint)    FUNCTION       CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCompany"("CompanyIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyExecutive"."CompanyExecutiveID",
	company."CompanyBranchAddressDetails"."Latitude",
	company."CompanyBranchAddressDetails"."Longitude",
	company."CompanyExecutive"."ExecutiveName",
	company."Company"."CompanyName",
	company."CompanyBranch"."CompanyBranchName",
	company."CompanyExecutive"."MarkForDelete"
FROM 
	company."CompanyExecutive"
JOIN
	company."CompanyBranch"
	ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
JOIN
	company."CompanyBranchAddressDetails"
	ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
	company."Company"
	ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE
	company."CompanyExecutive"."CompanyID"="CompanyIdIn"
AND 
    company."Company"."MarkForDelete"=FALSE
$$;
 ^   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCompany"("CompanyIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78723 5   fn_selectCompanyExecutiveGeoByCountry(bigint, bigint)    FUNCTION     V  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyExecutive"."CompanyExecutiveID",
	company."CompanyBranchAddressDetails"."Latitude",
	company."CompanyBranchAddressDetails"."Longitude",
	company."CompanyExecutive"."ExecutiveName",
	company."Company"."CompanyName",
	company."CompanyBranch"."CompanyBranchName",
	company."CompanyExecutive"."MarkForDelete"
FROM 
	company."CompanyExecutive"
JOIN
	company."CompanyBranch"
	ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
JOIN
	company."CompanyBranchAddressDetails"
	ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
	company."Company"
	ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE
	company."Company"."OwnerContactId"="OwnerIdIn"
AND 
    company."Company"."MarkForDelete"=FALSE
AND 
	company."CompanyExecutive"."BaseCityID" IN	(
													SELECT
															location."businessCityForCompany"."BusinessCityForCompanyID"
													FROM 
															location."businessCityForCompany"
													JOIN
															location.cityinfo
															ON location.cityinfo."CityID"=location."businessCityForCompany"."CityID"
													JOIN
															location.stateinfo
															ON location.stateinfo."StateID"=location.cityinfo."StateID"
													JOIN
															location.countryinfo
															ON location.countryinfo."CountryID"=location.stateinfo."CountryID"
													WHERE 
															location.countryinfo."CountryID"="CountryIdIn"
												)
$$;
 r   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78722 +   fn_selectCompanyExecutiveGeoByOwner(bigint)    FUNCTION     u  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByOwner"("OwnerIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyExecutive"."CompanyExecutiveID",
	company."CompanyBranchAddressDetails"."Latitude",
	company."CompanyBranchAddressDetails"."Longitude",
	company."CompanyExecutive"."ExecutiveName",
	company."Company"."CompanyName",
	company."CompanyBranch"."CompanyBranchName",
	company."CompanyExecutive"."MarkForDelete"
FROM 
	company."CompanyExecutive"
JOIN
	company."CompanyBranch"
	ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
JOIN
	company."CompanyBranchAddressDetails"
	ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
	company."Company"
	ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE
	company."Company"."OwnerContactId"="OwnerIdIn"
AND 
    company."Company"."MarkForDelete"=FALSE
$$;
 Z   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByOwner"("OwnerIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78724 ;   fn_selectCompanyExecutiveGeoByState(bigint, bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
    LANGUAGE sql
    AS $$
SELECT 
    company."CompanyExecutive"."CompanyExecutiveID",
	company."CompanyBranchAddressDetails"."Latitude",
	company."CompanyBranchAddressDetails"."Longitude",
	company."CompanyExecutive"."ExecutiveName",
	company."Company"."CompanyName",
	company."CompanyBranch"."CompanyBranchName",
	company."CompanyExecutive"."MarkForDelete"
FROM 
	company."CompanyExecutive"
JOIN
	company."CompanyBranch"
	ON company."CompanyBranch"."CompanyBranchID"=company."CompanyExecutive"."CompanyBranchID"
JOIN
	company."CompanyBranchAddressDetails"
	ON company."CompanyBranchAddressDetails"."CompanyBranchAddressID"=company."CompanyBranch"."CompanyBranchAddressID"
JOIN
	company."Company"
	ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE
	company."Company"."OwnerContactId"="OwnerIdIn"
AND 
    company."Company"."MarkForDelete"=FALSE
AND 
	company."CompanyExecutive"."BaseCityID" IN	(
													SELECT
															location."businessCityForCompany"."BusinessCityForCompanyID"
													FROM 
															location."businessCityForCompany"
													JOIN
															location.cityinfo
															ON location.cityinfo."CityID"=location."businessCityForCompany"."CityID"
													JOIN
															location.stateinfo
															ON location.stateinfo."StateID"=location.cityinfo."StateID"
													JOIN
															location.countryinfo
															ON location.countryinfo."CountryID"=location.stateinfo."CountryID"
													WHERE 
															location.countryinfo."CountryID"="CountryIdIn"
													AND
															location.stateinfo."StateID"="StateIdIn"
												)
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78822 >   fn_selectEnquiryByArea(bigint, bigint, bigint, bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByArea"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
        enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		enquiry."EnquiryLocation"."CountryId"="CountryIdIn"
AND
		enquiry."EnquiryLocation"."StateId"="StateIdIn"
AND
		enquiry."EnquiryLocation"."CityId"="CityIdIn"
AND
		enquiry."EnquiryLocation"."AreaId"="AreaIdIn"
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByArea"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78821 6   fn_selectEnquiryByCity(bigint, bigint, bigint, bigint)    FUNCTION     D  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
       	enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		enquiry."EnquiryLocation"."CountryId"="CountryIdIn"
AND
		enquiry."EnquiryLocation"."StateId"="StateIdIn"
AND
		enquiry."EnquiryLocation"."CityId"="CityIdIn"
$$;
 �   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78818 !   fn_selectEnquiryByCompany(bigint)    FUNCTION     i  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompany"("CompanyIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
        enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE
		enquiry."MainEnquiry"."CompanyId"="CompanyIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
$$;
 R   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompany"("CompanyIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78823 *   fn_selectEnquiryByCompanyExecutive(bigint)    FUNCTION     #  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompanyExecutive"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
        enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryAccessList"
		ON enquiry."EnquiryAccessList"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
JOIN
		public."CRMAccessList"
		ON public."CRMAccessList"."CorrespondingId"=enquiry."EnquiryAccessList"."CompanyExecutiveId"
WHERE
		enquiry."EnquiryAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND
		enquiry."EnquiryAccessList"."MarkForDelete"=FALSE	
AND
        company."Company"."MarkForDelete"=FALSE
AND
        public."CRMAccessList"."MarkForDelete"=FALSE
AND
		public."CRMAccessList"."OwnerFlag"=FALSE
$$;
 d   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompanyExecutive"("CompanyExecutiveIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78819 )   fn_selectEnquiryByCountry(bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
       enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		enquiry."EnquiryLocation"."CountryId"="CountryIdIn"
$$;
 f   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78817    fn_selectEnquiryByOwner(bigint)    FUNCTION     d  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByOwner"("OwnerIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
        enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
$$;
 N   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByOwner"("OwnerIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    78820 /   fn_selectEnquiryByState(bigint, bigint, bigint)    FUNCTION     �  CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
    LANGUAGE sql
    AS $$
SELECT
        enquiry."MainEnquiry"."EnquiryId",
		enquiry."EnquiryLocation"."Latitude",
		enquiry."EnquiryLocation"."Longitude",
		enquiry."MainEnquiry"."CompanyName",
		enquiry."EnquiryClient"."ClientName",
		enquiry."EnquiryClient"."ContactPerson",
		enquiry."EnquiryClient"."EmailId",
		enquiry."EnquiryClient"."ContactNumber",
		enquiry."MainEnquiry"."EnquiryTypeName"
FROM 
		enquiry."MainEnquiry"
JOIN
		enquiry."EnquiryLocation"
		ON enquiry."EnquiryLocation"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN
		company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE
		company."Company"."OwnerContactId"="OwnerIdIn"
AND
        company."Company"."MarkForDelete"=FALSE
AND
		enquiry."EnquiryLocation"."CountryId"="CountryIdIn"
AND
		enquiry."EnquiryLocation"."StateId"="StateIdIn"
$$;
 x   DROP FUNCTION "geoMapPlotting"."fn_selectEnquiryByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint);
       geoMapPlotting          postgres    false    11            �           1255    77911    fn_deleteArea(bigint)    FUNCTION     �  CREATE FUNCTION location."fn_deleteArea"("p_AreaID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "MarkForDelete"=true
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ;   DROP FUNCTION location."fn_deleteArea"("p_AreaID" bigint);
       location          postgres    false    17            �           1255    77912 (   fn_deleteBusinessAreaFromCompany(bigint)    FUNCTION     f  CREATE FUNCTION location."fn_deleteBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "MarkForDelete"=true WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 `   DROP FUNCTION location."fn_deleteBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint);
       location          postgres    false    17            �           1255    77913 (   fn_deleteBusinessCityFromCompany(bigint)    FUNCTION     f  CREATE FUNCTION location."fn_deleteBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "MarkForDelete"=true WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 `   DROP FUNCTION location."fn_deleteBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint);
       location          postgres    false    17            �           1255    77914    fn_deleteCity(bigint)    FUNCTION       CREATE FUNCTION location."fn_deleteCity"("p_CityID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "MarkForDelete"=true WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ;   DROP FUNCTION location."fn_deleteCity"("p_CityID" bigint);
       location          postgres    false    17            �           1255    77915    fn_deleteCountry(bigint)    FUNCTION       CREATE FUNCTION location."fn_deleteCountry"("p_CountryID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "MarkForDelete"=true WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 A   DROP FUNCTION location."fn_deleteCountry"("p_CountryID" bigint);
       location          postgres    false    17            �           1255    77916    fn_deleteState(bigint)    FUNCTION     $  CREATE FUNCTION location."fn_deleteState"("p_StateID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "MarkForDelete"=true WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 =   DROP FUNCTION location."fn_deleteState"("p_StateID" bigint);
       location          postgres    false    17            �           1255    77917 �   fn_insertIntoArea(bigint, bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_insertIntoArea"("p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $$

BEGIN
INSERT INTO location.areainfo("AreaName", "AreaCode", "AreaDescription",
"CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "CityID", "StateID", "CountryID")
VALUES ("p_AreaName", "p_AreaCode", "p_AreaDescription", "p_CreatedOn", "p_CreatedBy",
         "p_DeviceType", "p_LastEditOn", "p_LastEditBy", "p_LastEditDeviceType", "p_CityID", "p_StateID", "p_CountryID");
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 e  DROP FUNCTION location."fn_insertIntoArea"("p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77918 �   fn_insertIntoBusinessAreaForCompany(bigint, bigint, bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     o  CREATE FUNCTION location."fn_insertIntoBusinessAreaForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE sql STRICT
    AS $$

WITH "SelectFromAreaInfo" AS (
	INSERT INTO location.areainfo("AreaName", "AreaCode", "AreaDescription",
	"CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy",
	"LastEditDeviceType", "CityID", "StateID", "CountryID")
	VALUES ("p_AreaName", "p_AreaCode", "p_AreaDescription", "p_CreatedOn",
			"p_CreatedBy","p_DeviceType", "p_LastEditOn", "p_LastEditBy", 
			"p_LastEditDeviceType", "p_CityID", "p_StateID", "p_CountryID")
	RETURNING "AreaID" AS "AreaID"
), 
"SelectFromBusinessAreaInfo" AS (
	INSERT INTO location."businessAreaForCompany"("CompanyID", "AreaID",
		"CityID", "CreatedOn", "CreatedBy", "DeviceType", 
		"LastEditOn", "LastEditBy", "LastEditDeviceType")
	VALUES ("p_CompanyID", (SELECT "AreaID" FROM "SelectFromAreaInfo"), 
			"p_CityID", "p_CreatedOn", "p_CreatedBy", "p_DeviceType", 
			"p_LastEditOn", "p_LastEditBy", "p_LastEditDeviceType")
	RETURNING true	
)

SELECT * FROM "SelectFromBusinessAreaInfo";

$$;
 �  DROP FUNCTION location."fn_insertIntoBusinessAreaForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77919 �   fn_insertIntoBusinessCityForCompany(bigint, bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     2  CREATE FUNCTION location."fn_insertIntoBusinessCityForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE sql STRICT
    AS $$

WITH "SelectFromCityInfo" AS (
	INSERT INTO location.cityinfo
	(
		"CityName", "CityCode", "CityDescription",
		"CreatedOn", "CreatedBy", "DeviceType",
		"LastEditOn", "LastEditBy", "LastEditDeviceType",
		"StateID", "CountryID"
	)
	VALUES
	(
		"p_CityName", "p_CityCode", "p_CityDescription",
		"p_CreatedOn", "p_CreatedBy", "p_DeviceType",
		"p_LastEditOn", "p_LastEditBy", "p_LastEditDeviceType",
		"p_StateID", "p_CountryID"
	) RETURNING "CityID" 
), 
"SelectFromBusinessCityInfo" AS (
	INSERT INTO location."businessCityForCompany"(
		"CompanyID", "CityID", 
		"CreatedOn", "CreatedBy", "DeviceType", 
		"LastEditOn", "LastEditBy", "LastEditDeviceType"
	)VALUES (
		"p_CompanyID", (SELECT * FROM "SelectFromCityInfo"), "p_CreatedOn", 
		"p_CreatedBy", "p_DeviceType", "p_LastEditOn",
		"p_LastEditBy", "p_LastEditDeviceType"
	) RETURNING true
)

SELECT * FROM "SelectFromBusinessCityInfo";

$$;
 z  DROP FUNCTION location."fn_insertIntoBusinessCityForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77920 �   fn_insertIntoCity(bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     [  CREATE FUNCTION location."fn_insertIntoCity"("p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $$

BEGIN
INSERT INTO location.cityinfo("CityName", "CityCode", "CityDescription",
"CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "StateID", "CountryID")
VALUES ("p_CityName", "p_CityCode", "p_CityDescription", "p_CreatedOn", "p_CreatedBy",
         "p_DeviceType", "p_LastEditOn", "p_LastEditBy", "p_LastEditDeviceType", "p_StateID", "p_CountryID");
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 R  DROP FUNCTION location."fn_insertIntoCity"("p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77921 �   fn_insertIntoCountry(text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION       CREATE FUNCTION location."fn_insertIntoCountry"("p_CountryName" text, "p_CountryCode" text, "p_CountryDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $$

BEGIN
INSERT INTO location.countryinfo("CountryName", "CountryCode", "CountryDescription", 
"CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType")
VALUES ("p_CountryName", "p_CountryCode", "p_CountryDescription", "p_CreatedOn", "p_CreatedBy",
		 "p_DeviceType", "p_LastEditOn", "p_LastEditBy", "p_LastEditDeviceType");
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 4  DROP FUNCTION location."fn_insertIntoCountry"("p_CountryName" text, "p_CountryCode" text, "p_CountryDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77922 �   fn_insertIntoState(bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer)    FUNCTION     :  CREATE FUNCTION location."fn_insertIntoState"("p_CountryID" bigint, "p_StateName" text, "p_StateCode" text, "p_StateDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql STRICT
    AS $$

BEGIN
INSERT INTO location.stateinfo("CountryID", "StateName", "StateCode", "StateDescription",
"CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType")
VALUES ("p_CountryID", "p_StateName", "p_StateCode", "p_StateDescription", "p_CreatedOn", "p_CreatedBy",
         "p_DeviceType", "p_LastEditOn", "p_LastEditBy", "p_LastEditDeviceType");
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 B  DROP FUNCTION location."fn_insertIntoState"("p_CountryID" bigint, "p_StateName" text, "p_StateCode" text, "p_StateDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77923    fn_revokeArea(bigint)    FUNCTION        CREATE FUNCTION location."fn_revokeArea"("p_AreaID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo SET "MarkForDelete"=false WHERE "AreaID"="p_AreaID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ;   DROP FUNCTION location."fn_revokeArea"("p_AreaID" bigint);
       location          postgres    false    17            �           1255    77924 (   fn_revokeBusinessAreaFromCompany(bigint)    FUNCTION     g  CREATE FUNCTION location."fn_revokeBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "MarkForDelete"=false WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 `   DROP FUNCTION location."fn_revokeBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint);
       location          postgres    false    17            �           1255    77925 (   fn_revokeBusinessCityFromCompany(bigint)    FUNCTION     g  CREATE FUNCTION location."fn_revokeBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "MarkForDelete"=false WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 `   DROP FUNCTION location."fn_revokeBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint);
       location          postgres    false    17            �           1255    77926    fn_revokeCity(bigint)    FUNCTION        CREATE FUNCTION location."fn_revokeCity"("p_CityID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "MarkForDelete"=false WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ;   DROP FUNCTION location."fn_revokeCity"("p_CityID" bigint);
       location          postgres    false    17            �           1255    77927    fn_revokeCountry(bigint)    FUNCTION       CREATE FUNCTION location."fn_revokeCountry"("p_CountryID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "MarkForDelete"=false WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 A   DROP FUNCTION location."fn_revokeCountry"("p_CountryID" bigint);
       location          postgres    false    17            �           1255    77928    fn_revokeState(bigint)    FUNCTION     %  CREATE FUNCTION location."fn_revokeState"("p_StateID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "MarkForDelete"=false WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 =   DROP FUNCTION location."fn_revokeState"("p_StateID" bigint);
       location          postgres    false    17            �           1255    77929    fn_searchInArea(text)    FUNCTION     G  CREATE FUNCTION location."fn_searchInArea"(search_con text) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaName" text, "AreaCode" text, "AreaID" bigint, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryID", cou."CountryName", st."StateID", st."StateName",
ct."CityID", ct."CityName",
ar."AreaName", ar."AreaCode", ar."AreaID", ar."AreaDescription", ar."IsActive",
ar."CreatedOn", ar."CreatedBy", ar."DeviceType", ar."LastEditOn", ar."LastEditBy", 
ar."LastEditDeviceType"
FROM location.areainfo AS ar
INNER JOIN location.countryinfo AS cou
ON ar."CountryID"=cou."CountryID"
INNER JOIN location.stateinfo AS st
ON ar."StateID"=st."StateID"
INNER JOIN location.cityinfo AS ct
ON ar."CityID"=ct."CityID"
WHERE cou."CountryName" LIKE CONCAT('%',search_con,'%') OR st."StateName" LIKE CONCAT('%',search_con,'%') OR 
ct."CityName" LIKE CONCAT('%',search_con,'%') OR 
ar."AreaName" LIKE CONCAT('%',search_con,'%') OR ar."AreaCode" LIKE CONCAT('%',search_con,'%') OR
ar."AreaDescription" LIKE CONCAT('%',search_con,'%')
AND ar."MarkForDelete"=false;
    
$$;
 ;   DROP FUNCTION location."fn_searchInArea"(search_con text);
       location          postgres    false    17            �           1255    77930 '   fn_searchInBusinessAreaForCompany(text)    FUNCTION     �  CREATE FUNCTION location."fn_searchInBusinessAreaForCompany"(search_con text) RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT 	bafc."BusinessAreaForCompanyID", 
		bafc."CompanyID", 
		comp."ownerName", 
		bafc."CityID", 
		ct."CityName", 
		bafc."AreaID", 
		ar."AreaName", 
		ar."AreaCode",
		ar."AreaDescription",
		bafc."IsActive",
		bafc."CreatedOn", 
		bafc."CreatedBy", 
		bafc."DeviceType", 
		bafc."LastEditOn",
		bafc."LastEditBy",
		bafc."LastEditDeviceType"		
FROM 
	location."businessAreaForCompany" AS bafc
INNER JOIN 
	"owner"."OwnerContact" AS comp
ON 
	bafc."CompanyID" = comp."id"
INNER JOIN 
	location.cityinfo AS ct
ON 
	bafc."CityID" = ct."CityID"
INNER JOIN 
	location.areainfo AS ar
ON
	bafc."AreaID" = ar."AreaID"
WHERE 
	comp."ownerName" LIKE CONCAT('%',search_con,'%') OR 
	ct."CityName" LIKE CONCAT('%',search_con,'%') OR
	ar."AreaName" LIKE CONCAT('%',search_con,'%') OR
	ar."AreaCode" LIKE CONCAT('%',search_con,'%') OR
	ar."AreaDescription" LIKE CONCAT('%',search_con,'%') AND 
	bafc."MarkForDelete"=false;
	
$$;
 M   DROP FUNCTION location."fn_searchInBusinessAreaForCompany"(search_con text);
       location          postgres    false    17            �           1255    77931 '   fn_searchInBusinessCityForCompany(text)    FUNCTION     �  CREATE FUNCTION location."fn_searchInBusinessCityForCompany"(search_con text) RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT 	bcfc."BusinessCityForCompanyID", 
		bcfc."CompanyID",
		comp."ownerName",
		bcfc."CityID",
		ct."CityName",
		ct."CityCode",
		ct."CityDescription",
		bcfc."IsActive",
		bcfc."CreatedOn", 
		bcfc."CreatedBy",
		bcfc."DeviceType", 
		bcfc."LastEditOn",
		bcfc."LastEditBy", 
		bcfc."LastEditDeviceType"		
FROM 
	location."businessCityForCompany" AS bcfc
INNER JOIN 
	"owner"."OwnerContact" AS comp
ON 
	bcfc."CompanyID" = comp."id"
INNER JOIN 
	location.cityinfo AS ct
ON 
	bcfc."CityID" = ct."CityID"
WHERE 
	comp."ownerName" LIKE CONCAT('%',search_con,'%') OR 
	ct."CityName" LIKE CONCAT('%',search_con,'%') OR
	ct."CityCode" LIKE CONCAT('%',search_con,'%') OR
	ct."CityDescription" LIKE CONCAT('%',search_con,'%') AND 
	bcfc."MarkForDelete"=false;
	
$$;
 M   DROP FUNCTION location."fn_searchInBusinessCityForCompany"(search_con text);
       location          postgres    false    17            �           1255    77932    fn_searchInCity(text)    FUNCTION     �  CREATE FUNCTION location."fn_searchInCity"(search_con text) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityName" text, "CityCode" text, "CityID" bigint, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryID", cou."CountryName", st."StateID", st."StateName", 
ct."CityName", ct."CityCode", ct."CityID", ct."CityDescription", ct."IsActive",
ct."CreatedOn", ct."CreatedBy", ct."DeviceType", ct."LastEditOn", ct."LastEditBy", 
ct."LastEditDeviceType"
FROM location.cityinfo AS ct
INNER JOIN location.countryinfo AS cou
ON ct."CountryID"=cou."CountryID"
INNER JOIN location.stateinfo AS st
ON ct."StateID"=st."StateID"
WHERE cou."CountryName" LIKE CONCAT('%',search_con,'%') OR st."StateName" LIKE CONCAT('%',search_con,'%') OR 
ct."CityName" LIKE CONCAT('%',search_con,'%') OR ct."CityCode" LIKE CONCAT('%',search_con,'%') OR
ct."CityDescription" LIKE CONCAT('%',search_con,'%')
AND ct."MarkForDelete"=false;
    
$$;
 ;   DROP FUNCTION location."fn_searchInCity"(search_con text);
       location          postgres    false    17            �           1255    77933    fn_searchInCountry(text)    FUNCTION       CREATE FUNCTION location."fn_searchInCountry"(search_con text) RETURNS TABLE("CountryName" text, "CountryCode" text, "CountryID" bigint, "CountryDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT "CountryName", "CountryCode", "CountryID", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType"
FROM location.countryinfo WHERE 
"CountryName" LIKE CONCAT('%',search_con,'%') OR "CountryCode" LIKE CONCAT('%',search_con,'%') OR 
"CountryDescription" LIKE CONCAT('%',search_con,'%')
AND "MarkForDelete"=false;
	
$$;
 >   DROP FUNCTION location."fn_searchInCountry"(search_con text);
       location          postgres    false    17            �           1255    77934    fn_searchInState(text)    FUNCTION     �  CREATE FUNCTION location."fn_searchInState"(search_con text) RETURNS TABLE("CountryName" text, "CountryID" bigint, "StateName" text, "StateCode" text, "StateID" bigint, "StateDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryName", st."CountryID", st."StateName", st."StateCode", st."StateID", st."StateDescription", 
st."IsActive", st."CreatedOn", st."CreatedBy", st."DeviceType", st."LastEditOn", st."LastEditBy", st."LastEditDeviceType"
    FROM location.stateinfo AS st
	INNER JOIN location.countryinfo AS cou
	ON st."CountryID"=cou."CountryID"
	WHERE cou."CountryName" LIKE CONCAT('%',search_con,'%') OR
	st."StateName" LIKE CONCAT('%',search_con,'%') OR st."StateCode" LIKE CONCAT('%',search_con,'%') OR
	st."StateDescription" LIKE CONCAT('%',search_con,'%')
	AND st."MarkForDelete"=false;

    
$$;
 <   DROP FUNCTION location."fn_searchInState"(search_con text);
       location          postgres    false    17            �           1255    77935    fn_selectAreaUsingCity(bigint)    FUNCTION     �   CREATE FUNCTION location."fn_selectAreaUsingCity"(areaid bigint) RETURNS TABLE(area_name text, pin_code text, id integer)
    LANGUAGE sql STRICT
    AS $$SELECT area_name,pin_code,id FROM location.areainfo WHERE city_id=areaid;$$;
 @   DROP FUNCTION location."fn_selectAreaUsingCity"(areaid bigint);
       location          postgres    false    17            o           1255    77936     fn_selectAreaUsingCityId(bigint)    FUNCTION     I  CREATE FUNCTION location."fn_selectAreaUsingCityId"("p_CityID" bigint) RETURNS TABLE("AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text)
    LANGUAGE sql
    AS $$

SELECT "AreaID", "AreaName", "AreaCode", "AreaDescription"
	FROM location.areainfo WHERE "CityID"="p_CityID" AND "MarkForDelete"=false;

$$;
 F   DROP FUNCTION location."fn_selectAreaUsingCityId"("p_CityID" bigint);
       location          postgres    false    17                       1255    78448 0   fn_selectBusinessAreaUsingCityId(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_selectBusinessAreaUsingCityId"("p_CityID" bigint, "p_OwnerID" bigint) RETURNS TABLE("AreaID" bigint, "AreaName" text)
    LANGUAGE sql
    AS $$
	
	SELECT bafc."BusinessAreaForCompanyID", ar."AreaName"
	FROM location.areainfo AS ar
	INNER JOIN location."businessAreaForCompany" AS bafc
	ON ar."AreaID" = bafc."AreaID"
	WHERE bafc."CityID" = "p_CityID"
	AND bafc."CompanyID" = "p_OwnerID"
	AND bafc."MarkForDelete" = false;

$$;
 b   DROP FUNCTION location."fn_selectBusinessAreaUsingCityId"("p_CityID" bigint, "p_OwnerID" bigint);
       location          postgres    false    17                       1255    78449 1   fn_selectBusinessCityUsingStateId(bigint, bigint)    FUNCTION       CREATE FUNCTION location."fn_selectBusinessCityUsingStateId"("p_StateID" bigint, "p_OwnerID" bigint) RETURNS TABLE("CityID" bigint, "CityName" text)
    LANGUAGE sql
    AS $$
	
	SELECT bcfc."BusinessCityForCompanyID", ct."CityName"
	FROM location.cityinfo AS ct
	INNER JOIN location."businessCityForCompany" AS bcfc
	ON ct."CityID" = bcfc."CityID"
	INNER JOIN location.stateinfo AS st
	ON ct."StateID" = st."StateID"
	WHERE st."StateID" = "p_StateID"
	AND bcfc."CompanyID" = "p_OwnerID"
	AND bcfc."MarkForDelete" = false;

$$;
 d   DROP FUNCTION location."fn_selectBusinessCityUsingStateId"("p_StateID" bigint, "p_OwnerID" bigint);
       location          postgres    false    17            p           1255    77937    fn_selectCityUsingState(bigint)    FUNCTION     �   CREATE FUNCTION location."fn_selectCityUsingState"(stateid bigint) RETURNS TABLE(city_name text, id integer)
    LANGUAGE sql STRICT
    AS $$SELECT city_name,id FROM location.cityinfo WHERE state_id=stateid;$$;
 B   DROP FUNCTION location."fn_selectCityUsingState"(stateid bigint);
       location          postgres    false    17            q           1255    77938 !   fn_selectCityUsingStateId(bigint)    FUNCTION     M  CREATE FUNCTION location."fn_selectCityUsingStateId"("p_StateID" bigint) RETURNS TABLE("CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text)
    LANGUAGE sql
    AS $$

SELECT "CityID", "CityName", "CityCode", "CityDescription"
	FROM location.cityinfo WHERE "StateID"="p_StateID" AND "MarkForDelete"=false;

$$;
 H   DROP FUNCTION location."fn_selectCityUsingStateId"("p_StateID" bigint);
       location          postgres    false    17            r           1255    77939    fn_selectFromArea()    FUNCTION       CREATE FUNCTION location."fn_selectFromArea"() RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaName" text, "AreaCode" text, "AreaID" bigint, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryID", cou."CountryName", st."StateID", st."StateName",
ct."CityID", ct."CityName",
ar."AreaName", ar."AreaCode", ar."AreaID", ar."AreaDescription", ar."IsActive",
ar."CreatedOn", ar."CreatedBy", ar."DeviceType", ar."LastEditOn", ar."LastEditBy", 
ar."LastEditDeviceType"
FROM location.areainfo AS ar
INNER JOIN location.countryinfo AS cou
ON ar."CountryID"=cou."CountryID"
INNER JOIN location.stateinfo AS st
ON ar."StateID"=st."StateID"
INNER JOIN location.cityinfo AS ct
ON ar."CityID"=ct."CityID"
WHERE ar."MarkForDelete"=false;

$$;
 .   DROP FUNCTION location."fn_selectFromArea"();
       location          postgres    false    17            �           1255    77940    fn_selectFromAreaById(bigint)    FUNCTION     1  CREATE FUNCTION location."fn_selectFromAreaById"("p_AreaID" bigint) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaName" text, "AreaCode" text, "AreaID" bigint, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryID", cou."CountryName", st."StateID", st."StateName",
ct."CityID", ct."CityName",
ar."AreaName", ar."AreaCode", ar."AreaID", ar."AreaDescription", ar."IsActive",
ar."CreatedOn", ar."CreatedBy", ar."DeviceType", ar."LastEditOn", ar."LastEditBy", 
ar."LastEditDeviceType"
FROM location.areainfo AS ar
INNER JOIN location.countryinfo AS cou
ON ar."CountryID"=cou."CountryID"
INNER JOIN location.stateinfo AS st
ON ar."StateID"=st."StateID"
INNER JOIN location.cityinfo AS ct
ON ar."CityID"=ct."CityID"
WHERE ar."AreaID"="p_AreaID" AND ar."MarkForDelete"=false;

$$;
 C   DROP FUNCTION location."fn_selectFromAreaById"("p_AreaID" bigint);
       location          postgres    false    17            h           1255    77941 %   fn_selectFromBusinessAreaForCompany()    FUNCTION     �  CREATE FUNCTION location."fn_selectFromBusinessAreaForCompany"() RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT 	bafc."BusinessAreaForCompanyID", 
		bafc."CompanyID", 
		comp."CompanyName", 
		bafc."CityID", 
		ct."CityName", 
		bafc."AreaID", 
		ar."AreaName", 
		ar."AreaCode",
		ar."AreaDescription",
		bafc."IsActive",
		bafc."CreatedOn", 
		bafc."CreatedBy", 
		bafc."DeviceType", 
		bafc."LastEditOn",
		bafc."LastEditBy",
		bafc."LastEditDeviceType"
		
FROM 
	location."businessAreaForCompany" AS bafc
INNER JOIN 
	company."Company" AS comp
ON 
	bafc."CompanyID" = comp."CompanyId"
INNER JOIN 
	location.cityinfo AS ct
ON 
	bafc."CityID" = ct."CityID"
INNER JOIN 
	location.areainfo AS ar
ON 
	bafc."AreaID" = ar."AreaID"
WHERE 
	bafc."MarkForDelete"=false;

$$;
 @   DROP FUNCTION location."fn_selectFromBusinessAreaForCompany"();
       location          postgres    false    17            i           1255    77942 3   fn_selectFromBusinessAreaForCompanyByAreaId(bigint)    FUNCTION     �  CREATE FUNCTION location."fn_selectFromBusinessAreaForCompanyByAreaId"("p_BusinessAreaForCompanyAreaID" bigint) RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT 	bafc."BusinessAreaForCompanyID", 
		bafc."CompanyID", 
		comp."ownerName", 
		bafc."CityID", 
		ct."CityName", 
		bafc."AreaID", 
		ar."AreaName", 
		ar."AreaCode",
		ar."AreaDescription",
		bafc."IsActive",
		bafc."CreatedOn", 
		bafc."CreatedBy", 
		bafc."DeviceType", 
		bafc."LastEditOn",
		bafc."LastEditBy",
		bafc."LastEditDeviceType"
		
FROM 
	location."businessAreaForCompany" AS bafc
INNER JOIN 
	"owner"."OwnerContact" AS comp
ON 
	bafc."CompanyID" = comp."id"
INNER JOIN 
	location.cityinfo AS ct
ON 
	bafc."CityID" = ct."CityID"
INNER JOIN 
	location.areainfo AS ar
ON 
	bafc."AreaID" = ar."AreaID"
WHERE 
	bafc."BusinessAreaForCompanyID"="p_BusinessAreaForCompanyAreaID" AND
	bafc."MarkForDelete"=false;

$$;
 o   DROP FUNCTION location."fn_selectFromBusinessAreaForCompanyByAreaId"("p_BusinessAreaForCompanyAreaID" bigint);
       location          postgres    false    17            �           1255    103626 /   fn_selectFromBusinessAreaForCompanyById(bigint)    FUNCTION     &  CREATE FUNCTION location."fn_selectFromBusinessAreaForCompanyById"("p_CompanyID" bigint) RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT bafc."BusinessAreaForCompanyID",
bafc."CompanyID",
comp."ownerName" AS "CompanyName",
(SELECT ar."CountryID" FROM location."areainfo" AS ar
WHERE "AreaID"=bafc."AreaID"),
(SELECT "CountryName" FROM location."countryinfo"
WHERE "CountryID"=(SELECT ar."CountryID" FROM location."areainfo" AS ar
WHERE "AreaID"=bafc."AreaID")),
(SELECT ar."StateID" FROM location."areainfo" AS ar
WHERE "AreaID"=bafc."AreaID"),
(SELECT "StateName" FROM location."stateinfo"
WHERE "StateID"=(SELECT ar."StateID" FROM location."areainfo" AS ar
WHERE "AreaID"=bafc."AreaID")),
bafc."CityID",
(
SELECT ct."CityName" FROM location.cityinfo AS ct
WHERE ct."CityID"=(
SELECT bcfc."CityID"
FROM location."businessCityForCompany" AS bcfc
WHERE bcfc."BusinessCityForCompanyID"=bafc."CityID"
)
),
bafc."AreaID",
ar."AreaName",
ar."AreaCode",
ar."AreaDescription",
bafc."IsActive",
bafc."CreatedOn",
bafc."CreatedBy",
bafc."DeviceType",
bafc."LastEditOn",
bafc."LastEditBy",
bafc."LastEditDeviceType"
FROM
location."businessAreaForCompany" AS bafc
INNER JOIN
"owner"."OwnerContact" AS comp
ON  
bafc."CompanyID" = comp."id"
INNER JOIN
location.areainfo AS ar
ON
bafc."AreaID" = ar."AreaID"
WHERE
bafc."CompanyID" = "p_CompanyID" AND
bafc."MarkForDelete" = false;

$$;
 X   DROP FUNCTION location."fn_selectFromBusinessAreaForCompanyById"("p_CompanyID" bigint);
       location          postgres    false    17            �           1255    77944 %   fn_selectFromBusinessCityForCompany()    FUNCTION     �  CREATE FUNCTION location."fn_selectFromBusinessCityForCompany"() RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT 	bcfc."BusinessCityForCompanyID", 
		bcfc."CompanyID",
		comp."CompanyName",
		bcfc."CityID",
		ct."CityName",
		ct."CityCode",
		ct."CityDescription",
		bcfc."IsActive",
		bcfc."CreatedOn", 
		bcfc."CreatedBy",
		bcfc."DeviceType", 
		bcfc."LastEditOn",
		bcfc."LastEditBy", 
		bcfc."LastEditDeviceType"
FROM 
	location."businessCityForCompany" AS bcfc
INNER JOIN 
	company."Company" AS comp
ON 
	bcfc."CompanyID" = comp."CompanyId"
INNER JOIN 
	location.cityinfo AS ct
ON 
	bcfc."CityID" = ct."CityID"
WHERE 
	bcfc."MarkForDelete"=false;

$$;
 @   DROP FUNCTION location."fn_selectFromBusinessCityForCompany"();
       location          postgres    false    17            �           1255    103625 6   fn_selectFromBusinessCityForCompanyByCompanyId(bigint)    FUNCTION        CREATE FUNCTION location."fn_selectFromBusinessCityForCompanyByCompanyId"("p_CompanyID" bigint) RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT bcfc."BusinessCityForCompanyID",
bcfc."CompanyID",
comp."ownerName",
(SELECT ct."CountryID" FROM location."cityinfo" AS ct
WHERE "CityID"=bcfc."CityID"),
(SELECT "CountryName" FROM location."countryinfo"
WHERE "CountryID"=(SELECT ct."CountryID" FROM location."cityinfo" AS ct
WHERE "CityID"=bcfc."CityID")),
(SELECT ct."StateID" FROM location."cityinfo" AS ct
WHERE "CityID"=bcfc."CityID"),
(SELECT "StateName" FROM location."stateinfo"
WHERE "StateID"=(SELECT ct."StateID" FROM location."cityinfo" AS ct
WHERE "CityID"=bcfc."CityID")),
bcfc."CityID",
ct."CityName",
ct."CityCode",
ct."CityDescription",
bcfc."IsActive",
bcfc."CreatedOn",
bcfc."CreatedBy",
bcfc."DeviceType",
bcfc."LastEditOn",
bcfc."LastEditBy",
bcfc."LastEditDeviceType"
FROM location."businessCityForCompany" AS bcfc
INNER JOIN "owner"."OwnerContact" AS comp
ON bcfc."CompanyID" = comp."id"
INNER JOIN location.cityinfo AS ct
ON bcfc."CityID" = ct."CityID"
WHERE bcfc."CompanyID"="p_CompanyID" AND
bcfc."MarkForDelete"=false;

$$;
 _   DROP FUNCTION location."fn_selectFromBusinessCityForCompanyByCompanyId"("p_CompanyID" bigint);
       location          postgres    false    17            �           1255    77946 /   fn_selectFromBusinessCityForCompanyById(bigint)    FUNCTION     F  CREATE FUNCTION location."fn_selectFromBusinessCityForCompanyById"("p_BusinessCityForCompanyID" bigint) RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT 	bcfc."BusinessCityForCompanyID", 
		bcfc."CompanyID",
		comp."ownerName",
		bcfc."CityID",
		ct."CityName",
		ct."CityCode",
		ct."CityDescription",
		bcfc."IsActive",
		bcfc."CreatedOn", 
		bcfc."CreatedBy",
		bcfc."DeviceType", 
		bcfc."LastEditOn",
		bcfc."LastEditBy", 
		bcfc."LastEditDeviceType"
FROM location."businessCityForCompany" AS bcfc
INNER JOIN "owner"."OwnerContact" AS comp
ON bcfc."CompanyID" = comp."id"
INNER JOIN location.cityinfo AS ct
ON bcfc."CityID" = ct."CityID"
WHERE bcfc."BusinessCityForCompanyID"="p_BusinessCityForCompanyID" 
AND bcfc."MarkForDelete"=false;

$$;
 g   DROP FUNCTION location."fn_selectFromBusinessCityForCompanyById"("p_BusinessCityForCompanyID" bigint);
       location          postgres    false    17            �           1255    77947    fn_selectFromCity()    FUNCTION     �  CREATE FUNCTION location."fn_selectFromCity"() RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityName" text, "CityCode" text, "CityID" bigint, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryID", cou."CountryName", st."StateID", st."StateName", 
ct."CityName", ct."CityCode", ct."CityID", ct."CityDescription", ct."IsActive",
ct."CreatedOn", ct."CreatedBy", ct."DeviceType", ct."LastEditOn", ct."LastEditBy", 
ct."LastEditDeviceType"
FROM location.cityinfo AS ct
INNER JOIN location.countryinfo AS cou
ON ct."CountryID"=cou."CountryID"
INNER JOIN location.stateinfo AS st
ON ct."StateID"=st."StateID"
WHERE ct."MarkForDelete"=false;

$$;
 .   DROP FUNCTION location."fn_selectFromCity"();
       location          postgres    false    17            �           1255    77948    fn_selectFromCityById(bigint)    FUNCTION     �  CREATE FUNCTION location."fn_selectFromCityById"("p_CityID" bigint) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityName" text, "CityCode" text, "CityID" bigint, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryID", cou."CountryName", st."StateID", st."StateName", 
ct."CityName", ct."CityCode", ct."CityID", ct."CityDescription", ct."IsActive",
ct."CreatedOn", ct."CreatedBy", ct."DeviceType", ct."LastEditOn", ct."LastEditBy", 
ct."LastEditDeviceType"
FROM location.cityinfo AS ct
INNER JOIN location.countryinfo AS cou
ON ct."CountryID"=cou."CountryID"
INNER JOIN location.stateinfo AS st
ON ct."StateID"=st."StateID"
WHERE ct."CityID"="p_CityID"
AND ct."MarkForDelete"=false;

$$;
 C   DROP FUNCTION location."fn_selectFromCityById"("p_CityID" bigint);
       location          postgres    false    17            �           1255    77949    fn_selectFromCountry()    FUNCTION     a  CREATE FUNCTION location."fn_selectFromCountry"() RETURNS TABLE("CountryName" text, "CountryCode" text, "CountryID" bigint, "CountryDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT "CountryName", "CountryCode", "CountryID", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType"
	FROM location.countryinfo WHERE "MarkForDelete"=false;

$$;
 1   DROP FUNCTION location."fn_selectFromCountry"();
       location          postgres    false    17            �           1255    77950     fn_selectFromCountryById(bigint)    FUNCTION     �  CREATE FUNCTION location."fn_selectFromCountryById"("p_CountryID" bigint) RETURNS TABLE("CountryName" text, "CountryCode" text, "CountryID" bigint, "CountryDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT "CountryName", "CountryCode", "CountryID", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType"
	FROM location.countryinfo WHERE "CountryID"="p_CountryID" AND "MarkForDelete"=false;

$$;
 I   DROP FUNCTION location."fn_selectFromCountryById"("p_CountryID" bigint);
       location          postgres    false    17            �           1255    77951    fn_selectFromState()    FUNCTION       CREATE FUNCTION location."fn_selectFromState"() RETURNS TABLE("CountryName" text, "CountryID" bigint, "StateName" text, "StateCode" text, "StateID" bigint, "StateDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryName", st."CountryID", st."StateName", st."StateCode", st."StateID", st."StateDescription", 
st."IsActive", st."CreatedOn", st."CreatedBy", st."DeviceType", st."LastEditOn", st."LastEditBy", st."LastEditDeviceType"
    FROM location.stateinfo AS st
	INNER JOIN location.countryinfo AS cou
	ON st."CountryID"=cou."CountryID"
	WHERE st."MarkForDelete"=false;

$$;
 /   DROP FUNCTION location."fn_selectFromState"();
       location          postgres    false    17            �           1255    77952    fn_selectFromStateById(bigint)    FUNCTION     E  CREATE FUNCTION location."fn_selectFromStateById"("p_StateID" bigint) RETURNS TABLE("CountryName" text, "CountryID" bigint, "StateName" text, "StateCode" text, "StateID" bigint, "StateDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryName", st."CountryID", st."StateName", st."StateCode", st."StateID", st."StateDescription", 
st."IsActive", st."CreatedOn", st."CreatedBy", st."DeviceType", st."LastEditOn", st."LastEditBy", st."LastEditDeviceType"
    FROM location.stateinfo AS st
	INNER JOIN location.countryinfo AS cou
	ON st."CountryID"=cou."CountryID"
	WHERE st."StateID"="p_StateID" AND st."MarkForDelete"=false;

$$;
 E   DROP FUNCTION location."fn_selectFromStateById"("p_StateID" bigint);
       location          postgres    false    17            �           1255    77953 "   fn_selectStateUsingCountry(bigint)    FUNCTION     �   CREATE FUNCTION location."fn_selectStateUsingCountry"(countryid bigint) RETURNS TABLE(state_name text, id integer)
    LANGUAGE sql STRICT
    AS $$SELECT state_name,id FROM location.stateinfo WHERE country_id=countryid;$$;
 G   DROP FUNCTION location."fn_selectStateUsingCountry"(countryid bigint);
       location          postgres    false    17            �           1255    77954 $   fn_selectStateUsingCountryId(bigint)    FUNCTION     _  CREATE FUNCTION location."fn_selectStateUsingCountryId"("p_CountryID" bigint) RETURNS TABLE("StateID" bigint, "StateName" text, "StateCode" text, "StateDescription" text)
    LANGUAGE sql
    AS $$

SELECT "StateID", "StateName", "StateCode", "StateDescription"
	FROM location.stateinfo WHERE "CountryID"="p_CountryID" AND "MarkForDelete"=false;

$$;
 M   DROP FUNCTION location."fn_selectStateUsingCountryId"("p_CountryID" bigint);
       location          postgres    false    17            �           1255    77963 #   fn_updateAreaAreaCode(bigint, text)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaAreaCode"("p_AreaID" bigint, "p_AreaCode" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "AreaCode"="p_AreaCode"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 V   DROP FUNCTION location."fn_updateAreaAreaCode"("p_AreaID" bigint, "p_AreaCode" text);
       location          postgres    false    17            �           1255    77964 *   fn_updateAreaAreaDescription(bigint, text)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaAreaDescription"("p_AreaID" bigint, "p_AreaDescription" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "AreaDescription"="p_AreaDescription" 
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 d   DROP FUNCTION location."fn_updateAreaAreaDescription"("p_AreaID" bigint, "p_AreaDescription" text);
       location          postgres    false    17            �           1255    77965 #   fn_updateAreaAreaName(bigint, text)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaAreaName"("p_AreaID" bigint, "p_AreaName" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "AreaName"="p_AreaName"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 V   DROP FUNCTION location."fn_updateAreaAreaName"("p_AreaID" bigint, "p_AreaName" text);
       location          postgres    false    17            �           1255    77966 #   fn_updateAreaCityID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaCityID"("p_AreaID" bigint, "p_CityID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "CityID"="p_CityID" 
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 T   DROP FUNCTION location."fn_updateAreaCityID"("p_AreaID" bigint, "p_CityID" bigint);
       location          postgres    false    17            �           1255    77967 &   fn_updateAreaCountryID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaCountryID"("p_AreaID" bigint, "p_CountryID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "CountryID"="p_CountryID"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 Z   DROP FUNCTION location."fn_updateAreaCountryID"("p_AreaID" bigint, "p_CountryID" bigint);
       location          postgres    false    17            �           1255    77968 (   fn_updateAreaDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaDeviceType"("p_AreaID" bigint, "p_DeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "DeviceType"="p_DeviceType" 
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ]   DROP FUNCTION location."fn_updateAreaDeviceType"("p_AreaID" bigint, "p_DeviceType" integer);
       location          postgres    false    17            �           1255    77969 &   fn_updateAreaIsActive(bigint, boolean)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaIsActive"("p_AreaID" bigint, "p_IsActive" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "IsActive"="p_IsActive" 
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 Y   DROP FUNCTION location."fn_updateAreaIsActive"("p_AreaID" bigint, "p_IsActive" boolean);
       location          postgres    false    17            �           1255    77970 '   fn_updateAreaLastEditBy(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaLastEditBy"("p_AreaID" bigint, "p_LastEditBy" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "LastEditBy"="p_LastEditBy"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 \   DROP FUNCTION location."fn_updateAreaLastEditBy"("p_AreaID" bigint, "p_LastEditBy" bigint);
       location          postgres    false    17            �           1255    77971 0   fn_updateAreaLastEditDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaLastEditDeviceType"("p_AreaID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "LastEditDeviceType"="p_LastEditDeviceType"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 m   DROP FUNCTION location."fn_updateAreaLastEditDeviceType"("p_AreaID" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77972 <   fn_updateAreaLastEditOn(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaLastEditOn"("p_AreaID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo 
	SET "LastEditOn"="p_LastEditOn"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 q   DROP FUNCTION location."fn_updateAreaLastEditOn"("p_AreaID" bigint, "p_LastEditOn" timestamp without time zone);
       location          postgres    false    17            �           1255    77973 $   fn_updateAreaStateID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateAreaStateID"("p_AreaID" bigint, "p_StateID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.areainfo
	SET "StateID"="p_StateID"
	WHERE "AreaID"=(
		SELECT "AreaID" 
		FROM location."businessAreaForCompany" 
		WHERE "BusinessAreaForCompanyID"="p_AreaID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 V   DROP FUNCTION location."fn_updateAreaStateID"("p_AreaID" bigint, "p_StateID" bigint);
       location          postgres    false    17            j           1255    77974 5   fn_updateBusinessAreaForCompanyCityID(bigint, bigint)    FUNCTION     }  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyCityID"("p_BusinessAreaForCompanyID" bigint, "p_CityID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "CityID"="p_CityID" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 x   DROP FUNCTION location."fn_updateBusinessAreaForCompanyCityID"("p_BusinessAreaForCompanyID" bigint, "p_CityID" bigint);
       location          postgres    false    17            {           1255    77975 8   fn_updateBusinessAreaForCompanyCompanyID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyCompanyID"("p_BusinessAreaForCompanyID" bigint, "p_CompanyID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "CompanyID"="p_CompanyID" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 ~   DROP FUNCTION location."fn_updateBusinessAreaForCompanyCompanyID"("p_BusinessAreaForCompanyID" bigint, "p_CompanyID" bigint);
       location          postgres    false    17            |           1255    77976 :   fn_updateBusinessAreaForCompanyDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_DeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "DeviceType"="p_DeviceType" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessAreaForCompanyDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_DeviceType" integer);
       location          postgres    false    17            }           1255    77977 8   fn_updateBusinessAreaForCompanyIsActive(bigint, boolean)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyIsActive"("p_BusinessAreaForCompanyID" bigint, "p_IsActive" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "IsActive"="p_IsActive" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 }   DROP FUNCTION location."fn_updateBusinessAreaForCompanyIsActive"("p_BusinessAreaForCompanyID" bigint, "p_IsActive" boolean);
       location          postgres    false    17            ~           1255    77978 9   fn_updateBusinessAreaForCompanyLastEditBy(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyLastEditBy"("p_BusinessAreaForCompanyID" bigint, "p_LastEditBy" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "LastEditBy"="p_LastEditBy" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessAreaForCompanyLastEditBy"("p_BusinessAreaForCompanyID" bigint, "p_LastEditBy" bigint);
       location          postgres    false    17                       1255    77979 B   fn_updateBusinessAreaForCompanyLastEditDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyLastEditDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "LastEditDeviceType"="p_LastEditDeviceType" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessAreaForCompanyLastEditDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77980 N   fn_updateBusinessAreaForCompanyLastEditOn(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessAreaForCompanyLastEditOn"("p_BusinessAreaForCompanyID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessAreaForCompany" SET "LastEditOn"="p_LastEditOn" WHERE "BusinessAreaForCompanyID"="p_BusinessAreaForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessAreaForCompanyLastEditOn"("p_BusinessAreaForCompanyID" bigint, "p_LastEditOn" timestamp without time zone);
       location          postgres    false    17            s           1255    77981 8   fn_updateBusinessCityForCompanyCompanyID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessCityForCompanyCompanyID"("p_BusinessCityForCompanyID" bigint, "p_CompanyID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "CompanyID"="p_CompanyID" WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 ~   DROP FUNCTION location."fn_updateBusinessCityForCompanyCompanyID"("p_BusinessCityForCompanyID" bigint, "p_CompanyID" bigint);
       location          postgres    false    17            t           1255    77982 :   fn_updateBusinessCityForCompanyDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessCityForCompanyDeviceType"("p_BusinessCityForCompanyID" bigint, "p_DeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "DeviceType"="p_DeviceType" WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessCityForCompanyDeviceType"("p_BusinessCityForCompanyID" bigint, "p_DeviceType" integer);
       location          postgres    false    17            �           1255    77983 8   fn_updateBusinessCityForCompanyIsActive(bigint, boolean)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessCityForCompanyIsActive"("p_BusinessCityForCompanyID" bigint, "p_IsActive" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "IsActive"="p_IsActive" WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 }   DROP FUNCTION location."fn_updateBusinessCityForCompanyIsActive"("p_BusinessCityForCompanyID" bigint, "p_IsActive" boolean);
       location          postgres    false    17            �           1255    77984 9   fn_updateBusinessCityForCompanyLastEditBy(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessCityForCompanyLastEditBy"("p_BusinessCityForCompanyID" bigint, "p_LastEditBy" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "LastEditBy"="p_LastEditBy" WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessCityForCompanyLastEditBy"("p_BusinessCityForCompanyID" bigint, "p_LastEditBy" bigint);
       location          postgres    false    17            �           1255    77985 B   fn_updateBusinessCityForCompanyLastEditDeviceType(bigint, integer)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessCityForCompanyLastEditDeviceType"("p_BusinessCityForCompanyID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "LastEditDeviceType"="p_LastEditDeviceType" WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessCityForCompanyLastEditDeviceType"("p_BusinessCityForCompanyID" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77986 N   fn_updateBusinessCityForCompanyLastEditOn(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION location."fn_updateBusinessCityForCompanyLastEditOn"("p_BusinessCityForCompanyID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location."businessCityForCompany" SET "LastEditOn"="p_LastEditOn" WHERE "BusinessCityForCompanyID"="p_BusinessCityForCompanyID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 �   DROP FUNCTION location."fn_updateBusinessCityForCompanyLastEditOn"("p_BusinessCityForCompanyID" bigint, "p_LastEditOn" timestamp without time zone);
       location          postgres    false    17            �           1255    77987 #   fn_updateCityCityCode(bigint, text)    FUNCTION     �  CREATE FUNCTION location."fn_updateCityCityCode"("p_CityID" bigint, "p_CityCode" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "CityCode"="p_CityCode"
	WHERE "CityID"=(SELECT "CityID" FROM location."businessCityForCompany" 
					WHERE "BusinessCityForCompanyID" = "p_CityID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 V   DROP FUNCTION location."fn_updateCityCityCode"("p_CityID" bigint, "p_CityCode" text);
       location          postgres    false    17                       1255    77988 *   fn_updateCityCityDescription(bigint, text)    FUNCTION     �  CREATE FUNCTION location."fn_updateCityCityDescription"("p_CityID" bigint, "p_CityDescription" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "CityDescription"="p_CityDescription" 
	WHERE "CityID"=(SELECT "CityID" FROM location."businessCityForCompany" 
					WHERE "BusinessCityForCompanyID" = "p_CityID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 d   DROP FUNCTION location."fn_updateCityCityDescription"("p_CityID" bigint, "p_CityDescription" text);
       location          postgres    false    17                       1255    77989 #   fn_updateCityCityName(bigint, text)    FUNCTION     �  CREATE FUNCTION location."fn_updateCityCityName"("p_CityID" bigint, "p_CityName" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "CityName"="p_CityName"
	WHERE "CityID"=(SELECT "CityID" FROM location."businessCityForCompany" 
					WHERE "BusinessCityForCompanyID" = "p_CityID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 V   DROP FUNCTION location."fn_updateCityCityName"("p_CityID" bigint, "p_CityName" text);
       location          postgres    false    17                       1255    77990 &   fn_updateCityCountryID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateCityCountryID"("p_CityID" bigint, "p_CountryID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "CountryID"="p_CountryID" 
	WHERE "CityID"=(SELECT "CityID" FROM location."businessCityForCompany" 
					WHERE "BusinessCityForCompanyID" = "p_CityID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 Z   DROP FUNCTION location."fn_updateCityCountryID"("p_CityID" bigint, "p_CountryID" bigint);
       location          postgres    false    17            �           1255    77991 (   fn_updateCityDeviceType(bigint, integer)    FUNCTION     H  CREATE FUNCTION location."fn_updateCityDeviceType"("p_CityID" bigint, "p_DeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "DeviceType"="p_DeviceType" WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ]   DROP FUNCTION location."fn_updateCityDeviceType"("p_CityID" bigint, "p_DeviceType" integer);
       location          postgres    false    17            �           1255    77992 &   fn_updateCityIsActive(bigint, boolean)    FUNCTION     @  CREATE FUNCTION location."fn_updateCityIsActive"("p_CityID" bigint, "p_IsActive" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "IsActive"="p_IsActive" WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 Y   DROP FUNCTION location."fn_updateCityIsActive"("p_CityID" bigint, "p_IsActive" boolean);
       location          postgres    false    17            �           1255    77993 '   fn_updateCityLastEditBy(bigint, bigint)    FUNCTION     G  CREATE FUNCTION location."fn_updateCityLastEditBy"("p_CityID" bigint, "p_LastEditBy" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "LastEditBy"="p_LastEditBy" WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 \   DROP FUNCTION location."fn_updateCityLastEditBy"("p_CityID" bigint, "p_LastEditBy" bigint);
       location          postgres    false    17            �           1255    77994 0   fn_updateCityLastEditDeviceType(bigint, integer)    FUNCTION     h  CREATE FUNCTION location."fn_updateCityLastEditDeviceType"("p_CityID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "LastEditDeviceType"="p_LastEditDeviceType" WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 m   DROP FUNCTION location."fn_updateCityLastEditDeviceType"("p_CityID" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    77995 <   fn_updateCityLastEditOn(bigint, timestamp without time zone)    FUNCTION     \  CREATE FUNCTION location."fn_updateCityLastEditOn"("p_CityID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "LastEditOn"="p_LastEditOn" WHERE "CityID"="p_CityID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 q   DROP FUNCTION location."fn_updateCityLastEditOn"("p_CityID" bigint, "p_LastEditOn" timestamp without time zone);
       location          postgres    false    17                       1255    77996 $   fn_updateCityStateID(bigint, bigint)    FUNCTION     �  CREATE FUNCTION location."fn_updateCityStateID"("p_CityID" bigint, "p_StateID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.cityinfo SET "StateID"="p_StateID" 
	WHERE "CityID"=(SELECT "CityID" FROM location."businessCityForCompany" 
					WHERE "BusinessCityForCompanyID" = "p_CityID");
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 V   DROP FUNCTION location."fn_updateCityStateID"("p_CityID" bigint, "p_StateID" bigint);
       location          postgres    false    17            �           1255    77997 )   fn_updateCountryCountryCode(bigint, text)    FUNCTION     F  CREATE FUNCTION location."fn_updateCountryCountryCode"("p_CountryID" bigint, "p_CountryCode" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "CountryCode"="p_CountryCode" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 b   DROP FUNCTION location."fn_updateCountryCountryCode"("p_CountryID" bigint, "p_CountryCode" text);
       location          postgres    false    17            �           1255    77998 0   fn_updateCountryCountryDescription(bigint, text)    FUNCTION     b  CREATE FUNCTION location."fn_updateCountryCountryDescription"("p_CountryID" bigint, "p_CountryDescription" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "CountryDescription"="p_CountryDescription" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 p   DROP FUNCTION location."fn_updateCountryCountryDescription"("p_CountryID" bigint, "p_CountryDescription" text);
       location          postgres    false    17            �           1255    77999 )   fn_updateCountryCountryName(bigint, text)    FUNCTION     F  CREATE FUNCTION location."fn_updateCountryCountryName"("p_CountryID" bigint, "p_CountryName" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "CountryName"="p_CountryName" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 b   DROP FUNCTION location."fn_updateCountryCountryName"("p_CountryID" bigint, "p_CountryName" text);
       location          postgres    false    17            �           1255    78000 +   fn_updateCountryDeviceType(bigint, integer)    FUNCTION     E  CREATE FUNCTION location."fn_updateCountryDeviceType"("p_CountryID" bigint, "p_DeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "DeviceType"="p_DeviceType" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 c   DROP FUNCTION location."fn_updateCountryDeviceType"("p_CountryID" bigint, "p_DeviceType" integer);
       location          postgres    false    17            �           1255    78001 )   fn_updateCountryIsActive(bigint, boolean)    FUNCTION     =  CREATE FUNCTION location."fn_updateCountryIsActive"("p_CountryID" bigint, "p_IsActive" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "IsActive"="p_IsActive" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 _   DROP FUNCTION location."fn_updateCountryIsActive"("p_CountryID" bigint, "p_IsActive" boolean);
       location          postgres    false    17            �           1255    78002 *   fn_updateCountryLastEditBy(bigint, bigint)    FUNCTION     D  CREATE FUNCTION location."fn_updateCountryLastEditBy"("p_CountryID" bigint, "p_LastEditBy" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "LastEditBy"="p_LastEditBy" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 b   DROP FUNCTION location."fn_updateCountryLastEditBy"("p_CountryID" bigint, "p_LastEditBy" bigint);
       location          postgres    false    17            �           1255    78003 3   fn_updateCountryLastEditDeviceType(bigint, integer)    FUNCTION     e  CREATE FUNCTION location."fn_updateCountryLastEditDeviceType"("p_CountryID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "LastEditDeviceType"="p_LastEditDeviceType" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 s   DROP FUNCTION location."fn_updateCountryLastEditDeviceType"("p_CountryID" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    78004 ?   fn_updateCountryLastEditOn(bigint, timestamp without time zone)    FUNCTION     Y  CREATE FUNCTION location."fn_updateCountryLastEditOn"("p_CountryID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE location.countryinfo SET "LastEditOn"="p_LastEditOn" WHERE "CountryID"="p_CountryID";
	RETURN true;
	
	EXCEPTION WHEN OTHERS THEN
	RETURN false;
	ROLLBACK;
END
$$;
 w   DROP FUNCTION location."fn_updateCountryLastEditOn"("p_CountryID" bigint, "p_LastEditOn" timestamp without time zone);
       location          postgres    false    17            �           1255    78005 '   fn_updateStateCountryID(bigint, bigint)    FUNCTION     H  CREATE FUNCTION location."fn_updateStateCountryID"("p_StateID" bigint, "p_CountryID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "CountryID"="p_CountryID" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 \   DROP FUNCTION location."fn_updateStateCountryID"("p_StateID" bigint, "p_CountryID" bigint);
       location          postgres    false    17            �           1255    78006 )   fn_updateStateDeviceType(bigint, integer)    FUNCTION     M  CREATE FUNCTION location."fn_updateStateDeviceType"("p_StateID" bigint, "p_DeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "DeviceType"="p_DeviceType" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 _   DROP FUNCTION location."fn_updateStateDeviceType"("p_StateID" bigint, "p_DeviceType" integer);
       location          postgres    false    17            �           1255    78007 '   fn_updateStateIsActive(bigint, boolean)    FUNCTION     E  CREATE FUNCTION location."fn_updateStateIsActive"("p_StateID" bigint, "p_IsActive" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "IsActive"="p_IsActive" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 [   DROP FUNCTION location."fn_updateStateIsActive"("p_StateID" bigint, "p_IsActive" boolean);
       location          postgres    false    17            �           1255    78008 (   fn_updateStateLastEditBy(bigint, bigint)    FUNCTION     L  CREATE FUNCTION location."fn_updateStateLastEditBy"("p_StateID" bigint, "p_LastEditBy" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "LastEditBy"="p_LastEditBy" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 ^   DROP FUNCTION location."fn_updateStateLastEditBy"("p_StateID" bigint, "p_LastEditBy" bigint);
       location          postgres    false    17            �           1255    78009 1   fn_updateStateLastEditDeviceType(bigint, integer)    FUNCTION     m  CREATE FUNCTION location."fn_updateStateLastEditDeviceType"("p_StateID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "LastEditDeviceType"="p_LastEditDeviceType" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 o   DROP FUNCTION location."fn_updateStateLastEditDeviceType"("p_StateID" bigint, "p_LastEditDeviceType" integer);
       location          postgres    false    17            �           1255    78010 =   fn_updateStateLastEditOn(bigint, timestamp without time zone)    FUNCTION     a  CREATE FUNCTION location."fn_updateStateLastEditOn"("p_StateID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "LastEditOn"="p_LastEditOn" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 s   DROP FUNCTION location."fn_updateStateLastEditOn"("p_StateID" bigint, "p_LastEditOn" timestamp without time zone);
       location          postgres    false    17            �           1255    78011 %   fn_updateStateStateCode(bigint, text)    FUNCTION     F  CREATE FUNCTION location."fn_updateStateStateCode"("p_StateID" bigint, "p_StateCode" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "StateCode"="p_StateCode" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 Z   DROP FUNCTION location."fn_updateStateStateCode"("p_StateID" bigint, "p_StateCode" text);
       location          postgres    false    17            �           1255    78012 ,   fn_updateStateStateDescription(bigint, text)    FUNCTION     b  CREATE FUNCTION location."fn_updateStateStateDescription"("p_StateID" bigint, "p_StateDescription" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "StateDescription"="p_StateDescription" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 h   DROP FUNCTION location."fn_updateStateStateDescription"("p_StateID" bigint, "p_StateDescription" text);
       location          postgres    false    17            �           1255    78013 %   fn_updateStateStateName(bigint, text)    FUNCTION     F  CREATE FUNCTION location."fn_updateStateStateName"("p_StateID" bigint, "p_StateName" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE location.stateinfo SET "StateName"="p_StateName" WHERE "StateID"="p_StateID";
    RETURN true;
    
    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 Z   DROP FUNCTION location."fn_updateStateStateName"("p_StateID" bigint, "p_StateName" text);
       location          postgres    false    17            �           1255    78673 L   fn_insertNotification(bigint, text, text, text, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION notification."fn_insertNotification"("p_CompanyExecutiveID" bigint, "p_CompanyExecutiveName" text, "p_NotificationSubject" text, "p_NotificationDescription" text, "p_NotificationTime" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO notification."Notification"(
	"CompanyExecutiveID", 
	"CompanyExecutiveName", 
	"NotificationSubject", 
	"NotificationDescription", 
	"NotificationTime"
)
VALUES (
	"p_CompanyExecutiveID",
	"p_CompanyExecutiveName",
	"p_NotificationSubject",
	"p_NotificationDescription",
	"p_NotificationTime"
);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;

$$;
 �   DROP FUNCTION notification."fn_insertNotification"("p_CompanyExecutiveID" bigint, "p_CompanyExecutiveName" text, "p_NotificationSubject" text, "p_NotificationDescription" text, "p_NotificationTime" timestamp without time zone);
       notification          postgres    false    8            �           1255    78674    fn_revokeMarkForDelete(bigint)    FUNCTION     I  CREATE FUNCTION notification."fn_revokeMarkForDelete"("p_NotificationID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	UPDATE notification."Notification"
	SET "MarkForDelete"=false
	WHERE "NotificationID"="p_NotificationID";
	RETURN true;

    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 P   DROP FUNCTION notification."fn_revokeMarkForDelete"("p_NotificationID" bigint);
       notification          postgres    false    8            �           1255    78675    fn_selectNotifications(bigint)    FUNCTION     ;  CREATE FUNCTION notification."fn_selectNotifications"("p_CompanyExecutiveID" bigint) RETURNS TABLE("CompanyExecutiveID" bigint, "CompanyExecutiveName" text, "NotificationSubject" text, "NotificationDescription" text, "ReadIndex" boolean, "NotificationTime" timestamp without time zone, "NotificationID" bigint)
    LANGUAGE sql
    AS $$
SELECT  "CompanyExecutiveID", 
		"CompanyExecutiveName", 
		"NotificationSubject", 
		"NotificationDescription", 
		"ReadIndex", 
		"NotificationTime", 
		"NotificationID"
FROM notification."Notification"
	JOIN public."CRMAccessList"
	ON public."CRMAccessList"."CorrespondingId"=notification."Notification"."CompanyExecutiveID"
WHERE public."CRMAccessList"."MarkForDelete"=FALSE	
AND notification."Notification"."MarkForDelete"=false
AND "CompanyExecutiveID" = "p_CompanyExecutiveID";
$$;
 T   DROP FUNCTION notification."fn_selectNotifications"("p_CompanyExecutiveID" bigint);
       notification          postgres    false    8            �           1255    78676 %   fn_updateJustArrived(bigint, boolean)    FUNCTION     h  CREATE FUNCTION notification."fn_updateJustArrived"("p_NotificationID" bigint, "p_JustArrived" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	UPDATE notification."Notification"
	SET "JustArrived"="p_JustArrived"
	WHERE "NotificationID"="p_NotificationID";
	RETURN true;

    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 g   DROP FUNCTION notification."fn_updateJustArrived"("p_NotificationID" bigint, "p_JustArrived" boolean);
       notification          postgres    false    8            �           1255    78677    fn_updateMarkForDelete(bigint)    FUNCTION     I  CREATE FUNCTION notification."fn_updateMarkForDelete"("p_NotificationID" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	UPDATE notification."Notification"
	SET "MarkForDelete"= true
	WHERE "NotificationID"="p_NotificationID";
	RETURN true;

    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 P   DROP FUNCTION notification."fn_updateMarkForDelete"("p_NotificationID" bigint);
       notification          postgres    false    8            �           1255    78678 #   fn_updateReadIndex(bigint, boolean)    FUNCTION     `  CREATE FUNCTION notification."fn_updateReadIndex"("p_NotificationID" bigint, "p_ReadIndex" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	UPDATE notification."Notification"
	SET "ReadIndex"="p_ReadIndex"
	WHERE "NotificationID"="p_NotificationID";
	RETURN true;

    EXCEPTION WHEN OTHERS THEN
    RETURN false;
    ROLLBACK;
END
$$;
 c   DROP FUNCTION notification."fn_updateReadIndex"("p_NotificationID" bigint, "p_ReadIndex" boolean);
       notification          postgres    false    8                       1255    59564 !   fn_checkOwnerDeleteStatus(bigint)    FUNCTION     �   CREATE FUNCTION owner."fn_checkOwnerDeleteStatus"("OwnerIdIn" bigint) RETURNS bigint
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyId") FROM company."Company" WHERE "OwnerContactId"="OwnerIdIn"
$$;
 E   DROP FUNCTION owner."fn_checkOwnerDeleteStatus"("OwnerIdIn" bigint);
       owner          postgres    false    10                       1255    59556    fn_deleteOwnerContact(bigint)    FUNCTION     i  CREATE FUNCTION owner."fn_deleteOwnerContact"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "owner"."OwnerContact" SET "MarkForDelete" = true WHERE "id" = "idIn";
UPDATE "public"."CRMAccessList" SET "MarkForDelete" = TRUE WHERE "CorrespondingId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 <   DROP FUNCTION owner."fn_deleteOwnerContact"("idIn" bigint);
       owner          postgres    false    10            �           1255    59546 V   fn_insertOwnerContact(text, text, text, text, text, text, timestamp without time zone)    FUNCTION     !  CREATE FUNCTION owner."fn_insertOwnerContact"("ownerNameIn" text, "ownerContactIn" text, "ownerEmailIn" text, "SecretKeyIn" text, "UserNameIn" text, "PasswordIn" text, "CreatedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
WITH "OwnerIdSelect" AS(
	INSERT INTO "owner"."OwnerContact" 
	(
		"ownerName",
		"ownerContact",
		"ownerEmail",
		"SecretKey",
		"UserName",
		"Password",
		"LastEditOn",
		"CreatedOn"
	)
VALUES
	(
			"ownerNameIn",
			"ownerContactIn",
			"ownerEmailIn",
			"SecretKeyIn",
			"UserNameIn",
			"PasswordIn",
			"CreatedOnIn",
			"CreatedOnIn"
	)RETURNING "id"
)
	INSERT INTO "public"."CRMAccessList" 
	(
		"CorrespondingId",
		"CorrespondingName",
		"CorrespondingEmailId",
		"CorrespondingPosition",
		"CorrespondingContactNumber",
		"CorrespondingPassword",
		"OwnerFlag"
	)
VALUES
	(
			(SELECT id FROM "OwnerIdSelect"),
			"ownerNameIn",
			"ownerEmailIn",
			0,
			"ownerContactIn",
			"PasswordIn",
			true
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION owner."fn_insertOwnerContact"("ownerNameIn" text, "ownerContactIn" text, "ownerEmailIn" text, "SecretKeyIn" text, "UserNameIn" text, "PasswordIn" text, "CreatedOnIn" timestamp without time zone);
       owner          postgres    false    10            �           1255    120449     fn_loginOwnerContact(text, text)    FUNCTION     X  CREATE FUNCTION owner."fn_loginOwnerContact"("UserNameIn" text, "SecretKeyIn" text) RETURNS TABLE("OwnerId" bigint)
    LANGUAGE sql
    AS $$
SELECT
		id
FROM "owner"."OwnerContact"
WHERE "owner"."OwnerContact"."ownerEmail"="UserNameIn"
AND "owner"."OwnerContact"."SecretKey"="SecretKeyIn"
AND "owner"."OwnerContact"."MarkForDelete"=false
$$;
 S   DROP FUNCTION owner."fn_loginOwnerContact"("UserNameIn" text, "SecretKeyIn" text);
       owner          postgres    false    10                       1255    120500 "   fn_selectOwnerAssestsCount(bigint)    FUNCTION     �  CREATE FUNCTION owner."fn_selectOwnerAssestsCount"("OwnerIdIn" bigint) RETURNS TABLE("NumberOfClients" bigint, "NumberOfCompanies" bigint, "NumberOfBranches" bigint, "NumberOfProducts" bigint, "NumberOfTickets" bigint, "NumberOfExecutives" bigint)
    LANGUAGE sql
    AS $$
SELECT  
	(
		SELECT
			COUNT(client."Client"."ClientId")
		FROM
			owner."OwnerContact"
		JOIN company."Company"
			ON company."Company"."OwnerContactId"=owner."OwnerContact"."id"
	JOIN client."Client"
			ON client."Client"."CompanyId"=company."Company"."CompanyId"
		WHERE company."Company"."MarkForDelete"=FALSE
		AND client."Client"."MarkForDelete"=FALSE
	)AS "ClientCount",
	(
	SELECT 
		COUNT(company."Company"."CompanyId")
	FROM
		owner."OwnerContact"
	JOIN company."Company"
		ON company."Company"."OwnerContactId"=owner."OwnerContact"."id"
	WHERE company."Company"."MarkForDelete"=FALSE
	)AS "CompanyCount",
	(
	SELECT
		COUNT(company."CompanyBranch"."CompanyBranchID")
	FROM
		owner."OwnerContact"
	JOIN company."Company"
		ON company."Company"."OwnerContactId"=owner."OwnerContact"."id"
	JOIN company."CompanyBranch"
	    ON company."CompanyBranch"."CompanyID"=company."Company"."CompanyId"
	WHERE company."Company"."MarkForDelete"=FALSE
	AND company."CompanyBranch"."MarkForDelete"=FALSE
	)AS "CompanyBranchCount",
	(
	SELECT
		COUNT(product."Product"."id")
    FROM
		owner."OwnerContact"
	JOIN company."Company"
		ON company."Company"."OwnerContactId"=owner."OwnerContact"."id"
    JOIN product."Product"
	    ON product."Product"."companyId"=company."Company"."CompanyId"
    WHERE company."Company"."MarkForDelete"=FALSE
    AND product."Product"."MarkForDelete"=FALSE
	)AS "ProductCount",
    (
        SELECT 
            COUNT(ticket."MainTicket"."TicketId")
        FROM
		    owner."OwnerContact"
	    JOIN company."Company"
		    ON company."Company"."OwnerContactId"=owner."OwnerContact"."id"
        JOIN ticket."TicketMetaData"
	        ON ticket."TicketMetaData"."CompanyId"=company."Company"."CompanyId"
        JOIN ticket."MainTicket"
	        ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
        WHERE company."Company"."MarkForDelete"=FALSE
        AND ticket."MainTicket"."MarkForDelete"=FALSE
    )AS "TicketCount",
    (
        SELECT
            COUNT(company."CompanyExecutive"."CompanyExecutiveID")
        FROM
		    owner."OwnerContact"
	    JOIN company."Company"
		    ON company."Company"."OwnerContactId"=owner."OwnerContact"."id"
        JOIN company."CompanyBranch"
	    	ON company."CompanyBranch"."CompanyID"=company."Company"."CompanyId"
		JOIN company."CompanyExecutive"
	        ON company."CompanyExecutive"."CompanyBranchID"=company."CompanyBranch"."CompanyBranchID"
        WHERE company."Company"."MarkForDelete"=FALSE
		AND company."CompanyBranch"."MarkForDelete"=FALSE
        AND company."CompanyExecutive"."MarkForDelete"=FALSE
    )AS "CompanyExecutiveCount"
FROM
	owner."OwnerContact"
WHERE owner."OwnerContact"."id"="OwnerIdIn"
AND owner."OwnerContact"."MarkForDelete"=FALSE
$$;
 F   DROP FUNCTION owner."fn_selectOwnerAssestsCount"("OwnerIdIn" bigint);
       owner          postgres    false    10                       1255    59560 &   fn_selectOwnerContactByOwnerId(bigint)    FUNCTION     E  CREATE FUNCTION owner."fn_selectOwnerContactByOwnerId"("OwnerId" bigint) RETURNS TABLE(id bigint, "ownerName" text, "ownerContact" text, "ownerEmail" text, "UserName" text, "Password" text, "LastEditOn" timestamp without time zone, "CreatedOn" timestamp without time zone, "isActive" boolean)
    LANGUAGE sql
    AS $$
SELECT
		"id",
		"ownerName",
		"ownerContact",
		"ownerEmail",
		"UserName",
		"Password",
		"LastEditOn",
		"CreatedOn",
		"isActive"
FROM "owner"."OwnerContact"
WHERE "owner"."OwnerContact"."id"="OwnerId"
AND "owner"."OwnerContact"."MarkForDelete"=false
$$;
 H   DROP FUNCTION owner."fn_selectOwnerContactByOwnerId"("OwnerId" bigint);
       owner          postgres    false    10                       1255    59561 (   fn_selectOwnerContactCredentials(bigint)    FUNCTION     `  CREATE FUNCTION owner."fn_selectOwnerContactCredentials"("OwnerId" bigint) RETURNS TABLE("ownerContact" text, "ownerEmail" text, "UserName" text)
    LANGUAGE sql
    AS $$
SELECT
		"ownerContact",
		"ownerEmail",
		"UserName"
FROM "owner"."OwnerContact"
WHERE "owner"."OwnerContact"."id"="OwnerId"
AND "owner"."OwnerContact"."MarkForDelete"=false
$$;
 J   DROP FUNCTION owner."fn_selectOwnerContactCredentials"("OwnerId" bigint);
       owner          postgres    false    10                        1255    120499    fn_selectTopExecutives(bigint)    FUNCTION     �  CREATE FUNCTION owner."fn_selectTopExecutives"("OwnerIdIn" bigint) RETURNS TABLE("ExecutiveName" text, "ExecutivePLRate" integer)
    LANGUAGE sql
    AS $$
SELECT 
	(
	SELECT company."CompanyExecutive"."ExecutiveName" 
	FROM company."CompanyExecutive" 
	WHERE company."CompanyExecutive"."CompanyExecutiveID"="ExecutiveFilter"."executiveId"
	AND company."CompanyExecutive"."MarkForDelete"=FALSE
	),
	"ExecutiveFilter"."PLRate"
FROM (
SELECT
	DISTINCT ON(company."CompanyExecutivePL"."executiveId")company."CompanyExecutivePL"."executiveId",
	company."CompanyExecutivePL"."PLRate"
FROM 
	company."CompanyExecutivePL"
JOIN company."CompanyExecutive" 
		ON company."CompanyExecutive"."CompanyExecutiveID"=company."CompanyExecutivePL"."executiveId"
	JOIN company."Company"
		ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
JOIN owner."OwnerContact"
	ON owner."OwnerContact"."id"=company."Company"."OwnerContactId"
WHERE owner."OwnerContact"."id"="OwnerIdIn"
AND owner."OwnerContact"."MarkForDelete"=FALSE
AND company."Company"."MarkForDelete"=FALSE
ORDER BY company."CompanyExecutivePL"."executiveId" , "dateOfEntry" DESC) AS "ExecutiveFilter"
ORDER BY "ExecutiveFilter"."PLRate" DESC
LIMIT 3;
$$;
 B   DROP FUNCTION owner."fn_selectTopExecutives"("OwnerIdIn" bigint);
       owner          postgres    false    10                       1255    59554 D   fn_updateOwnerContactLastEditOn(bigint, timestamp without time zone)    FUNCTION     I  CREATE FUNCTION owner."fn_updateOwnerContactLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "owner"."OwnerContact" SET "LastEditOn" = "LastEditOnIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 r   DROP FUNCTION owner."fn_updateOwnerContactLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       owner          postgres    false    10            �           1255    59553 +   fn_updateOwnerContactPassword(bigint, text)    FUNCTION     �  CREATE FUNCTION owner."fn_updateOwnerContactPassword"("idIn" bigint, "PasswordIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE "owner"."OwnerContact" SET "Password" = "PasswordIn" WHERE "id" = "idIn";
UPDATE public."CRMAccessList" SET "CorrespondingPassword"="PasswordIn" WHERE "CorrespondingId"="idIn"; 
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 W   DROP FUNCTION owner."fn_updateOwnerContactPassword"("idIn" bigint, "PasswordIn" text);
       owner          postgres    false    10                        1255    59551 ,   fn_updateOwnerContactSecretKey(bigint, text)    FUNCTION     .  CREATE FUNCTION owner."fn_updateOwnerContactSecretKey"("idIn" bigint, "SecretKeyIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "owner"."OwnerContact" SET "SecretKey" = "SecretKeyIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Y   DROP FUNCTION owner."fn_updateOwnerContactSecretKey"("idIn" bigint, "SecretKeyIn" text);
       owner          postgres    false    10            �           1255    59552 +   fn_updateOwnerContactUserName(bigint, text)    FUNCTION     �  CREATE FUNCTION owner."fn_updateOwnerContactUserName"("idIn" bigint, "UserNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE "owner"."OwnerContact" SET "UserName" = "UserNameIn" WHERE "id" = "idIn";

UPDATE public."CRMAccessList" SET "CorrespondingName"="UserNameIn" WHERE "CorrespondingId"="idIn";
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 W   DROP FUNCTION owner."fn_updateOwnerContactUserName"("idIn" bigint, "UserNameIn" text);
       owner          postgres    false    10                       1255    59555 .   fn_updateOwnerContactisActive(bigint, boolean)    FUNCTION     -  CREATE FUNCTION owner."fn_updateOwnerContactisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "owner"."OwnerContact" SET "isActive" = "isActiveIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION owner."fn_updateOwnerContactisActive"("idIn" bigint, "isActiveIn" boolean);
       owner          postgres    false    10            �           1255    59549 /   fn_updateOwnerContactownerContact(bigint, text)    FUNCTION     �  CREATE FUNCTION owner."fn_updateOwnerContactownerContact"("idIn" bigint, "ownerContactIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE "owner"."OwnerContact" SET "ownerContact" = "ownerContactIn" WHERE "id" = "idIn";

UPDATE public."CRMAccessList" SET "CorrespondingContactNumber"="ownerContactIn" WHERE "CorrespondingId"="idIn";
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 _   DROP FUNCTION owner."fn_updateOwnerContactownerContact"("idIn" bigint, "ownerContactIn" text);
       owner          postgres    false    10            �           1255    59550 -   fn_updateOwnerContactownerEmail(bigint, text)    FUNCTION     �  CREATE FUNCTION owner."fn_updateOwnerContactownerEmail"("idIn" bigint, "ownerEmailIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE "owner"."OwnerContact" SET "ownerEmail" = "ownerEmailIn" WHERE "id" = "idIn";

UPDATE public."CRMAccessList" SET "CorrespondingEmailId"="ownerEmailIn" WHERE "CorrespondingId"="idIn";
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 [   DROP FUNCTION owner."fn_updateOwnerContactownerEmail"("idIn" bigint, "ownerEmailIn" text);
       owner          postgres    false    10            �           1255    59548 ,   fn_updateOwnerContactownerName(bigint, text)    FUNCTION     .  CREATE FUNCTION owner."fn_updateOwnerContactownerName"("idIn" bigint, "ownerNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "owner"."OwnerContact" SET "ownerName" = "ownerNameIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Y   DROP FUNCTION owner."fn_updateOwnerContactownerName"("idIn" bigint, "ownerNameIn" text);
       owner          postgres    false    10            ?           1255    67490 $   fn_checkPositionDeleteStatus(bigint)    FUNCTION     �   CREATE FUNCTION "position"."fn_checkPositionDeleteStatus"("PositionIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyExecutiveID") 
FROM company."CompanyExecutive" 
WHERE "LastEditDeviceType"="PositionIdIn";
$$;
 P   DROP FUNCTION "position"."fn_checkPositionDeleteStatus"("PositionIdIn" bigint);
       position          postgres    false    12                       1255    67435    fn_deletePositions(bigint)    FUNCTION       CREATE FUNCTION "position"."fn_deletePositions"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "MarkForDelete" = true WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 >   DROP FUNCTION "position"."fn_deletePositions"("idIn" bigint);
       position          postgres    false    12            �           1255    78443 Y   fn_insertCompanyExecutiveMasterList(text, text, text, text, text, text, text, text, text)    FUNCTION       CREATE FUNCTION "position"."fn_insertCompanyExecutiveMasterList"("CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text) RETURNS TABLE("idForAccess" bigint)
    LANGUAGE sql
    AS $$ 
WITH "CompanyExecutiveMaster" AS(
	INSERT INTO "position"."CompanyExecutiveMasterList" 
	(
		"Company",
		"CompanyBranch",
		"CompanyExecutive",
		"Client",
		"Product",
		"Location",
		"Enquiry",
		"Ticket",
		"Position"
	)
VALUES
	(
			"CompanyIn",
			"CompanyBranchIn",
			"CompanyExecutiveIn",
			"ClientIn",
			"ProductIn",
			"LocationIn",
			"EnquiryIn",
			"TicketIn",
			"PositionIn"
	)RETURNING id AS "idForAccess"
)
SELECT "idForAccess" FROM "CompanyExecutiveMaster"; 
$$;
 �   DROP FUNCTION "position"."fn_insertCompanyExecutiveMasterList"("CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text);
       position          postgres    false    12            �           1255    78445 �   fn_insertPositions(text, integer, bigint, bigint, timestamp without time zone, text, text, text, text, text, text, text, text, text)    FUNCTION     -  CREATE FUNCTION "position"."fn_insertPositions"("PositionNameIn" text, "PositionPriorityIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN

WITH "CompanyExecutiveMasterAccess" AS(
    INSERT INTO "position"."CompanyExecutiveMasterList" 
	(
		"Company",
		"CompanyBranch",
		"CompanyExecutive",
		"Client",
		"Product",
		"Location",
		"Enquiry",
		"Ticket",
		"Position"
	)
VALUES
	(
			"CompanyIn",
			"CompanyBranchIn",
			"CompanyExecutiveIn",
			"ClientIn",
			"ProductIn",
			"LocationIn",
			"EnquiryIn",
			"TicketIn",
			"PositionIn"
	)RETURNING id AS "idForAccess"
)
	INSERT INTO "position"."Positions" 
	(
		"PositionName",
		"PositionPriority",
		"CompanyId",
		"ExecutiveMasterId",
		"LastEditBy",
		"LastEditOn",
		"CreatedBy",
		"CreatedOn"
	)
VALUES
	(
			"PositionNameIn",
			"PositionPriorityIn",
			"CompanyIdIn",
			(SELECT "idForAccess" FROM "CompanyExecutiveMasterAccess"),
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END; 
$$;
 l  DROP FUNCTION "position"."fn_insertPositions"("PositionNameIn" text, "PositionPriorityIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text);
       position          postgres    false    12            �           1255    78446    fn_selectPositions(bigint)    FUNCTION     �  CREATE FUNCTION "position"."fn_selectPositions"("OwnerIdIn" bigint) RETURNS TABLE(id bigint, "PositionName" text, "PositionPriority" integer, "CompanyId" bigint, "CompanyName" text, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean, "Company" text, "CompanyBranch" text, "CompanyExecutive" text, "Client" text, "Product" text, "Location" text, "Enquiry" text, "Ticket" text, "Position" text)
    LANGUAGE sql
    AS $$SELECT
		"position"."Positions"."id",
		"position"."Positions"."PositionName",
		"position"."Positions"."PositionPriority",
		"position"."Positions"."CompanyId",
		"company"."Company"."CompanyName",
		"position"."Positions"."LastEditBy",
		"position"."Positions"."LastEditOn",
		"position"."Positions"."CreatedBy",
		"position"."Positions"."CreatedOn",
		"position"."Positions"."isActive",
		"position"."CompanyExecutiveMasterList"."Company",
		"position"."CompanyExecutiveMasterList"."CompanyBranch",
		"position"."CompanyExecutiveMasterList"."CompanyExecutive",
		"position"."CompanyExecutiveMasterList"."Client",
		"position"."CompanyExecutiveMasterList"."Product",
		"position"."CompanyExecutiveMasterList"."Location",
		"position"."CompanyExecutiveMasterList"."Enquiry",
		"position"."CompanyExecutiveMasterList"."Ticket",
		"position"."CompanyExecutiveMasterList"."Position"

FROM "position"."Positions"
	JOIN "position"."CompanyExecutiveMasterList" ON "position"."CompanyExecutiveMasterList"."id"="position"."Positions"."ExecutiveMasterId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="position"."Positions"."CompanyId"
WHERE "company"."Company"."OwnerContactId"="OwnerIdIn"
AND "position"."Positions"."MarkForDelete"=FALSE
$$;
 C   DROP FUNCTION "position"."fn_selectPositions"("OwnerIdIn" bigint);
       position          postgres    false    12                       1255    78447 &   fn_selectPositionsByPositionId(bigint)    FUNCTION     �  CREATE FUNCTION "position"."fn_selectPositionsByPositionId"("PositionId" bigint) RETURNS TABLE(id bigint, "PositionName" text, "PositionPriority" integer, "CompanyId" bigint, "CompanyName" text, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean, "Company" text, "CompanyBranch" text, "CompanyExecutive" text, "Client" text, "Product" text, "Location" text, "Enquiry" text, "Ticket" text, "Position" text)
    LANGUAGE sql
    AS $$SELECT
		"position"."Positions"."id",
		"position"."Positions"."PositionName",
		"position"."Positions"."PositionPriority",
		"position"."Positions"."CompanyId",
		"company"."Company"."CompanyName",
		"position"."Positions"."LastEditBy",
		"position"."Positions"."LastEditOn",
		"position"."Positions"."CreatedBy",
		"position"."Positions"."CreatedOn",
		"position"."Positions"."isActive",
		"position"."CompanyExecutiveMasterList"."Company",
		"position"."CompanyExecutiveMasterList"."CompanyBranch",
		"position"."CompanyExecutiveMasterList"."CompanyExecutive",
		"position"."CompanyExecutiveMasterList"."Client",
		"position"."CompanyExecutiveMasterList"."Product",
		"position"."CompanyExecutiveMasterList"."Location",
		"position"."CompanyExecutiveMasterList"."Enquiry",
		"position"."CompanyExecutiveMasterList"."Ticket",
		"position"."CompanyExecutiveMasterList"."Position"

FROM "position"."Positions"
	JOIN "position"."CompanyExecutiveMasterList" ON "position"."CompanyExecutiveMasterList"."id"="position"."Positions"."ExecutiveMasterId"
	JOIN "company"."Company" ON "company"."Company"."CompanyId"="position"."Positions"."CompanyId"
WHERE "position"."Positions"."id"="PositionId"
AND "position"."Positions"."MarkForDelete"=FALSE
$$;
 P   DROP FUNCTION "position"."fn_selectPositionsByPositionId"("PositionId" bigint);
       position          postgres    false    12                       1255    67430 +   fn_updatePositionsCompanyId(bigint, bigint)    FUNCTION     2  CREATE FUNCTION "position"."fn_updatePositionsCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "CompanyId" = "CompanyIdIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ]   DROP FUNCTION "position"."fn_updatePositionsCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       position          postgres    false    12            A           1255    67479 3   fn_updatePositionsExecutiveMasterId(bigint, bigint)    FUNCTION     R  CREATE FUNCTION "position"."fn_updatePositionsExecutiveMasterId"("idIn" bigint, "ExecutiveMasterIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "ExecutiveMasterId" = "ExecutiveMasterIdIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 m   DROP FUNCTION "position"."fn_updatePositionsExecutiveMasterId"("idIn" bigint, "ExecutiveMasterIdIn" bigint);
       position          postgres    false    12                       1255    67432 ,   fn_updatePositionsLastEditBy(bigint, bigint)    FUNCTION     6  CREATE FUNCTION "position"."fn_updatePositionsLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "LastEditBy" = "LastEditByIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 _   DROP FUNCTION "position"."fn_updatePositionsLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       position          postgres    false    12                       1255    67433 A   fn_updatePositionsLastEditOn(bigint, timestamp without time zone)    FUNCTION     K  CREATE FUNCTION "position"."fn_updatePositionsLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "LastEditOn" = "LastEditOnIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 t   DROP FUNCTION "position"."fn_updatePositionsLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       position          postgres    false    12                       1255    67428 ,   fn_updatePositionsPositionName(bigint, text)    FUNCTION     <  CREATE FUNCTION "position"."fn_updatePositionsPositionName"("idIn" bigint, "PositionNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "PositionName" = "PositionNameIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 a   DROP FUNCTION "position"."fn_updatePositionsPositionName"("idIn" bigint, "PositionNameIn" text);
       position          postgres    false    12                       1255    67429 3   fn_updatePositionsPositionPriority(bigint, integer)    FUNCTION     O  CREATE FUNCTION "position"."fn_updatePositionsPositionPriority"("idIn" bigint, "PositionPriorityIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "PositionPriority" = "PositionPriorityIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 l   DROP FUNCTION "position"."fn_updatePositionsPositionPriority"("idIn" bigint, "PositionPriorityIn" integer);
       position          postgres    false    12                       1255    67434 +   fn_updatePositionsisActive(bigint, boolean)    FUNCTION     /  CREATE FUNCTION "position"."fn_updatePositionsisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "position"."Positions" SET "isActive" = "isActiveIn" WHERE "id" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION "position"."fn_updatePositionsisActive"("idIn" bigint, "isActiveIn" boolean);
       position          postgres    false    12            4           1255    67762    fn_selectPriority()    FUNCTION     �   CREATE FUNCTION priority."fn_selectPriority"() RETURNS TABLE("PriorityId" bigint, "PriorityName" text, "PriorityPosition" smallint)
    LANGUAGE sql
    AS $$
SELECT
		"PriorityId",
		"PriorityName",
		"PriorityPosition"
FROM "priority"."Priority"

$$;
 .   DROP FUNCTION priority."fn_selectPriority"();
       priority          postgres    false    6            �           1255    59440    fn_deleteProduct(bigint)    FUNCTION       CREATE FUNCTION product."fn_deleteProduct"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "MarkForDelete" = true WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 9   DROP FUNCTION product."fn_deleteProduct"("idIn" bigint);
       product          postgres    false    22            �           1255    59426 [   fn_insertProduct(text, text, bigint, double precision, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION product."fn_insertProduct"("productNameIn" text, "productDescriptionIn" text, "companyIdIn" bigint, "costIn" double precision, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "product"."Product" 
	(
		"productName",
		"productDescription",
		"companyId",
		"cost",
		"LastEditBy",
		"LastEditOn",
		"CreatedBy",
		"CreatedOn"
	)
VALUES
	(
			"productNameIn",
			"productDescriptionIn",
			"companyIdIn",
			"costIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	);
	
RETURN true;
EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION product."fn_insertProduct"("productNameIn" text, "productDescriptionIn" text, "companyIdIn" bigint, "costIn" double precision, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone);
       product          postgres    false    22            �           1255    59431    fn_selectProduct()    FUNCTION     v  CREATE FUNCTION product."fn_selectProduct"() RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
    LANGUAGE sql
    AS $$
SELECT
		product."Product"."id",
		product."Product"."productName",
		product."Product"."productDescription",
		product."Product"."companyId",
		company."Company"."CompanyName",
		product."Product"."cost",
		product."Product"."LastEditBy",
		product."Product"."LastEditOn",
		product."Product"."CreatedBy",
		product."Product"."CreatedOn",
		product."Product"."isActive"
FROM "product"."Product"
	JOIN company."Company" ON product."Product"."companyId"=company."Company"."CompanyId"
WHERE "product"."Product"."MarkForDelete"=false
$$;
 ,   DROP FUNCTION product."fn_selectProduct"();
       product          postgres    false    22            �           1255    59449 #   fn_selectProductByCompanyId(bigint)    FUNCTION     �  CREATE FUNCTION product."fn_selectProductByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
    LANGUAGE sql
    AS $$
SELECT
		product."Product"."id",
		product."Product"."productName",
		product."Product"."productDescription",
		product."Product"."companyId",
		company."Company"."CompanyName",
		product."Product"."cost",
		product."Product"."LastEditBy",
		product."Product"."LastEditOn",
		product."Product"."CreatedBy",
		product."Product"."CreatedOn",
		product."Product"."isActive"
FROM "product"."Product"
	JOIN company."Company" ON product."Product"."companyId"=company."Company"."CompanyId"
WHERE "product"."Product"."companyId"="CompanyIdIn"
AND "product"."Product"."MarkForDelete"=false
$$;
 K   DROP FUNCTION product."fn_selectProductByCompanyId"("CompanyIdIn" bigint);
       product          postgres    false    22            �           1255    75838 !   fn_selectProductByOwnerId(bigint)    FUNCTION     �  CREATE FUNCTION product."fn_selectProductByOwnerId"("OwnerIdIn" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
    LANGUAGE sql
    AS $$
SELECT
		product."Product"."id",
		product."Product"."productName",
		product."Product"."productDescription",
		product."Product"."companyId",
		company."Company"."CompanyName",
		product."Product"."cost",
		product."Product"."LastEditBy",
		product."Product"."LastEditOn",
		product."Product"."CreatedBy",
		product."Product"."CreatedOn",
		product."Product"."isActive"
FROM "product"."Product"
	JOIN company."Company" ON product."Product"."companyId"=company."Company"."CompanyId"
WHERE company."Company"."OwnerContactId"="OwnerIdIn"
AND "product"."Product"."MarkForDelete"=false
$$;
 G   DROP FUNCTION product."fn_selectProductByOwnerId"("OwnerIdIn" bigint);
       product          postgres    false    22            �           1255    59450 #   fn_selectProductByProductId(bigint)    FUNCTION     �  CREATE FUNCTION product."fn_selectProductByProductId"("ProductId" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
    LANGUAGE sql
    AS $$
SELECT
		product."Product"."id",
		product."Product"."productName",
		product."Product"."productDescription",
		product."Product"."companyId",
		company."Company"."CompanyName",
		product."Product"."cost",
		product."Product"."LastEditBy",
		product."Product"."LastEditOn",
		product."Product"."CreatedBy",
		product."Product"."CreatedOn",
		product."Product"."isActive"
FROM "product"."Product"
	JOIN company."Company" ON product."Product"."companyId"=company."Company"."CompanyId"
WHERE "product"."Product"."id"="ProductId"
AND "product"."Product"."MarkForDelete"=false
$$;
 I   DROP FUNCTION product."fn_selectProductByProductId"("ProductId" bigint);
       product          postgres    false    22            �           1255    59437 *   fn_updateProductLastEditBy(bigint, bigint)    FUNCTION     -  CREATE FUNCTION product."fn_updateProductLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "LastEditBy" = "LastEditByIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION product."fn_updateProductLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       product          postgres    false    22            �           1255    59438 ?   fn_updateProductLastEditOn(bigint, timestamp without time zone)    FUNCTION     B  CREATE FUNCTION product."fn_updateProductLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "LastEditOn" = "LastEditOnIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 o   DROP FUNCTION product."fn_updateProductLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       product          postgres    false    22            �           1255    59435 )   fn_updateProductcompanyId(bigint, bigint)    FUNCTION     )  CREATE FUNCTION product."fn_updateProductcompanyId"("idIn" bigint, "companyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "companyId" = "companyIdIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 X   DROP FUNCTION product."fn_updateProductcompanyId"("idIn" bigint, "companyIdIn" bigint);
       product          postgres    false    22            �           1255    59436 .   fn_updateProductcost(bigint, double precision)    FUNCTION       CREATE FUNCTION product."fn_updateProductcost"("idIn" bigint, "costIn" double precision) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "cost" = "costIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 X   DROP FUNCTION product."fn_updateProductcost"("idIn" bigint, "costIn" double precision);
       product          postgres    false    22            �           1255    59439 )   fn_updateProductisActive(bigint, boolean)    FUNCTION     &  CREATE FUNCTION product."fn_updateProductisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "isActive" = "isActiveIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 W   DROP FUNCTION product."fn_updateProductisActive"("idIn" bigint, "isActiveIn" boolean);
       product          postgres    false    22            �           1255    59434 0   fn_updateProductproductDescription(bigint, text)    FUNCTION     K  CREATE FUNCTION product."fn_updateProductproductDescription"("idIn" bigint, "productDescriptionIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "productDescription" = "productDescriptionIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 h   DROP FUNCTION product."fn_updateProductproductDescription"("idIn" bigint, "productDescriptionIn" text);
       product          postgres    false    22            �           1255    59433 )   fn_updateProductproductName(bigint, text)    FUNCTION     /  CREATE FUNCTION product."fn_updateProductproductName"("idIn" bigint, "productNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "productName" = "productNameIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 Z   DROP FUNCTION product."fn_updateProductproductName"("idIn" bigint, "productNameIn" text);
       product          postgres    false    22            �           1255    78374 "   fn_checkExecutiveOwnerFlag(bigint)    FUNCTION     �   CREATE FUNCTION public."fn_checkExecutiveOwnerFlag"("idIn" bigint) RETURNS bigint
    LANGUAGE sql
    AS $$ 
SELECT COUNT("CRMAccessListId") FROM public."CRMAccessList"	WHERE "CorrespondingId"="idIn" AND "OwnerFlag"=true AND "MarkForDelete"=false;
$$;
 B   DROP FUNCTION public."fn_checkExecutiveOwnerFlag"("idIn" bigint);
       public          postgres    false            �           1255    119988    fn_loadUserByEmailId(text)    FUNCTION     �  CREATE FUNCTION public."fn_loadUserByEmailId"("EmailIdIn" text) RETURNS TABLE("CorrespondingName" text, "CorrespondingEmailId" text, "CorrespondingPassword" text, "CorrespondingContactNumber" text, "CorrespondingPosition" integer, "OwnerFlag" boolean)
    LANGUAGE sql
    AS $$

SELECT
	public."CRMAccessList"."CorrespondingName",
	public."CRMAccessList"."CorrespondingEmailId",
	public."CRMAccessList"."CorrespondingPassword",
	public."CRMAccessList"."CorrespondingContactNumber",
	public."CRMAccessList"."CorrespondingPosition",
	public."CRMAccessList"."OwnerFlag"
FROM public."CRMAccessList"
WHERE "CorrespondingEmailId"="EmailIdIn"
AND "MarkForDelete"=FALSE

$$;
 ?   DROP FUNCTION public."fn_loadUserByEmailId"("EmailIdIn" text);
       public          postgres    false            �           1255    78661    AreaNStatus(bigint)    FUNCTION     �  CREATE FUNCTION report."AreaNStatus"("p_CompanyID" bigint) RETURNS TABLE("AreaName" text, "TotalTickets" bigint, "Prospects" bigint, "CallBack" bigint, "DemoPending" bigint, "Quotation" bigint, "PaymentPending" bigint, "Closure" bigint, "Dead" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
BEGIN

	FOR rec IN 
	(
		SELECT 
			ar."BusinessAreaForCompanyID" AS "AreaID", 
			arin."AreaName"
		FROM 
			location."businessAreaForCompany" AS ar 		
		INNER JOIN
			location.areainfo AS arin
		ON 
			ar."AreaID" = arin."AreaID"
		WHERE
			ar."CompanyID"="p_CompanyID"
		ORDER BY ar."AreaID"					
	)
	LOOP
		"AreaName" := rec."AreaName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
		);	
		"Prospects" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=1
		);
		"CallBack" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=2
		);
		"DemoPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=4
		);
		"Quotation" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=7
		);
		"PaymentPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=8
		);
		"Closure" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=3
		);
		"Dead" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticsta."StatusId"=9
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		(SELECT COUNT("TicketId") FROM ticket."MainTicket"),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=1),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=2),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=4),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=7),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=8),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=3),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=9);
	RETURN;
END;
$$;
 :   DROP FUNCTION report."AreaNStatus"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78662    AreaPriorityReport(bigint)    FUNCTION     �  CREATE FUNCTION report."AreaPriorityReport"("p_CompanyID" bigint) RETURNS TABLE("AreaName" text, "TotalTickets" bigint, "Immediate" bigint, "High" bigint, "Normal" bigint, "Low" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
BEGIN

	FOR rec IN 
	(
		SELECT 
			ar."BusinessAreaForCompanyID" AS "AreaID", 
			arin."AreaName"
		FROM 
			location."businessAreaForCompany" AS ar 		
		INNER JOIN
			location.areainfo AS arin
		ON 
			ar."AreaID" = arin."AreaID"
		WHERE
			ar."CompanyID"="p_CompanyID"
		ORDER BY ar."AreaID"					
	)
	LOOP
		"AreaName" := rec."AreaName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic			
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
		);	
		"Immediate" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticmeta."TicketPriority"=4
		);
		"High" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticmeta."TicketPriority"=3
		);
		"Normal" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticmeta."TicketPriority"=2
		);		
		"Low" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticmeta."TicketPriority"=1
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId" <> 3 AND "StatusId" <> 9),
		
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=4 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		 
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=3 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		 
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=2 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=1 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9);
	RETURN;
END;
$$;
 A   DROP FUNCTION report."AreaPriorityReport"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78663    AreaTimeReport(bigint)    FUNCTION       CREATE FUNCTION report."AreaTimeReport"("p_CompanyID" bigint) RETURNS TABLE("AreaName" text, "TotalTickets" bigint, "Today" bigint, "Tomorrow" bigint, "NextWeek" bigint, "NextMonth" bigint, "NextQuarter" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
	timee timestamp without time zone;
BEGIN
	timee = CURRENT_TIMESTAMP;
	FOR rec IN 
	(
		SELECT 
			ar."BusinessAreaForCompanyID" AS "AreaID", 
			arin."AreaName"
		FROM 
			location."businessAreaForCompany" AS ar		
		INNER JOIN
			location.areainfo AS arin
		ON 
			ar."AreaID" = arin."AreaID"
		WHERE
			ar."CompanyID"="p_CompanyID"
		ORDER BY ar."AreaID"					
	)
	LOOP
		"AreaName" := rec."AreaName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic			
			INNER JOIN
				ticket."TicketDateAndTimelines" AS ticdat
			ON
				tic."TicketId" = ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND
				ticdat."DeadlineDateAndTime" > timee
			AND
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
		);	
		"Today" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
				AND CURRENT_DATE + interval '1 day'			
		);
		"Tomorrow" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN CURRENT_DATE + interval '1 day' 
				AND CURRENT_DATE + interval '2 day'		
		);		
		"NextWeek" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee
				AND CURRENT_DATE + interval '7 day'		
		);
		"NextMonth" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND timee + interval '1 month'
		);		
		"NextQuarter" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."AreaId"=rec."AreaID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND CURRENT_TIMESTAMP + interval '3 month'
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		
		(SELECT COUNT(ts."TicketId") FROM ticket."TicketStatus" AS ts
		 INNER JOIN ticket."TicketDateAndTimelines" AS ticdat 
		 ON ts."TicketId" = ticdat."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND ticdat."DeadlineDateAndTime" > timee),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId" 
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '1 day'),
			
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '2 day'),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId" 
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '7 day'),					
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '1 month'),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '3 month');
	RETURN;
END;
$$;
 =   DROP FUNCTION report."AreaTimeReport"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78664    CityNStatus(bigint)    FUNCTION     �  CREATE FUNCTION report."CityNStatus"("p_CompanyID" bigint) RETURNS TABLE("CityName" text, "TotalTickets" bigint, "Prospects" bigint, "CallBack" bigint, "DemoPending" bigint, "Quotation" bigint, "PaymentPending" bigint, "Closure" bigint, "Dead" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
BEGIN

	FOR rec IN 
	(
		SELECT 
			ct."BusinessCityForCompanyID" AS "CityID", 
			ctin."CityName"
		FROM 
			location."businessCityForCompany" AS ct 		
		INNER JOIN
			location.cityinfo AS ctin
		ON 
			ct."CityID" = ctin."CityID"
		WHERE
			ct."CompanyID"="p_CompanyID"
		ORDER BY ct."CityID"					
	)
	LOOP
		"CityName" := rec."CityName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
		);	
		"Prospects" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=1
		);
		"CallBack" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=2
		);
		"DemoPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=4
		);
		"Quotation" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=7
		);
		"PaymentPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=8
		);
		"Closure" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=3
		);
		"Dead" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticsta."StatusId"=9
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		(SELECT COUNT("TicketId") FROM ticket."MainTicket"),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=1),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=2),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=4),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=7),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=8),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=3),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=9);
	RETURN;
END;
$$;
 :   DROP FUNCTION report."CityNStatus"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78665    CityPriorityReport(bigint)    FUNCTION     �  CREATE FUNCTION report."CityPriorityReport"("p_CompanyID" bigint) RETURNS TABLE("CityName" text, "TotalTickets" bigint, "Immediate" bigint, "High" bigint, "Normal" bigint, "Low" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
BEGIN

	FOR rec IN 
	(
		SELECT 
			ct."BusinessCityForCompanyID" AS "CityID", 
			ctin."CityName"
		FROM 
			location."businessCityForCompany" AS ct 		
		INNER JOIN
			location.cityinfo AS ctin
		ON 
			ct."CityID" = ctin."CityID"
		WHERE
			ct."CompanyID"="p_CompanyID"
		ORDER BY ct."CityID"					
	)
	LOOP
		"CityName" := rec."CityName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
		);	
		"Immediate" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticmeta."TicketPriority"=4
		);
		"High" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticmeta."TicketPriority"=3
		);
		"Normal" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticmeta."TicketPriority"=2
		);		
		"Low" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticmeta."TicketPriority"=1
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId" <> 3 AND "StatusId" <> 9),
		
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=4 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		 
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=3 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		 
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=2 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=1 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9);
	RETURN;
END;
$$;
 A   DROP FUNCTION report."CityPriorityReport"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78666    CityTimeReport(bigint)    FUNCTION       CREATE FUNCTION report."CityTimeReport"("p_CompanyID" bigint) RETURNS TABLE("CityName" text, "TotalTickets" bigint, "Today" bigint, "Tomorrow" bigint, "NextWeek" bigint, "NextMonth" bigint, "NextQuarter" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
	timee timestamp without time zone;
BEGIN
	timee = CURRENT_TIMESTAMP;
	FOR rec IN 
	(
		SELECT 
			ct."BusinessCityForCompanyID" AS "CityID", 
			ctin."CityName"
		FROM 
			location."businessCityForCompany" AS ct 		
		INNER JOIN
			location.cityinfo AS ctin
		ON 
			ct."CityID" = ctin."CityID"
		WHERE
			ct."CompanyID"="p_CompanyID"
		ORDER BY ct."CityID"					
	)
	LOOP
		"CityName" := rec."CityName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			INNER JOIN
				ticket."TicketDateAndTimelines" AS ticdat
			ON
				tic."TicketId" = ticdat."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND
				ticdat."DeadlineDateAndTime" > timee
			AND
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
		);	
		"Today" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
				AND CURRENT_DATE + interval '1 day'			
		);
		"Tomorrow" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN CURRENT_DATE + interval '1 day' 
				AND CURRENT_DATE + interval '2 day'		
		);		
		"NextWeek" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee
				AND CURRENT_DATE + interval '7 day'		
		);
		"NextMonth" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND timee + interval '1 month'
		);		
		"NextQuarter" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."CityId"=rec."CityID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND CURRENT_TIMESTAMP + interval '3 month'
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		
		(SELECT COUNT(ts."TicketId") FROM ticket."TicketStatus" AS ts
		 INNER JOIN ticket."TicketDateAndTimelines" AS ticdat 
		 ON ts."TicketId" = ticdat."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND ticdat."DeadlineDateAndTime" > timee),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId" 
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '1 day'),
			
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '2 day'),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId" 
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '7 day'),					
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '1 month'),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '3 month');
	RETURN;
END;
$$;
 =   DROP FUNCTION report."CityTimeReport"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78667    ExecutiveReport(bigint)    FUNCTION     �  CREATE FUNCTION report."ExecutiveReport"("p_CompanyID" bigint) RETURNS TABLE("CompanyExecutiveName" text, "TotalTickets" bigint, "TicketCompleted" bigint, "TicketDelayed" bigint, "TicketPending" bigint, "PLRate" integer)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
BEGIN
	FOR rec IN 
	(
		SELECT 
			com."CompanyExecutiveID" AS "ExecutiveID", 
			com."ExecutiveName"
		FROM 
			company."CompanyExecutive" AS com 		
		WHERE
			com."CompanyID"="p_CompanyID"
		ORDER BY com."CompanyExecutiveID"					
	)
	LOOP
		"CompanyExecutiveName" := rec."ExecutiveName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."TicketAccessList" AS tic
			WHERE 
				tic."CompanyExecutiveId" = rec."ExecutiveID"
		);	
		"TicketCompleted" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."TicketAccessList" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ticstat
			ON 
				tic."TicketId" = ticstat."TicketId"				
			WHERE 
				tic."CompanyExecutiveId" = rec."ExecutiveID"
			AND
				ticstat."StatusId"=3 
		);
		"TicketDelayed" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."TicketAccessList" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ticstat
			ON 
				tic."TicketId" = ticstat."TicketId"	
			INNER JOIN
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId" = ticdat."TicketId"	
			WHERE 
				tic."CompanyExecutiveId" = rec."ExecutiveID"
			AND
				ticstat."StatusId"<>3
			AND
				CURRENT_TIMESTAMP > ticdat."DeadlineDateAndTime" 
		);		
		"TicketPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."TicketAccessList" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ticstat
			ON 
				tic."TicketId" = ticstat."TicketId"	
			INNER JOIN
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId" = ticdat."TicketId"	
			WHERE 
				tic."CompanyExecutiveId" = rec."ExecutiveID" 	
			AND
				ticstat."StatusId"<>3
			AND
				CURRENT_TIMESTAMP < ticdat."DeadlineDateAndTime" 	
		);	
		"PLRate" :=
		(
			SELECT 
				com."PLRate"		
			FROM 
				company."CompanyExecutivePL" AS com
			WHERE 
				"executiveId" = rec."ExecutiveID" 
			ORDER BY 
				com."dateOfEntry" DESC
			LIMIT 
				1
		);
		RETURN NEXT;
	END LOOP;	
	RETURN;
END;
$$;
 >   DROP FUNCTION report."ExecutiveReport"("p_CompanyID" bigint);
       report          postgres    false    16            �           1255    78668    ProductReport()    FUNCTION     Q  CREATE FUNCTION report."ProductReport"() RETURNS TABLE("ProductName" text, "TotalTickets" bigint, "NumOfClient" bigint, "Closure" bigint, "TotalRevenue" double precision)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
	sid BIGINT=0;
BEGIN

	FOR rec IN 
	(
		SELECT 
			pro."id", 
			pro."productName" AS "ProductName"
		FROM 
			product."Product" AS pro 		
		ORDER BY pro."id"					
	)
	LOOP
		"ProductName" := rec."ProductName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(ticmeta."TicketId")		
			FROM 
				ticket."TicketMetaData" AS ticmeta
			WHERE 
				ticmeta."ProductId"=rec."id"		
		);	
		"NumOfClient" :=
		(			
			SELECT 
				COUNT(DISTINCT enq."ClientId")
			FROM 
				enquiry."EnquiryProductList" AS enqpro			
			INNER JOIN 
				enquiry."EnquiryClient" AS enq
			ON 
				enqpro."EnquiryId" = enq."EnquiryId"
			WHERE 
				enqpro."ProductId" = rec."id"						
		);
		"Closure" :=
		(
			SELECT 
				COUNT(ticmeta."TicketId")		
			FROM 
				ticket."TicketMetaData" AS ticmeta
			INNER JOIN
				ticket."TicketStatus" AS tic
			ON 
				ticmeta."TicketId" = tic."TicketId"
			WHERE 
				ticmeta."ProductId" = rec."id" 
			AND tic."StatusId"=3
		);
		"TotalRevenue" := "Closure" * 
		(
			SELECT 
				pro."cost"	
			FROM 
				product."Product" AS pro
			WHERE
				pro."id" = rec."id"			
		);		
		RETURN NEXT;
	END LOOP;	
	RETURN;
END;
$$;
 (   DROP FUNCTION report."ProductReport"();
       report          postgres    false    16            �           1255    78669    StateNStatusReport()    FUNCTION       CREATE FUNCTION report."StateNStatusReport"() RETURNS TABLE("StateName" text, "TotalTickets" bigint, "Prospects" bigint, "CallBack" bigint, "DemoPending" bigint, "Quotation" bigint, "PaymentPending" bigint, "Closure" bigint, "Dead" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
	sid BIGINT=0;
BEGIN

	FOR rec IN 
	(
		SELECT 
			st."StateID", 
			st."StateName"
		FROM 
			location.stateinfo AS st 		
		ORDER BY st."StateID"					
	)
	LOOP
		"StateName" := rec."StateName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
		);	
		"Prospects" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=1
		);
		"CallBack" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=2
		);
		"DemoPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=4
		);
		"Quotation" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=7
		);
		"PaymentPending" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=8
		);
		"Closure" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=3
		);
		"Dead" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketStatus" AS ticsta
			ON 
				tic."TicketId"=ticsta."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticsta."StatusId"=9
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		(SELECT COUNT("TicketId") FROM ticket."MainTicket"),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=1),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=2),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=4),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=7),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=8),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=3),
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId"=9);
	RETURN;
END;
$$;
 -   DROP FUNCTION report."StateNStatusReport"();
       report          postgres    false    16            �           1255    78670    StatePriorityReport()    FUNCTION     :  CREATE FUNCTION report."StatePriorityReport"() RETURNS TABLE("StateName" text, "TotalTickets" bigint, "Immediate" bigint, "High" bigint, "Normal" bigint, "Low" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
	sid BIGINT=0;
BEGIN

	FOR rec IN 
	(
		SELECT 
			st."StateID", 
			st."StateName"
		FROM 
			location.stateinfo AS st 		
		ORDER BY st."StateID"					
	)
	LOOP
		"StateName" := rec."StateName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
		);	
		"Immediate" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticmeta."TicketPriority"=4
		);
		"High" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticmeta."TicketPriority"=3
		);
		"Normal" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticmeta."TicketPriority"=2
		);
		"Low" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketMetaData" AS ticmeta
			ON 
				tic."TicketId"=ticmeta."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 
				ts."StatusId" <> 3
			AND
				ts."StatusId" <> 9
			AND  
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticmeta."TicketPriority"=1
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		
		(SELECT COUNT("TicketId") FROM ticket."TicketStatus" WHERE "StatusId" <> 3 AND "StatusId" <> 9),
		
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=4 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		 
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=3 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		 
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=2 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9),
		
		(SELECT COUNT(ticmeta."TicketId") FROM ticket."TicketMetaData" AS ticmeta
		 INNER JOIN ticket."TicketStatus" AS ts ON ticmeta."TicketId" = ts."TicketId"
		 WHERE ticmeta."TicketPriority"=1 AND ts."StatusId" <> 3 AND ts."StatusId" <> 9);
	RETURN;
END;
$$;
 .   DROP FUNCTION report."StatePriorityReport"();
       report          postgres    false    16            �           1255    78671    StateTimeReport()    FUNCTION     w  CREATE FUNCTION report."StateTimeReport"() RETURNS TABLE("StateName" text, "TotalTickets" bigint, "Today" bigint, "Tomorrow" bigint, "NextWeek" bigint, "NextMonth" bigint, "NextQuarter" bigint)
    LANGUAGE plpgsql STRICT
    AS $$

DECLARE
    rec RECORD;
	timee timestamp without time zone;
BEGIN
	timee = CURRENT_TIMESTAMP;
	FOR rec IN 
	(
		SELECT 
			st."StateID", 
			st."StateName"
		FROM 
			location."stateinfo" AS st		
		ORDER BY st."StateID"					
	)
	LOOP
		"StateName" := rec."StateName";
		"TotalTickets" := 
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			INNER JOIN
				ticket."TicketDateAndTimelines" AS ticdat
			ON
				tic."TicketId" = ticdat."TicketId"
			WHERE 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND
				ticdat."DeadlineDateAndTime" > timee
			AND
				ts."StatusId" <> 3
			AND 
				ts."StatusId" <> 9
		);	
		"Today" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 			
				ts."StatusId" <> 3
			AND 
				ts."StatusId" <> 9
			AND
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND CURRENT_DATE + interval '1 day'			
		);
		"Tomorrow" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 			
				ts."StatusId" <> 3
			AND 
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN CURRENT_DATE + interval '1 day' 
				AND CURRENT_DATE + interval '2 day'		
		);		
		"NextWeek" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 			
				ts."StatusId" <> 3
			AND 
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee
				AND CURRENT_DATE + interval '7 day'		
		);
		"NextMonth" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 			
				ts."StatusId" <> 3
			AND 
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND timee + interval '1 month'
		);		
		"NextQuarter" :=
		(
			SELECT 
				COUNT(tic."TicketId")		
			FROM 
				ticket."MainTicket" AS tic
			INNER JOIN 
				ticket."TicketDateAndTimelines" AS ticdat
			ON 
				tic."TicketId"=ticdat."TicketId"
			INNER JOIN
				ticket."TicketStatus" AS ts
			ON
				tic."TicketId" = ts."TicketId"
			WHERE 			
				ts."StatusId" <> 3
			AND 
				ts."StatusId" <> 9
			AND 
				tic."EnquiryId" IN 
				(
					SELECT enq."EnquiryId"
					FROM enquiry."EnquiryLocation" AS enq
					WHERE enq."StateId"=rec."StateID"
				)
			AND ticdat."DeadlineDateAndTime" BETWEEN timee 
			AND timee + interval '3 month'
		);
		RETURN NEXT;
	END LOOP;
	RETURN QUERY 
	SELECT 
		'Total',
		
		(SELECT COUNT(ts."TicketId") FROM ticket."TicketStatus" AS ts
		 INNER JOIN ticket."TicketDateAndTimelines" AS ticdat 
		 ON ts."TicketId" = ticdat."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND ticdat."DeadlineDateAndTime" > timee),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId" 
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '1 day'),
			
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '2 day'),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId" 
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '7 day'),					
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '1 month'),
		 
		(SELECT COUNT(tic."TicketId") FROM ticket."TicketDateAndTimelines" AS tic 
		 INNER JOIN ticket."TicketStatus" AS ts ON tic."TicketId" = ts."TicketId"
		 WHERE ts."StatusId" <> 3 AND ts."StatusId" <> 9 AND 
		 tic."DeadlineDateAndTime" BETWEEN CURRENT_TIMESTAMP AND CURRENT_DATE + interval '3 month');
	RETURN;
END;
$$;
 *   DROP FUNCTION report."StateTimeReport"();
       report          postgres    false    16            [           1255    67697    fn_deleteStatus(bigint)    FUNCTION       CREATE FUNCTION status."fn_deleteStatus"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "MarkForDelete" = true WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 7   DROP FUNCTION status."fn_deleteStatus"("idIn" bigint);
       status          postgres    false    23            �           1255    67690 Q   fn_insertStatus(text, text, integer, bigint, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION status."fn_insertStatus"("StatusNameIn" text, "StatusColorCodeIn" text, "WorkProgressIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "status"."Status" 
	(
		"StatusName",
		"StatusColorCode",
		"WorkProgress",
		"CompanyId",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"StatusNameIn",
			"StatusColorCodeIn",
			"WorkProgressIn",
			"CompanyIdIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION status."fn_insertStatus"("StatusNameIn" text, "StatusColorCodeIn" text, "WorkProgressIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone);
       status          postgres    false    23            Z           1255    67698    fn_selectStatus()    FUNCTION       CREATE FUNCTION status."fn_selectStatus"() RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"StatusId",
		"StatusName",
		"StatusColorCode",
		"WorkProgress",
		"CompanyId",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
FROM "status"."Status"
WHERE "status"."Status"."MarkForDelete"=false
$$;
 *   DROP FUNCTION status."fn_selectStatus"();
       status          postgres    false    23            l           1255    67724 "   fn_selectStatusByCompanyId(bigint)    FUNCTION     �  CREATE FUNCTION status."fn_selectStatusByCompanyId"("companyIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"status"."Status"."StatusId",
		"status"."Status"."StatusName",
		"status"."Status"."StatusColorCode",
		"status"."Status"."WorkProgress",
		"status"."Status"."CompanyId",
		"company"."Company"."CompanyName",
		"status"."Status"."CreatedBy",
		"status"."Status"."CreatedOn",
		"status"."Status"."LastEditBy",
		"status"."Status"."LastEditOn"
FROM "status"."Status"
JOIN "company"."Company" ON "company"."Company"."CompanyId"="status"."Status"."CompanyId"
WHERE "status"."Status"."CompanyId"="companyIdIn"
AND "status"."Status"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=FALSE


$$;
 I   DROP FUNCTION status."fn_selectStatusByCompanyId"("companyIdIn" bigint);
       status          postgres    false    23            �           1255    75837     fn_selectStatusByOwnerId(bigint)    FUNCTION     �  CREATE FUNCTION status."fn_selectStatusByOwnerId"("ownerIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"status"."Status"."StatusId",
		"status"."Status"."StatusName",
		"status"."Status"."StatusColorCode",
		"status"."Status"."WorkProgress",
		"status"."Status"."CompanyId",
		"company"."Company"."CompanyName",
		"status"."Status"."CreatedBy",
		"status"."Status"."CreatedOn",
		"status"."Status"."LastEditBy",
		"status"."Status"."LastEditOn"
FROM "status"."Status"
JOIN "company"."Company" ON "company"."Company"."CompanyId"="status"."Status"."CompanyId"
WHERE "company"."Company"."OwnerContactId"="ownerIdIn"
AND "status"."Status"."MarkForDelete"=false
AND "company"."Company"."MarkForDelete"=FALSE

$$;
 E   DROP FUNCTION status."fn_selectStatusByOwnerId"("ownerIdIn" bigint);
       status          postgres    false    23            �           1255    67694 (   fn_updateStatusCompanyId(bigint, bigint)    FUNCTION     ,  CREATE FUNCTION status."fn_updateStatusCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "CompanyId" = "CompanyIdIn" WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 V   DROP FUNCTION status."fn_updateStatusCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       status          postgres    false    23            �           1255    67695 )   fn_updateStatusLastEditBy(bigint, bigint)    FUNCTION     0  CREATE FUNCTION status."fn_updateStatusLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "LastEditBy" = "LastEditByIn" WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 X   DROP FUNCTION status."fn_updateStatusLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       status          postgres    false    23            �           1255    67696 >   fn_updateStatusLastEditOn(bigint, timestamp without time zone)    FUNCTION     E  CREATE FUNCTION status."fn_updateStatusLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "LastEditOn" = "LastEditOnIn" WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 m   DROP FUNCTION status."fn_updateStatusLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       status          postgres    false    23            �           1255    67692 ,   fn_updateStatusStatusColorCode(bigint, text)    FUNCTION     B  CREATE FUNCTION status."fn_updateStatusStatusColorCode"("idIn" bigint, "StatusColorCodeIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "StatusColorCode" = "StatusColorCodeIn" WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 `   DROP FUNCTION status."fn_updateStatusStatusColorCode"("idIn" bigint, "StatusColorCodeIn" text);
       status          postgres    false    23            c           1255    67691 '   fn_updateStatusStatusName(bigint, text)    FUNCTION     .  CREATE FUNCTION status."fn_updateStatusStatusName"("idIn" bigint, "StatusNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "StatusName" = "StatusNameIn" WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 V   DROP FUNCTION status."fn_updateStatusStatusName"("idIn" bigint, "StatusNameIn" text);
       status          postgres    false    23            �           1255    67693 ,   fn_updateStatusWorkProgress(bigint, integer)    FUNCTION     9  CREATE FUNCTION status."fn_updateStatusWorkProgress"("idIn" bigint, "WorkProgressIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "status"."Status" SET "WorkProgress" = "WorkProgressIn" WHERE "StatusId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ]   DROP FUNCTION status."fn_updateStatusWorkProgress"("idIn" bigint, "WorkProgressIn" integer);
       status          postgres    false    23            �           1255    67947 -   fn_checkExecutiveTicketAccess(bigint, bigint)    FUNCTION     O  CREATE FUNCTION ticket."fn_checkExecutiveTicketAccess"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$SELECT COUNT("TicketAccessListId") FROM ticket."TicketAccessList" 
	JOIN public."CRMAccessList"
		ON public."CRMAccessList"."CorrespondingId"=
			ticket."TicketAccessList"."CompanyExecutiveId"
WHERE ticket."TicketAccessList"."TicketId"="TicketIdIn"
AND ticket."TicketAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND ticket."TicketAccessList"."MarkForDelete"=false
AND public."CRMAccessList"."MarkForDelete"=false
$$;
 j   DROP FUNCTION ticket."fn_checkExecutiveTicketAccess"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       ticket          postgres    false    15            <           1255    67912    fn_deleteMainTicket(bigint)    FUNCTION       CREATE FUNCTION ticket."fn_deleteMainTicket"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."MainTicket" SET "MarkForDelete" = TRUE WHERE "TicketId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ;   DROP FUNCTION ticket."fn_deleteMainTicket"("idIn" bigint);
       ticket          postgres    false    15            :           1255    67904 !   fn_deleteTicketAccessList(bigint)    FUNCTION     &  CREATE FUNCTION ticket."fn_deleteTicketAccessList"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketAccessList" SET "MarkForDelete" = true WHERE "TicketAccessListId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 A   DROP FUNCTION ticket."fn_deleteTicketAccessList"("idIn" bigint);
       ticket          postgres    false    15            ;           1255    67907 $   fn_deleteTicketFollowupDates(bigint)    FUNCTION     /  CREATE FUNCTION ticket."fn_deleteTicketFollowupDates"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketFollowupDates" SET "MarkForDelete" = TRUE WHERE "TicketFollowupDatesId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 D   DROP FUNCTION ticket."fn_deleteTicketFollowupDates"("idIn" bigint);
       ticket          postgres    false    15            e           1255    67952 "   fn_getDeadlineDateOfTicket(bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_getDeadlineDateOfTicket"("TicketIdIn" bigint) RETURNS TABLE("DeadlineDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT "DeadlineDateAndTime" FROM ticket."TicketDateAndTimelines" 
JOIN ticket."MainTicket" ON ticket."TicketDateAndTimelines"."TicketId"=ticket."MainTicket"."TicketId"
WHERE ticket."TicketDateAndTimelines"."TicketId"="TicketIdIn"
AND ticket."MainTicket"."MarkForDelete"=false;
$$;
 H   DROP FUNCTION ticket."fn_getDeadlineDateOfTicket"("TicketIdIn" bigint);
       ticket          postgres    false    15            d           1255    67951    fn_getStartDateOfTicket(bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_getStartDateOfTicket"("TicketIdIn" bigint) RETURNS TABLE("StartDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT "StartDateAndTime" FROM ticket."TicketDateAndTimelines" 
JOIN ticket."MainTicket" ON ticket."TicketDateAndTimelines"."TicketId"=ticket."MainTicket"."TicketId"
WHERE ticket."TicketDateAndTimelines"."TicketId"="TicketIdIn"
AND ticket."MainTicket"."MarkForDelete"=false;
$$;
 E   DROP FUNCTION ticket."fn_getStartDateOfTicket"("TicketIdIn" bigint);
       ticket          postgres    false    15            �           1255    67901 �   fn_insertTicket(bigint, text, text, bigint, timestamp without time zone, timestamp with time zone, timestamp without time zone, bigint, bigint, integer, bigint, bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_insertTicket"("EnquiryIdIn" bigint, "EnquiryRemarksIn" text, "TicketRemarksIn" text, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "StartDateAndTimeIn" timestamp with time zone, "DeadlineDateAndTimeIn" timestamp without time zone, "ProductIdIn" bigint, "TicketTypeIn" bigint, "TicketPriorityIn" integer, "CompanyIdIn" bigint, "StatusIdIn" bigint) RETURNS TABLE("TicketID" bigint)
    LANGUAGE sql
    AS $$WITH "MainTicketRegion" AS
(
INSERT INTO "ticket"."MainTicket" 
	(
		"EnquiryId",
		"EnquiryRemarks",
		"TicketRemarks",
		"CreatedBy",
		"CreatedOn",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"EnquiryIdIn",
			"EnquiryRemarksIn",
			"TicketRemarksIn",
			"CreatedByIn",
			"CreatedOnIn",
			"CreatedByIn",
			"CreatedOnIn"
	)RETURNING "TicketId" AS "TicketID"
),
"SubTicketRegion1" AS
(
INSERT INTO "ticket"."TicketAccessList" 
	(
		"TicketId",
		"CompanyExecutiveId",
		"CompanyExecutiveName",
		"AccessApplicationTime"
	)
VALUES
	(
			(SELECT "TicketID" FROM "MainTicketRegion"),
			"CreatedByIn",
			(SELECT "CorrespondingName" FROM public."CRMAccessList" 
			 WHERE "CorrespondingId"="CreatedByIn"
			 AND public."CRMAccessList"."MarkForDelete"=false 	
			 LIMIT 1),
			"CreatedOnIn"
	)RETURNING "TicketId" AS "TicketID"
),
"SubTicketRegion2" AS
(
INSERT INTO "ticket"."TicketDateAndTimelines" 
	(
		"TicketId",
		"StartDateAndTime",
		"DeadlineDateAndTime"
	)
VALUES
	(
			(SELECT "TicketID" FROM "SubTicketRegion1"),
			"StartDateAndTimeIn",
			"DeadlineDateAndTimeIn"
	)RETURNING "TicketId" AS "TicketID"
),
"SubTicketRegion3" AS
(
INSERT INTO "ticket"."TicketMetaData" 
	(
		"TicketId",
		"ProductId",
		"ProductName",
		"TicketType",
		"TicketTypeName",
		"TicketPriority",
		"TicketPriorityName",
		"CompanyId",
		"CompanyName"
	)
VALUES
	(
			(SELECT "TicketID" FROM "SubTicketRegion2"),
			"ProductIdIn",
			(SELECT "productName" FROM "product"."Product" 
            WHERE "id"="ProductIdIn" 
            AND "MarkForDelete"=false LIMIT 1),
			"TicketTypeIn",
			(SELECT "EnquiryTypeName" FROM "enquiry"."EnquiryType" 
            WHERE "EnquiryTypeId"="TicketTypeIn" 
            AND "MarkForDelete"=false LIMIT 1),
			"TicketPriorityIn",
			(SELECT "PriorityName" FROM "priority"."Priority" 
            WHERE "PriorityId"="TicketPriorityIn" LIMIT 1),
			"CompanyIdIn",
			(SELECT "CompanyName" FROM "company"."Company" 
            WHERE "CompanyId"="CompanyIdIn" 
            AND "MarkForDelete"=false LIMIT 1)
	)RETURNING "TicketId" AS "TicketID"
),
"SubTicketRegion4" AS
(
	INSERT INTO "ticket"."TicketStatus" 
	(
		"TicketId",
		"StatusId",
		"StatusName",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			(SELECT "TicketID" FROM "SubTicketRegion3"),
			"StatusIdIn",
			(SELECT "StatusName" FROM "status"."Status" 
            WHERE "StatusId"="StatusIdIn" 
            AND "MarkForDelete"=false LIMIT 1),
			"CreatedByIn",
			"CreatedOnIn"
	)RETURNING "TicketId" AS "TicketID"
)
SELECT "TicketID" FROM "SubTicketRegion4";
$$;
 �  DROP FUNCTION ticket."fn_insertTicket"("EnquiryIdIn" bigint, "EnquiryRemarksIn" text, "TicketRemarksIn" text, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "StartDateAndTimeIn" timestamp with time zone, "DeadlineDateAndTimeIn" timestamp without time zone, "ProductIdIn" bigint, "TicketTypeIn" bigint, "TicketPriorityIn" integer, "CompanyIdIn" bigint, "StatusIdIn" bigint);
       ticket          postgres    false    15            �           1255    67916 F   fn_insertTicketAccessList(bigint, bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION ticket."fn_insertTicketAccessList"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "ticket"."TicketAccessList" 
	(
		"TicketId",
		"CompanyExecutiveId",
		"CompanyExecutiveName",
		"AccessApplicationTime"
	)
VALUES
	(
			"TicketIdIn",
			"CompanyExecutiveIdIn",
			(SELECT "CorrespondingName" FROM public."CRMAccessList" 
			 WHERE "CorrespondingId"="CompanyExecutiveIdIn"
			 AND public."CRMAccessList"."MarkForDelete"=false 	
			 LIMIT 1),
			"AccessApplicationTimeIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION ticket."fn_insertTicketAccessList"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone);
       ticket          postgres    false    15            5           1255    67902 A   fn_insertTicketFollowupDates(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION ticket."fn_insertTicketFollowupDates"("TicketIdIn" bigint, "FollowupDateAndTimeIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "ticket"."TicketFollowupDates" 
	(
		"TicketId",
		"FollowupDateAndTime"
	)
VALUES
	(
			"TicketIdIn",
			"FollowupDateAndTimeIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
    DROP FUNCTION ticket."fn_insertTicketFollowupDates"("TicketIdIn" bigint, "FollowupDateAndTimeIn" timestamp without time zone);
       ticket          postgres    false    15            6           1255    67903 J   fn_insertTicketStatus(bigint, bigint, bigint, timestamp without time zone)    FUNCTION     U  CREATE FUNCTION ticket."fn_insertTicketStatus"("TicketIdIn" bigint, "StatusIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
	INSERT INTO "ticket"."TicketStatus" 
	(
		"TicketId",
		"StatusId",
		"StatusName",
		"LastEditBy",
		"LastEditOn"
	)
VALUES
	(
			"TicketIdIn",
			"StatusIdIn",
			(SELECT "StatusName" FROM "status"."Status" WHERE "StatusId"="StatusIdIn" AND "MarkForDelete"=false LIMIT 1),
			"CreatedByIn",
			"CreatedOnIn"
	);
RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION ticket."fn_insertTicketStatus"("TicketIdIn" bigint, "StatusIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone);
       ticket          postgres    false    15            �           1255    78696 +   fn_selectCompanyExecutivePLUpdateList(date)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectCompanyExecutivePLUpdateList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CurrentWorkProgress" integer, "ThresholdWorkProgress" integer, "TicketId" bigint)
    LANGUAGE sql
    AS $$
SELECT 
	ticket."TicketAccessList"."CompanyExecutiveId",
	ticket."TicketAccessList"."CompanyExecutiveName",
	(SELECT status."Status"."WorkProgress" FROM ticket."TicketStatus" 
	JOIN status."Status" ON status."Status"."StatusId"=ticket."TicketStatus"."StatusId"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketStatus"."TicketId"
	JOIN enquiry."MainEnquiry" ON enquiry."MainEnquiry"."EnquiryId"=ticket."MainTicket"."EnquiryId"
WHERE status."Status"."MarkForDelete"=FALSE
AND ticket."MainTicket"."MarkForDelete"=FALSE
AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND ticket."TicketStatus"."TicketId"=ticket."TicketAccessList"."TicketId"
AND status."Status"."CompanyId"=company."Company"."CompanyId"
ORDER BY ticket."TicketStatus"."LastEditOn" DESC LIMIT 1),
	(SELECT MAX(status."Status"."WorkProgress") FROM status."Status"
WHERE "CompanyId"=company."Company"."CompanyId"),
ticket."TicketAccessList"."TicketId"

FROM ticket."TicketAccessList"
JOIN ticket."MainTicket"
	ON ticket."MainTicket"."TicketId"=ticket."TicketAccessList"."TicketId"
JOIN ticket."TicketDateAndTimelines"
	ON ticket."TicketDateAndTimelines"."TicketId"=ticket."MainTicket"."TicketId"
JOIN ticket."TicketMetaData"
	ON ticket."TicketMetaData"."TicketId"=ticket."MainTicket"."TicketId"
JOIN enquiry."MainEnquiry"
	ON enquiry."MainEnquiry"."EnquiryId"=ticket."MainTicket"."EnquiryId"
JOIN enquiry."EnquiryClient"
	ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN public."CRMAccessList"
	ON public."CRMAccessList"."CorrespondingId"=ticket."TicketAccessList"."CompanyExecutiveId"
JOIN company."Company"
	ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
AND ticket."TicketAccessList"."MarkForDelete"=FALSE
AND ticket."MainTicket"."MarkForDelete"=FALSE
And enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND public."CRMAccessList"."MarkForDelete"=FALSE
AND company."Company"."MarkForDelete"=FALSE
AND DATE(ticket."TicketDateAndTimelines"."DeadlineDateAndTime")="CurrentDateIn"
$$;
 T   DROP FUNCTION ticket."fn_selectCompanyExecutivePLUpdateList"("CurrentDateIn" date);
       ticket          postgres    false    15                       1255    78532 ?   fn_selectCompanyExecutiveTicketAccessDependency(bigint, bigint)    FUNCTION     c  CREATE FUNCTION ticket."fn_selectCompanyExecutiveTicketAccessDependency"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("TicketAccessList") 
FROM ticket."TicketAccessList"
WHERE "TicketId"="TicketIdIn"
AND "CompanyExecutiveId"="CompanyExecutiveIdIn"
AND	"MarkForDelete"=FALSE
$$;
 |   DROP FUNCTION ticket."fn_selectCompanyExecutiveTicketAccessDependency"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       ticket          postgres    false    15            �           1255    78653 /   fn_selectCurrentDeadlineDateExecutiveList(date)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectCurrentDeadlineDateExecutiveList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ProductName" text, "ClientName" text)
    LANGUAGE sql
    AS $$
SELECT "CompanyExecutiveId",
		"CompanyExecutiveName",
		ticket."TicketMetaData"."ProductName",
		enquiry."EnquiryClient"."ClientName"
FROM ticket."TicketAccessList"
	JOIN ticket."MainTicket"
		ON ticket."MainTicket"."TicketId"=ticket."TicketAccessList"."TicketId"
	JOIN ticket."TicketMetaData"
		ON ticket."TicketMetaData"."TicketId"=ticket."TicketAccessList"."TicketId"
	JOIN enquiry."MainEnquiry"
		ON enquiry."MainEnquiry"."EnquiryId"=ticket."MainTicket"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN public."CRMAccessList"
		ON public."CRMAccessList"."CorrespondingId"=ticket."TicketAccessList"."CompanyExecutiveId"
	JOIN company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE ticket."TicketAccessList"."TicketId" IN(
SELECT "TicketId" 
FROM ticket."TicketDateAndTimelines"
WHERE DATE(ticket."TicketDateAndTimelines"."DeadlineDateAndTime")="CurrentDateIn"
)
AND ticket."TicketAccessList"."MarkForDelete"=FALSE
AND ticket."MainTicket"."MarkForDelete"=FALSE
AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND public."CRMAccessList"."MarkForDelete"=FALSE
AND company."Company"."MarkForDelete"=FALSE;
$$;
 X   DROP FUNCTION ticket."fn_selectCurrentDeadlineDateExecutiveList"("CurrentDateIn" date);
       ticket          postgres    false    15            �           1255    78654 /   fn_selectCurrentFollowupDateExecutiveList(date)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectCurrentFollowupDateExecutiveList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ProductName" text, "ClientName" text)
    LANGUAGE sql
    AS $$
SELECT  "CompanyExecutiveId",
		"CompanyExecutiveName",
		ticket."TicketMetaData"."ProductName",
		enquiry."EnquiryClient"."ClientName"
FROM ticket."TicketAccessList"
	JOIN ticket."MainTicket"
		ON ticket."MainTicket"."TicketId"=ticket."TicketAccessList"."TicketId"
	JOIN ticket."TicketMetaData"
		ON ticket."TicketMetaData"."TicketId"=ticket."TicketAccessList"."TicketId"
	JOIN enquiry."MainEnquiry"
		ON enquiry."MainEnquiry"."EnquiryId"=ticket."MainTicket"."EnquiryId"
	JOIN enquiry."EnquiryClient"
		ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
	JOIN public."CRMAccessList"
		ON public."CRMAccessList"."CorrespondingId"=ticket."TicketAccessList"."CompanyExecutiveId"
	JOIN company."Company"
		ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
WHERE ticket."TicketAccessList"."TicketId" IN(

SELECT "TicketId" 
FROM ticket."TicketFollowupDates"
WHERE DATE(ticket."TicketFollowupDates"."FollowupDateAndTime")="CurrentDateIn"
AND ticket."TicketFollowupDates"."MarkForDelete"=FALSE
)
AND ticket."TicketAccessList"."MarkForDelete"=FALSE
AND ticket."MainTicket"."MarkForDelete"=FALSE
AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND public."CRMAccessList"."MarkForDelete"=FALSE
AND company."Company"."MarkForDelete"=FALSE;
$$;
 X   DROP FUNCTION ticket."fn_selectCurrentFollowupDateExecutiveList"("CurrentDateIn" date);
       ticket          postgres    false    15            �           1255    78658 -   fn_selectDeadlineCrossoverExecutiveList(date)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectDeadlineCrossoverExecutiveList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ProductName" text, "ClientName" text)
    LANGUAGE sql
    AS $$

SELECT	ticket."TicketAccessList"."CompanyExecutiveId",
		ticket."TicketAccessList"."CompanyExecutiveName",
		ticket."TicketMetaData"."ProductName",
		enquiry."EnquiryClient"."ClientName"
FROM ticket."TicketAccessList"
JOIN ticket."MainTicket"
	ON ticket."MainTicket"."TicketId"=ticket."TicketAccessList"."TicketId"
JOIN ticket."TicketDateAndTimelines"
	ON ticket."TicketDateAndTimelines"."TicketId"=ticket."MainTicket"."TicketId"
JOIN ticket."TicketMetaData"
	ON ticket."TicketMetaData"."TicketId"=ticket."MainTicket"."TicketId"
JOIN enquiry."MainEnquiry"
	ON enquiry."MainEnquiry"."EnquiryId"=ticket."MainTicket"."EnquiryId"
JOIN enquiry."EnquiryClient"
	ON enquiry."EnquiryClient"."EnquiryId"=enquiry."MainEnquiry"."EnquiryId"
JOIN public."CRMAccessList"
	ON public."CRMAccessList"."CorrespondingId"=ticket."TicketAccessList"."CompanyExecutiveId"
JOIN company."Company"
	ON company."Company"."CompanyId"=enquiry."MainEnquiry"."CompanyId"
AND ticket."TicketAccessList"."MarkForDelete"=FALSE
AND ticket."MainTicket"."MarkForDelete"=FALSE
And enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND public."CRMAccessList"."MarkForDelete"=FALSE
AND company."Company"."MarkForDelete"=FALSE
AND DATE(ticket."TicketDateAndTimelines"."DeadlineDateAndTime")<"CurrentDateIn"
AND (
(SELECT status."Status"."WorkProgress" FROM ticket."TicketStatus" 
	JOIN status."Status" ON status."Status"."StatusId"=ticket."TicketStatus"."StatusId"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketStatus"."TicketId"
	JOIN enquiry."MainEnquiry" ON enquiry."MainEnquiry"."EnquiryId"=ticket."MainTicket"."EnquiryId"
WHERE status."Status"."MarkForDelete"=FALSE
AND ticket."MainTicket"."MarkForDelete"=FALSE
AND enquiry."MainEnquiry"."MarkForDelete"=FALSE
AND ticket."TicketStatus"."TicketId"=ticket."TicketAccessList"."TicketId"
AND status."Status"."CompanyId"=company."Company"."CompanyId"
ORDER BY ticket."TicketStatus"."LastEditOn" DESC LIMIT 1)<>
(SELECT MAX(status."Status"."WorkProgress") FROM status."Status"
WHERE "CompanyId"=company."Company"."CompanyId")
)
$$;
 V   DROP FUNCTION ticket."fn_selectDeadlineCrossoverExecutiveList"("CurrentDateIn" date);
       ticket          postgres    false    15            m           1255    68219 :   fn_selectMainTicketIdByEnquiryAndProductId(bigint, bigint)    FUNCTION     n  CREATE FUNCTION ticket."fn_selectMainTicketIdByEnquiryAndProductId"("EnquiryIdIn" bigint, "ProductIdIn" bigint) RETURNS TABLE("TicketId" bigint)
    LANGUAGE sql
    AS $$
SELECT ticket."MainTicket"."TicketId" 
FROM ticket."MainTicket" 
	JOIN ticket."TicketMetaData" ON ticket."TicketMetaData"."TicketId"=ticket."MainTicket"."TicketId"
	JOIN product."Product" ON product."Product"."id"=ticket."TicketMetaData"."ProductId"
WHERE ticket."TicketMetaData"."ProductId"="ProductIdIn"
AND ticket."MainTicket"."EnquiryId"="EnquiryIdIn"
AND product."Product"."MarkForDelete"=false
AND ticket."MainTicket"."MarkForDelete"=false
$$;
 o   DROP FUNCTION ticket."fn_selectMainTicketIdByEnquiryAndProductId"("EnquiryIdIn" bigint, "ProductIdIn" bigint);
       ticket          postgres    false    15            �           1255    68218 (   fn_selectMainTicketIdByEnquiryId(bigint)    FUNCTION     $  CREATE FUNCTION ticket."fn_selectMainTicketIdByEnquiryId"("EnquiryIdIn" bigint) RETURNS TABLE("TicketId" bigint)
    LANGUAGE sql
    AS $$
SELECT
		"TicketId"
FROM "ticket"."MainTicket"
WHERE "ticket"."MainTicket"."EnquiryId"="EnquiryIdIn"
AND"ticket"."MainTicket"."MarkForDelete"=false
$$;
 O   DROP FUNCTION ticket."fn_selectMainTicketIdByEnquiryId"("EnquiryIdIn" bigint);
       ticket          postgres    false    15            �           1255    78702 5   fn_selectNonExistingCompanyExecutivesInTicket(bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicket"("TicketIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
    LANGUAGE sql
    AS $$
SELECT 
company."CompanyExecutive"."CompanyExecutiveID",
company."CompanyExecutive"."ExecutiveName",
company."CompanyExecutive"."ContactNumber",
company."CompanyExecutive"."CompanyID"
FROM company."CompanyExecutive"
	JOIN company."Company"
		ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE company."CompanyExecutive"."CompanyExecutiveID" NOT IN
(
	SELECT ticket."TicketAccessList"."CompanyExecutiveId"
	FROM ticket."TicketAccessList"
	JOIN ticket."MainTicket"
		ON ticket."MainTicket"."TicketId"=ticket."TicketAccessList"."TicketId"
	WHERE ticket."TicketAccessList"."TicketId"="TicketIdIn"
	AND ticket."MainTicket"."TicketId"="TicketIdIn"
	AND ticket."MainTicket"."MarkForDelete"=FALSE
	AND ticket."TicketAccessList"."MarkForDelete"=FALSE
)
AND company."CompanyExecutive"."MarkForDelete"=FALSE
AND company."CompanyExecutive"."CompanyID" IN (SELECT "CompanyId" FROM ticket."TicketMetaData" WHERE "TicketId"="TicketIdIn" LIMIT 1)
$$;
 [   DROP FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicket"("TicketIdIn" bigint);
       ticket          postgres    false    15            �           1255    86832 O   fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutive(bigint, bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutive"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
    LANGUAGE sql
    AS $$
SELECT  
company."CompanyExecutive"."CompanyExecutiveID",
company."CompanyExecutive"."ExecutiveName",
company."CompanyExecutive"."ContactNumber",
company."CompanyExecutive"."CompanyID"
FROM company."CompanyExecutive"
	JOIN company."Company"
		ON company."Company"."CompanyId"=company."CompanyExecutive"."CompanyID"
WHERE company."CompanyExecutive"."CompanyExecutiveID" NOT IN
(
	SELECT ticket."TicketAccessList"."CompanyExecutiveId"
	FROM ticket."TicketAccessList"
	JOIN ticket."MainTicket"
		ON ticket."MainTicket"."TicketId"=ticket."TicketAccessList"."TicketId"
	WHERE ticket."TicketAccessList"."TicketId"="TicketIdIn"
	AND ticket."MainTicket"."TicketId"="TicketIdIn"
	AND ticket."MainTicket"."MarkForDelete"=FALSE
	AND ticket."TicketAccessList"."MarkForDelete"=FALSE
)
AND company."CompanyExecutive"."MarkForDelete"=FALSE
AND company."CompanyExecutive"."CompanyID" IN (SELECT "CompanyId" FROM ticket."TicketMetaData" WHERE "TicketId"="TicketIdIn" LIMIT 1)
AND company."CompanyExecutive"."DeviceType" IN(
SELECT company."CompanyExecutive"."DeviceType"
FROM company."CompanyExecutive"
	JOIN position."Positions"
	ON position."Positions"."id"=company."CompanyExecutive"."DeviceType"
AND position."Positions"."PositionPriority" > (
SELECT position."Positions"."PositionPriority"
FROM company."CompanyExecutive"
	JOIN position."Positions"
	ON position."Positions"."id"=company."CompanyExecutive"."DeviceType"
WHERE company."CompanyExecutive"."CompanyExecutiveID"="CompanyExecutiveIdIn"
)
)
$$;
 �   DROP FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutive"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint);
       ticket          postgres    false    15            �           1255    78698 +   fn_selectTicketAccessListByTicketId(bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectTicketAccessListByTicketId"("TicketIdIn" bigint) RETURNS TABLE("TicketAccessListId" bigint, "TicketId" bigint, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "OwnerFlag" boolean, "AccessApplicationTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"ticket"."TicketAccessList"."TicketAccessListId",
		"ticket"."TicketAccessList"."TicketId",
		"ticket"."TicketAccessList"."CompanyExecutiveId",
		"ticket"."TicketAccessList"."CompanyExecutiveName",
		public."CRMAccessList"."OwnerFlag",
		"ticket"."TicketAccessList"."AccessApplicationTime"
FROM "ticket"."TicketAccessList"
	JOIN "ticket"."MainTicket" ON "ticket"."TicketAccessList"."TicketId"="ticket"."MainTicket"."TicketId"
	JOIN public."CRMAccessList" ON public."CRMAccessList"."CorrespondingId"=ticket."TicketAccessList"."CompanyExecutiveId"
	WHERE "ticket"."TicketAccessList"."TicketId"="TicketIdIn"
AND "ticket"."TicketAccessList"."MarkForDelete"=false
$$;
 Q   DROP FUNCTION ticket."fn_selectTicketAccessListByTicketId"("TicketIdIn" bigint);
       ticket          postgres    false    15            �           1255    68278 2   fn_selectTicketDetailsByCompanyExecutiveId(bigint)    FUNCTION     �	  CREATE FUNCTION ticket."fn_selectTicketDetailsByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("TicketId" bigint, "EnquiryId" bigint, "TicketAccessListId" bigint, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "EnquiryRemarks" text, "TicketRemarks" text, "StartDateAndTime" timestamp without time zone, "DeadlineDateAndTime" timestamp without time zone, "ProductId" bigint, "ProductName" text, "TicketType" bigint, "TicketTypeName" text, "TicketPriority" integer, "TicketPriorityName" text, "CompanyId" bigint, "CompanyName" text, "StatusId" bigint, "StatusName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$SELECT
		DISTINCT("ticket"."MainTicket"."TicketId"),
		"ticket"."MainTicket"."EnquiryId",
		"ticket"."TicketAccessList"."TicketAccessListId",
		"ticket"."TicketAccessList"."CompanyExecutiveId",
		"ticket"."TicketAccessList"."CompanyExecutiveName",
		"ticket"."MainTicket"."EnquiryRemarks",
		"ticket"."MainTicket"."TicketRemarks",
		"ticket"."TicketDateAndTimelines"."StartDateAndTime",
		"ticket"."TicketDateAndTimelines"."DeadlineDateAndTime",
		"ticket"."TicketMetaData"."ProductId",
		"ticket"."TicketMetaData"."ProductName",
		"ticket"."TicketMetaData"."TicketType",
		"ticket"."TicketMetaData"."TicketTypeName",
		"ticket"."TicketMetaData"."TicketPriority",
		"ticket"."TicketMetaData"."TicketPriorityName",
		"ticket"."TicketMetaData"."CompanyId",
		"ticket"."TicketMetaData"."CompanyName",
		(SELECT "StatusId" FROM "ticket"."TicketStatus" ORDER BY "LastEditOn" DESC LIMIT 1),
		(SELECT "StatusName" FROM "ticket"."TicketStatus" ORDER BY "LastEditOn" DESC LIMIT 1),
		"ticket"."MainTicket"."CreatedBy",
		"ticket"."MainTicket"."CreatedOn",
		"ticket"."MainTicket"."LastEditBy",
		"ticket"."MainTicket"."LastEditOn"
FROM "ticket"."MainTicket"
	JOIN "ticket"."TicketAccessList" 
			ON "ticket"."TicketAccessList"."TicketId"="ticket"."MainTicket"."TicketId"
	JOIN "ticket"."TicketDateAndTimelines"
			ON "ticket"."TicketDateAndTimelines"."TicketId"="ticket"."MainTicket"."TicketId"
	JOIN "ticket"."TicketMetaData"
			ON "ticket"."TicketMetaData"."TicketId"="ticket"."MainTicket"."TicketId"
	JOIN "ticket"."TicketStatus"
			ON "ticket"."TicketStatus"."TicketId"="ticket"."MainTicket"."TicketId"
WHERE "ticket"."TicketAccessList"."CompanyExecutiveId"="CompanyExecutiveIdIn"
AND "ticket"."MainTicket"."MarkForDelete"=false
AND "ticket"."TicketAccessList"."MarkForDelete"=false
$$;
 b   DROP FUNCTION ticket."fn_selectTicketDetailsByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint);
       ticket          postgres    false    15            k           1255    67953 $   fn_selectTicketFollowupDates(bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectTicketFollowupDates"("TicketIdIn" bigint) RETURNS TABLE("TicketFollowupDatesId" bigint, "TicketId" bigint, "FollowupDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
		"TicketFollowupDatesId",
		"TicketId",
		"FollowupDateAndTime"
FROM "ticket"."TicketFollowupDates"
WHERE "ticket"."TicketFollowupDates"."TicketId"="TicketIdIn"
AND "ticket"."TicketFollowupDates"."MarkForDelete"=false
ORDER BY "FollowupDateAndTime" ASC
$$;
 J   DROP FUNCTION ticket."fn_selectTicketFollowupDates"("TicketIdIn" bigint);
       ticket          postgres    false    15            �           1255    78560 (   fn_selectTicketStatusLogOfTicket(bigint)    FUNCTION     ;  CREATE FUNCTION ticket."fn_selectTicketStatusLogOfTicket"("TicketIdIn" bigint) RETURNS TABLE("TicketStatusId" bigint, "TicketId" bigint, "StatusId" bigint, "StatusName" text, "WorkProgress" integer, "StatusColorCode" text, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT
	ticket."TicketStatus"."TicketStatusId",
	ticket."TicketStatus"."TicketId",
	ticket."TicketStatus"."StatusId",
	ticket."TicketStatus"."StatusName",
	(SELECT "WorkProgress" 
	 FROM status."Status" 
	 WHERE "StatusId"=ticket."TicketStatus"."StatusId" 
	 AND status."Status"."MarkForDelete"=FALSE LIMIT 1),
	 (SELECT "StatusColorCode" 
	 FROM status."Status" 
	 WHERE "StatusId"=ticket."TicketStatus"."StatusId" 
	 AND status."Status"."MarkForDelete"=FALSE LIMIT 1),
	 ticket."TicketStatus"."LastEditBy",
	 ticket."TicketStatus"."LastEditOn"
FROM ticket."TicketStatus"
	JOIN ticket."MainTicket"
		ON ticket."MainTicket"."TicketId"=ticket."TicketStatus"."TicketId"
WHERE ticket."TicketStatus"."TicketId"="TicketIdIn"
AND ticket."MainTicket"."MarkForDelete"=FALSE
$$;
 N   DROP FUNCTION ticket."fn_selectTicketStatusLogOfTicket"("TicketIdIn" bigint);
       ticket          postgres    false    15            !           1255    136876 "   fn_selectTicketValidStatus(bigint)    FUNCTION     �  CREATE FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT DISTINCT
		"status"."Status"."StatusId",
		"status"."Status"."StatusName",
		"status"."Status"."StatusColorCode",
		"status"."Status"."WorkProgress",
		"status"."Status"."CompanyId",
		"company"."Company"."CompanyName",
		"status"."Status"."CreatedBy",
		"status"."Status"."CreatedOn",
		"status"."Status"."LastEditBy",
		"status"."Status"."LastEditOn"
FROM "status"."Status"
JOIN "company"."Company" ON "company"."Company"."CompanyId"="status"."Status"."CompanyId"
JOIN "ticket"."TicketMetaData" ON "ticket"."TicketMetaData"."CompanyId"="company"."Company"."CompanyId"
JOIN "ticket"."MainTicket" ON "ticket"."MainTicket"."TicketId"="ticket"."TicketMetaData"."TicketId"
JOIN "ticket"."TicketStatus" ON "ticket"."TicketStatus"."TicketId"="ticket"."MainTicket"."TicketId"
WHERE "status"."Status"."StatusId" NOT IN(
	SELECT "ticket"."TicketStatus"."StatusId"
	FROM "ticket"."TicketStatus"
	WHERE "ticket"."TicketStatus"."TicketId"="TicketIdIn"
	ORDER BY "LastEditOn" DESC
	LIMIT 1
)
AND "status"."Status"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
AND "ticket"."MainTicket"."MarkForDelete"=FALSE
$$;
 H   DROP FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint);
       ticket          postgres    false    15            "           1255    136878 *   fn_selectTicketValidStatus(bigint, bigint)    FUNCTION       CREATE FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint, "CompanyIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT DISTINCT
		"status"."Status"."StatusId",
		"status"."Status"."StatusName",
		"status"."Status"."StatusColorCode",
		"status"."Status"."WorkProgress",
		"status"."Status"."CompanyId",
		"company"."Company"."CompanyName",
		"status"."Status"."CreatedBy",
		"status"."Status"."CreatedOn",
		"status"."Status"."LastEditBy",
		"status"."Status"."LastEditOn"
FROM "status"."Status"
JOIN "company"."Company" ON "company"."Company"."CompanyId"="status"."Status"."CompanyId"
JOIN "ticket"."TicketMetaData" ON "ticket"."TicketMetaData"."CompanyId"="company"."Company"."CompanyId"
JOIN "ticket"."MainTicket" ON "ticket"."MainTicket"."TicketId"="ticket"."TicketMetaData"."TicketId"
JOIN "ticket"."TicketStatus" ON "ticket"."TicketStatus"."TicketId"="ticket"."MainTicket"."TicketId"
WHERE "status"."Status"."StatusId" NOT IN(
	SELECT "ticket"."TicketStatus"."StatusId"
	FROM "ticket"."TicketStatus"
	WHERE "ticket"."TicketStatus"."TicketId"="TicketIdIn"
	ORDER BY "LastEditOn" DESC
	LIMIT 1
)
AND "status"."Status"."CompanyId"="CompanyIdIn"
AND "status"."Status"."MarkForDelete"=FALSE
AND "company"."Company"."MarkForDelete"=FALSE
AND "ticket"."MainTicket"."MarkForDelete"=FALSE
$$;
 ^   DROP FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint, "CompanyIdIn" bigint);
       ticket          postgres    false    15            �           1255    67942 /   fn_updateMainTicketEnquiryRemarks(bigint, text)    FUNCTION     F  CREATE FUNCTION ticket."fn_updateMainTicketEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."MainTicket" SET "EnquiryRemarks" = "EnquiryRemarksIn" WHERE "TicketId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 b   DROP FUNCTION ticket."fn_updateMainTicketEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text);
       ticket          postgres    false    15            8           1255    67910 -   fn_updateMainTicketLastEditBy(bigint, bigint)    FUNCTION     8  CREATE FUNCTION ticket."fn_updateMainTicketLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."MainTicket" SET "LastEditBy" = "LastEditByIn" WHERE "TicketId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 \   DROP FUNCTION ticket."fn_updateMainTicketLastEditBy"("idIn" bigint, "LastEditByIn" bigint);
       ticket          postgres    false    15            9           1255    67911 B   fn_updateMainTicketLastEditOn(bigint, timestamp without time zone)    FUNCTION     M  CREATE FUNCTION ticket."fn_updateMainTicketLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."MainTicket" SET "LastEditOn" = "LastEditOnIn" WHERE "TicketId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 q   DROP FUNCTION ticket."fn_updateMainTicketLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone);
       ticket          postgres    false    15            7           1255    67909 .   fn_updateMainTicketTicketRemarks(bigint, text)    FUNCTION     B  CREATE FUNCTION ticket."fn_updateMainTicketTicketRemarks"("idIn" bigint, "TicketRemarksIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."MainTicket" SET "TicketRemarks" = "TicketRemarksIn" WHERE "TicketId" = "idIn";
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 `   DROP FUNCTION ticket."fn_updateMainTicketTicketRemarks"("idIn" bigint, "TicketRemarksIn" text);
       ticket          postgres    false    15            =           1255    67906 W   fn_updateTicketDateAndTimelinesDeadlineDateAndTime(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION ticket."fn_updateTicketDateAndTimelinesDeadlineDateAndTime"("idIn" bigint, "DeadlineDateAndTimeIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketDateAndTimelines" SET "DeadlineDateAndTime" = "DeadlineDateAndTimeIn" 
WHERE "TicketDateAndTimelinesId" = (SELECT ticket."TicketDateAndTimelines"."TicketDateAndTimelinesId" FROM ticket."TicketDateAndTimelines"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketDateAndTimelines"."TicketId"
WHERE ticket."MainTicket". "TicketId"="idIn"
AND ticket."MainTicket"."MarkForDelete"=false);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION ticket."fn_updateTicketDateAndTimelinesDeadlineDateAndTime"("idIn" bigint, "DeadlineDateAndTimeIn" timestamp without time zone);
       ticket          postgres    false    15            >           1255    67905 T   fn_updateTicketDateAndTimelinesStartDateAndTime(bigint, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION ticket."fn_updateTicketDateAndTimelinesStartDateAndTime"("idIn" bigint, "StartDateAndTimeIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketDateAndTimelines" SET "StartDateAndTime" = "StartDateAndTimeIn"
WHERE "TicketDateAndTimelinesId" = (SELECT ticket."TicketDateAndTimelines"."TicketDateAndTimelinesId" FROM ticket."TicketDateAndTimelines"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketDateAndTimelines"."TicketId"
WHERE ticket."MainTicket". "TicketId"="idIn"
AND ticket."MainTicket"."MarkForDelete"=false);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 �   DROP FUNCTION ticket."fn_updateTicketDateAndTimelinesStartDateAndTime"("idIn" bigint, "StartDateAndTimeIn" timestamp without time zone);
       ticket          postgres    false    15            �           1255    67946 0   fn_updateTicketMetaDataCompanyId(bigint, bigint)    FUNCTION       CREATE FUNCTION ticket."fn_updateTicketMetaDataCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketMetaData" SET "CompanyId" = "CompanyIdIn"
 WHERE "TicketMetaDataId" = (SELECT ticket."TicketMetaData"."TicketMetaDataId" FROM ticket."TicketMetaData"
									JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
							WHERE ticket."MainTicket". "TicketId"="idIn"
							AND ticket."MainTicket"."MarkForDelete"=false);

UPDATE "ticket"."TicketMetaData" SET "CompanyName" = (SELECT "CompanyName" FROM company."Company" WHERE "CompanyId"="CompanyIdIn")
WHERE "TicketMetaDataId" =(SELECT ticket."TicketMetaData"."TicketMetaDataId" FROM ticket."TicketMetaData"
									JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
						WHERE ticket."MainTicket". "TicketId"="idIn"
						AND ticket."MainTicket"."MarkForDelete"=false);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 ^   DROP FUNCTION ticket."fn_updateTicketMetaDataCompanyId"("idIn" bigint, "CompanyIdIn" bigint);
       ticket          postgres    false    15            �           1255    67935 6   fn_updateTicketMetaDataTicketPriority(bigint, integer)    FUNCTION       CREATE FUNCTION ticket."fn_updateTicketMetaDataTicketPriority"("idIn" bigint, "TicketPriorityIn" integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketMetaData" SET "TicketPriority" = "TicketPriorityIn" 
WHERE "TicketMetaDataId" = (SELECT ticket."TicketMetaData"."TicketMetaDataId" FROM ticket."TicketMetaData"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
WHERE ticket."MainTicket". "TicketId"="idIn"
AND ticket."MainTicket"."MarkForDelete"=false);
UPDATE "ticket"."TicketMetaData" SET "TicketPriorityName" = (SELECT "PriorityName" FROM "priority"."Priority" WHERE "PriorityId"="TicketPriorityIn")
WHERE "TicketMetaDataId" = (SELECT ticket."TicketMetaData"."TicketMetaDataId" FROM ticket."TicketMetaData"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
WHERE ticket."MainTicket". "TicketId"="idIn"
AND ticket."MainTicket"."MarkForDelete"=false);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 i   DROP FUNCTION ticket."fn_updateTicketMetaDataTicketPriority"("idIn" bigint, "TicketPriorityIn" integer);
       ticket          postgres    false    15            �           1255    67943 1   fn_updateTicketMetaDataTicketType(bigint, bigint)    FUNCTION       CREATE FUNCTION ticket."fn_updateTicketMetaDataTicketType"("idIn" bigint, "TicketTypeIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "ticket"."TicketMetaData" SET "TicketType" = "TicketTypeIn" 
WHERE "TicketMetaDataId" =(SELECT ticket."TicketMetaData"."TicketMetaDataId" FROM ticket."TicketMetaData"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
WHERE ticket."MainTicket". "TicketId"="idIn"
AND ticket."MainTicket"."MarkForDelete"=false);
UPDATE "ticket"."TicketMetaData" SET "TicketTypeName" = (SELECT "EnquiryTypeName" FROM "enquiry"."EnquiryType" WHERE "EnquiryTypeId"="TicketTypeIn")
WHERE "TicketMetaDataId" = (SELECT ticket."TicketMetaData"."TicketMetaDataId" FROM ticket."TicketMetaData"
	JOIN ticket."MainTicket" ON ticket."MainTicket"."TicketId"=ticket."TicketMetaData"."TicketId"
WHERE ticket."MainTicket". "TicketId"="idIn"
AND ticket."MainTicket"."MarkForDelete"=false);
 RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;
 `   DROP FUNCTION ticket."fn_updateTicketMetaDataTicketType"("idIn" bigint, "TicketTypeIn" bigint);
       ticket          postgres    false    15            �            1259    50931    CallTransaction    TABLE     �  CREATE TABLE "callTransactions"."CallTransaction" (
    "CallTransactionId" bigint NOT NULL,
    "ClientId" bigint NOT NULL,
    "CompanyExecutiveId" bigint NOT NULL,
    "ClientNameOnExecutiveContactList" text NOT NULL,
    "ClientContactNumber" text NOT NULL,
    "CallType" integer NOT NULL,
    "TalkDuration" double precision NOT NULL,
    "CallTime" timestamp without time zone NOT NULL,
    "FileURL" text NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "FilePath" text NOT NULL
);
 1   DROP TABLE "callTransactions"."CallTransaction";
       callTransactions            postgres    false    20            �            1259    50925 %   CallTransaction_CallTransactionId_seq    SEQUENCE     �   CREATE SEQUENCE "callTransactions"."CallTransaction_CallTransactionId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE "callTransactions"."CallTransaction_CallTransactionId_seq";
       callTransactions          postgres    false    229    20            �           0    0 %   CallTransaction_CallTransactionId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "callTransactions"."CallTransaction_CallTransactionId_seq" OWNED BY "callTransactions"."CallTransaction"."CallTransactionId";
          callTransactions          postgres    false    226            �            1259    50927    CallTransaction_ClientId_seq    SEQUENCE     �   CREATE SEQUENCE "callTransactions"."CallTransaction_ClientId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE "callTransactions"."CallTransaction_ClientId_seq";
       callTransactions          postgres    false    20    229            �           0    0    CallTransaction_ClientId_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE "callTransactions"."CallTransaction_ClientId_seq" OWNED BY "callTransactions"."CallTransaction"."ClientId";
          callTransactions          postgres    false    227            �            1259    50929 &   CallTransaction_CompanyExecutiveId_seq    SEQUENCE     �   CREATE SEQUENCE "callTransactions"."CallTransaction_CompanyExecutiveId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE "callTransactions"."CallTransaction_CompanyExecutiveId_seq";
       callTransactions          postgres    false    229    20            �           0    0 &   CallTransaction_CompanyExecutiveId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "callTransactions"."CallTransaction_CompanyExecutiveId_seq" OWNED BY "callTransactions"."CallTransaction"."CompanyExecutiveId";
          callTransactions          postgres    false    228            �            1259    67554    Client    TABLE        CREATE TABLE client."Client" (
    "ClientId" bigint NOT NULL,
    "ContactName" text NOT NULL,
    "ContactPerson" text NOT NULL,
    "EmailId" text NOT NULL,
    "ContactNumber" text NOT NULL,
    "CompanyId" bigint NOT NULL,
    "ClientLocationId" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
    DROP TABLE client."Client";
       client            postgres    false    19            �            1259    67565    ClientLocation    TABLE     �  CREATE TABLE client."ClientLocation" (
    "ClientLocationId" bigint NOT NULL,
    "Country" bigint NOT NULL,
    "State" bigint NOT NULL,
    "City" bigint NOT NULL,
    "Area" bigint NOT NULL,
    "AddressLine1" text NOT NULL,
    "AddressLine2" text NOT NULL,
    "AddressLine3" text NOT NULL,
    pincode text NOT NULL,
    latitude text NOT NULL,
    longitude text NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 $   DROP TABLE client."ClientLocation";
       client            postgres    false    19            �            1259    67563 #   ClientLocation_ClientLocationId_seq    SEQUENCE     �   CREATE SEQUENCE client."ClientLocation_ClientLocationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE client."ClientLocation_ClientLocationId_seq";
       client          postgres    false    243    19            �           0    0 #   ClientLocation_ClientLocationId_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE client."ClientLocation_ClientLocationId_seq" OWNED BY client."ClientLocation"."ClientLocationId";
          client          postgres    false    242            �            1259    67552    Client_ClientId_seq    SEQUENCE     ~   CREATE SEQUENCE client."Client_ClientId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE client."Client_ClientId_seq";
       client          postgres    false    19    241            �           0    0    Client_ClientId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE client."Client_ClientId_seq" OWNED BY client."Client"."ClientId";
          client          postgres    false    240            �            1259    49878    Company    TABLE     T  CREATE TABLE company."Company" (
    "CompanyCode" text NOT NULL,
    "CompanyName" text NOT NULL,
    "OwnerContactId" bigint NOT NULL,
    "CompanyAddress" bigint NOT NULL,
    "CityId" bigint NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditedOn" timestamp without time zone NOT NULL,
    "LastEditedBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "CompanyId" bigint NOT NULL
);
    DROP TABLE company."Company";
       company            postgres    false    9            �            1259    49929    CompanyAddressDetails    TABLE     �  CREATE TABLE company."CompanyAddressDetails" (
    "AddressLine1" text NOT NULL,
    "AddressLine2" text NOT NULL,
    "AddressLine3" text NOT NULL,
    "Pincode" bigint NOT NULL,
    "CityID" bigint NOT NULL,
    "StateID" bigint NOT NULL,
    "CountryID" bigint NOT NULL,
    "Latitude" text NOT NULL,
    "Longitude" text NOT NULL,
    "GeoLocation" text NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedDeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "CompanyAddressID" bigint NOT NULL
);
 ,   DROP TABLE company."CompanyAddressDetails";
       company            postgres    false    9            �            1259    49937 *   CompanyAddressDetails_CompanyAddressID_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyAddressDetails_CompanyAddressID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE company."CompanyAddressDetails_CompanyAddressID_seq";
       company          postgres    false    9    214            �           0    0 *   CompanyAddressDetails_CompanyAddressID_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE company."CompanyAddressDetails_CompanyAddressID_seq" OWNED BY company."CompanyAddressDetails"."CompanyAddressID";
          company          postgres    false    215            �            1259    50012    CompanyArea    TABLE     j  CREATE TABLE company."CompanyArea" (
    "CompanyAreaCode" text NOT NULL,
    "CompanyAreaDescription" text NOT NULL,
    "CompanyAreaID" bigint NOT NULL,
    "CompanyAreaName" text NOT NULL,
    "CompanyID" bigint NOT NULL,
    "CompanyRegionID" bigint NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "DeviceType" integer NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 "   DROP TABLE company."CompanyArea";
       company            postgres    false    9            �            1259    50010    CompanyArea_CompanyAreaID_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyArea_CompanyAreaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE company."CompanyArea_CompanyAreaID_seq";
       company          postgres    false    9    219            �           0    0    CompanyArea_CompanyAreaID_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE company."CompanyArea_CompanyAreaID_seq" OWNED BY company."CompanyArea"."CompanyAreaID";
          company          postgres    false    218            �            1259    50050    CompanyBranch    TABLE     �  CREATE TABLE company."CompanyBranch" (
    "CompanyBranchName" text NOT NULL,
    "CompanyBranchCode" text NOT NULL,
    "CompanyRegionID" bigint NOT NULL,
    "CompanyAreaID" bigint NOT NULL,
    "CompanyID" bigint NOT NULL,
    "CompanyBranchType" integer NOT NULL,
    "CompanyBranchAddressID" bigint NOT NULL,
    "CompanyBranchPrimaryContactID" bigint,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "CompanyBranchID" bigint NOT NULL
);
 $   DROP TABLE company."CompanyBranch";
       company            postgres    false    9            �            1259    50142    CompanyBranchAddressDetails    TABLE     �  CREATE TABLE company."CompanyBranchAddressDetails" (
    "CompanyBranchAddressID" bigint NOT NULL,
    "AddressLine1" text NOT NULL,
    "AddressLine2" text NOT NULL,
    "AddressLine3" text NOT NULL,
    "Pincode" bigint NOT NULL,
    "CityID" bigint NOT NULL,
    "StateID" bigint NOT NULL,
    "CountryID" bigint NOT NULL,
    "Latitude" text NOT NULL,
    "Longitude" text NOT NULL,
    "GeoLocation" text NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedDeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 2   DROP TABLE company."CompanyBranchAddressDetails";
       company            postgres    false    9            �            1259    50140 6   CompanyBranchAddressDetails_CompanyBranchAddressID_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 P   DROP SEQUENCE company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq";
       company          postgres    false    225    9            �           0    0 6   CompanyBranchAddressDetails_CompanyBranchAddressID_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq" OWNED BY company."CompanyBranchAddressDetails"."CompanyBranchAddressID";
          company          postgres    false    224            �            1259    67702    CompanyBranchType    TABLE     �  CREATE TABLE company."CompanyBranchType" (
    "CompanyBranchTypeId" bigint NOT NULL,
    "CompanyBranchTypeName" text NOT NULL,
    "CompanyId" bigint NOT NULL,
    "CompanyBranchPosition" integer NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 (   DROP TABLE company."CompanyBranchType";
       company            postgres    false    9            �            1259    67700 )   CompanyBranchType_CompanyBranchTypeId_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyBranchType_CompanyBranchTypeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE company."CompanyBranchType_CompanyBranchTypeId_seq";
       company          postgres    false    9    247            �           0    0 )   CompanyBranchType_CompanyBranchTypeId_seq    SEQUENCE OWNED BY        ALTER SEQUENCE company."CompanyBranchType_CompanyBranchTypeId_seq" OWNED BY company."CompanyBranchType"."CompanyBranchTypeId";
          company          postgres    false    246            �            1259    50048 !   CompanyBranch_CompanyBranchID_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyBranch_CompanyBranchID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE company."CompanyBranch_CompanyBranchID_seq";
       company          postgres    false    221    9            �           0    0 !   CompanyBranch_CompanyBranchID_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE company."CompanyBranch_CompanyBranchID_seq" OWNED BY company."CompanyBranch"."CompanyBranchID";
          company          postgres    false    220            �            1259    50102    CompanyExecutive    TABLE     �  CREATE TABLE company."CompanyExecutive" (
    "CompanyExecutiveID" bigint NOT NULL,
    "ExecutiveName" text NOT NULL,
    "LoginID" text NOT NULL,
    "Password" text NOT NULL,
    "CompanyBranchID" bigint NOT NULL,
    "BaseCityID" bigint NOT NULL,
    "CompanyID" bigint NOT NULL,
    "ContactNumber" text NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 '   DROP TABLE company."CompanyExecutive";
       company            postgres    false    9            �            1259    59579    CompanyExecutivePL    TABLE     �   CREATE TABLE company."CompanyExecutivePL" (
    id bigint NOT NULL,
    "executiveId" bigint NOT NULL,
    "PLRate" integer DEFAULT 0 NOT NULL,
    "dateOfEntry" timestamp without time zone NOT NULL
);
 )   DROP TABLE company."CompanyExecutivePL";
       company            postgres    false    9            �            1259    59577    CompanyExecutivePL_id_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyExecutivePL_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE company."CompanyExecutivePL_id_seq";
       company          postgres    false    9    235            �           0    0    CompanyExecutivePL_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE company."CompanyExecutivePL_id_seq" OWNED BY company."CompanyExecutivePL".id;
          company          postgres    false    234            �            1259    50100     CompanyExecutive_ExecutiveID_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyExecutive_ExecutiveID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE company."CompanyExecutive_ExecutiveID_seq";
       company          postgres    false    9    223            �           0    0     CompanyExecutive_ExecutiveID_seq    SEQUENCE OWNED BY     t   ALTER SEQUENCE company."CompanyExecutive_ExecutiveID_seq" OWNED BY company."CompanyExecutive"."CompanyExecutiveID";
          company          postgres    false    222            �            1259    49976    CompanyRegion    TABLE     M  CREATE TABLE company."CompanyRegion" (
    "CompanyRegionID" bigint NOT NULL,
    "CompanyRegionName" text NOT NULL,
    "CompanyRegionCode" text NOT NULL,
    "CompanyRegionDescription" text NOT NULL,
    "CompanyID" bigint NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 $   DROP TABLE company."CompanyRegion";
       company            postgres    false    9            �            1259    49974 !   CompanyRegion_CompanyRegionID_seq    SEQUENCE     �   CREATE SEQUENCE company."CompanyRegion_CompanyRegionID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE company."CompanyRegion_CompanyRegionID_seq";
       company          postgres    false    9    217            �           0    0 !   CompanyRegion_CompanyRegionID_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE company."CompanyRegion_CompanyRegionID_seq" OWNED BY company."CompanyRegion"."CompanyRegionID";
          company          postgres    false    216            �            1259    49888    Company_CompanyId_seq    SEQUENCE     �   CREATE SEQUENCE company."Company_CompanyId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE company."Company_CompanyId_seq";
       company          postgres    false    9    212            �           0    0    Company_CompanyId_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE company."Company_CompanyId_seq" OWNED BY company."Company"."CompanyId";
          company          postgres    false    213                       1259    68235    CompanyExecutiveGeoLocation    TABLE     �  CREATE TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" (
    "CompanyExecutiveGeoLocationId" bigint NOT NULL,
    "Latitude" text NOT NULL,
    "Longitude" text NOT NULL,
    "CompanyExecutiveId" bigint NOT NULL,
    "CompanyExecutiveName" text NOT NULL,
    "CompanyId" bigint NOT NULL,
    "CompanyName" text NOT NULL,
    "EntryDateAndTime" timestamp without time zone NOT NULL,
    "CompanyExecutiveGeoLocationAddressId" bigint NOT NULL
);
 H   DROP TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation";
       companyExecutiveGeoLocation            postgres    false    13                       1259    68224 "   CompanyExecutiveGeoLocationAddress    TABLE       CREATE TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" (
    "CompanyExecutiveGeoLocationAddressId" bigint NOT NULL,
    "Country" text NOT NULL,
    "State" text NOT NULL,
    "City" text NOT NULL,
    "Area" text NOT NULL,
    "AddressLine1" text NOT NULL,
    "AddressLine2" text NOT NULL,
    "AddressLine3" text NOT NULL,
    "Pincode" text NOT NULL
);
 O   DROP TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress";
       companyExecutiveGeoLocation            postgres    false    13                       1259    68222 ?   CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq    SEQUENCE     �   CREATE SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 o   DROP SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq";
       companyExecutiveGeoLocation          postgres    false    275    13            �           0    0 ?   CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq" OWNED BY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"."CompanyExecutiveGeoLocationAddressId";
          companyExecutiveGeoLocation          postgres    false    274                       1259    68233 =   CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq    SEQUENCE     �   CREATE SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 m   DROP SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq";
       companyExecutiveGeoLocation          postgres    false    13    277            �           0    0 =   CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq" OWNED BY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationId";
          companyExecutiveGeoLocation          postgres    false    276                       1259    77471    EnquiryAccessList    TABLE     C  CREATE TABLE enquiry."EnquiryAccessList" (
    "EnquiryAccessListId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "CompanyExecutiveId" bigint NOT NULL,
    "CompanyExecutiveName" text NOT NULL,
    "AccessApplicationTime" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 (   DROP TABLE enquiry."EnquiryAccessList";
       enquiry            postgres    false    18                       1259    77469 )   EnquiryAccessList_EnquiryAccessListId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."EnquiryAccessList_EnquiryAccessListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE enquiry."EnquiryAccessList_EnquiryAccessListId_seq";
       enquiry          postgres    false    18    281            �           0    0 )   EnquiryAccessList_EnquiryAccessListId_seq    SEQUENCE OWNED BY        ALTER SEQUENCE enquiry."EnquiryAccessList_EnquiryAccessListId_seq" OWNED BY enquiry."EnquiryAccessList"."EnquiryAccessListId";
          enquiry          postgres    false    280                       1259    67968    EnquiryClient    TABLE       CREATE TABLE enquiry."EnquiryClient" (
    "EnquiryClientId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "ClientName" text NOT NULL,
    "ContactPerson" text NOT NULL,
    "EmailId" text NOT NULL,
    "ContactNumber" text NOT NULL,
    "ClientId" bigint NOT NULL
);
 $   DROP TABLE enquiry."EnquiryClient";
       enquiry            postgres    false    18            
           1259    67966 !   EnquiryClient_EnquiryClientId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."EnquiryClient_EnquiryClientId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE enquiry."EnquiryClient_EnquiryClientId_seq";
       enquiry          postgres    false    267    18            �           0    0 !   EnquiryClient_EnquiryClientId_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE enquiry."EnquiryClient_EnquiryClientId_seq" OWNED BY enquiry."EnquiryClient"."EnquiryClientId";
          enquiry          postgres    false    266                       1259    68120    EnquiryDateAndTimelines    TABLE       CREATE TABLE enquiry."EnquiryDateAndTimelines" (
    "EnquiryDateAndTimelinesId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "startDateAndTime" timestamp without time zone NOT NULL,
    "deadlineDateAndTime" timestamp without time zone NOT NULL
);
 .   DROP TABLE enquiry."EnquiryDateAndTimelines";
       enquiry            postgres    false    18                       1259    68118 5   EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq";
       enquiry          postgres    false    273    18            �           0    0 5   EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq" OWNED BY enquiry."EnquiryDateAndTimelines"."EnquiryDateAndTimelinesId";
          enquiry          postgres    false    272                       1259    67979    EnquiryLocation    TABLE     -  CREATE TABLE enquiry."EnquiryLocation" (
    "EnquiryLocationId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "CountryId" bigint NOT NULL,
    "CountryName" text NOT NULL,
    "StateId" bigint NOT NULL,
    "StateName" text NOT NULL,
    "CityId" bigint NOT NULL,
    "CityName" text NOT NULL,
    "AreaId" bigint NOT NULL,
    "AreaName" text NOT NULL,
    "AddressLine1" text NOT NULL,
    "AddressLine2" text NOT NULL,
    "AddressLine3" text NOT NULL,
    "Pincode" text NOT NULL,
    "Latitude" text NOT NULL,
    "Longitude" text NOT NULL
);
 &   DROP TABLE enquiry."EnquiryLocation";
       enquiry            postgres    false    18                       1259    67977 %   EnquiryLocation_EnquiryLocationId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."EnquiryLocation_EnquiryLocationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE enquiry."EnquiryLocation_EnquiryLocationId_seq";
       enquiry          postgres    false    18    269            �           0    0 %   EnquiryLocation_EnquiryLocationId_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE enquiry."EnquiryLocation_EnquiryLocationId_seq" OWNED BY enquiry."EnquiryLocation"."EnquiryLocationId";
          enquiry          postgres    false    268                       1259    67990    EnquiryProductList    TABLE     !  CREATE TABLE enquiry."EnquiryProductList" (
    "EnquiryProductListId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "ProductName" text NOT NULL,
    "ProductCharges" double precision NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 )   DROP TABLE enquiry."EnquiryProductList";
       enquiry            postgres    false    18                       1259    67988 +   EnquiryProductList_EnquiryProductListId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."EnquiryProductList_EnquiryProductListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE enquiry."EnquiryProductList_EnquiryProductListId_seq";
       enquiry          postgres    false    271    18            �           0    0 +   EnquiryProductList_EnquiryProductListId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE enquiry."EnquiryProductList_EnquiryProductListId_seq" OWNED BY enquiry."EnquiryProductList"."EnquiryProductListId";
          enquiry          postgres    false    270            �            1259    67728    EnquiryType    TABLE     �  CREATE TABLE enquiry."EnquiryType" (
    "EnquiryTypeId" bigint NOT NULL,
    "EnquiryTypeName" text NOT NULL,
    "EnquiryTypeColorCode" text NOT NULL,
    "CompanyId" bigint NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 "   DROP TABLE enquiry."EnquiryType";
       enquiry            postgres    false    18            �            1259    67726    EnquiryType_EnquiryTypeId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."EnquiryType_EnquiryTypeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE enquiry."EnquiryType_EnquiryTypeId_seq";
       enquiry          postgres    false    18    249            �           0    0    EnquiryType_EnquiryTypeId_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE enquiry."EnquiryType_EnquiryTypeId_seq" OWNED BY enquiry."EnquiryType"."EnquiryTypeId";
          enquiry          postgres    false    248            	           1259    67956    MainEnquiry    TABLE     �  CREATE TABLE enquiry."MainEnquiry" (
    "EnquiryId" bigint NOT NULL,
    "CompanyId" bigint NOT NULL,
    "CompanyName" text NOT NULL,
    "EnquiryRemarks" text NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "EnquiryType" bigint NOT NULL,
    "EnquiryTypeName" text NOT NULL
);
 "   DROP TABLE enquiry."MainEnquiry";
       enquiry            postgres    false    18                       1259    67954    MainEnquiry_EnquiryId_seq    SEQUENCE     �   CREATE SEQUENCE enquiry."MainEnquiry_EnquiryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE enquiry."MainEnquiry_EnquiryId_seq";
       enquiry          postgres    false    265    18            �           0    0    MainEnquiry_EnquiryId_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE enquiry."MainEnquiry_EnquiryId_seq" OWNED BY enquiry."MainEnquiry"."EnquiryId";
          enquiry          postgres    false    264                       1259    78014    seq_id    SEQUENCE     s   CREATE SEQUENCE location.seq_id
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE location.seq_id;
       location          postgres    false    17                       1259    78016    areainfo    TABLE     �  CREATE TABLE location.areainfo (
    "AreaName" text NOT NULL,
    "AreaCode" text NOT NULL,
    "AreaID" bigint DEFAULT nextval('location.seq_id'::regclass) NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "AreaDescription" text NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "CountryID" bigint NOT NULL,
    "StateID" bigint NOT NULL,
    "CityID" bigint NOT NULL
);
    DROP TABLE location.areainfo;
       location            postgres    false    284    17                       1259    78025    businessCityForCompany    TABLE       CREATE TABLE location."businessCityForCompany" (
    "BusinessCityForCompanyID" bigint NOT NULL,
    "CompanyID" bigint NOT NULL,
    "CityID" bigint NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 .   DROP TABLE location."businessCityForCompany";
       location            postgres    false    17                       1259    78030 3   businessCityForCompany_BusinessCityForCompanyID_seq    SEQUENCE     �   CREATE SEQUENCE location."businessCityForCompany_BusinessCityForCompanyID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE location."businessCityForCompany_BusinessCityForCompanyID_seq";
       location          postgres    false    17    286            �           0    0 3   businessCityForCompany_BusinessCityForCompanyID_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE location."businessCityForCompany_BusinessCityForCompanyID_seq" OWNED BY location."businessCityForCompany"."BusinessCityForCompanyID";
          location          postgres    false    287                        1259    78032    businessAreaForCompany    TABLE     |  CREATE TABLE location."businessAreaForCompany" (
    "BusinessAreaForCompanyID" bigint DEFAULT nextval('location."businessCityForCompany_BusinessCityForCompanyID_seq"'::regclass) NOT NULL,
    "CompanyID" bigint NOT NULL,
    "AreaID" bigint NOT NULL,
    "CityID" bigint NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 .   DROP TABLE location."businessAreaForCompany";
       location            postgres    false    287    17            !           1259    78038    cityinfo    TABLE     o  CREATE TABLE location.cityinfo (
    "CityName" text NOT NULL,
    "CityCode" text NOT NULL,
    "CityID" bigint DEFAULT nextval('location.seq_id'::regclass) NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "CityDescription" text NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "CountryID" bigint NOT NULL,
    "StateID" bigint NOT NULL
);
    DROP TABLE location.cityinfo;
       location            postgres    false    284    17            "           1259    78047    countryinfo    TABLE     >  CREATE TABLE location.countryinfo (
    "CountryName" text NOT NULL,
    "CountryCode" text NOT NULL,
    "CountryID" bigint DEFAULT nextval('location.seq_id'::regclass) NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "CountryDescription" text NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL
);
 !   DROP TABLE location.countryinfo;
       location            postgres    false    284    17            #           1259    78056 	   stateinfo    TABLE     (  CREATE TABLE location.stateinfo (
    "StateName" text NOT NULL,
    "StateCode" text NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "StateDescription" text NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "DeviceType" integer NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditDeviceType" integer NOT NULL,
    "CountryID" bigint NOT NULL,
    "StateID" bigint NOT NULL
);
    DROP TABLE location.stateinfo;
       location            postgres    false    17            $           1259    78064    stateinfo_StateID_seq    SEQUENCE     �   CREATE SEQUENCE location."stateinfo_StateID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE location."stateinfo_StateID_seq";
       location          postgres    false    291    17            �           0    0    stateinfo_StateID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE location."stateinfo_StateID_seq" OWNED BY location.stateinfo."StateID";
          location          postgres    false    292            %           1259    78679    Notification    TABLE     �  CREATE TABLE notification."Notification" (
    "CompanyExecutiveID" bigint,
    "CompanyExecutiveName" text,
    "NotificationSubject" text,
    "NotificationDescription" text,
    "ReadIndex" boolean DEFAULT false,
    "NotificationTime" timestamp without time zone,
    "MarkForDelete" boolean DEFAULT false,
    "JustArrived" boolean DEFAULT true,
    "NotificationID" bigint NOT NULL
);
 (   DROP TABLE notification."Notification";
       notification            postgres    false    8            &           1259    78688    Notification_NotificationID_seq    SEQUENCE     �   CREATE SEQUENCE notification."Notification_NotificationID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE notification."Notification_NotificationID_seq";
       notification          postgres    false    8    293            �           0    0    Notification_NotificationID_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE notification."Notification_NotificationID_seq" OWNED BY notification."Notification"."NotificationID";
          notification          postgres    false    294            �            1259    59535    OwnerContact    TABLE       CREATE TABLE owner."OwnerContact" (
    id bigint DEFAULT nextval('company."CompanyExecutive_ExecutiveID_seq"'::regclass) NOT NULL,
    "ownerName" text NOT NULL,
    "ownerContact" text NOT NULL,
    "ownerEmail" text NOT NULL,
    "SecretKey" text NOT NULL,
    "UserName" text NOT NULL,
    "Password" text NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 !   DROP TABLE owner."OwnerContact";
       owner            postgres    false    222    10            �            1259    59533    OwnerContact_id_seq    SEQUENCE     }   CREATE SEQUENCE owner."OwnerContact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE owner."OwnerContact_id_seq";
       owner          postgres    false    10    233            �           0    0    OwnerContact_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE owner."OwnerContact_id_seq" OWNED BY owner."OwnerContact".id;
          owner          postgres    false    232            �            1259    67438    CompanyExecutiveMasterList    TABLE     e  CREATE TABLE "position"."CompanyExecutiveMasterList" (
    id bigint NOT NULL,
    "Company" text NOT NULL,
    "CompanyBranch" text NOT NULL,
    "CompanyExecutive" text NOT NULL,
    "Client" text NOT NULL,
    "Product" text NOT NULL,
    "Location" text NOT NULL,
    "Enquiry" text NOT NULL,
    "Ticket" text NOT NULL,
    "Position" text NOT NULL
);
 4   DROP TABLE "position"."CompanyExecutiveMasterList";
       position            postgres    false    12            �            1259    67436 !   CompanyExecutiveMasterList_id_seq    SEQUENCE     �   CREATE SEQUENCE "position"."CompanyExecutiveMasterList_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE "position"."CompanyExecutiveMasterList_id_seq";
       position          postgres    false    239    12            �           0    0 !   CompanyExecutiveMasterList_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "position"."CompanyExecutiveMasterList_id_seq" OWNED BY "position"."CompanyExecutiveMasterList".id;
          position          postgres    false    238            �            1259    67417 	   Positions    TABLE     T  CREATE TABLE "position"."Positions" (
    id bigint NOT NULL,
    "PositionName" text NOT NULL,
    "PositionPriority" integer NOT NULL,
    "CompanyId" bigint NOT NULL,
    "ExecutiveMasterId" integer NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    CONSTRAINT "CHECK_PositionPriority" CHECK ((("PositionPriority" <= 25) AND ("PositionPriority" >= 1)))
);
 #   DROP TABLE "position"."Positions";
       position            postgres    false    12            �            1259    67415    Positions_id_seq    SEQUENCE        CREATE SEQUENCE "position"."Positions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE "position"."Positions_id_seq";
       position          postgres    false    237    12            �           0    0    Positions_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE "position"."Positions_id_seq" OWNED BY "position"."Positions".id;
          position          postgres    false    236            �            1259    67752    Priority    TABLE     �   CREATE TABLE priority."Priority" (
    "PriorityId" bigint NOT NULL,
    "PriorityName" text NOT NULL,
    "PriorityPosition" smallint NOT NULL
);
     DROP TABLE priority."Priority";
       priority            postgres    false    6            �            1259    67750    Priority_PriorityId_seq    SEQUENCE     �   CREATE SEQUENCE priority."Priority_PriorityId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE priority."Priority_PriorityId_seq";
       priority          postgres    false    251    6            �           0    0    Priority_PriorityId_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE priority."Priority_PriorityId_seq" OWNED BY priority."Priority"."PriorityId";
          priority          postgres    false    250            �            1259    59413    Product    TABLE     �  CREATE TABLE product."Product" (
    id bigint NOT NULL,
    "productName" text NOT NULL,
    "productDescription" text NOT NULL,
    "companyId" bigint NOT NULL,
    cost double precision NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
    DROP TABLE product."Product";
       product            postgres    false    22            �            1259    59411    Product_id_seq    SEQUENCE     z   CREATE SEQUENCE product."Product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE product."Product_id_seq";
       product          postgres    false    231    22            �           0    0    Product_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE product."Product_id_seq" OWNED BY product."Product".id;
          product          postgres    false    230                       1259    77488    CRMAccessList    TABLE     �  CREATE TABLE public."CRMAccessList" (
    "CRMAccessListId" bigint NOT NULL,
    "CorrespondingId" bigint NOT NULL,
    "OwnerFlag" boolean NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL,
    "CorrespondingName" text NOT NULL,
    "CorrespondingPosition" integer NOT NULL,
    "CorrespondingEmailId" text NOT NULL,
    "CorrespondingContactNumber" text NOT NULL,
    "CorrespondingPassword" text NOT NULL
);
 #   DROP TABLE public."CRMAccessList";
       public            postgres    false                       1259    77486 !   CRMAccessList_CRMAccessListId_seq    SEQUENCE     �   CREATE SEQUENCE public."CRMAccessList_CRMAccessListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."CRMAccessList_CRMAccessListId_seq";
       public          postgres    false    283            �           0    0 !   CRMAccessList_CRMAccessListId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."CRMAccessList_CRMAccessListId_seq" OWNED BY public."CRMAccessList"."CRMAccessListId";
          public          postgres    false    282                       1259    75854    EmailPurpose    TABLE     �   CREATE TABLE purposes."EmailPurpose" (
    "EmailPurposeId" bigint NOT NULL,
    "EmailPurposeTitle" text NOT NULL,
    "EmailPurposeDescription" text NOT NULL
);
 $   DROP TABLE purposes."EmailPurpose";
       purposes            postgres    false    4                       1259    75852    EmailPurpose_EmailPurposeId_seq    SEQUENCE     �   CREATE SEQUENCE purposes."EmailPurpose_EmailPurposeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE purposes."EmailPurpose_EmailPurposeId_seq";
       purposes          postgres    false    4    279            �           0    0    EmailPurpose_EmailPurposeId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE purposes."EmailPurpose_EmailPurposeId_seq" OWNED BY purposes."EmailPurpose"."EmailPurposeId";
          purposes          postgres    false    278            �            1259    67680    Status    TABLE     �  CREATE TABLE status."Status" (
    "StatusId" bigint NOT NULL,
    "StatusName" text NOT NULL,
    "StatusColorCode" text NOT NULL,
    "WorkProgress" integer NOT NULL,
    "CompanyId" bigint NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
    DROP TABLE status."Status";
       status            postgres    false    23            �            1259    67678    Status_StatusId_seq    SEQUENCE     ~   CREATE SEQUENCE status."Status_StatusId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE status."Status_StatusId_seq";
       status          postgres    false    245    23            �           0    0    Status_StatusId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE status."Status_StatusId_seq" OWNED BY status."Status"."StatusId";
          status          postgres    false    244            �            1259    67766 
   MainTicket    TABLE     �  CREATE TABLE ticket."MainTicket" (
    "TicketId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "EnquiryRemarks" text NOT NULL,
    "TicketRemarks" text NOT NULL,
    "CreatedBy" bigint NOT NULL,
    "CreatedOn" timestamp without time zone NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
     DROP TABLE ticket."MainTicket";
       ticket            postgres    false    15            �            1259    67764    MainTicket_TicketId_seq    SEQUENCE     �   CREATE SEQUENCE ticket."MainTicket_TicketId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE ticket."MainTicket_TicketId_seq";
       ticket          postgres    false    253    15            �           0    0    MainTicket_TicketId_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE ticket."MainTicket_TicketId_seq" OWNED BY ticket."MainTicket"."TicketId";
          ticket          postgres    false    252                       1259    67799    TicketAccessList    TABLE     ?  CREATE TABLE ticket."TicketAccessList" (
    "TicketAccessListId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "CompanyExecutiveId" bigint NOT NULL,
    "CompanyExecutiveName" text NOT NULL,
    "AccessApplicationTime" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 &   DROP TABLE ticket."TicketAccessList";
       ticket            postgres    false    15                        1259    67797 '   TicketAccessList_TicketAccessListId_seq    SEQUENCE     �   CREATE SEQUENCE ticket."TicketAccessList_TicketAccessListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE ticket."TicketAccessList_TicketAccessListId_seq";
       ticket          postgres    false    257    15            �           0    0 '   TicketAccessList_TicketAccessListId_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE ticket."TicketAccessList_TicketAccessListId_seq" OWNED BY ticket."TicketAccessList"."TicketAccessListId";
          ticket          postgres    false    256                       1259    67826    TicketDateAndTimelines    TABLE     �   CREATE TABLE ticket."TicketDateAndTimelines" (
    "TicketDateAndTimelinesId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "StartDateAndTime" timestamp without time zone NOT NULL,
    "DeadlineDateAndTime" timestamp without time zone NOT NULL
);
 ,   DROP TABLE ticket."TicketDateAndTimelines";
       ticket            postgres    false    15                       1259    67824 3   TicketDateAndTimelines_TicketDateAndTimelinesId_seq    SEQUENCE     �   CREATE SEQUENCE ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 L   DROP SEQUENCE ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq";
       ticket          postgres    false    15    259            �           0    0 3   TicketDateAndTimelines_TicketDateAndTimelinesId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq" OWNED BY ticket."TicketDateAndTimelines"."TicketDateAndTimelinesId";
          ticket          postgres    false    258                       1259    67839    TicketFollowupDates    TABLE     �   CREATE TABLE ticket."TicketFollowupDates" (
    "TicketFollowupDatesId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "FollowupDateAndTime" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);
 )   DROP TABLE ticket."TicketFollowupDates";
       ticket            postgres    false    15                       1259    67837 -   TicketFollowupDates_TicketFollowupDatesId_seq    SEQUENCE     �   CREATE SEQUENCE ticket."TicketFollowupDates_TicketFollowupDatesId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE ticket."TicketFollowupDates_TicketFollowupDatesId_seq";
       ticket          postgres    false    261    15            �           0    0 -   TicketFollowupDates_TicketFollowupDatesId_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE ticket."TicketFollowupDates_TicketFollowupDatesId_seq" OWNED BY ticket."TicketFollowupDates"."TicketFollowupDatesId";
          ticket          postgres    false    260                       1259    67853    TicketMetaData    TABLE     �  CREATE TABLE ticket."TicketMetaData" (
    "TicketMetaDataId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "ProductName" text NOT NULL,
    "TicketType" bigint NOT NULL,
    "TicketTypeName" text NOT NULL,
    "TicketPriority" integer NOT NULL,
    "TicketPriorityName" text NOT NULL,
    "CompanyId" bigint NOT NULL,
    "CompanyName" text NOT NULL
);
 $   DROP TABLE ticket."TicketMetaData";
       ticket            postgres    false    15                       1259    67851 #   TicketMetaData_TicketMetaDataId_seq    SEQUENCE     �   CREATE SEQUENCE ticket."TicketMetaData_TicketMetaDataId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE ticket."TicketMetaData_TicketMetaDataId_seq";
       ticket          postgres    false    15    263            �           0    0 #   TicketMetaData_TicketMetaDataId_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE ticket."TicketMetaData_TicketMetaDataId_seq" OWNED BY ticket."TicketMetaData"."TicketMetaDataId";
          ticket          postgres    false    262            �            1259    67778    TicketStatus    TABLE       CREATE TABLE ticket."TicketStatus" (
    "TicketStatusId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "StatusName" text NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL
);
 "   DROP TABLE ticket."TicketStatus";
       ticket            postgres    false    15            �            1259    67776    TicketStatus_TicketStatusId_seq    SEQUENCE     �   CREATE SEQUENCE ticket."TicketStatus_TicketStatusId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE ticket."TicketStatus_TicketStatusId_seq";
       ticket          postgres    false    255    15            �           0    0    TicketStatus_TicketStatusId_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE ticket."TicketStatus_TicketStatusId_seq" OWNED BY ticket."TicketStatus"."TicketStatusId";
          ticket          postgres    false    254            �           2604    103577 !   CallTransaction CallTransactionId    DEFAULT     �   ALTER TABLE ONLY "callTransactions"."CallTransaction" ALTER COLUMN "CallTransactionId" SET DEFAULT nextval('"callTransactions"."CallTransaction_CallTransactionId_seq"'::regclass);
 `   ALTER TABLE "callTransactions"."CallTransaction" ALTER COLUMN "CallTransactionId" DROP DEFAULT;
       callTransactions          postgres    false    229    226    229            �           2604    103578    Client ClientId    DEFAULT     x   ALTER TABLE ONLY client."Client" ALTER COLUMN "ClientId" SET DEFAULT nextval('client."Client_ClientId_seq"'::regclass);
 B   ALTER TABLE client."Client" ALTER COLUMN "ClientId" DROP DEFAULT;
       client          postgres    false    241    240    241            �           2604    103579    ClientLocation ClientLocationId    DEFAULT     �   ALTER TABLE ONLY client."ClientLocation" ALTER COLUMN "ClientLocationId" SET DEFAULT nextval('client."ClientLocation_ClientLocationId_seq"'::regclass);
 R   ALTER TABLE client."ClientLocation" ALTER COLUMN "ClientLocationId" DROP DEFAULT;
       client          postgres    false    242    243    243            �           2604    103580    Company CompanyId    DEFAULT     ~   ALTER TABLE ONLY company."Company" ALTER COLUMN "CompanyId" SET DEFAULT nextval('company."Company_CompanyId_seq"'::regclass);
 E   ALTER TABLE company."Company" ALTER COLUMN "CompanyId" DROP DEFAULT;
       company          postgres    false    213    212            �           2604    103581 &   CompanyAddressDetails CompanyAddressID    DEFAULT     �   ALTER TABLE ONLY company."CompanyAddressDetails" ALTER COLUMN "CompanyAddressID" SET DEFAULT nextval('company."CompanyAddressDetails_CompanyAddressID_seq"'::regclass);
 Z   ALTER TABLE company."CompanyAddressDetails" ALTER COLUMN "CompanyAddressID" DROP DEFAULT;
       company          postgres    false    215    214            �           2604    103582    CompanyArea CompanyAreaID    DEFAULT     �   ALTER TABLE ONLY company."CompanyArea" ALTER COLUMN "CompanyAreaID" SET DEFAULT nextval('company."CompanyArea_CompanyAreaID_seq"'::regclass);
 M   ALTER TABLE company."CompanyArea" ALTER COLUMN "CompanyAreaID" DROP DEFAULT;
       company          postgres    false    218    219    219            �           2604    103583    CompanyBranch CompanyBranchID    DEFAULT     �   ALTER TABLE ONLY company."CompanyBranch" ALTER COLUMN "CompanyBranchID" SET DEFAULT nextval('company."CompanyBranch_CompanyBranchID_seq"'::regclass);
 Q   ALTER TABLE company."CompanyBranch" ALTER COLUMN "CompanyBranchID" DROP DEFAULT;
       company          postgres    false    221    220    221            �           2604    103584 2   CompanyBranchAddressDetails CompanyBranchAddressID    DEFAULT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails" ALTER COLUMN "CompanyBranchAddressID" SET DEFAULT nextval('company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq"'::regclass);
 f   ALTER TABLE company."CompanyBranchAddressDetails" ALTER COLUMN "CompanyBranchAddressID" DROP DEFAULT;
       company          postgres    false    225    224    225            �           2604    103585 %   CompanyBranchType CompanyBranchTypeId    DEFAULT     �   ALTER TABLE ONLY company."CompanyBranchType" ALTER COLUMN "CompanyBranchTypeId" SET DEFAULT nextval('company."CompanyBranchType_CompanyBranchTypeId_seq"'::regclass);
 Y   ALTER TABLE company."CompanyBranchType" ALTER COLUMN "CompanyBranchTypeId" DROP DEFAULT;
       company          postgres    false    246    247    247            �           2604    103586 #   CompanyExecutive CompanyExecutiveID    DEFAULT     �   ALTER TABLE ONLY company."CompanyExecutive" ALTER COLUMN "CompanyExecutiveID" SET DEFAULT nextval('company."CompanyExecutive_ExecutiveID_seq"'::regclass);
 W   ALTER TABLE company."CompanyExecutive" ALTER COLUMN "CompanyExecutiveID" DROP DEFAULT;
       company          postgres    false    223    222    223            �           2604    103587    CompanyExecutivePL id    DEFAULT     �   ALTER TABLE ONLY company."CompanyExecutivePL" ALTER COLUMN id SET DEFAULT nextval('company."CompanyExecutivePL_id_seq"'::regclass);
 G   ALTER TABLE company."CompanyExecutivePL" ALTER COLUMN id DROP DEFAULT;
       company          postgres    false    235    234    235            �           2604    103588    CompanyRegion CompanyRegionID    DEFAULT     �   ALTER TABLE ONLY company."CompanyRegion" ALTER COLUMN "CompanyRegionID" SET DEFAULT nextval('company."CompanyRegion_CompanyRegionID_seq"'::regclass);
 Q   ALTER TABLE company."CompanyRegion" ALTER COLUMN "CompanyRegionID" DROP DEFAULT;
       company          postgres    false    216    217    217            �           2604    103589 9   CompanyExecutiveGeoLocation CompanyExecutiveGeoLocationId    DEFAULT     �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" ALTER COLUMN "CompanyExecutiveGeoLocationId" SET DEFAULT nextval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq"'::regclass);
 �   ALTER TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" ALTER COLUMN "CompanyExecutiveGeoLocationId" DROP DEFAULT;
       companyExecutiveGeoLocation          postgres    false    276    277    277            �           2604    103590 G   CompanyExecutiveGeoLocationAddress CompanyExecutiveGeoLocationAddressId    DEFAULT     
  ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" ALTER COLUMN "CompanyExecutiveGeoLocationAddressId" SET DEFAULT nextval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq"'::regclass);
 �   ALTER TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" ALTER COLUMN "CompanyExecutiveGeoLocationAddressId" DROP DEFAULT;
       companyExecutiveGeoLocation          postgres    false    274    275    275            �           2604    103591 %   EnquiryAccessList EnquiryAccessListId    DEFAULT     �   ALTER TABLE ONLY enquiry."EnquiryAccessList" ALTER COLUMN "EnquiryAccessListId" SET DEFAULT nextval('enquiry."EnquiryAccessList_EnquiryAccessListId_seq"'::regclass);
 Y   ALTER TABLE enquiry."EnquiryAccessList" ALTER COLUMN "EnquiryAccessListId" DROP DEFAULT;
       enquiry          postgres    false    280    281    281            �           2604    103592    EnquiryClient EnquiryClientId    DEFAULT     �   ALTER TABLE ONLY enquiry."EnquiryClient" ALTER COLUMN "EnquiryClientId" SET DEFAULT nextval('enquiry."EnquiryClient_EnquiryClientId_seq"'::regclass);
 Q   ALTER TABLE enquiry."EnquiryClient" ALTER COLUMN "EnquiryClientId" DROP DEFAULT;
       enquiry          postgres    false    267    266    267            �           2604    103593 1   EnquiryDateAndTimelines EnquiryDateAndTimelinesId    DEFAULT     �   ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines" ALTER COLUMN "EnquiryDateAndTimelinesId" SET DEFAULT nextval('enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq"'::regclass);
 e   ALTER TABLE enquiry."EnquiryDateAndTimelines" ALTER COLUMN "EnquiryDateAndTimelinesId" DROP DEFAULT;
       enquiry          postgres    false    272    273    273            �           2604    103594 !   EnquiryLocation EnquiryLocationId    DEFAULT     �   ALTER TABLE ONLY enquiry."EnquiryLocation" ALTER COLUMN "EnquiryLocationId" SET DEFAULT nextval('enquiry."EnquiryLocation_EnquiryLocationId_seq"'::regclass);
 U   ALTER TABLE enquiry."EnquiryLocation" ALTER COLUMN "EnquiryLocationId" DROP DEFAULT;
       enquiry          postgres    false    268    269    269            �           2604    103595 '   EnquiryProductList EnquiryProductListId    DEFAULT     �   ALTER TABLE ONLY enquiry."EnquiryProductList" ALTER COLUMN "EnquiryProductListId" SET DEFAULT nextval('enquiry."EnquiryProductList_EnquiryProductListId_seq"'::regclass);
 [   ALTER TABLE enquiry."EnquiryProductList" ALTER COLUMN "EnquiryProductListId" DROP DEFAULT;
       enquiry          postgres    false    270    271    271            �           2604    103596    EnquiryType EnquiryTypeId    DEFAULT     �   ALTER TABLE ONLY enquiry."EnquiryType" ALTER COLUMN "EnquiryTypeId" SET DEFAULT nextval('enquiry."EnquiryType_EnquiryTypeId_seq"'::regclass);
 M   ALTER TABLE enquiry."EnquiryType" ALTER COLUMN "EnquiryTypeId" DROP DEFAULT;
       enquiry          postgres    false    248    249    249            �           2604    103597    MainEnquiry EnquiryId    DEFAULT     �   ALTER TABLE ONLY enquiry."MainEnquiry" ALTER COLUMN "EnquiryId" SET DEFAULT nextval('enquiry."MainEnquiry_EnquiryId_seq"'::regclass);
 I   ALTER TABLE enquiry."MainEnquiry" ALTER COLUMN "EnquiryId" DROP DEFAULT;
       enquiry          postgres    false    264    265    265            �           2604    103598 /   businessCityForCompany BusinessCityForCompanyID    DEFAULT     �   ALTER TABLE ONLY location."businessCityForCompany" ALTER COLUMN "BusinessCityForCompanyID" SET DEFAULT nextval('location."businessCityForCompany_BusinessCityForCompanyID_seq"'::regclass);
 d   ALTER TABLE location."businessCityForCompany" ALTER COLUMN "BusinessCityForCompanyID" DROP DEFAULT;
       location          postgres    false    287    286            �           2604    103599    stateinfo StateID    DEFAULT     ~   ALTER TABLE ONLY location.stateinfo ALTER COLUMN "StateID" SET DEFAULT nextval('location."stateinfo_StateID_seq"'::regclass);
 D   ALTER TABLE location.stateinfo ALTER COLUMN "StateID" DROP DEFAULT;
       location          postgres    false    292    291            �           2604    103601    Notification NotificationID    DEFAULT     �   ALTER TABLE ONLY notification."Notification" ALTER COLUMN "NotificationID" SET DEFAULT nextval('notification."Notification_NotificationID_seq"'::regclass);
 T   ALTER TABLE notification."Notification" ALTER COLUMN "NotificationID" DROP DEFAULT;
       notification          postgres    false    294    293            �           2604    103602    CompanyExecutiveMasterList id    DEFAULT     �   ALTER TABLE ONLY "position"."CompanyExecutiveMasterList" ALTER COLUMN id SET DEFAULT nextval('"position"."CompanyExecutiveMasterList_id_seq"'::regclass);
 R   ALTER TABLE "position"."CompanyExecutiveMasterList" ALTER COLUMN id DROP DEFAULT;
       position          postgres    false    238    239    239            �           2604    103603    Positions id    DEFAULT     x   ALTER TABLE ONLY "position"."Positions" ALTER COLUMN id SET DEFAULT nextval('"position"."Positions_id_seq"'::regclass);
 A   ALTER TABLE "position"."Positions" ALTER COLUMN id DROP DEFAULT;
       position          postgres    false    237    236    237            �           2604    103604    Priority PriorityId    DEFAULT     �   ALTER TABLE ONLY priority."Priority" ALTER COLUMN "PriorityId" SET DEFAULT nextval('priority."Priority_PriorityId_seq"'::regclass);
 H   ALTER TABLE priority."Priority" ALTER COLUMN "PriorityId" DROP DEFAULT;
       priority          postgres    false    251    250    251            �           2604    103605 
   Product id    DEFAULT     n   ALTER TABLE ONLY product."Product" ALTER COLUMN id SET DEFAULT nextval('product."Product_id_seq"'::regclass);
 <   ALTER TABLE product."Product" ALTER COLUMN id DROP DEFAULT;
       product          postgres    false    230    231    231            �           2604    103606    CRMAccessList CRMAccessListId    DEFAULT     �   ALTER TABLE ONLY public."CRMAccessList" ALTER COLUMN "CRMAccessListId" SET DEFAULT nextval('public."CRMAccessList_CRMAccessListId_seq"'::regclass);
 P   ALTER TABLE public."CRMAccessList" ALTER COLUMN "CRMAccessListId" DROP DEFAULT;
       public          postgres    false    282    283    283            �           2604    103607    EmailPurpose EmailPurposeId    DEFAULT     �   ALTER TABLE ONLY purposes."EmailPurpose" ALTER COLUMN "EmailPurposeId" SET DEFAULT nextval('purposes."EmailPurpose_EmailPurposeId_seq"'::regclass);
 P   ALTER TABLE purposes."EmailPurpose" ALTER COLUMN "EmailPurposeId" DROP DEFAULT;
       purposes          postgres    false    279    278    279            �           2604    103608    Status StatusId    DEFAULT     x   ALTER TABLE ONLY status."Status" ALTER COLUMN "StatusId" SET DEFAULT nextval('status."Status_StatusId_seq"'::regclass);
 B   ALTER TABLE status."Status" ALTER COLUMN "StatusId" DROP DEFAULT;
       status          postgres    false    244    245    245            �           2604    103609    MainTicket TicketId    DEFAULT     �   ALTER TABLE ONLY ticket."MainTicket" ALTER COLUMN "TicketId" SET DEFAULT nextval('ticket."MainTicket_TicketId_seq"'::regclass);
 F   ALTER TABLE ticket."MainTicket" ALTER COLUMN "TicketId" DROP DEFAULT;
       ticket          postgres    false    253    252    253            �           2604    103610 #   TicketAccessList TicketAccessListId    DEFAULT     �   ALTER TABLE ONLY ticket."TicketAccessList" ALTER COLUMN "TicketAccessListId" SET DEFAULT nextval('ticket."TicketAccessList_TicketAccessListId_seq"'::regclass);
 V   ALTER TABLE ticket."TicketAccessList" ALTER COLUMN "TicketAccessListId" DROP DEFAULT;
       ticket          postgres    false    257    256    257            �           2604    103611 /   TicketDateAndTimelines TicketDateAndTimelinesId    DEFAULT     �   ALTER TABLE ONLY ticket."TicketDateAndTimelines" ALTER COLUMN "TicketDateAndTimelinesId" SET DEFAULT nextval('ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq"'::regclass);
 b   ALTER TABLE ticket."TicketDateAndTimelines" ALTER COLUMN "TicketDateAndTimelinesId" DROP DEFAULT;
       ticket          postgres    false    259    258    259            �           2604    103612 )   TicketFollowupDates TicketFollowupDatesId    DEFAULT     �   ALTER TABLE ONLY ticket."TicketFollowupDates" ALTER COLUMN "TicketFollowupDatesId" SET DEFAULT nextval('ticket."TicketFollowupDates_TicketFollowupDatesId_seq"'::regclass);
 \   ALTER TABLE ticket."TicketFollowupDates" ALTER COLUMN "TicketFollowupDatesId" DROP DEFAULT;
       ticket          postgres    false    261    260    261            �           2604    103613    TicketMetaData TicketMetaDataId    DEFAULT     �   ALTER TABLE ONLY ticket."TicketMetaData" ALTER COLUMN "TicketMetaDataId" SET DEFAULT nextval('ticket."TicketMetaData_TicketMetaDataId_seq"'::regclass);
 R   ALTER TABLE ticket."TicketMetaData" ALTER COLUMN "TicketMetaDataId" DROP DEFAULT;
       ticket          postgres    false    262    263    263            �           2604    103614    TicketStatus TicketStatusId    DEFAULT     �   ALTER TABLE ONLY ticket."TicketStatus" ALTER COLUMN "TicketStatusId" SET DEFAULT nextval('ticket."TicketStatus_TicketStatusId_seq"'::regclass);
 N   ALTER TABLE ticket."TicketStatus" ALTER COLUMN "TicketStatusId" DROP DEFAULT;
       ticket          postgres    false    254    255    255            g          0    50931    CallTransaction 
   TABLE DATA           �   COPY "callTransactions"."CallTransaction" ("CallTransactionId", "ClientId", "CompanyExecutiveId", "ClientNameOnExecutiveContactList", "ClientContactNumber", "CallType", "TalkDuration", "CallTime", "FileURL", "MarkForDelete", "FilePath") FROM stdin;
    callTransactions          postgres    false    229   ��      s          0    67554    Client 
   TABLE DATA           �   COPY client."Client" ("ClientId", "ContactName", "ContactPerson", "EmailId", "ContactNumber", "CompanyId", "ClientLocationId", "CreatedOn", "LastEditOn", "CreatedBy", "LastEditBy", "isActive", "MarkForDelete") FROM stdin;
    client          postgres    false    241   ��      u          0    67565    ClientLocation 
   TABLE DATA             COPY client."ClientLocation" ("ClientLocationId", "Country", "State", "City", "Area", "AddressLine1", "AddressLine2", "AddressLine3", pincode, latitude, longitude, "CreatedOn", "LastEditOn", "CreatedBy", "LastEditBy", "isActive", "MarkForDelete") FROM stdin;
    client          postgres    false    243   �      V          0    49878    Company 
   TABLE DATA           �   COPY company."Company" ("CompanyCode", "CompanyName", "OwnerContactId", "CompanyAddress", "CityId", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditedOn", "LastEditedBy", "LastEditDeviceType", "MarkForDelete", "CompanyId") FROM stdin;
    company          postgres    false    212   .�      X          0    49929    CompanyAddressDetails 
   TABLE DATA           =  COPY company."CompanyAddressDetails" ("AddressLine1", "AddressLine2", "AddressLine3", "Pincode", "CityID", "StateID", "CountryID", "Latitude", "Longitude", "GeoLocation", "CreatedOn", "CreatedBy", "CreatedDeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete", "CompanyAddressID") FROM stdin;
    company          postgres    false    214   K�      ]          0    50012    CompanyArea 
   TABLE DATA             COPY company."CompanyArea" ("CompanyAreaCode", "CompanyAreaDescription", "CompanyAreaID", "CompanyAreaName", "CompanyID", "CompanyRegionID", "CreatedBy", "CreatedOn", "DeviceType", "IsActive", "LastEditBy", "LastEditDeviceType", "LastEditOn", "MarkForDelete") FROM stdin;
    company          postgres    false    219   h�      _          0    50050    CompanyBranch 
   TABLE DATA           _  COPY company."CompanyBranch" ("CompanyBranchName", "CompanyBranchCode", "CompanyRegionID", "CompanyAreaID", "CompanyID", "CompanyBranchType", "CompanyBranchAddressID", "CompanyBranchPrimaryContactID", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete", "CompanyBranchID") FROM stdin;
    company          postgres    false    221   ��      c          0    50142    CompanyBranchAddressDetails 
   TABLE DATA           I  COPY company."CompanyBranchAddressDetails" ("CompanyBranchAddressID", "AddressLine1", "AddressLine2", "AddressLine3", "Pincode", "CityID", "StateID", "CountryID", "Latitude", "Longitude", "GeoLocation", "CreatedOn", "CreatedBy", "CreatedDeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete") FROM stdin;
    company          postgres    false    225   ��      y          0    67702    CompanyBranchType 
   TABLE DATA           �   COPY company."CompanyBranchType" ("CompanyBranchTypeId", "CompanyBranchTypeName", "CompanyId", "CompanyBranchPosition", "CreatedBy", "CreatedOn", "LastEditBy", "LastEditOn", "MarkForDelete") FROM stdin;
    company          postgres    false    247   ��      a          0    50102    CompanyExecutive 
   TABLE DATA           !  COPY company."CompanyExecutive" ("CompanyExecutiveID", "ExecutiveName", "LoginID", "Password", "CompanyBranchID", "BaseCityID", "CompanyID", "ContactNumber", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete") FROM stdin;
    company          postgres    false    223   ��      m          0    59579    CompanyExecutivePL 
   TABLE DATA           [   COPY company."CompanyExecutivePL" (id, "executiveId", "PLRate", "dateOfEntry") FROM stdin;
    company          postgres    false    235   ��      [          0    49976    CompanyRegion 
   TABLE DATA             COPY company."CompanyRegion" ("CompanyRegionID", "CompanyRegionName", "CompanyRegionCode", "CompanyRegionDescription", "CompanyID", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete") FROM stdin;
    company          postgres    false    217   �      �          0    68235    CompanyExecutiveGeoLocation 
   TABLE DATA             COPY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" ("CompanyExecutiveGeoLocationId", "Latitude", "Longitude", "CompanyExecutiveId", "CompanyExecutiveName", "CompanyId", "CompanyName", "EntryDateAndTime", "CompanyExecutiveGeoLocationAddressId") FROM stdin;
    companyExecutiveGeoLocation          postgres    false    277   3�      �          0    68224 "   CompanyExecutiveGeoLocationAddress 
   TABLE DATA           �   COPY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" ("CompanyExecutiveGeoLocationAddressId", "Country", "State", "City", "Area", "AddressLine1", "AddressLine2", "AddressLine3", "Pincode") FROM stdin;
    companyExecutiveGeoLocation          postgres    false    275   P�      �          0    77471    EnquiryAccessList 
   TABLE DATA           �   COPY enquiry."EnquiryAccessList" ("EnquiryAccessListId", "EnquiryId", "CompanyExecutiveId", "CompanyExecutiveName", "AccessApplicationTime", "MarkForDelete") FROM stdin;
    enquiry          postgres    false    281   m�      �          0    67968    EnquiryClient 
   TABLE DATA           �   COPY enquiry."EnquiryClient" ("EnquiryClientId", "EnquiryId", "ClientName", "ContactPerson", "EmailId", "ContactNumber", "ClientId") FROM stdin;
    enquiry          postgres    false    267   ��      �          0    68120    EnquiryDateAndTimelines 
   TABLE DATA           �   COPY enquiry."EnquiryDateAndTimelines" ("EnquiryDateAndTimelinesId", "EnquiryId", "startDateAndTime", "deadlineDateAndTime") FROM stdin;
    enquiry          postgres    false    273   ��      �          0    67979    EnquiryLocation 
   TABLE DATA             COPY enquiry."EnquiryLocation" ("EnquiryLocationId", "EnquiryId", "CountryId", "CountryName", "StateId", "StateName", "CityId", "CityName", "AreaId", "AreaName", "AddressLine1", "AddressLine2", "AddressLine3", "Pincode", "Latitude", "Longitude") FROM stdin;
    enquiry          postgres    false    269   ��      �          0    67990    EnquiryProductList 
   TABLE DATA           �   COPY enquiry."EnquiryProductList" ("EnquiryProductListId", "EnquiryId", "ProductId", "ProductName", "ProductCharges", "MarkForDelete") FROM stdin;
    enquiry          postgres    false    271   ��      {          0    67728    EnquiryType 
   TABLE DATA           �   COPY enquiry."EnquiryType" ("EnquiryTypeId", "EnquiryTypeName", "EnquiryTypeColorCode", "CompanyId", "CreatedBy", "CreatedOn", "LastEditBy", "LastEditOn", "MarkForDelete") FROM stdin;
    enquiry          postgres    false    249   ��      �          0    67956    MainEnquiry 
   TABLE DATA           �   COPY enquiry."MainEnquiry" ("EnquiryId", "CompanyId", "CompanyName", "EnquiryRemarks", "CreatedBy", "CreatedOn", "LastEditBy", "LastEditOn", "MarkForDelete", "EnquiryType", "EnquiryTypeName") FROM stdin;
    enquiry          postgres    false    265   �      �          0    78016    areainfo 
   TABLE DATA           �   COPY location.areainfo ("AreaName", "AreaCode", "AreaID", "MarkForDelete", "AreaDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "CountryID", "StateID", "CityID") FROM stdin;
    location          postgres    false    285   8�      �          0    78032    businessAreaForCompany 
   TABLE DATA           �   COPY location."businessAreaForCompany" ("BusinessAreaForCompanyID", "CompanyID", "AreaID", "CityID", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete") FROM stdin;
    location          postgres    false    288   U�      �          0    78025    businessCityForCompany 
   TABLE DATA           �   COPY location."businessCityForCompany" ("BusinessCityForCompanyID", "CompanyID", "CityID", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "MarkForDelete") FROM stdin;
    location          postgres    false    286   r�      �          0    78038    cityinfo 
   TABLE DATA           �   COPY location.cityinfo ("CityName", "CityCode", "CityID", "MarkForDelete", "CityDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "CountryID", "StateID") FROM stdin;
    location          postgres    false    289   ��      �          0    78047    countryinfo 
   TABLE DATA           �   COPY location.countryinfo ("CountryName", "CountryCode", "CountryID", "MarkForDelete", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType") FROM stdin;
    location          postgres    false    290   ��      �          0    78056 	   stateinfo 
   TABLE DATA           �   COPY location.stateinfo ("StateName", "StateCode", "MarkForDelete", "StateDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "CountryID", "StateID") FROM stdin;
    location          postgres    false    291   ��      �          0    78679    Notification 
   TABLE DATA           �   COPY notification."Notification" ("CompanyExecutiveID", "CompanyExecutiveName", "NotificationSubject", "NotificationDescription", "ReadIndex", "NotificationTime", "MarkForDelete", "JustArrived", "NotificationID") FROM stdin;
    notification          postgres    false    293   ^�      k          0    59535    OwnerContact 
   TABLE DATA           �   COPY owner."OwnerContact" (id, "ownerName", "ownerContact", "ownerEmail", "SecretKey", "UserName", "Password", "LastEditOn", "CreatedOn", "isActive", "MarkForDelete") FROM stdin;
    owner          postgres    false    233   {�      q          0    67438    CompanyExecutiveMasterList 
   TABLE DATA           �   COPY "position"."CompanyExecutiveMasterList" (id, "Company", "CompanyBranch", "CompanyExecutive", "Client", "Product", "Location", "Enquiry", "Ticket", "Position") FROM stdin;
    position          postgres    false    239   ��      o          0    67417 	   Positions 
   TABLE DATA           �   COPY "position"."Positions" (id, "PositionName", "PositionPriority", "CompanyId", "ExecutiveMasterId", "LastEditBy", "LastEditOn", "CreatedBy", "CreatedOn", "isActive", "MarkForDelete") FROM stdin;
    position          postgres    false    237   ��      }          0    67752    Priority 
   TABLE DATA           X   COPY priority."Priority" ("PriorityId", "PriorityName", "PriorityPosition") FROM stdin;
    priority          postgres    false    251   ��      i          0    59413    Product 
   TABLE DATA           �   COPY product."Product" (id, "productName", "productDescription", "companyId", cost, "LastEditBy", "LastEditOn", "CreatedBy", "CreatedOn", "isActive", "MarkForDelete") FROM stdin;
    product          postgres    false    231   �      �          0    77488    CRMAccessList 
   TABLE DATA           �   COPY public."CRMAccessList" ("CRMAccessListId", "CorrespondingId", "OwnerFlag", "MarkForDelete", "CorrespondingName", "CorrespondingPosition", "CorrespondingEmailId", "CorrespondingContactNumber", "CorrespondingPassword") FROM stdin;
    public          postgres    false    283   6�      �          0    75854    EmailPurpose 
   TABLE DATA           l   COPY purposes."EmailPurpose" ("EmailPurposeId", "EmailPurposeTitle", "EmailPurposeDescription") FROM stdin;
    purposes          postgres    false    279   S�      w          0    67680    Status 
   TABLE DATA           �   COPY status."Status" ("StatusId", "StatusName", "StatusColorCode", "WorkProgress", "CompanyId", "CreatedBy", "CreatedOn", "LastEditBy", "LastEditOn", "MarkForDelete") FROM stdin;
    status          postgres    false    245   ��                0    67766 
   MainTicket 
   TABLE DATA           �   COPY ticket."MainTicket" ("TicketId", "EnquiryId", "EnquiryRemarks", "TicketRemarks", "CreatedBy", "CreatedOn", "LastEditBy", "LastEditOn", "MarkForDelete") FROM stdin;
    ticket          postgres    false    253   �      �          0    67799    TicketAccessList 
   TABLE DATA           �   COPY ticket."TicketAccessList" ("TicketAccessListId", "TicketId", "CompanyExecutiveId", "CompanyExecutiveName", "AccessApplicationTime", "MarkForDelete") FROM stdin;
    ticket          postgres    false    257   #�      �          0    67826    TicketDateAndTimelines 
   TABLE DATA           �   COPY ticket."TicketDateAndTimelines" ("TicketDateAndTimelinesId", "TicketId", "StartDateAndTime", "DeadlineDateAndTime") FROM stdin;
    ticket          postgres    false    259   @�      �          0    67839    TicketFollowupDates 
   TABLE DATA           |   COPY ticket."TicketFollowupDates" ("TicketFollowupDatesId", "TicketId", "FollowupDateAndTime", "MarkForDelete") FROM stdin;
    ticket          postgres    false    261   ]�      �          0    67853    TicketMetaData 
   TABLE DATA           �   COPY ticket."TicketMetaData" ("TicketMetaDataId", "TicketId", "ProductId", "ProductName", "TicketType", "TicketTypeName", "TicketPriority", "TicketPriorityName", "CompanyId", "CompanyName") FROM stdin;
    ticket          postgres    false    263   z�      �          0    67778    TicketStatus 
   TABLE DATA           |   COPY ticket."TicketStatus" ("TicketStatusId", "TicketId", "StatusId", "StatusName", "LastEditBy", "LastEditOn") FROM stdin;
    ticket          postgres    false    255   ��      �           0    0 %   CallTransaction_CallTransactionId_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('"callTransactions"."CallTransaction_CallTransactionId_seq"', 101, true);
          callTransactions          postgres    false    226            �           0    0    CallTransaction_ClientId_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('"callTransactions"."CallTransaction_ClientId_seq"', 1, false);
          callTransactions          postgres    false    227            �           0    0 &   CallTransaction_CompanyExecutiveId_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('"callTransactions"."CallTransaction_CompanyExecutiveId_seq"', 1, false);
          callTransactions          postgres    false    228            �           0    0 #   ClientLocation_ClientLocationId_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('client."ClientLocation_ClientLocationId_seq"', 52, true);
          client          postgres    false    242            �           0    0    Client_ClientId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('client."Client_ClientId_seq"', 52, true);
          client          postgres    false    240            �           0    0 *   CompanyAddressDetails_CompanyAddressID_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('company."CompanyAddressDetails_CompanyAddressID_seq"', 6, true);
          company          postgres    false    215            �           0    0    CompanyArea_CompanyAreaID_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('company."CompanyArea_CompanyAreaID_seq"', 13, true);
          company          postgres    false    218            �           0    0 6   CompanyBranchAddressDetails_CompanyBranchAddressID_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq"', 173, true);
          company          postgres    false    224            �           0    0 )   CompanyBranchType_CompanyBranchTypeId_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('company."CompanyBranchType_CompanyBranchTypeId_seq"', 21, true);
          company          postgres    false    246            �           0    0 !   CompanyBranch_CompanyBranchID_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('company."CompanyBranch_CompanyBranchID_seq"', 174, true);
          company          postgres    false    220            �           0    0    CompanyExecutivePL_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('company."CompanyExecutivePL_id_seq"', 21, true);
          company          postgres    false    234            �           0    0     CompanyExecutive_ExecutiveID_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('company."CompanyExecutive_ExecutiveID_seq"', 209, true);
          company          postgres    false    222            �           0    0 !   CompanyRegion_CompanyRegionID_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('company."CompanyRegion_CompanyRegionID_seq"', 183, true);
          company          postgres    false    216            �           0    0    Company_CompanyId_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('company."Company_CompanyId_seq"', 148, true);
          company          postgres    false    213            �           0    0 ?   CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq    SEQUENCE SET     �   SELECT pg_catalog.setval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq"', 48, true);
          companyExecutiveGeoLocation          postgres    false    274            �           0    0 =   CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq    SEQUENCE SET     �   SELECT pg_catalog.setval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq"', 48, true);
          companyExecutiveGeoLocation          postgres    false    276            �           0    0 )   EnquiryAccessList_EnquiryAccessListId_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('enquiry."EnquiryAccessList_EnquiryAccessListId_seq"', 99, true);
          enquiry          postgres    false    280            �           0    0 !   EnquiryClient_EnquiryClientId_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('enquiry."EnquiryClient_EnquiryClientId_seq"', 98, true);
          enquiry          postgres    false    266            �           0    0 5   EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq"', 93, true);
          enquiry          postgres    false    272            �           0    0 %   EnquiryLocation_EnquiryLocationId_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('enquiry."EnquiryLocation_EnquiryLocationId_seq"', 98, true);
          enquiry          postgres    false    268            �           0    0 +   EnquiryProductList_EnquiryProductListId_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('enquiry."EnquiryProductList_EnquiryProductListId_seq"', 240, true);
          enquiry          postgres    false    270            �           0    0    EnquiryType_EnquiryTypeId_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('enquiry."EnquiryType_EnquiryTypeId_seq"', 14, true);
          enquiry          postgres    false    248            �           0    0    MainEnquiry_EnquiryId_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('enquiry."MainEnquiry_EnquiryId_seq"', 98, true);
          enquiry          postgres    false    264            �           0    0 3   businessCityForCompany_BusinessCityForCompanyID_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('location."businessCityForCompany_BusinessCityForCompanyID_seq"', 24, true);
          location          postgres    false    287            �           0    0    seq_id    SEQUENCE SET     8   SELECT pg_catalog.setval('location.seq_id', 128, true);
          location          postgres    false    284            �           0    0    stateinfo_StateID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('location."stateinfo_StateID_seq"', 5, true);
          location          postgres    false    292            �           0    0    Notification_NotificationID_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('notification."Notification_NotificationID_seq"', 420, true);
          notification          postgres    false    294            �           0    0    OwnerContact_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('owner."OwnerContact_id_seq"', 6, true);
          owner          postgres    false    232            �           0    0 !   CompanyExecutiveMasterList_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"position"."CompanyExecutiveMasterList_id_seq"', 46, true);
          position          postgres    false    238            �           0    0    Positions_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"position"."Positions_id_seq"', 37, true);
          position          postgres    false    236            �           0    0    Priority_PriorityId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('priority."Priority_PriorityId_seq"', 4, true);
          priority          postgres    false    250            �           0    0    Product_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('product."Product_id_seq"', 22, true);
          product          postgres    false    230            �           0    0 !   CRMAccessList_CRMAccessListId_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."CRMAccessList_CRMAccessListId_seq"', 66, true);
          public          postgres    false    282            �           0    0    EmailPurpose_EmailPurposeId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('purposes."EmailPurpose_EmailPurposeId_seq"', 2, true);
          purposes          postgres    false    278            �           0    0    Status_StatusId_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('status."Status_StatusId_seq"', 26, true);
          status          postgres    false    244            �           0    0    MainTicket_TicketId_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('ticket."MainTicket_TicketId_seq"', 238, true);
          ticket          postgres    false    252            �           0    0 '   TicketAccessList_TicketAccessListId_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('ticket."TicketAccessList_TicketAccessListId_seq"', 360, true);
          ticket          postgres    false    256            �           0    0 3   TicketDateAndTimelines_TicketDateAndTimelinesId_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq"', 238, true);
          ticket          postgres    false    258            �           0    0 -   TicketFollowupDates_TicketFollowupDatesId_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('ticket."TicketFollowupDates_TicketFollowupDatesId_seq"', 28, true);
          ticket          postgres    false    260            �           0    0 #   TicketMetaData_TicketMetaDataId_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('ticket."TicketMetaData_TicketMetaDataId_seq"', 238, true);
          ticket          postgres    false    262            �           0    0    TicketStatus_TicketStatusId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('ticket."TicketStatus_TicketStatusId_seq"', 276, true);
          ticket          postgres    false    254            �           2606    50942 $   CallTransaction callTransaction_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "callTransactions"."CallTransaction"
    ADD CONSTRAINT "callTransaction_pkey" PRIMARY KEY ("CallTransactionId");
 ^   ALTER TABLE ONLY "callTransactions"."CallTransaction" DROP CONSTRAINT "callTransaction_pkey";
       callTransactions            postgres    false    229                       2606    67562    Client PK_Client 
   CONSTRAINT     Z   ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "PK_Client" PRIMARY KEY ("ClientId");
 >   ALTER TABLE ONLY client."Client" DROP CONSTRAINT "PK_Client";
       client            postgres    false    241                       2606    67573     ClientLocation PK_ClientLocation 
   CONSTRAINT     r   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "PK_ClientLocation" PRIMARY KEY ("ClientLocationId");
 N   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "PK_ClientLocation";
       client            postgres    false    243            �           2606    50020    CompanyArea CompanyArea_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "CompanyArea_pkey" PRIMARY KEY ("CompanyAreaID");
 K   ALTER TABLE ONLY company."CompanyArea" DROP CONSTRAINT "CompanyArea_pkey";
       company            postgres    false    219            �           2606    50058     CompanyBranch CompanyBranch_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "CompanyBranch_pkey" PRIMARY KEY ("CompanyBranchID");
 O   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "CompanyBranch_pkey";
       company            postgres    false    221            �           2606    50110 &   CompanyExecutive CompanyExecutive_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "CompanyExecutive_pkey" PRIMARY KEY ("CompanyExecutiveID");
 U   ALTER TABLE ONLY company."CompanyExecutive" DROP CONSTRAINT "CompanyExecutive_pkey";
       company            postgres    false    223            �           2606    49984     CompanyRegion CompanyRegion_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "CompanyRegion_pkey" PRIMARY KEY ("CompanyRegionID");
 O   ALTER TABLE ONLY company."CompanyRegion" DROP CONSTRAINT "CompanyRegion_pkey";
       company            postgres    false    217            �           2606    49898    Company PK_Company 
   CONSTRAINT     ^   ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "PK_Company" PRIMARY KEY ("CompanyId");
 A   ALTER TABLE ONLY company."Company" DROP CONSTRAINT "PK_Company";
       company            postgres    false    212            �           2606    49950 .   CompanyAddressDetails PK_CompanyAddressDetails 
   CONSTRAINT     �   ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "PK_CompanyAddressDetails" PRIMARY KEY ("CompanyAddressID");
 ]   ALTER TABLE ONLY company."CompanyAddressDetails" DROP CONSTRAINT "PK_CompanyAddressDetails";
       company            postgres    false    214            �           2606    50151 :   CompanyBranchAddressDetails PK_CompanyBranchAddressDetails 
   CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "PK_CompanyBranchAddressDetails" PRIMARY KEY ("CompanyBranchAddressID");
 i   ALTER TABLE ONLY company."CompanyBranchAddressDetails" DROP CONSTRAINT "PK_CompanyBranchAddressDetails";
       company            postgres    false    225                       2606    67711 &   CompanyBranchType PK_CompanyBranchType 
   CONSTRAINT     |   ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "PK_CompanyBranchType" PRIMARY KEY ("CompanyBranchTypeId");
 U   ALTER TABLE ONLY company."CompanyBranchType" DROP CONSTRAINT "PK_CompanyBranchType";
       company            postgres    false    247                       2606    59585 (   CompanyExecutivePL PK_CompanyExecutivePL 
   CONSTRAINT     k   ALTER TABLE ONLY company."CompanyExecutivePL"
    ADD CONSTRAINT "PK_CompanyExecutivePL" PRIMARY KEY (id);
 W   ALTER TABLE ONLY company."CompanyExecutivePL" DROP CONSTRAINT "PK_CompanyExecutivePL";
       company            postgres    false    235            V           2606    68243 :   CompanyExecutiveGeoLocation PK_CompanyExecutiveGeoLocation 
   CONSTRAINT     �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "PK_CompanyExecutiveGeoLocation" PRIMARY KEY ("CompanyExecutiveGeoLocationId");
    ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" DROP CONSTRAINT "PK_CompanyExecutiveGeoLocation";
       companyExecutiveGeoLocation            postgres    false    277            T           2606    68232 H   CompanyExecutiveGeoLocationAddress PK_CompanyExecutiveGeoLocationAddress 
   CONSTRAINT     �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"
    ADD CONSTRAINT "PK_CompanyExecutiveGeoLocationAddress" PRIMARY KEY ("CompanyExecutiveGeoLocationAddressId");
 �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" DROP CONSTRAINT "PK_CompanyExecutiveGeoLocationAddress";
       companyExecutiveGeoLocation            postgres    false    275            R           2606    68125 4   EnquiryDateAndTimelines EnquiryDateAndTimelines_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines"
    ADD CONSTRAINT "EnquiryDateAndTimelines_pkey" PRIMARY KEY ("EnquiryDateAndTimelinesId");
 c   ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines" DROP CONSTRAINT "EnquiryDateAndTimelines_pkey";
       enquiry            postgres    false    273            ]           2606    77480 &   EnquiryAccessList PK_EnquiryAccessList 
   CONSTRAINT     |   ALTER TABLE ONLY enquiry."EnquiryAccessList"
    ADD CONSTRAINT "PK_EnquiryAccessList" PRIMARY KEY ("EnquiryAccessListId");
 U   ALTER TABLE ONLY enquiry."EnquiryAccessList" DROP CONSTRAINT "PK_EnquiryAccessList";
       enquiry            postgres    false    281            C           2606    67976    EnquiryClient PK_EnquiryClient 
   CONSTRAINT     p   ALTER TABLE ONLY enquiry."EnquiryClient"
    ADD CONSTRAINT "PK_EnquiryClient" PRIMARY KEY ("EnquiryClientId");
 M   ALTER TABLE ONLY enquiry."EnquiryClient" DROP CONSTRAINT "PK_EnquiryClient";
       enquiry            postgres    false    267            G           2606    67987 "   EnquiryLocation PK_EnquiryLocation 
   CONSTRAINT     v   ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "PK_EnquiryLocation" PRIMARY KEY ("EnquiryLocationId");
 Q   ALTER TABLE ONLY enquiry."EnquiryLocation" DROP CONSTRAINT "PK_EnquiryLocation";
       enquiry            postgres    false    269            N           2606    67998 (   EnquiryProductList PK_EnquiryProductList 
   CONSTRAINT        ALTER TABLE ONLY enquiry."EnquiryProductList"
    ADD CONSTRAINT "PK_EnquiryProductList" PRIMARY KEY ("EnquiryProductListId");
 W   ALTER TABLE ONLY enquiry."EnquiryProductList" DROP CONSTRAINT "PK_EnquiryProductList";
       enquiry            postgres    false    271            "           2606    67737    EnquiryType PK_EnquiryType 
   CONSTRAINT     j   ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "PK_EnquiryType" PRIMARY KEY ("EnquiryTypeId");
 I   ALTER TABLE ONLY enquiry."EnquiryType" DROP CONSTRAINT "PK_EnquiryType";
       enquiry            postgres    false    249            =           2606    67965    MainEnquiry PK_MainEnquiry 
   CONSTRAINT     f   ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "PK_MainEnquiry" PRIMARY KEY ("EnquiryId");
 I   ALTER TABLE ONLY enquiry."MainEnquiry" DROP CONSTRAINT "PK_MainEnquiry";
       enquiry            postgres    false    265            n           2606    78069    cityinfo PK_cityinfo 
   CONSTRAINT     \   ALTER TABLE ONLY location.cityinfo
    ADD CONSTRAINT "PK_cityinfo" PRIMARY KEY ("CityID");
 B   ALTER TABLE ONLY location.cityinfo DROP CONSTRAINT "PK_cityinfo";
       location            postgres    false    289            p           2606    78071    countryinfo PK_countryinfo 
   CONSTRAINT     e   ALTER TABLE ONLY location.countryinfo
    ADD CONSTRAINT "PK_countryinfo" PRIMARY KEY ("CountryID");
 H   ALTER TABLE ONLY location.countryinfo DROP CONSTRAINT "PK_countryinfo";
       location            postgres    false    290            e           2606    78073    areainfo areainfo_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY location.areainfo
    ADD CONSTRAINT areainfo_pkey PRIMARY KEY ("AreaID");
 B   ALTER TABLE ONLY location.areainfo DROP CONSTRAINT areainfo_pkey;
       location            postgres    false    285            k           2606    78075 2   businessAreaForCompany businessAreaForCompany_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "businessAreaForCompany_pkey" PRIMARY KEY ("BusinessAreaForCompanyID");
 b   ALTER TABLE ONLY location."businessAreaForCompany" DROP CONSTRAINT "businessAreaForCompany_pkey";
       location            postgres    false    288            g           2606    78077 2   businessCityForCompany businessCityForCompany_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY location."businessCityForCompany"
    ADD CONSTRAINT "businessCityForCompany_pkey" PRIMARY KEY ("BusinessCityForCompanyID");
 b   ALTER TABLE ONLY location."businessCityForCompany" DROP CONSTRAINT "businessCityForCompany_pkey";
       location            postgres    false    286            r           2606    78079    stateinfo stateinfo_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY location.stateinfo
    ADD CONSTRAINT stateinfo_pkey PRIMARY KEY ("StateID");
 D   ALTER TABLE ONLY location.stateinfo DROP CONSTRAINT stateinfo_pkey;
       location            postgres    false    291            t           2606    86831    Notification PK_Notification 
   CONSTRAINT     r   ALTER TABLE ONLY notification."Notification"
    ADD CONSTRAINT "PK_Notification" PRIMARY KEY ("NotificationID");
 P   ALTER TABLE ONLY notification."Notification" DROP CONSTRAINT "PK_Notification";
       notification            postgres    false    293                       2606    59545    OwnerContact PK_OwnerContact 
   CONSTRAINT     ]   ALTER TABLE ONLY owner."OwnerContact"
    ADD CONSTRAINT "PK_OwnerContact" PRIMARY KEY (id);
 I   ALTER TABLE ONLY owner."OwnerContact" DROP CONSTRAINT "PK_OwnerContact";
       owner            postgres    false    233                       2606    67443 8   CompanyExecutiveMasterList PK_CompanyExecutiveMasterList 
   CONSTRAINT     ~   ALTER TABLE ONLY "position"."CompanyExecutiveMasterList"
    ADD CONSTRAINT "PK_CompanyExecutiveMasterList" PRIMARY KEY (id);
 j   ALTER TABLE ONLY "position"."CompanyExecutiveMasterList" DROP CONSTRAINT "PK_CompanyExecutiveMasterList";
       position            postgres    false    239                       2606    67427    Positions PK_Positions 
   CONSTRAINT     \   ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "PK_Positions" PRIMARY KEY (id);
 H   ALTER TABLE ONLY "position"."Positions" DROP CONSTRAINT "PK_Positions";
       position            postgres    false    237            %           2606    67760    Priority Priority_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY priority."Priority"
    ADD CONSTRAINT "Priority_pkey" PRIMARY KEY ("PriorityId");
 F   ALTER TABLE ONLY priority."Priority" DROP CONSTRAINT "Priority_pkey";
       priority            postgres    false    251            '           2606    78308    Priority U_PriorityPosition 
   CONSTRAINT     j   ALTER TABLE ONLY priority."Priority"
    ADD CONSTRAINT "U_PriorityPosition" UNIQUE ("PriorityPosition");
 K   ALTER TABLE ONLY priority."Priority" DROP CONSTRAINT "U_PriorityPosition";
       priority            postgres    false    251                       2606    59421    Product PK_Product 
   CONSTRAINT     U   ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "PK_Product" PRIMARY KEY (id);
 A   ALTER TABLE ONLY product."Product" DROP CONSTRAINT "PK_Product";
       product            postgres    false    231            a           2606    77493     CRMAccessList CRMAccessList_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."CRMAccessList"
    ADD CONSTRAINT "CRMAccessList_pkey" PRIMARY KEY ("CRMAccessListId");
 N   ALTER TABLE ONLY public."CRMAccessList" DROP CONSTRAINT "CRMAccessList_pkey";
       public            postgres    false    283            c           2606    77668    CRMAccessList U_CorrespondingId 
   CONSTRAINT     k   ALTER TABLE ONLY public."CRMAccessList"
    ADD CONSTRAINT "U_CorrespondingId" UNIQUE ("CorrespondingId");
 M   ALTER TABLE ONLY public."CRMAccessList" DROP CONSTRAINT "U_CorrespondingId";
       public            postgres    false    283            [           2606    75862    EmailPurpose EmailPurpose_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY purposes."EmailPurpose"
    ADD CONSTRAINT "EmailPurpose_pkey" PRIMARY KEY ("EmailPurposeId");
 N   ALTER TABLE ONLY purposes."EmailPurpose" DROP CONSTRAINT "EmailPurpose_pkey";
       purposes            postgres    false    279                       2606    67689    Status PK_Status 
   CONSTRAINT     Z   ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "PK_Status" PRIMARY KEY ("StatusId");
 >   ALTER TABLE ONLY status."Status" DROP CONSTRAINT "PK_Status";
       status            postgres    false    245            )           2606    67775    MainTicket PK_MainTicket 
   CONSTRAINT     b   ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "PK_MainTicket" PRIMARY KEY ("TicketId");
 F   ALTER TABLE ONLY ticket."MainTicket" DROP CONSTRAINT "PK_MainTicket";
       ticket            postgres    false    253            0           2606    67807 $   TicketAccessList PK_TicketAccessList 
   CONSTRAINT     x   ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "PK_TicketAccessList" PRIMARY KEY ("TicketAccessListId");
 R   ALTER TABLE ONLY ticket."TicketAccessList" DROP CONSTRAINT "PK_TicketAccessList";
       ticket            postgres    false    257            3           2606    67831 0   TicketDateAndTimelines PK_TicketDateAndTimelines 
   CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketDateAndTimelines"
    ADD CONSTRAINT "PK_TicketDateAndTimelines" PRIMARY KEY ("TicketDateAndTimelinesId");
 ^   ALTER TABLE ONLY ticket."TicketDateAndTimelines" DROP CONSTRAINT "PK_TicketDateAndTimelines";
       ticket            postgres    false    259            5           2606    67845 *   TicketFollowupDates PK_TicketFollowupDates 
   CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketFollowupDates"
    ADD CONSTRAINT "PK_TicketFollowupDates" PRIMARY KEY ("TicketFollowupDatesId");
 X   ALTER TABLE ONLY ticket."TicketFollowupDates" DROP CONSTRAINT "PK_TicketFollowupDates";
       ticket            postgres    false    261            7           2606    67861     TicketMetaData PK_TicketMetaData 
   CONSTRAINT     r   ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "PK_TicketMetaData" PRIMARY KEY ("TicketMetaDataId");
 N   ALTER TABLE ONLY ticket."TicketMetaData" DROP CONSTRAINT "PK_TicketMetaData";
       ticket            postgres    false    263            .           2606    67786    TicketStatus PK_TicketStatus 
   CONSTRAINT     l   ALTER TABLE ONLY ticket."TicketStatus"
    ADD CONSTRAINT "PK_TicketStatus" PRIMARY KEY ("TicketStatusId");
 J   ALTER TABLE ONLY ticket."TicketStatus" DROP CONSTRAINT "PK_TicketStatus";
       ticket            postgres    false    255                        1259    76845    fki_FK_CallTransaction_ClientId    INDEX     q   CREATE INDEX "fki_FK_CallTransaction_ClientId" ON "callTransactions"."CallTransaction" USING btree ("ClientId");
 A   DROP INDEX "callTransactions"."fki_FK_CallTransaction_ClientId";
       callTransactions            postgres    false    229                       1259    76851 '   fki_FK_CallTransaction_CompanyExecutive    INDEX     �   CREATE INDEX "fki_FK_CallTransaction_CompanyExecutive" ON "callTransactions"."CallTransaction" USING btree ("CompanyExecutiveId");
 I   DROP INDEX "callTransactions"."fki_FK_CallTransaction_CompanyExecutive";
       callTransactions            postgres    false    229                       1259    67674    fki_FK_ClientLocation_Area    INDEX     [   CREATE INDEX "fki_FK_ClientLocation_Area" ON client."ClientLocation" USING btree ("Area");
 0   DROP INDEX client."fki_FK_ClientLocation_Area";
       client            postgres    false    243                       1259    67668    fki_FK_ClientLocation_City    INDEX     [   CREATE INDEX "fki_FK_ClientLocation_City" ON client."ClientLocation" USING btree ("City");
 0   DROP INDEX client."fki_FK_ClientLocation_City";
       client            postgres    false    243                       1259    67656    fki_FK_ClientLocation_Country    INDEX     a   CREATE INDEX "fki_FK_ClientLocation_Country" ON client."ClientLocation" USING btree ("Country");
 3   DROP INDEX client."fki_FK_ClientLocation_Country";
       client            postgres    false    243                       1259    67662    fki_FK_ClientLocation_State    INDEX     ]   CREATE INDEX "fki_FK_ClientLocation_State" ON client."ClientLocation" USING btree ("State");
 1   DROP INDEX client."fki_FK_ClientLocation_State";
       client            postgres    false    243                       1259    67650    fki_FK_Client_Company    INDEX     S   CREATE INDEX "fki_FK_Client_Company" ON client."Client" USING btree ("CompanyId");
 +   DROP INDEX client."fki_FK_Client_Company";
       client            postgres    false    241                       1259    76857    fki_FK_CreatedBy    INDEX     N   CREATE INDEX "fki_FK_CreatedBy" ON client."Client" USING btree ("CreatedBy");
 &   DROP INDEX client."fki_FK_CreatedBy";
       client            postgres    false    241                       1259    76863    fki_FK_LastEditBy    INDEX     P   CREATE INDEX "fki_FK_LastEditBy" ON client."Client" USING btree ("LastEditBy");
 '   DROP INDEX client."fki_FK_LastEditBy";
       client            postgres    false    241            �           1259    50339 !   fki_FK_CompanyAddressDetails_City    INDEX     l   CREATE INDEX "fki_FK_CompanyAddressDetails_City" ON company."CompanyAddressDetails" USING btree ("CityID");
 8   DROP INDEX company."fki_FK_CompanyAddressDetails_City";
       company            postgres    false    214            �           1259    50327 $   fki_FK_CompanyAddressDetails_Country    INDEX     r   CREATE INDEX "fki_FK_CompanyAddressDetails_Country" ON company."CompanyAddressDetails" USING btree ("CountryID");
 ;   DROP INDEX company."fki_FK_CompanyAddressDetails_Country";
       company            postgres    false    214            �           1259    50333 "   fki_FK_CompanyAddressDetails_State    INDEX     n   CREATE INDEX "fki_FK_CompanyAddressDetails_State" ON company."CompanyAddressDetails" USING btree ("StateID");
 9   DROP INDEX company."fki_FK_CompanyAddressDetails_State";
       company            postgres    false    214            �           1259    50028 #   fki_FK_CompanyAddress_CompanyRegion    INDEX     m   CREATE INDEX "fki_FK_CompanyAddress_CompanyRegion" ON company."CompanyArea" USING btree ("CompanyRegionID");
 :   DROP INDEX company."fki_FK_CompanyAddress_CompanyRegion";
       company            postgres    false    219            �           1259    50070    fki_FK_CompanyArea_Company    INDEX     ^   CREATE INDEX "fki_FK_CompanyArea_Company" ON company."CompanyArea" USING btree ("CompanyID");
 1   DROP INDEX company."fki_FK_CompanyArea_Company";
       company            postgres    false    219            �           1259    50064    fki_FK_CompanyBranch    INDEX     Z   CREATE INDEX "fki_FK_CompanyBranch" ON company."CompanyBranch" USING btree ("CompanyID");
 +   DROP INDEX company."fki_FK_CompanyBranch";
       company            postgres    false    221            �           1259    50350 '   fki_FK_CompanyBranchAddressDetails_City    INDEX     x   CREATE INDEX "fki_FK_CompanyBranchAddressDetails_City" ON company."CompanyBranchAddressDetails" USING btree ("CityID");
 >   DROP INDEX company."fki_FK_CompanyBranchAddressDetails_City";
       company            postgres    false    225            �           1259    50362 *   fki_FK_CompanyBranchAddressDetails_Country    INDEX     ~   CREATE INDEX "fki_FK_CompanyBranchAddressDetails_Country" ON company."CompanyBranchAddressDetails" USING btree ("CountryID");
 A   DROP INDEX company."fki_FK_CompanyBranchAddressDetails_Country";
       company            postgres    false    225            �           1259    50356 (   fki_FK_CompanyBranchAddressDetails_State    INDEX     z   CREATE INDEX "fki_FK_CompanyBranchAddressDetails_State" ON company."CompanyBranchAddressDetails" USING btree ("StateID");
 ?   DROP INDEX company."fki_FK_CompanyBranchAddressDetails_State";
       company            postgres    false    225                        1259    76884     fki_FK_CompanyBranchType_Company    INDEX     j   CREATE INDEX "fki_FK_CompanyBranchType_Company" ON company."CompanyBranchType" USING btree ("CompanyId");
 7   DROP INDEX company."fki_FK_CompanyBranchType_Company";
       company            postgres    false    247            �           1259    50076     fki_FK_CompanyBranch_CompanyArea    INDEX     j   CREATE INDEX "fki_FK_CompanyBranch_CompanyArea" ON company."CompanyBranch" USING btree ("CompanyAreaID");
 7   DROP INDEX company."fki_FK_CompanyBranch_CompanyArea";
       company            postgres    false    221            �           1259    50175 0   fki_FK_CompanyBranch_CompanyBranchAddressDetails    INDEX     �   CREATE INDEX "fki_FK_CompanyBranch_CompanyBranchAddressDetails" ON company."CompanyBranch" USING btree ("CompanyBranchAddressID");
 G   DROP INDEX company."fki_FK_CompanyBranch_CompanyBranchAddressDetails";
       company            postgres    false    221            �           1259    50181 %   fki_FK_CompanyBranch_CompanyExecutive    INDEX        CREATE INDEX "fki_FK_CompanyBranch_CompanyExecutive" ON company."CompanyBranch" USING btree ("CompanyBranchPrimaryContactID");
 <   DROP INDEX company."fki_FK_CompanyBranch_CompanyExecutive";
       company            postgres    false    221            �           1259    50082 "   fki_FK_CompanyBranch_CompanyRegion    INDEX     n   CREATE INDEX "fki_FK_CompanyBranch_CompanyRegion" ON company."CompanyBranch" USING btree ("CompanyRegionID");
 9   DROP INDEX company."fki_FK_CompanyBranch_CompanyRegion";
       company            postgres    false    221            	           1259    59595 *   fki_FK_CompanyExecutivePL_CompanyExecutive    INDEX     w   CREATE INDEX "fki_FK_CompanyExecutivePL_CompanyExecutive" ON company."CompanyExecutivePL" USING btree ("executiveId");
 A   DROP INDEX company."fki_FK_CompanyExecutivePL_CompanyExecutive";
       company            postgres    false    235            �           1259    50368    fki_FK_CompanyExecutive_City    INDEX     f   CREATE INDEX "fki_FK_CompanyExecutive_City" ON company."CompanyExecutive" USING btree ("BaseCityID");
 3   DROP INDEX company."fki_FK_CompanyExecutive_City";
       company            postgres    false    223            �           1259    76890    fki_FK_CompanyExecutive_Company    INDEX     h   CREATE INDEX "fki_FK_CompanyExecutive_Company" ON company."CompanyExecutive" USING btree ("CompanyID");
 6   DROP INDEX company."fki_FK_CompanyExecutive_Company";
       company            postgres    false    223            �           1259    50187 %   fki_FK_CompanyExecutive_CompanyBranch    INDEX     t   CREATE INDEX "fki_FK_CompanyExecutive_CompanyBranch" ON company."CompanyExecutive" USING btree ("CompanyBranchID");
 <   DROP INDEX company."fki_FK_CompanyExecutive_CompanyBranch";
       company            postgres    false    223            �           1259    67485     fki_FK_CompanyExecutive_Position    INDEX     j   CREATE INDEX "fki_FK_CompanyExecutive_Position" ON company."CompanyExecutive" USING btree ("DeviceType");
 7   DROP INDEX company."fki_FK_CompanyExecutive_Position";
       company            postgres    false    223            �           1259    50009    fki_FK_CompanyRegion_Company    INDEX     b   CREATE INDEX "fki_FK_CompanyRegion_Company" ON company."CompanyRegion" USING btree ("CompanyID");
 3   DROP INDEX company."fki_FK_CompanyRegion_Company";
       company            postgres    false    217            �           1259    50321    fki_FK_Company_City    INDEX     P   CREATE INDEX "fki_FK_Company_City" ON company."Company" USING btree ("CityId");
 *   DROP INDEX company."fki_FK_Company_City";
       company            postgres    false    212            �           1259    49956 $   fki_FK_Company_CompanyAddressDetails    INDEX     i   CREATE INDEX "fki_FK_Company_CompanyAddressDetails" ON company."Company" USING btree ("CompanyAddress");
 ;   DROP INDEX company."fki_FK_Company_CompanyAddressDetails";
       company            postgres    false    212            �           1259    59570    fki_FK_Company_OwnerContact    INDEX     `   CREATE INDEX "fki_FK_Company_OwnerContact" ON company."Company" USING btree ("OwnerContactId");
 2   DROP INDEX company."fki_FK_Company_OwnerContact";
       company            postgres    false    212            W           1259    68261 *   fki_FK_CompanyExecutiveGeoLocation_Company    INDEX     �   CREATE INDEX "fki_FK_CompanyExecutiveGeoLocation_Company" ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" USING btree ("CompanyId");
 W   DROP INDEX "companyExecutiveGeoLocation"."fki_FK_CompanyExecutiveGeoLocation_Company";
       companyExecutiveGeoLocation            postgres    false    277            X           1259    68255 3   fki_FK_CompanyExecutiveGeoLocation_CompanyExecutive    INDEX     �   CREATE INDEX "fki_FK_CompanyExecutiveGeoLocation_CompanyExecutive" ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" USING btree ("CompanyExecutiveId");
 `   DROP INDEX "companyExecutiveGeoLocation"."fki_FK_CompanyExecutiveGeoLocation_CompanyExecutive";
       companyExecutiveGeoLocation            postgres    false    277            Y           1259    68249 ?   fki_FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationA    INDEX     �   CREATE INDEX "fki_FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationA" ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" USING btree ("CompanyExecutiveGeoLocationAddressId");
 l   DROP INDEX "companyExecutiveGeoLocation"."fki_FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationA";
       companyExecutiveGeoLocation            postgres    false    277            ^           1259    78242 &   fki_FK_EnquiryAccessList_CRMAccessList    INDEX     y   CREATE INDEX "fki_FK_EnquiryAccessList_CRMAccessList" ON enquiry."EnquiryAccessList" USING btree ("CompanyExecutiveId");
 =   DROP INDEX enquiry."fki_FK_EnquiryAccessList_CRMAccessList";
       enquiry            postgres    false    281            _           1259    78373     fki_FK_EnquiryAccessList_Enquiry    INDEX     j   CREATE INDEX "fki_FK_EnquiryAccessList_Enquiry" ON enquiry."EnquiryAccessList" USING btree ("EnquiryId");
 7   DROP INDEX enquiry."fki_FK_EnquiryAccessList_Enquiry";
       enquiry            postgres    false    281            D           1259    68076    fki_FK_EnquiryClient_Client    INDEX     `   CREATE INDEX "fki_FK_EnquiryClient_Client" ON enquiry."EnquiryClient" USING btree ("ClientId");
 2   DROP INDEX enquiry."fki_FK_EnquiryClient_Client";
       enquiry            postgres    false    267            E           1259    68070     fki_FK_EnquiryClient_MainEnquiry    INDEX     f   CREATE INDEX "fki_FK_EnquiryClient_MainEnquiry" ON enquiry."EnquiryClient" USING btree ("EnquiryId");
 7   DROP INDEX enquiry."fki_FK_EnquiryClient_MainEnquiry";
       enquiry            postgres    false    267            H           1259    68064    fki_FK_EnquiryLocation_Area    INDEX     `   CREATE INDEX "fki_FK_EnquiryLocation_Area" ON enquiry."EnquiryLocation" USING btree ("AreaId");
 2   DROP INDEX enquiry."fki_FK_EnquiryLocation_Area";
       enquiry            postgres    false    269            I           1259    68058    fki_FK_EnquiryLocation_City    INDEX     `   CREATE INDEX "fki_FK_EnquiryLocation_City" ON enquiry."EnquiryLocation" USING btree ("CityId");
 2   DROP INDEX enquiry."fki_FK_EnquiryLocation_City";
       enquiry            postgres    false    269            J           1259    68046    fki_FK_EnquiryLocation_Country    INDEX     f   CREATE INDEX "fki_FK_EnquiryLocation_Country" ON enquiry."EnquiryLocation" USING btree ("CountryId");
 5   DROP INDEX enquiry."fki_FK_EnquiryLocation_Country";
       enquiry            postgres    false    269            K           1259    68040 "   fki_FK_EnquiryLocation_MainEnquiry    INDEX     j   CREATE INDEX "fki_FK_EnquiryLocation_MainEnquiry" ON enquiry."EnquiryLocation" USING btree ("EnquiryId");
 9   DROP INDEX enquiry."fki_FK_EnquiryLocation_MainEnquiry";
       enquiry            postgres    false    269            L           1259    68052    fki_FK_EnquiryLocation_State    INDEX     b   CREATE INDEX "fki_FK_EnquiryLocation_State" ON enquiry."EnquiryLocation" USING btree ("StateId");
 3   DROP INDEX enquiry."fki_FK_EnquiryLocation_State";
       enquiry            postgres    false    269            O           1259    68034 %   fki_FK_EnquiryProductList_MainEnquiry    INDEX     p   CREATE INDEX "fki_FK_EnquiryProductList_MainEnquiry" ON enquiry."EnquiryProductList" USING btree ("EnquiryId");
 <   DROP INDEX enquiry."fki_FK_EnquiryProductList_MainEnquiry";
       enquiry            postgres    false    271            P           1259    68028 !   fki_FK_EnquiryProductList_Product    INDEX     l   CREATE INDEX "fki_FK_EnquiryProductList_Product" ON enquiry."EnquiryProductList" USING btree ("ProductId");
 8   DROP INDEX enquiry."fki_FK_EnquiryProductList_Product";
       enquiry            postgres    false    271            #           1259    78236    fki_FK_EnquiryType_Company    INDEX     ^   CREATE INDEX "fki_FK_EnquiryType_Company" ON enquiry."EnquiryType" USING btree ("CompanyId");
 1   DROP INDEX enquiry."fki_FK_EnquiryType_Company";
       enquiry            postgres    false    249            >           1259    68004    fki_FK_MainEnquiry_Company    INDEX     ^   CREATE INDEX "fki_FK_MainEnquiry_Company" ON enquiry."MainEnquiry" USING btree ("CompanyId");
 1   DROP INDEX enquiry."fki_FK_MainEnquiry_Company";
       enquiry            postgres    false    265            ?           1259    68016 .   fki_FK_MainEnquiry_CompanyExecutive(CreatedBy)    INDEX     r   CREATE INDEX "fki_FK_MainEnquiry_CompanyExecutive(CreatedBy)" ON enquiry."MainEnquiry" USING btree ("CreatedBy");
 E   DROP INDEX enquiry."fki_FK_MainEnquiry_CompanyExecutive(CreatedBy)";
       enquiry            postgres    false    265            @           1259    68022 /   fki_FK_MainEnquiry_CompanyExecutive(LastEditBy)    INDEX     t   CREATE INDEX "fki_FK_MainEnquiry_CompanyExecutive(LastEditBy)" ON enquiry."MainEnquiry" USING btree ("LastEditBy");
 F   DROP INDEX enquiry."fki_FK_MainEnquiry_CompanyExecutive(LastEditBy)";
       enquiry            postgres    false    265            A           1259    68082    fki_FK_MainEnquiry_EnquiryType    INDEX     d   CREATE INDEX "fki_FK_MainEnquiry_EnquiryType" ON enquiry."MainEnquiry" USING btree ("EnquiryType");
 5   DROP INDEX enquiry."fki_FK_MainEnquiry_EnquiryType";
       enquiry            postgres    false    265            l           1259    78155 4   fki_FK_BusinessAreaForCompany_BusinessCityForCompany    INDEX     �   CREATE INDEX "fki_FK_BusinessAreaForCompany_BusinessCityForCompany" ON location."businessAreaForCompany" USING btree ("CityID");
 L   DROP INDEX location."fki_FK_BusinessAreaForCompany_BusinessCityForCompany";
       location            postgres    false    288            h           1259    78080    fki_businessCity_CityInfo    INDEX     f   CREATE INDEX "fki_businessCity_CityInfo" ON location."businessCityForCompany" USING btree ("CityID");
 1   DROP INDEX location."fki_businessCity_CityInfo";
       location            postgres    false    286            i           1259    78081    fki_businessCity_OwnerId    INDEX     h   CREATE INDEX "fki_businessCity_OwnerId" ON location."businessCityForCompany" USING btree ("CompanyID");
 0   DROP INDEX location."fki_businessCity_OwnerId";
       location            postgres    false    286            u           1259    86829 !   fki_FK_Notification_CRMAccessList    INDEX     t   CREATE INDEX "fki_FK_Notification_CRMAccessList" ON notification."Notification" USING btree ("CompanyExecutiveID");
 =   DROP INDEX notification."fki_FK_Notification_CRMAccessList";
       notification            postgres    false    293                       1259    76926    fki_FK_Positions_Company    INDEX     ]   CREATE INDEX "fki_FK_Positions_Company" ON "position"."Positions" USING btree ("CompanyId");
 2   DROP INDEX "position"."fki_FK_Positions_Company";
       position            postgres    false    237                       1259    76932 +   fki_FK_Positions_CompanyExecutiveMasterList    INDEX     x   CREATE INDEX "fki_FK_Positions_CompanyExecutiveMasterList" ON "position"."Positions" USING btree ("ExecutiveMasterId");
 E   DROP INDEX "position"."fki_FK_Positions_CompanyExecutiveMasterList";
       position            postgres    false    237                       1259    59448    fki_FK_product_company    INDEX     V   CREATE INDEX "fki_FK_product_company" ON product."Product" USING btree ("companyId");
 -   DROP INDEX product."fki_FK_product_company";
       product            postgres    false    231                       1259    76938    fki_FK_Status_Company    INDEX     S   CREATE INDEX "fki_FK_Status_Company" ON status."Status" USING btree ("CompanyId");
 +   DROP INDEX status."fki_FK_Status_Company";
       status            postgres    false    245            *           1259    68010 -   fki_FK_MainTicket_CompanyExcutive(LastEditBy)    INDEX     p   CREATE INDEX "fki_FK_MainTicket_CompanyExcutive(LastEditBy)" ON ticket."MainTicket" USING btree ("LastEditBy");
 C   DROP INDEX ticket."fki_FK_MainTicket_CompanyExcutive(LastEditBy)";
       ticket            postgres    false    253            +           1259    67891 "   fki_FK_MainTicket_CompanyExecutive    INDEX     d   CREATE INDEX "fki_FK_MainTicket_CompanyExecutive" ON ticket."MainTicket" USING btree ("CreatedBy");
 8   DROP INDEX ticket."fki_FK_MainTicket_CompanyExecutive";
       ticket            postgres    false    253            ,           1259    68195    fki_FK_MainTicket_MainEnquiry    INDEX     _   CREATE INDEX "fki_FK_MainTicket_MainEnquiry" ON ticket."MainTicket" USING btree ("EnquiryId");
 3   DROP INDEX ticket."fki_FK_MainTicket_MainEnquiry";
       ticket            postgres    false    253            1           1259    68346    fki_FK_TicketAccessList_Owner    INDEX     n   CREATE INDEX "fki_FK_TicketAccessList_Owner" ON ticket."TicketAccessList" USING btree ("CompanyExecutiveId");
 3   DROP INDEX ticket."fki_FK_TicketAccessList_Owner";
       ticket            postgres    false    257            8           1259    67879 !   fki_FK_TicketMetaData_EnquiryType    INDEX     h   CREATE INDEX "fki_FK_TicketMetaData_EnquiryType" ON ticket."TicketMetaData" USING btree ("TicketType");
 7   DROP INDEX ticket."fki_FK_TicketMetaData_EnquiryType";
       ticket            postgres    false    263            9           1259    67867     fki_FK_TicketMetaData_MainTicket    INDEX     e   CREATE INDEX "fki_FK_TicketMetaData_MainTicket" ON ticket."TicketMetaData" USING btree ("TicketId");
 6   DROP INDEX ticket."fki_FK_TicketMetaData_MainTicket";
       ticket            postgres    false    263            :           1259    67917    fki_FK_TicketMetaData_Priority    INDEX     i   CREATE INDEX "fki_FK_TicketMetaData_Priority" ON ticket."TicketMetaData" USING btree ("TicketPriority");
 4   DROP INDEX ticket."fki_FK_TicketMetaData_Priority";
       ticket            postgres    false    263            ;           1259    67873    fki_FK_TicketMetaData_Product    INDEX     c   CREATE INDEX "fki_FK_TicketMetaData_Product" ON ticket."TicketMetaData" USING btree ("ProductId");
 3   DROP INDEX ticket."fki_FK_TicketMetaData_Product";
       ticket            postgres    false    263            �           2606    76840 +   CallTransaction FK_CallTransaction_ClientId    FK CONSTRAINT     �   ALTER TABLE ONLY "callTransactions"."CallTransaction"
    ADD CONSTRAINT "FK_CallTransaction_ClientId" FOREIGN KEY ("ClientId") REFERENCES client."Client"("ClientId");
 e   ALTER TABLE ONLY "callTransactions"."CallTransaction" DROP CONSTRAINT "FK_CallTransaction_ClientId";
       callTransactions          postgres    false    229    241    3601            �           2606    76846 3   CallTransaction FK_CallTransaction_CompanyExecutive    FK CONSTRAINT     �   ALTER TABLE ONLY "callTransactions"."CallTransaction"
    ADD CONSTRAINT "FK_CallTransaction_CompanyExecutive" FOREIGN KEY ("CompanyExecutiveId") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");
 m   ALTER TABLE ONLY "callTransactions"."CallTransaction" DROP CONSTRAINT "FK_CallTransaction_CompanyExecutive";
       callTransactions          postgres    false    223    3572    229            �           2606    78171 %   ClientLocation FK_ClientLocation_Area    FK CONSTRAINT     �   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_Area" FOREIGN KEY ("Area") REFERENCES location."businessAreaForCompany"("BusinessAreaForCompanyID");
 S   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "FK_ClientLocation_Area";
       client          postgres    false    288    243    3691            �           2606    78166 %   ClientLocation FK_ClientLocation_City    FK CONSTRAINT     �   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_City" FOREIGN KEY ("City") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");
 S   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "FK_ClientLocation_City";
       client          postgres    false    3687    243    286            �           2606    78156 (   ClientLocation FK_ClientLocation_Country    FK CONSTRAINT     �   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_Country" FOREIGN KEY ("Country") REFERENCES location.countryinfo("CountryID");
 V   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "FK_ClientLocation_Country";
       client          postgres    false    243    290    3696            �           2606    78161 &   ClientLocation FK_ClientLocation_State    FK CONSTRAINT     �   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_State" FOREIGN KEY ("State") REFERENCES location.stateinfo("StateID");
 T   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "FK_ClientLocation_State";
       client          postgres    false    291    3698    243            �           2606    67645    Client FK_Client_Company    FK CONSTRAINT     �   ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "FK_Client_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 F   ALTER TABLE ONLY client."Client" DROP CONSTRAINT "FK_Client_Company";
       client          postgres    false    212    3548    241            �           2606    78262    Client FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 A   ALTER TABLE ONLY client."Client" DROP CONSTRAINT "FK_CreatedBy";
       client          postgres    false    283    3683    241            �           2606    78272    ClientLocation FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 I   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "FK_CreatedBy";
       client          postgres    false    283    243    3683            �           2606    78267    Client FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 B   ALTER TABLE ONLY client."Client" DROP CONSTRAINT "FK_LastEditBy";
       client          postgres    false    283    3683    241            �           2606    78277    ClientLocation FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 J   ALTER TABLE ONLY client."ClientLocation" DROP CONSTRAINT "FK_LastEditBy";
       client          postgres    false    3683    243    283            z           2606    78186 3   CompanyAddressDetails FK_CompanyAddressDetails_City    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "FK_CompanyAddressDetails_City" FOREIGN KEY ("CityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");
 b   ALTER TABLE ONLY company."CompanyAddressDetails" DROP CONSTRAINT "FK_CompanyAddressDetails_City";
       company          postgres    false    286    3687    214            {           2606    78176 6   CompanyAddressDetails FK_CompanyAddressDetails_Country    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "FK_CompanyAddressDetails_Country" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");
 e   ALTER TABLE ONLY company."CompanyAddressDetails" DROP CONSTRAINT "FK_CompanyAddressDetails_Country";
       company          postgres    false    214    3696    290            |           2606    78181 4   CompanyAddressDetails FK_CompanyAddressDetails_State    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "FK_CompanyAddressDetails_State" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");
 c   ALTER TABLE ONLY company."CompanyAddressDetails" DROP CONSTRAINT "FK_CompanyAddressDetails_State";
       company          postgres    false    214    3698    291            �           2606    50023 +   CompanyArea FK_CompanyAddress_CompanyRegion    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_CompanyAddress_CompanyRegion" FOREIGN KEY ("CompanyRegionID") REFERENCES company."CompanyRegion"("CompanyRegionID");
 Z   ALTER TABLE ONLY company."CompanyArea" DROP CONSTRAINT "FK_CompanyAddress_CompanyRegion";
       company          postgres    false    217    3558    219            �           2606    50065 "   CompanyArea FK_CompanyArea_Company    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_CompanyArea_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");
 Q   ALTER TABLE ONLY company."CompanyArea" DROP CONSTRAINT "FK_CompanyArea_Company";
       company          postgres    false    212    219    3548            �           2606    78201 ?   CompanyBranchAddressDetails FK_CompanyBranchAddressDetails_City    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CompanyBranchAddressDetails_City" FOREIGN KEY ("CityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");
 n   ALTER TABLE ONLY company."CompanyBranchAddressDetails" DROP CONSTRAINT "FK_CompanyBranchAddressDetails_City";
       company          postgres    false    286    225    3687            �           2606    78191 B   CompanyBranchAddressDetails FK_CompanyBranchAddressDetails_Country    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CompanyBranchAddressDetails_Country" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");
 q   ALTER TABLE ONLY company."CompanyBranchAddressDetails" DROP CONSTRAINT "FK_CompanyBranchAddressDetails_Country";
       company          postgres    false    225    290    3696            �           2606    78196 @   CompanyBranchAddressDetails FK_CompanyBranchAddressDetails_State    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CompanyBranchAddressDetails_State" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");
 o   ALTER TABLE ONLY company."CompanyBranchAddressDetails" DROP CONSTRAINT "FK_CompanyBranchAddressDetails_State";
       company          postgres    false    291    225    3698            �           2606    76879 .   CompanyBranchType FK_CompanyBranchType_Company    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "FK_CompanyBranchType_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 ]   ALTER TABLE ONLY company."CompanyBranchType" DROP CONSTRAINT "FK_CompanyBranchType_Company";
       company          postgres    false    3548    247    212            �           2606    50059 &   CompanyBranch FK_CompanyBranch_Company    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");
 U   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_CompanyBranch_Company";
       company          postgres    false    3548    212    221            �           2606    50071 *   CompanyBranch FK_CompanyBranch_CompanyArea    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyArea" FOREIGN KEY ("CompanyAreaID") REFERENCES company."CompanyArea"("CompanyAreaID");
 Y   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_CompanyBranch_CompanyArea";
       company          postgres    false    219    3561    221            �           2606    50170 :   CompanyBranch FK_CompanyBranch_CompanyBranchAddressDetails    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyBranchAddressDetails" FOREIGN KEY ("CompanyBranchAddressID") REFERENCES company."CompanyBranchAddressDetails"("CompanyBranchAddressID");
 i   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_CompanyBranch_CompanyBranchAddressDetails";
       company          postgres    false    221    225    3578            �           2606    50340 /   CompanyBranch FK_CompanyBranch_CompanyExecutive    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyExecutive" FOREIGN KEY ("CompanyBranchPrimaryContactID") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");
 ^   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_CompanyBranch_CompanyExecutive";
       company          postgres    false    221    3572    223            �           2606    50077 ,   CompanyBranch FK_CompanyBranch_CompanyRegion    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyRegion" FOREIGN KEY ("CompanyRegionID") REFERENCES company."CompanyRegion"("CompanyRegionID");
 [   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_CompanyBranch_CompanyRegion";
       company          postgres    false    217    221    3558            �           2606    59590 9   CompanyExecutivePL FK_CompanyExecutivePL_CompanyExecutive    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyExecutivePL"
    ADD CONSTRAINT "FK_CompanyExecutivePL_CompanyExecutive" FOREIGN KEY ("executiveId") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");
 h   ALTER TABLE ONLY company."CompanyExecutivePL" DROP CONSTRAINT "FK_CompanyExecutivePL_CompanyExecutive";
       company          postgres    false    235    3572    223            �           2606    78206 )   CompanyExecutive FK_CompanyExecutive_City    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CompanyExecutive_City" FOREIGN KEY ("BaseCityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");
 X   ALTER TABLE ONLY company."CompanyExecutive" DROP CONSTRAINT "FK_CompanyExecutive_City";
       company          postgres    false    286    223    3687            �           2606    76885 ,   CompanyExecutive FK_CompanyExecutive_Company    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CompanyExecutive_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");
 [   ALTER TABLE ONLY company."CompanyExecutive" DROP CONSTRAINT "FK_CompanyExecutive_Company";
       company          postgres    false    212    3548    223            �           2606    50182 2   CompanyExecutive FK_CompanyExecutive_CompanyBranch    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CompanyExecutive_CompanyBranch" FOREIGN KEY ("CompanyBranchID") REFERENCES company."CompanyBranch"("CompanyBranchID");
 a   ALTER TABLE ONLY company."CompanyExecutive" DROP CONSTRAINT "FK_CompanyExecutive_CompanyBranch";
       company          postgres    false    223    221    3565            }           2606    50004 &   CompanyRegion FK_CompanyRegion_Company    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "FK_CompanyRegion_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");
 U   ALTER TABLE ONLY company."CompanyRegion" DROP CONSTRAINT "FK_CompanyRegion_Company";
       company          postgres    false    3548    217    212            v           2606    49951 (   Company FK_Company_CompanyAddressDetails    FK CONSTRAINT     �   ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_Company_CompanyAddressDetails" FOREIGN KEY ("CompanyAddress") REFERENCES company."CompanyAddressDetails"("CompanyAddressID");
 W   ALTER TABLE ONLY company."Company" DROP CONSTRAINT "FK_Company_CompanyAddressDetails";
       company          postgres    false    212    214    3553            w           2606    59565    Company FK_Company_OwnerContact    FK CONSTRAINT     �   ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_Company_OwnerContact" FOREIGN KEY ("OwnerContactId") REFERENCES owner."OwnerContact"(id);
 N   ALTER TABLE ONLY company."Company" DROP CONSTRAINT "FK_Company_OwnerContact";
       company          postgres    false    233    212    3590            x           2606    77669    Company FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 C   ALTER TABLE ONLY company."Company" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    3683    212    283            �           2606    77679    CompanyArea FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 G   ALTER TABLE ONLY company."CompanyArea" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    219    3683    283            �           2606    77689    CompanyBranch FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 I   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    3683    221    283            �           2606    77699 (   CompanyBranchAddressDetails FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 W   ALTER TABLE ONLY company."CompanyBranchAddressDetails" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    225    283    3683            �           2606    77709    CompanyBranchType FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 M   ALTER TABLE ONLY company."CompanyBranchType" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    283    3683    247            �           2606    77719    CompanyExecutive FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 L   ALTER TABLE ONLY company."CompanyExecutive" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    223    3683    283            ~           2606    77729    CompanyRegion FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 I   ALTER TABLE ONLY company."CompanyRegion" DROP CONSTRAINT "FK_CreatedBy";
       company          postgres    false    3683    283    217            y           2606    77674    Company FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 D   ALTER TABLE ONLY company."Company" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    283    212    3683            �           2606    77684    CompanyArea FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 H   ALTER TABLE ONLY company."CompanyArea" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    3683    219    283            �           2606    77694    CompanyBranch FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 J   ALTER TABLE ONLY company."CompanyBranch" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    3683    283    221            �           2606    77704 )   CompanyBranchAddressDetails FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 X   ALTER TABLE ONLY company."CompanyBranchAddressDetails" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    3683    225    283            �           2606    77714    CompanyBranchType FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 N   ALTER TABLE ONLY company."CompanyBranchType" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    3683    283    247            �           2606    77724    CompanyExecutive FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 M   ALTER TABLE ONLY company."CompanyExecutive" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    3683    283    223                       2606    77734    CompanyRegion FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 J   ALTER TABLE ONLY company."CompanyRegion" DROP CONSTRAINT "FK_LastEditBy";
       company          postgres    false    3683    217    283            �           2606    68256 B   CompanyExecutiveGeoLocation FK_CompanyExecutiveGeoLocation_Company    FK CONSTRAINT     �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "FK_CompanyExecutiveGeoLocation_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" DROP CONSTRAINT "FK_CompanyExecutiveGeoLocation_Company";
       companyExecutiveGeoLocation          postgres    false    3548    277    212            �           2606    68250 K   CompanyExecutiveGeoLocation FK_CompanyExecutiveGeoLocation_CompanyExecutive    FK CONSTRAINT     �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "FK_CompanyExecutiveGeoLocation_CompanyExecutive" FOREIGN KEY ("CompanyExecutiveId") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");
 �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" DROP CONSTRAINT "FK_CompanyExecutiveGeoLocation_CompanyExecutive";
       companyExecutiveGeoLocation          postgres    false    277    223    3572            �           2606    68244 [   CompanyExecutiveGeoLocation FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationAddre    FK CONSTRAINT     N  ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationAddre" FOREIGN KEY ("CompanyExecutiveGeoLocationAddressId") REFERENCES "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"("CompanyExecutiveGeoLocationAddressId");
 �   ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" DROP CONSTRAINT "FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationAddre";
       companyExecutiveGeoLocation          postgres    false    3668    275    277            �           2606    78282    MainEnquiry FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 G   ALTER TABLE ONLY enquiry."MainEnquiry" DROP CONSTRAINT "FK_CreatedBy";
       enquiry          postgres    false    283    3683    265            �           2606    78292    EnquiryType FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 G   ALTER TABLE ONLY enquiry."EnquiryType" DROP CONSTRAINT "FK_CreatedBy";
       enquiry          postgres    false    3683    249    283            �           2606    78237 4   EnquiryAccessList FK_EnquiryAccessList_CRMAccessList    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryAccessList"
    ADD CONSTRAINT "FK_EnquiryAccessList_CRMAccessList" FOREIGN KEY ("CompanyExecutiveId") REFERENCES public."CRMAccessList"("CorrespondingId");
 c   ALTER TABLE ONLY enquiry."EnquiryAccessList" DROP CONSTRAINT "FK_EnquiryAccessList_CRMAccessList";
       enquiry          postgres    false    3683    283    281            �           2606    78368 .   EnquiryAccessList FK_EnquiryAccessList_Enquiry    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryAccessList"
    ADD CONSTRAINT "FK_EnquiryAccessList_Enquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");
 ]   ALTER TABLE ONLY enquiry."EnquiryAccessList" DROP CONSTRAINT "FK_EnquiryAccessList_Enquiry";
       enquiry          postgres    false    281    265    3645            �           2606    68071 %   EnquiryClient FK_EnquiryClient_Client    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryClient"
    ADD CONSTRAINT "FK_EnquiryClient_Client" FOREIGN KEY ("ClientId") REFERENCES client."Client"("ClientId");
 T   ALTER TABLE ONLY enquiry."EnquiryClient" DROP CONSTRAINT "FK_EnquiryClient_Client";
       enquiry          postgres    false    241    3601    267            �           2606    68065 *   EnquiryClient FK_EnquiryClient_MainEnquiry    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryClient"
    ADD CONSTRAINT "FK_EnquiryClient_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");
 Y   ALTER TABLE ONLY enquiry."EnquiryClient" DROP CONSTRAINT "FK_EnquiryClient_MainEnquiry";
       enquiry          postgres    false    265    267    3645            �           2606    68126 >   EnquiryDateAndTimelines FK_EnquiryDateAndTimelines_MainEnquiry    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines"
    ADD CONSTRAINT "FK_EnquiryDateAndTimelines_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");
 m   ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines" DROP CONSTRAINT "FK_EnquiryDateAndTimelines_MainEnquiry";
       enquiry          postgres    false    3645    273    265            �           2606    78226 '   EnquiryLocation FK_EnquiryLocation_Area    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_Area" FOREIGN KEY ("AreaId") REFERENCES location."businessAreaForCompany"("BusinessAreaForCompanyID");
 V   ALTER TABLE ONLY enquiry."EnquiryLocation" DROP CONSTRAINT "FK_EnquiryLocation_Area";
       enquiry          postgres    false    288    3691    269            �           2606    78221 '   EnquiryLocation FK_EnquiryLocation_City    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_City" FOREIGN KEY ("CityId") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");
 V   ALTER TABLE ONLY enquiry."EnquiryLocation" DROP CONSTRAINT "FK_EnquiryLocation_City";
       enquiry          postgres    false    286    269    3687            �           2606    78211 *   EnquiryLocation FK_EnquiryLocation_Country    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_Country" FOREIGN KEY ("CountryId") REFERENCES location.countryinfo("CountryID");
 Y   ALTER TABLE ONLY enquiry."EnquiryLocation" DROP CONSTRAINT "FK_EnquiryLocation_Country";
       enquiry          postgres    false    3696    290    269            �           2606    68035 .   EnquiryLocation FK_EnquiryLocation_MainEnquiry    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");
 ]   ALTER TABLE ONLY enquiry."EnquiryLocation" DROP CONSTRAINT "FK_EnquiryLocation_MainEnquiry";
       enquiry          postgres    false    265    3645    269            �           2606    78216 (   EnquiryLocation FK_EnquiryLocation_State    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_State" FOREIGN KEY ("StateId") REFERENCES location.stateinfo("StateID");
 W   ALTER TABLE ONLY enquiry."EnquiryLocation" DROP CONSTRAINT "FK_EnquiryLocation_State";
       enquiry          postgres    false    269    3698    291            �           2606    68029 4   EnquiryProductList FK_EnquiryProductList_MainEnquiry    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryProductList"
    ADD CONSTRAINT "FK_EnquiryProductList_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");
 c   ALTER TABLE ONLY enquiry."EnquiryProductList" DROP CONSTRAINT "FK_EnquiryProductList_MainEnquiry";
       enquiry          postgres    false    3645    265    271            �           2606    68023 0   EnquiryProductList FK_EnquiryProductList_Product    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryProductList"
    ADD CONSTRAINT "FK_EnquiryProductList_Product" FOREIGN KEY ("ProductId") REFERENCES product."Product"(id);
 _   ALTER TABLE ONLY enquiry."EnquiryProductList" DROP CONSTRAINT "FK_EnquiryProductList_Product";
       enquiry          postgres    false    3587    231    271            �           2606    78231 "   EnquiryType FK_EnquiryType_Company    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "FK_EnquiryType_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 Q   ALTER TABLE ONLY enquiry."EnquiryType" DROP CONSTRAINT "FK_EnquiryType_Company";
       enquiry          postgres    false    3548    212    249            �           2606    78287    MainEnquiry FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 H   ALTER TABLE ONLY enquiry."MainEnquiry" DROP CONSTRAINT "FK_LastEditBy";
       enquiry          postgres    false    265    283    3683            �           2606    78297    EnquiryType FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 H   ALTER TABLE ONLY enquiry."EnquiryType" DROP CONSTRAINT "FK_LastEditBy";
       enquiry          postgres    false    3683    249    283            �           2606    67999 "   MainEnquiry FK_MainEnquiry_Company    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_MainEnquiry_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 Q   ALTER TABLE ONLY enquiry."MainEnquiry" DROP CONSTRAINT "FK_MainEnquiry_Company";
       enquiry          postgres    false    3548    212    265            �           2606    68077 &   MainEnquiry FK_MainEnquiry_EnquiryType    FK CONSTRAINT     �   ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_MainEnquiry_EnquiryType" FOREIGN KEY ("EnquiryType") REFERENCES enquiry."EnquiryType"("EnquiryTypeId");
 U   ALTER TABLE ONLY enquiry."MainEnquiry" DROP CONSTRAINT "FK_MainEnquiry_EnquiryType";
       enquiry          postgres    false    249    3618    265            �           2606    78150 G   businessAreaForCompany FK_BusinessAreaForCompany_BusinessCityForCompany    FK CONSTRAINT     �   ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "FK_BusinessAreaForCompany_BusinessCityForCompany" FOREIGN KEY ("CityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");
 w   ALTER TABLE ONLY location."businessAreaForCompany" DROP CONSTRAINT "FK_BusinessAreaForCompany_BusinessCityForCompany";
       location          postgres    false    3687    286    288            �           2606    78082    areainfo area_CountryID    FK CONSTRAINT     �   ALTER TABLE ONLY location.areainfo
    ADD CONSTRAINT "area_CountryID" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");
 E   ALTER TABLE ONLY location.areainfo DROP CONSTRAINT "area_CountryID";
       location          postgres    false    3696    290    285            �           2606    78087    areainfo area_StateID    FK CONSTRAINT     �   ALTER TABLE ONLY location.areainfo
    ADD CONSTRAINT "area_StateID" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");
 C   ALTER TABLE ONLY location.areainfo DROP CONSTRAINT "area_StateID";
       location          postgres    false    291    285    3698            �           2606    78092 ,   businessAreaForCompany businessArea_AreaInfo    FK CONSTRAINT     �   ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "businessArea_AreaInfo" FOREIGN KEY ("AreaID") REFERENCES location.areainfo("AreaID");
 \   ALTER TABLE ONLY location."businessAreaForCompany" DROP CONSTRAINT "businessArea_AreaInfo";
       location          postgres    false    3685    288    285            �           2606    78097 +   businessAreaForCompany businessArea_OwnerId    FK CONSTRAINT     �   ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "businessArea_OwnerId" FOREIGN KEY ("CompanyID") REFERENCES owner."OwnerContact"(id);
 [   ALTER TABLE ONLY location."businessAreaForCompany" DROP CONSTRAINT "businessArea_OwnerId";
       location          postgres    false    288    3590    233            �           2606    78102 ,   businessCityForCompany businessCity_CityInfo    FK CONSTRAINT     �   ALTER TABLE ONLY location."businessCityForCompany"
    ADD CONSTRAINT "businessCity_CityInfo" FOREIGN KEY ("CityID") REFERENCES location.cityinfo("CityID");
 \   ALTER TABLE ONLY location."businessCityForCompany" DROP CONSTRAINT "businessCity_CityInfo";
       location          postgres    false    286    3694    289            �           2606    78107 +   businessCityForCompany businessCity_OwnerId    FK CONSTRAINT     �   ALTER TABLE ONLY location."businessCityForCompany"
    ADD CONSTRAINT "businessCity_OwnerId" FOREIGN KEY ("CompanyID") REFERENCES owner."OwnerContact"(id);
 [   ALTER TABLE ONLY location."businessCityForCompany" DROP CONSTRAINT "businessCity_OwnerId";
       location          postgres    false    233    286    3590            �           2606    78112    cityinfo city_CountryID    FK CONSTRAINT     �   ALTER TABLE ONLY location.cityinfo
    ADD CONSTRAINT "city_CountryID" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");
 E   ALTER TABLE ONLY location.cityinfo DROP CONSTRAINT "city_CountryID";
       location          postgres    false    289    3696    290            �           2606    78117    cityinfo city_StateID    FK CONSTRAINT     �   ALTER TABLE ONLY location.cityinfo
    ADD CONSTRAINT "city_StateID" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");
 C   ALTER TABLE ONLY location.cityinfo DROP CONSTRAINT "city_StateID";
       location          postgres    false    3698    289    291            �           2606    78122    stateinfo state_CountryID    FK CONSTRAINT     �   ALTER TABLE ONLY location.stateinfo
    ADD CONSTRAINT "state_CountryID" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");
 G   ALTER TABLE ONLY location.stateinfo DROP CONSTRAINT "state_CountryID";
       location          postgres    false    3696    291    290            �           2606    86824 *   Notification FK_Notification_CRMAccessList    FK CONSTRAINT     �   ALTER TABLE ONLY notification."Notification"
    ADD CONSTRAINT "FK_Notification_CRMAccessList" FOREIGN KEY ("CompanyExecutiveID") REFERENCES public."CRMAccessList"("CorrespondingId");
 ^   ALTER TABLE ONLY notification."Notification" DROP CONSTRAINT "FK_Notification_CRMAccessList";
       notification          postgres    false    293    283    3683            �           2606    77799    Positions FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 H   ALTER TABLE ONLY "position"."Positions" DROP CONSTRAINT "FK_CreatedBy";
       position          postgres    false    237    283    3683            �           2606    77804    Positions FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 I   ALTER TABLE ONLY "position"."Positions" DROP CONSTRAINT "FK_LastEditBy";
       position          postgres    false    237    3683    283            �           2606    76921    Positions FK_Positions_Company    FK CONSTRAINT     �   ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_Positions_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 P   ALTER TABLE ONLY "position"."Positions" DROP CONSTRAINT "FK_Positions_Company";
       position          postgres    false    212    237    3548            �           2606    76927 1   Positions FK_Positions_CompanyExecutiveMasterList    FK CONSTRAINT     �   ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_Positions_CompanyExecutiveMasterList" FOREIGN KEY ("ExecutiveMasterId") REFERENCES "position"."CompanyExecutiveMasterList"(id);
 c   ALTER TABLE ONLY "position"."Positions" DROP CONSTRAINT "FK_Positions_CompanyExecutiveMasterList";
       position          postgres    false    3599    239    237            �           2606    77809    Product FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 C   ALTER TABLE ONLY product."Product" DROP CONSTRAINT "FK_CreatedBy";
       product          postgres    false    283    231    3683            �           2606    77814    Product FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 D   ALTER TABLE ONLY product."Product" DROP CONSTRAINT "FK_LastEditBy";
       product          postgres    false    231    3683    283            �           2606    59443    Product FK_product_company    FK CONSTRAINT     �   ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "FK_product_company" FOREIGN KEY ("companyId") REFERENCES company."Company"("CompanyId");
 I   ALTER TABLE ONLY product."Product" DROP CONSTRAINT "FK_product_company";
       product          postgres    false    3548    212    231            �           2606    77819    Status FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 A   ALTER TABLE ONLY status."Status" DROP CONSTRAINT "FK_CreatedBy";
       status          postgres    false    3683    245    283            �           2606    77824    Status FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 B   ALTER TABLE ONLY status."Status" DROP CONSTRAINT "FK_LastEditBy";
       status          postgres    false    3683    245    283            �           2606    76933    Status FK_Status_Company    FK CONSTRAINT     �   ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "FK_Status_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");
 F   ALTER TABLE ONLY status."Status" DROP CONSTRAINT "FK_Status_Company";
       status          postgres    false    245    3548    212            �           2606    78302 &   TicketAccessList FK_CompanyExecutiveId    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "FK_CompanyExecutiveId" FOREIGN KEY ("CompanyExecutiveId") REFERENCES public."CRMAccessList"("CorrespondingId");
 T   ALTER TABLE ONLY ticket."TicketAccessList" DROP CONSTRAINT "FK_CompanyExecutiveId";
       ticket          postgres    false    283    257    3683            �           2606    77829    MainTicket FK_CreatedBy    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 E   ALTER TABLE ONLY ticket."MainTicket" DROP CONSTRAINT "FK_CreatedBy";
       ticket          postgres    false    3683    253    283            �           2606    77834    MainTicket FK_LastEditBy    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");
 F   ALTER TABLE ONLY ticket."MainTicket" DROP CONSTRAINT "FK_LastEditBy";
       ticket          postgres    false    3683    253    283            �           2606    68190 $   MainTicket FK_MainTicket_MainEnquiry    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "FK_MainTicket_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");
 R   ALTER TABLE ONLY ticket."MainTicket" DROP CONSTRAINT "FK_MainTicket_MainEnquiry";
       ticket          postgres    false    265    253    3645            �           2606    103620 2   TicketAccessList FK_TicketAccessList_CRMAccessList    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "FK_TicketAccessList_CRMAccessList" FOREIGN KEY ("CompanyExecutiveId") REFERENCES public."CRMAccessList"("CorrespondingId");
 `   ALTER TABLE ONLY ticket."TicketAccessList" DROP CONSTRAINT "FK_TicketAccessList_CRMAccessList";
       ticket          postgres    false    283    3683    257            �           2606    67808 /   TicketAccessList FK_TicketAccessList_MainTicket    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "FK_TicketAccessList_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");
 ]   ALTER TABLE ONLY ticket."TicketAccessList" DROP CONSTRAINT "FK_TicketAccessList_MainTicket";
       ticket          postgres    false    3625    257    253            �           2606    67832 ;   TicketDateAndTimelines FK_TicketDateAndTimelines_MainTicket    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketDateAndTimelines"
    ADD CONSTRAINT "FK_TicketDateAndTimelines_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");
 i   ALTER TABLE ONLY ticket."TicketDateAndTimelines" DROP CONSTRAINT "FK_TicketDateAndTimelines_MainTicket";
       ticket          postgres    false    259    3625    253            �           2606    67846 5   TicketFollowupDates FK_TicketFollowupDates_MainTicket    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketFollowupDates"
    ADD CONSTRAINT "FK_TicketFollowupDates_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");
 c   ALTER TABLE ONLY ticket."TicketFollowupDates" DROP CONSTRAINT "FK_TicketFollowupDates_MainTicket";
       ticket          postgres    false    253    261    3625            �           2606    67874 ,   TicketMetaData FK_TicketMetaData_EnquiryType    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_EnquiryType" FOREIGN KEY ("TicketType") REFERENCES enquiry."EnquiryType"("EnquiryTypeId");
 Z   ALTER TABLE ONLY ticket."TicketMetaData" DROP CONSTRAINT "FK_TicketMetaData_EnquiryType";
       ticket          postgres    false    3618    263    249            �           2606    67862 +   TicketMetaData FK_TicketMetaData_MainTicket    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");
 Y   ALTER TABLE ONLY ticket."TicketMetaData" DROP CONSTRAINT "FK_TicketMetaData_MainTicket";
       ticket          postgres    false    3625    253    263            �           2606    67918 )   TicketMetaData FK_TicketMetaData_Priority    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_Priority" FOREIGN KEY ("TicketPriority") REFERENCES priority."Priority"("PriorityId");
 W   ALTER TABLE ONLY ticket."TicketMetaData" DROP CONSTRAINT "FK_TicketMetaData_Priority";
       ticket          postgres    false    263    251    3621            �           2606    67868 (   TicketMetaData FK_TicketMetaData_Product    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_Product" FOREIGN KEY ("ProductId") REFERENCES product."Product"(id);
 V   ALTER TABLE ONLY ticket."TicketMetaData" DROP CONSTRAINT "FK_TicketMetaData_Product";
       ticket          postgres    false    263    231    3587            �           2606    67787 '   TicketStatus FK_TicketStatus_MainTicket    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketStatus"
    ADD CONSTRAINT "FK_TicketStatus_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");
 U   ALTER TABLE ONLY ticket."TicketStatus" DROP CONSTRAINT "FK_TicketStatus_MainTicket";
       ticket          postgres    false    3625    255    253            �           2606    67792 #   TicketStatus FK_TicketStatus_Status    FK CONSTRAINT     �   ALTER TABLE ONLY ticket."TicketStatus"
    ADD CONSTRAINT "FK_TicketStatus_Status" FOREIGN KEY ("StatusId") REFERENCES status."Status"("StatusId");
 Q   ALTER TABLE ONLY ticket."TicketStatus" DROP CONSTRAINT "FK_TicketStatus_Status";
       ticket          postgres    false    245    255    3612            g      x������ � �      s      x������ � �      u      x������ � �      V      x������ � �      X      x������ � �      ]      x������ � �      _      x������ � �      c      x������ � �      y      x������ � �      a      x������ � �      m      x������ � �      [      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      {      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   =   x���s�t���s�442�L���N##]K]SCS++CNCSNC�2\1z\\\ ��      �   U   x��u�pr�	r����L��E(�4202�5��52P00�26�20�4�4�4�#chd�i���4'���h(�C���\1z\\\ �6"B      �      x������ � �      k      x������ � �      q      x������ � �      o      x������ � �      }   7   x�3����4�2����u��4�2���t��4�2����uu�tq�4����� �M	      i      x������ � �      �      x������ � �      �   �   x���;1��>\������Z�"�#o����(�H��Ѽ��J���V��T�<be��J�"�x��'���m��M.� T��YR��]V[���v�R��P�g��d�g�L�y���^<��7��a�      w      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     