--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

-- Started on 2021-08-02 19:02:56 IST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- TOC entry 4194 (class 1262 OID 13448)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_IN';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4195 (class 0 OID 0)
-- Dependencies: 4194
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 15 (class 2615 OID 16384)
-- Name: callTransactions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "callTransactions";


ALTER SCHEMA "callTransactions" OWNER TO postgres;

--
-- TOC entry 18 (class 2615 OID 16385)
-- Name: client; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA client;


ALTER SCHEMA client OWNER TO postgres;

--
-- TOC entry 5 (class 2615 OID 16386)
-- Name: company; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA company;


ALTER SCHEMA company OWNER TO postgres;

--
-- TOC entry 11 (class 2615 OID 16387)
-- Name: companyExecutiveGeoLocation; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "companyExecutiveGeoLocation";


ALTER SCHEMA "companyExecutiveGeoLocation" OWNER TO postgres;

--
-- TOC entry 10 (class 2615 OID 16388)
-- Name: enquiry; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA enquiry;


ALTER SCHEMA enquiry OWNER TO postgres;

--
-- TOC entry 4 (class 2615 OID 16389)
-- Name: geoMapPlotting; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "geoMapPlotting";


ALTER SCHEMA "geoMapPlotting" OWNER TO postgres;

--
-- TOC entry 17 (class 2615 OID 16390)
-- Name: location; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA location;


ALTER SCHEMA location OWNER TO postgres;

--
-- TOC entry 13 (class 2615 OID 16391)
-- Name: notification; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA notification;


ALTER SCHEMA notification OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 16392)
-- Name: owner; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA owner;


ALTER SCHEMA owner OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 16393)
-- Name: position; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "position";


ALTER SCHEMA "position" OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 16394)
-- Name: priority; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA priority;


ALTER SCHEMA priority OWNER TO postgres;

--
-- TOC entry 16 (class 2615 OID 16395)
-- Name: product; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA product;


ALTER SCHEMA product OWNER TO postgres;

--
-- TOC entry 21 (class 2615 OID 16396)
-- Name: purposes; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA purposes;


ALTER SCHEMA purposes OWNER TO postgres;

--
-- TOC entry 19 (class 2615 OID 16397)
-- Name: report; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA report;


ALTER SCHEMA report OWNER TO postgres;

--
-- TOC entry 14 (class 2615 OID 16398)
-- Name: status; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA status;


ALTER SCHEMA status OWNER TO postgres;

--
-- TOC entry 20 (class 2615 OID 16399)
-- Name: ticket; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ticket;


ALTER SCHEMA ticket OWNER TO postgres;

--
-- TOC entry 300 (class 1255 OID 16400)
-- Name: fn_insertCallTransaction(bigint, bigint, text, text, integer, double precision, timestamp without time zone, text, text); Type: FUNCTION; Schema: callTransactions; Owner: postgres
--

CREATE FUNCTION "callTransactions"."fn_insertCallTransaction"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint, "ClientNameOnExecutiveContactListIn" text, "ClientContactNumberIn" text, "CallTypeIn" integer, "TalkDurationIn" double precision, "CallTimeIn" timestamp without time zone, "FileURLIn" text, "FilePathIn" text) RETURNS boolean
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


ALTER FUNCTION "callTransactions"."fn_insertCallTransaction"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint, "ClientNameOnExecutiveContactListIn" text, "ClientContactNumberIn" text, "CallTypeIn" integer, "TalkDurationIn" double precision, "CallTimeIn" timestamp without time zone, "FileURLIn" text, "FilePathIn" text) OWNER TO postgres;

--
-- TOC entry 303 (class 1255 OID 16401)
-- Name: fn_selectCallTransactionByCompanyExecutiveId(bigint); Type: FUNCTION; Schema: callTransactions; Owner: postgres
--

CREATE FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("CallTransactionId" bigint, "ClientId" bigint, "CompanyExecutiveId" bigint, "ClientNameOnExecutiveContactList" text, "ClientContactNumber" text, "CallType" integer, "TalkDuration" double precision, "CallTime" timestamp without time zone, "FileURL" text, "FilePath" text)
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


ALTER FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 16402)
-- Name: fn_selectCallTransactionByCompanyExecutiveIdAndCallDate(bigint, date); Type: FUNCTION; Schema: callTransactions; Owner: postgres
--

CREATE FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveIdAndCallDate"("CompanyExecutiveIdIn" bigint, "CallDateIn" date) RETURNS TABLE("CallTransactionId" bigint, "ClientId" bigint, "CompanyExecutiveId" bigint, "ClientNameOnExecutiveContactList" text, "ClientContactNumber" text, "CallType" integer, "TalkDuration" double precision, "CallTime" timestamp without time zone, "FileURL" text, "FilePath" text)
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


ALTER FUNCTION "callTransactions"."fn_selectCallTransactionByCompanyExecutiveIdAndCallDate"("CompanyExecutiveIdIn" bigint, "CallDateIn" date) OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 16403)
-- Name: fn_checkClientContactNumber(text, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_checkClientContactNumber"("ClientContactNumberIn" text, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint, "ClientId" bigint, "ContactName" text)
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


ALTER FUNCTION client."fn_checkClientContactNumber"("ClientContactNumberIn" text, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 16404)
-- Name: fn_deleteClient(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_deleteClient"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_deleteClient"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 16405)
-- Name: fn_deleteClientLocation(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_deleteClientLocation"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_deleteClientLocation"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 16406)
-- Name: fn_getClientLocationIdByClientId(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_getClientLocationIdByClientId"("ClientIDIn" bigint) RETURNS bigint
    LANGUAGE sql
    AS $$
SELECT "ClientLocationId" FROM "client"."Client" WHERE "ClientId"="ClientIDIn";
$$;


ALTER FUNCTION client."fn_getClientLocationIdByClientId"("ClientIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 330 (class 1255 OID 16407)
-- Name: fn_insertClient(text, text, text, text, bigint, bigint, bigint, bigint, bigint, text, text, text, text, text, text, timestamp without time zone, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_insertClient"("ContactNameIn" text, "ContactPersonIn" text, "EmailIdIn" text, "ContactNumberIn" text, "CompanyIdIn" bigint, "CountryIn" bigint, "StateIn" bigint, "CityIn" bigint, "AreaIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "pincodeIn" text, "latitudeIn" text, "longitudeIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_insertClient"("ContactNameIn" text, "ContactPersonIn" text, "EmailIdIn" text, "ContactNumberIn" text, "CompanyIdIn" bigint, "CountryIn" bigint, "StateIn" bigint, "CityIn" bigint, "AreaIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "pincodeIn" text, "latitudeIn" text, "longitudeIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint) OWNER TO postgres;

--
-- TOC entry 331 (class 1255 OID 16408)
-- Name: fn_selectClient(); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClient"() RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClient"() OWNER TO postgres;

--
-- TOC entry 335 (class 1255 OID 16409)
-- Name: fn_selectClientByArea(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClientByArea"("AreaIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClientByArea"("AreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 336 (class 1255 OID 16410)
-- Name: fn_selectClientByCity(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClientByCity"("CityIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClientByCity"("CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 337 (class 1255 OID 16411)
-- Name: fn_selectClientByCompany(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClientByCompany"("CompanyIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClientByCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 338 (class 1255 OID 16412)
-- Name: fn_selectClientByCountry(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClientByCountry"("CountryIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClientByCountry"("CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 339 (class 1255 OID 16413)
-- Name: fn_selectClientByOwner(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClientByOwner"("OwnerIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClientByOwner"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 341 (class 1255 OID 16414)
-- Name: fn_selectClientByState(bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_selectClientByState"("StateIdIn" bigint) RETURNS TABLE("ClientId" bigint, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CompanyId" bigint, "CompanyName" text, "Country" bigint, "CountryName" text, "State" bigint, "StateName" text, "City" bigint, "CityName" text, "Area" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, pincode text, latitude text, longitude text, "ClientCreatedOn" timestamp without time zone, "ClientLastEditOn" timestamp without time zone, "ClientCreatedBy" bigint, "ClientLastEditBy" bigint, "ClientisActive" boolean, "ClientLocationCreatedOn" timestamp without time zone, "ClientLocationLastEditOn" timestamp without time zone, "ClientLocationCreatedBy" bigint, "ClientLocationLastEditBy" bigint, "ClientLocationisActive" boolean)
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


ALTER FUNCTION client."fn_selectClientByState"("StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 342 (class 1255 OID 16415)
-- Name: fn_updateClientCompanyId(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 343 (class 1255 OID 16416)
-- Name: fn_updateClientContactName(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientContactName"("idIn" bigint, "ContactNameIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientContactName"("idIn" bigint, "ContactNameIn" text) OWNER TO postgres;

--
-- TOC entry 344 (class 1255 OID 16417)
-- Name: fn_updateClientContactNumber(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientContactNumber"("idIn" bigint, "ContactNumberIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientContactNumber"("idIn" bigint, "ContactNumberIn" text) OWNER TO postgres;

--
-- TOC entry 345 (class 1255 OID 16418)
-- Name: fn_updateClientContactPerson(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientContactPerson"("idIn" bigint, "ContactPersonIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientContactPerson"("idIn" bigint, "ContactPersonIn" text) OWNER TO postgres;

--
-- TOC entry 346 (class 1255 OID 16419)
-- Name: fn_updateClientEmailId(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientEmailId"("idIn" bigint, "EmailIdIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientEmailId"("idIn" bigint, "EmailIdIn" text) OWNER TO postgres;

--
-- TOC entry 347 (class 1255 OID 16420)
-- Name: fn_updateClientIsActive(bigint, boolean); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientIsActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientIsActive"("idIn" bigint, "isActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 348 (class 1255 OID 16421)
-- Name: fn_updateClientLastEditBy(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 349 (class 1255 OID 16422)
-- Name: fn_updateClientLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 350 (class 1255 OID 16423)
-- Name: fn_updateClientLocationAddressLine1(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationAddressLine1"("idIn" bigint, "AddressLine1In" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationAddressLine1"("idIn" bigint, "AddressLine1In" text) OWNER TO postgres;

--
-- TOC entry 351 (class 1255 OID 16424)
-- Name: fn_updateClientLocationAddressLine2(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationAddressLine2"("idIn" bigint, "AddressLine2In" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationAddressLine2"("idIn" bigint, "AddressLine2In" text) OWNER TO postgres;

--
-- TOC entry 352 (class 1255 OID 16425)
-- Name: fn_updateClientLocationAddressLine3(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationAddressLine3"("idIn" bigint, "AddressLine3In" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationAddressLine3"("idIn" bigint, "AddressLine3In" text) OWNER TO postgres;

--
-- TOC entry 353 (class 1255 OID 16426)
-- Name: fn_updateClientLocationArea(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationArea"("idIn" bigint, "AreaIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationArea"("idIn" bigint, "AreaIn" bigint) OWNER TO postgres;

--
-- TOC entry 354 (class 1255 OID 16427)
-- Name: fn_updateClientLocationCity(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationCity"("idIn" bigint, "CityIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationCity"("idIn" bigint, "CityIn" bigint) OWNER TO postgres;

--
-- TOC entry 355 (class 1255 OID 16428)
-- Name: fn_updateClientLocationCountry(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationCountry"("idIn" bigint, "CountryIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationCountry"("idIn" bigint, "CountryIn" bigint) OWNER TO postgres;

--
-- TOC entry 356 (class 1255 OID 16429)
-- Name: fn_updateClientLocationLastEditBy(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 357 (class 1255 OID 16430)
-- Name: fn_updateClientLocationLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 340 (class 1255 OID 16431)
-- Name: fn_updateClientLocationState(bigint, bigint); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationState"("idIn" bigint, "StateIn" bigint) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationState"("idIn" bigint, "StateIn" bigint) OWNER TO postgres;

--
-- TOC entry 299 (class 1255 OID 16432)
-- Name: fn_updateClientLocationisActive(bigint, boolean); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationisActive"("idIn" bigint, "isActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 301 (class 1255 OID 16433)
-- Name: fn_updateClientLocationlatitude(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationlatitude"("idIn" bigint, "latitudeIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationlatitude"("idIn" bigint, "latitudeIn" text) OWNER TO postgres;

--
-- TOC entry 302 (class 1255 OID 16434)
-- Name: fn_updateClientLocationlongitude(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationlongitude"("idIn" bigint, "longitudeIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationlongitude"("idIn" bigint, "longitudeIn" text) OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 16435)
-- Name: fn_updateClientLocationpincode(bigint, text); Type: FUNCTION; Schema: client; Owner: postgres
--

CREATE FUNCTION client."fn_updateClientLocationpincode"("idIn" bigint, "pincodeIn" text) RETURNS boolean
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


ALTER FUNCTION client."fn_updateClientLocationpincode"("idIn" bigint, "pincodeIn" text) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 16436)
-- Name: fn_checkCompanyAreaDeleteStatus(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_checkCompanyAreaDeleteStatus"("CompanyAreaIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") 
FROM company."CompanyBranch"
WHERE "MarkForDelete"=false AND "CompanyAreaID"="CompanyAreaIdIn";
$$;


ALTER FUNCTION company."fn_checkCompanyAreaDeleteStatus"("CompanyAreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 16437)
-- Name: fn_checkCompanyBranchDeleteStatus(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_checkCompanyBranchDeleteStatus"("CompanyBranchIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyExecutiveID") FROM company."CompanyExecutive" WHERE "MarkForDelete"=false AND "CompanyBranchID"="CompanyBranchIdIn";
$$;


ALTER FUNCTION company."fn_checkCompanyBranchDeleteStatus"("CompanyBranchIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 16438)
-- Name: fn_checkCompanyDeleteStatus(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_checkCompanyDeleteStatus"("CompanyIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") FROM company."CompanyBranch" WHERE "MarkForDelete"=false AND "CompanyID"="CompanyIdIn";
$$;


ALTER FUNCTION company."fn_checkCompanyDeleteStatus"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 309 (class 1255 OID 16439)
-- Name: fn_checkCompanyExecutiveDeleteDependency(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_checkCompanyExecutiveDeleteDependency"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") FROM company."CompanyBranch" WHERE "CompanyBranchPrimaryContactID"="CompanyExecutiveIdIn";
$$;


ALTER FUNCTION company."fn_checkCompanyExecutiveDeleteDependency"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 310 (class 1255 OID 16440)
-- Name: fn_checkCompanyExecutiveDeleteStatus(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_checkCompanyExecutiveDeleteStatus"("CompanyIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyBranchID") FROM company."CompanyExecutive" WHERE "CompanyID"="CompanyIdIn" AND "MarkForDelete"=false;
$$;


ALTER FUNCTION company."fn_checkCompanyExecutiveDeleteStatus"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 16441)
-- Name: fn_checkCompanyRegionDeleteStatus(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_checkCompanyRegionDeleteStatus"("CompanyRegionIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyAreaID") FROM company."CompanyArea" WHERE "MarkForDelete"=false AND "CompanyRegionID"="CompanyRegionIdIn";
$$;


ALTER FUNCTION company."fn_checkCompanyRegionDeleteStatus"("CompanyRegionIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 16442)
-- Name: fn_deleteCompany(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompany"("CompanyIdIn" bigint) RETURNS TABLE("CompanyAddressId" bigint)
    LANGUAGE sql
    AS $$

UPDATE company."Company" 	SET "MarkForDelete"=true 
							WHERE "CompanyId"="CompanyIdIn"
							RETURNING "CompanyAddress";

$$;


ALTER FUNCTION company."fn_deleteCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 16443)
-- Name: fn_deleteCompanyAddressDetails(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyAddressDetails"("CompanyAddressIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyAddressDetails"("CompanyAddressIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 16444)
-- Name: fn_deleteCompanyArea(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyArea"("CompanyAreaIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyArea"("CompanyAreaIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 332 (class 1255 OID 16445)
-- Name: fn_deleteCompanyBranch(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyBranch"("CompanyBranchIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyBranch"("CompanyBranchIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 333 (class 1255 OID 16446)
-- Name: fn_deleteCompanyBranchAddressDetails(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 334 (class 1255 OID 16447)
-- Name: fn_deleteCompanyBranchType(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyBranchType"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyBranchType"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 358 (class 1255 OID 16448)
-- Name: fn_deleteCompanyExecutive(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyExecutive"("CompanyExecutiveIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyExecutive"("CompanyExecutiveIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 359 (class 1255 OID 16449)
-- Name: fn_deleteCompanyRegion(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_deleteCompanyRegion"("CompanyRegionIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_deleteCompanyRegion"("CompanyRegionIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 360 (class 1255 OID 16450)
-- Name: fn_getOwnerIdByExecutiveId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_getOwnerIdByExecutiveId"("companyExecutiveId" bigint) RETURNS TABLE("OwnerId" bigint)
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


ALTER FUNCTION company."fn_getOwnerIdByExecutiveId"("companyExecutiveId" bigint) OWNER TO postgres;

--
-- TOC entry 361 (class 1255 OID 16451)
-- Name: fn_insertCompany(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, integer, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompany"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
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


ALTER FUNCTION company."fn_insertCompany"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 362 (class 1255 OID 16452)
-- Name: fn_insertCompanyArea(text, text, text, bigint, bigint, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyArea"("CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_insertCompanyArea"("CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 363 (class 1255 OID 16453)
-- Name: fn_insertCompanyBranch(text, text, text, bigint, bigint, bigint, bigint, text, text, text, bigint, bigint, bigint, text, text, integer, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyBranch"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CompanyAreaIDIn" bigint, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
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


ALTER FUNCTION company."fn_insertCompanyBranch"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyIDIn" bigint, "CompanyRegionIDIn" bigint, "CompanyAreaIDIn" bigint, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 364 (class 1255 OID 16454)
-- Name: fn_insertCompanyBranchType(text, bigint, integer, bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyBranchType"("CompanyBranchTypeNameIn" text, "CompanyIdIn" bigint, "CompanyBranchPositionIn" integer, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_insertCompanyBranchType"("CompanyBranchTypeNameIn" text, "CompanyIdIn" bigint, "CompanyBranchPositionIn" integer, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 367 (class 1255 OID 16455)
-- Name: fn_insertCompanyExecutive(text, text, text, bigint, bigint, bigint, text, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyExecutive"("ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "CompanyBranchIDIn" bigint, "BaseCityIDIn" bigint, "CompanyIDIn" bigint, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_insertCompanyExecutive"("ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "CompanyBranchIDIn" bigint, "BaseCityIDIn" bigint, "CompanyIDIn" bigint, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 368 (class 1255 OID 16456)
-- Name: fn_insertCompanyExecutivePL(bigint, integer, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyExecutivePL"("executiveIdIn" bigint, "PLRateIn" integer, "dateOfEntryIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_insertCompanyExecutivePL"("executiveIdIn" bigint, "PLRateIn" integer, "dateOfEntryIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 369 (class 1255 OID 16457)
-- Name: fn_insertCompanyRegion(text, text, text, bigint, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyRegion"("CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_insertCompanyRegion"("CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyIDIn" bigint, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 370 (class 1255 OID 16458)
-- Name: fn_insertCompanyWithCompanyBranchType(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, text, integer, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyWithCompanyBranchType"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
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


ALTER FUNCTION company."fn_insertCompanyWithCompanyBranchType"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 371 (class 1255 OID 16460)
-- Name: fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, text, integer, text, text, text, text, text, integer, text, text, text, text, text, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
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


ALTER FUNCTION company."fn_insertCompanyWithCompanyBranchTypeAndExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeNameIn" text, "CompanyBranchPositionIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 372 (class 1255 OID 16462)
-- Name: fn_insertCompanyWithExecutivePosition(text, text, text, bigint, bigint, bigint, bigint, text, text, text, text, text, bigint, text, text, text, text, text, text, text, text, integer, text, text, text, text, text, integer, text, text, text, text, text, text, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_insertCompanyWithExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS TABLE("ExecutiveID" bigint, "CompanyBranchID" bigint)
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


ALTER FUNCTION company."fn_insertCompanyWithExecutivePosition"("AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" bigint, "CityIDIn" bigint, "StateIDIn" bigint, "CountryIDIn" bigint, "LatitudeIn" text, "LongitudeIn" text, "GeoLocationIn" text, "CompanyCodeIn" text, "CompanyNameIn" text, "OwnerContactIdIn" bigint, "CompanyRegionNameIn" text, "CompanyRegionCodeIn" text, "CompanyRegionDescriptionIn" text, "CompanyAreaNameIn" text, "CompanyAreaCodeIn" text, "CompanyAreaDescriptionIn" text, "CompanyBranchNameIn" text, "CompanyBranchCodeIn" text, "CompanyBranchTypeIn" integer, "ExecutiveNameIn" text, "LoginIDIn" text, "PasswordIn" text, "ContactNumberIn" text, "PositionNameIn" text, "PositionPriorityIn" integer, "CompanyGrantIn" text, "CompanyBranchGrantIn" text, "CompanyExecutiveGrantIn" text, "ClientGrantIn" text, "ProductGrantIn" text, "LocationGrantIn" text, "EnquiryGrantIn" text, "TicketGrantIn" text, "PositionGrantIn" text, "CreatedOnIn" timestamp without time zone, "CreatedByIn" bigint, "DeviceTypeIn" integer, "LastEditOnIn" timestamp without time zone, "LastEditByIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 373 (class 1255 OID 16464)
-- Name: fn_loginCompanyExecutive(text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_loginCompanyExecutive"("LoginIdIn" text) RETURNS TABLE("CompanyExecutiveId" bigint, "OwnerId" bigint, "CompanyId" bigint, "Company" text, "CompanyBranch" text, "CompanyExecutive" text, "Client" text, "Product" text, "Location" text, "Enquiry" text, "Ticket" text, "Position" text, "NotificationCountToBeRead" bigint, "NotificationCountForNew" bigint, "ImmediateStatusTicketCount" bigint, "HighStatusTicketCount" bigint, "NormalStatusTicketCount" bigint, "LowStatusTicketCount" bigint)
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


ALTER FUNCTION company."fn_loginCompanyExecutive"("LoginIdIn" text) OWNER TO postgres;

--
-- TOC entry 374 (class 1255 OID 16465)
-- Name: fn_revokeCompany(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompany"("CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 375 (class 1255 OID 16466)
-- Name: fn_revokeCompanyAddressDetails(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompanyAddressDetails"("CompanyAddressIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompanyAddressDetails"("CompanyAddressIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 365 (class 1255 OID 16467)
-- Name: fn_revokeCompanyArea(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompanyArea"("CompanyAreaIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompanyArea"("CompanyAreaIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 366 (class 1255 OID 16468)
-- Name: fn_revokeCompanyBranch(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompanyBranch"("CompanyBranchIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompanyBranch"("CompanyBranchIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 376 (class 1255 OID 16469)
-- Name: fn_revokeCompanyBranchAddressDetails(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompanyBranchAddressDetails"("CompanyBranchAddressIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 377 (class 1255 OID 16470)
-- Name: fn_revokeCompanyExecutive(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompanyExecutive"("CompanyExecutiveIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompanyExecutive"("CompanyExecutiveIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 378 (class 1255 OID 16471)
-- Name: fn_revokeCompanyRegion(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_revokeCompanyRegion"("CompanyRegionIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_revokeCompanyRegion"("CompanyRegionIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 379 (class 1255 OID 16472)
-- Name: fn_selectCompany(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompany"() RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompany"() OWNER TO postgres;

--
-- TOC entry 380 (class 1255 OID 16473)
-- Name: fn_selectCompanyAddressDetails(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyAddressDetails"() RETURNS TABLE("CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "StateName" text, "CountryID" bigint, "CountryName" text, "Latitude" text, "Longitude" text)
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


ALTER FUNCTION company."fn_selectCompanyAddressDetails"() OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 16474)
-- Name: fn_selectCompanyArea(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyArea"() RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyArea"() OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 16475)
-- Name: fn_selectCompanyAreaByCompanyAreaID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyAreaByCompanyAreaID"("CompanyAreaIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyAreaByCompanyAreaID"("CompanyAreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 16476)
-- Name: fn_selectCompanyAreaByCompanyID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyAreaByCompanyID"("CompanyIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyAreaByCompanyID"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 16477)
-- Name: fn_selectCompanyAreaByCompanyRegionID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyAreaByCompanyRegionID"("CompanyRegionIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyAreaByCompanyRegionID"("CompanyRegionIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 16478)
-- Name: fn_selectCompanyAreaByOwnerID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyAreaByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyAreaDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyAreaByOwnerID"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 386 (class 1255 OID 16479)
-- Name: fn_selectCompanyBranch(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranch"() RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyBranch"() OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 16480)
-- Name: fn_selectCompanyBranchAddressDetails(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchAddressDetails"() RETURNS TABLE("CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "StateName" text, "CountryID" bigint, "CountryName" text, "Latitude" text, "Longitude" text)
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


ALTER FUNCTION company."fn_selectCompanyBranchAddressDetails"() OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 16481)
-- Name: fn_selectCompanyBranchByCompanyAreaId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchByCompanyAreaId"("CompanyAreaIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyBranchByCompanyAreaId"("CompanyAreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 390 (class 1255 OID 16482)
-- Name: fn_selectCompanyBranchByCompanyBranchId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchByCompanyBranchId"("CompanyBranchIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyBranchByCompanyBranchId"("CompanyBranchIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 391 (class 1255 OID 16483)
-- Name: fn_selectCompanyBranchByCompanyId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyBranchByCompanyId"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 16484)
-- Name: fn_selectCompanyBranchByCompanyRegionId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchByCompanyRegionId"("CompanyRegionIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyBranchByCompanyRegionId"("CompanyRegionIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 16485)
-- Name: fn_selectCompanyBranchByOwnerID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyAreaID" bigint, "CompanyAreaName" text, "CompanyAreaCode" text, "CompanyBranchType" integer, "CompanyId" bigint, "CompanyName" text, "CompanyCode" text, "CompanyBranchAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "ExecutiveId" bigint, "ExecutiveName" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyBranchByOwnerID"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 394 (class 1255 OID 16486)
-- Name: fn_selectCompanyBranchTypeByCompanyId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchTypeByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("CompanyBranchTypeId" bigint, "CompanyBranchTypeName" text, "CompanyId" bigint, "CompanyName" text, "CompanyBranchPosition" integer, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION company."fn_selectCompanyBranchTypeByCompanyId"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 16487)
-- Name: fn_selectCompanyBranchTypeByOwnerId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyBranchTypeByOwnerId"("OwnerIdIn" bigint) RETURNS TABLE("CompanyBranchTypeId" bigint, "CompanyBranchTypeName" text, "CompanyId" bigint, "CompanyName" text, "CompanyBranchPosition" integer, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION company."fn_selectCompanyBranchTypeByOwnerId"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 16488)
-- Name: fn_selectCompanyByCityID(bigint, bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyByCityID"("CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyByCityID"("CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 398 (class 1255 OID 16489)
-- Name: fn_selectCompanyByCompanyID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyByCompanyID"("CompanyIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyByCompanyID"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 16490)
-- Name: fn_selectCompanyByCountryID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyByCountryID"("CountryIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyByCountryID"("CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 400 (class 1255 OID 16491)
-- Name: fn_selectCompanyByOwnerID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyByOwnerID"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 401 (class 1255 OID 16492)
-- Name: fn_selectCompanyByStateID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyByStateID"("CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "CompanyCode" text, "CompanyName" text, "OwnerContactId" bigint, "CompanyAddressID" bigint, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" bigint, "CityID" bigint, "CityName" text, "StateID" bigint, "CountryID" bigint, "Latitude" text, "Longitude" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyByStateID"("CountryIdIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 404 (class 1255 OID 16493)
-- Name: fn_selectCompanyExecutive(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutive"() RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
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


ALTER FUNCTION company."fn_selectCompanyExecutive"() OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 16494)
-- Name: fn_selectCompanyExecutiveByCompanyBranchId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutiveByCompanyBranchId"("CompanyBranchIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
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


ALTER FUNCTION company."fn_selectCompanyExecutiveByCompanyBranchId"("CompanyBranchIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 16495)
-- Name: fn_selectCompanyExecutiveByCompanyExecutiveId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutiveByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
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


ALTER FUNCTION company."fn_selectCompanyExecutiveByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 407 (class 1255 OID 16496)
-- Name: fn_selectCompanyExecutiveByCompanyId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutiveByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
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


ALTER FUNCTION company."fn_selectCompanyExecutiveByCompanyId"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 408 (class 1255 OID 16497)
-- Name: fn_selectCompanyExecutiveByOwnerID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutiveByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean, "Position" integer)
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


ALTER FUNCTION company."fn_selectCompanyExecutiveByOwnerID"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 409 (class 1255 OID 16498)
-- Name: fn_selectCompanyExecutiveOfLowerPosition(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutiveOfLowerPosition"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("ExecutiveID" bigint, "ExecutiveName" text, "LoginID" text, "Password" text, "CompanyBranchID" bigint, "CompanyBranchName" text, "CompanyBranchCode" text, "CityID" bigint, "CityName" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "ContactNumber" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyExecutiveOfLowerPosition"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 410 (class 1255 OID 16499)
-- Name: fn_selectCompanyExecutivePLByAllYears(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLByAllYears"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PLRate" numeric, "Year" double precision)
    LANGUAGE sql
    AS $$
SELECT AVG("PLRate"),extract(year from "dateOfEntry") FROM company."CompanyExecutivePL"
WHERE "executiveId"="CompanyExecutiveIdIn"
GROUP BY extract(year from "dateOfEntry")
ORDER BY extract(year from "dateOfEntry");
$$;


ALTER FUNCTION company."fn_selectCompanyExecutivePLByAllYears"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 411 (class 1255 OID 16500)
-- Name: fn_selectCompanyExecutivePLByExecutiveId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLByExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE(id bigint, "executiveId" bigint, "PLRate" integer, "dateOfEntry" timestamp without time zone)
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


ALTER FUNCTION company."fn_selectCompanyExecutivePLByExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 16501)
-- Name: fn_selectCompanyExecutivePLByExecutiveIdAndDate(bigint, date); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "dateForSearch" date) RETURNS TABLE(id bigint, "executiveId" bigint, "PLRate" integer, "dateOfEntry" timestamp without time zone)
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


ALTER FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "dateForSearch" date) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 16502)
-- Name: fn_selectCompanyExecutivePLByExecutiveIdBetweenDate(bigint, date, date); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdBetweenDate"("CompanyExecutiveIdIn" bigint, "dateForSearchStart" date, "dateForSearchEnd" date) RETURNS TABLE(id bigint, "executiveId" bigint, "PLRate" integer, "dateOfEntry" timestamp without time zone)
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


ALTER FUNCTION company."fn_selectCompanyExecutivePLByExecutiveIdBetweenDate"("CompanyExecutiveIdIn" bigint, "dateForSearchStart" date, "dateForSearchEnd" date) OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 16503)
-- Name: fn_selectCompanyExecutivePLByMonth(bigint, integer, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLByMonth"("CompanyExecutiveIdIn" bigint, "MonthId" integer, "YearId" integer) RETURNS TABLE("PLRate" numeric, "Date" date)
    LANGUAGE sql
    AS $$
SELECT AVG("PLRate"),date("dateOfEntry") FROM company."CompanyExecutivePL"
WHERE extract(month from "dateOfEntry")="MonthId"
AND extract(year from "dateOfEntry")="YearId"
AND "executiveId"="CompanyExecutiveIdIn"
GROUP BY date("dateOfEntry") 
ORDER BY date("dateOfEntry");
$$;


ALTER FUNCTION company."fn_selectCompanyExecutivePLByMonth"("CompanyExecutiveIdIn" bigint, "MonthId" integer, "YearId" integer) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 16504)
-- Name: fn_selectCompanyExecutivePLByYear(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLByYear"("CompanyExecutiveIdIn" bigint, "YearId" integer) RETURNS TABLE("PLRate" numeric, "Month" double precision)
    LANGUAGE sql
    AS $$
SELECT AVG("PLRate"),extract(month from "dateOfEntry") FROM company."CompanyExecutivePL"
WHERE extract(year from "dateOfEntry")="YearId"
AND "executiveId"="CompanyExecutiveIdIn"
GROUP BY extract(month from "dateOfEntry")
ORDER BY extract(month from "dateOfEntry")
$$;


ALTER FUNCTION company."fn_selectCompanyExecutivePLByYear"("CompanyExecutiveIdIn" bigint, "YearId" integer) OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 16505)
-- Name: fn_selectCompanyExecutivePLLastPLEntry(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePLLastPLEntry"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PLRate" integer)
    LANGUAGE sql
    AS $$
SELECT "PLRate" 
FROM company."CompanyExecutivePL"
WHERE "executiveId"="CompanyExecutiveIdIn" 
ORDER BY "dateOfEntry" DESC LIMIT 1;
$$;


ALTER FUNCTION company."fn_selectCompanyExecutivePLLastPLEntry"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 413 (class 1255 OID 16506)
-- Name: fn_selectCompanyExecutivePositionPriority(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyExecutivePositionPriority"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PositionPriority" integer)
    LANGUAGE sql
    AS $$SELECT "CorrespondingPosition" 
FROM public."CRMAccessList" 
WHERE "CorrespondingId"="CompanyExecutiveIdIn"
AND "MarkForDelete"=FALSE$$;


ALTER FUNCTION company."fn_selectCompanyExecutivePositionPriority"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 16507)
-- Name: fn_selectCompanyRegion(); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyRegion"() RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyRegion"() OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 16508)
-- Name: fn_selectCompanyRegionByCompanyID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyRegionByCompanyID"("CompanyIdIn" bigint) RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyRegionByCompanyID"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 416 (class 1255 OID 16509)
-- Name: fn_selectCompanyRegionByCompanyRegionID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyRegionByCompanyRegionID"("CompanyRegionIdIn" bigint) RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyRegionByCompanyRegionID"("CompanyRegionIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 16510)
-- Name: fn_selectCompanyRegionByOwnerID(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectCompanyRegionByOwnerID"("OwnerIdIn" bigint) RETURNS TABLE("CompanyRegionID" bigint, "CompanyRegionName" text, "CompanyRegionCode" text, "CompanyRegionDescription" text, "CompanyID" bigint, "CompanyName" text, "CompanyCode" text, "IsActive" boolean)
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


ALTER FUNCTION company."fn_selectCompanyRegionByOwnerID"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 16511)
-- Name: fn_selectLatestCompanyExecutivePL(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectLatestCompanyExecutivePL"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("PLRate" integer)
    LANGUAGE sql
    AS $$
SELECT
		"PLRate"
FROM "company"."CompanyExecutivePL"
WHERE "company"."CompanyExecutivePL"."executiveId"="CompanyExecutiveIdIn"
ORDER BY "company"."CompanyExecutivePL"."dateOfEntry" DESC LIMIT 1
$$;


ALTER FUNCTION company."fn_selectLatestCompanyExecutivePL"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 419 (class 1255 OID 16512)
-- Name: fn_selectOwnerIdByCompanyExecutiveId(bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_selectOwnerIdByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("OwnerId" bigint)
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


ALTER FUNCTION company."fn_selectOwnerIdByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 420 (class 1255 OID 16513)
-- Name: fn_updateCompanyAddressDetailsAddressLine1(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsAddressLine1"("CompanyAddressIdIn" bigint, "AddressLine1In" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsAddressLine1"("CompanyAddressIdIn" bigint, "AddressLine1In" text) OWNER TO postgres;

--
-- TOC entry 421 (class 1255 OID 16514)
-- Name: fn_updateCompanyAddressDetailsAddressLine2(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsAddressLine2"("CompanyAddressIdIn" bigint, "AddressLine2In" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsAddressLine2"("CompanyAddressIdIn" bigint, "AddressLine2In" text) OWNER TO postgres;

--
-- TOC entry 422 (class 1255 OID 16515)
-- Name: fn_updateCompanyAddressDetailsAddressLine3(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsAddressLine3"("CompanyAddressIdIn" bigint, "AddressLine3In" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsAddressLine3"("CompanyAddressIdIn" bigint, "AddressLine3In" text) OWNER TO postgres;

--
-- TOC entry 423 (class 1255 OID 16516)
-- Name: fn_updateCompanyAddressDetailsCityID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsCityID"("CompanyAddressIdIn" bigint, "CityIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsCityID"("CompanyAddressIdIn" bigint, "CityIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 16517)
-- Name: fn_updateCompanyAddressDetailsCountryID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsCountryID"("CompanyAddressIdIn" bigint, "CountryIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsCountryID"("CompanyAddressIdIn" bigint, "CountryIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 425 (class 1255 OID 16518)
-- Name: fn_updateCompanyAddressDetailsGeoLocation(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsGeoLocation"("CompanyAddressIdIn" bigint, "GeoLocationIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsGeoLocation"("CompanyAddressIdIn" bigint, "GeoLocationIn" text) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 16519)
-- Name: fn_updateCompanyAddressDetailsLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsLastEditBy"("CompanyAddressIdIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsLastEditBy"("CompanyAddressIdIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 16520)
-- Name: fn_updateCompanyAddressDetailsLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsLastEditDeviceType"("CompanyAddressIdIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsLastEditDeviceType"("CompanyAddressIdIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 428 (class 1255 OID 16521)
-- Name: fn_updateCompanyAddressDetailsLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsLastEditOn"("CompanyAddressIdIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsLastEditOn"("CompanyAddressIdIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 429 (class 1255 OID 16522)
-- Name: fn_updateCompanyAddressDetailsLatitude(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsLatitude"("CompanyAddressIdIn" bigint, "LatitudeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsLatitude"("CompanyAddressIdIn" bigint, "LatitudeIn" text) OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 16523)
-- Name: fn_updateCompanyAddressDetailsLongitude(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsLongitude"("CompanyAddressIdIn" bigint, "LongitudeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsLongitude"("CompanyAddressIdIn" bigint, "LongitudeIn" text) OWNER TO postgres;

--
-- TOC entry 431 (class 1255 OID 16524)
-- Name: fn_updateCompanyAddressDetailsPincode(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsPincode"("CompanyAddressIdIn" bigint, "PincodeIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsPincode"("CompanyAddressIdIn" bigint, "PincodeIn" bigint) OWNER TO postgres;

--
-- TOC entry 432 (class 1255 OID 16525)
-- Name: fn_updateCompanyAddressDetailsStateID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAddressDetailsStateID"("CompanyAddressIdIn" bigint, "StateIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAddressDetailsStateID"("CompanyAddressIdIn" bigint, "StateIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 433 (class 1255 OID 16526)
-- Name: fn_updateCompanyAreaCompanyAreaCode(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaCompanyAreaCode"("CompanyAreaIDIn" bigint, "CompanyAreaCodeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaCompanyAreaCode"("CompanyAreaIDIn" bigint, "CompanyAreaCodeIn" text) OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 16527)
-- Name: fn_updateCompanyAreaCompanyAreaDescription(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaCompanyAreaDescription"("CompanyAreaIDIn" bigint, "CompanyAreaDescriptionIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaCompanyAreaDescription"("CompanyAreaIDIn" bigint, "CompanyAreaDescriptionIn" text) OWNER TO postgres;

--
-- TOC entry 435 (class 1255 OID 16528)
-- Name: fn_updateCompanyAreaCompanyAreaName(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaCompanyAreaName"("CompanyAreaIDIn" bigint, "CompanyAreaNameIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaCompanyAreaName"("CompanyAreaIDIn" bigint, "CompanyAreaNameIn" text) OWNER TO postgres;

--
-- TOC entry 436 (class 1255 OID 16529)
-- Name: fn_updateCompanyAreaCompanyID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaCompanyID"("CompanyAreaIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaCompanyID"("CompanyAreaIDIn" bigint, "CompanyIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 16530)
-- Name: fn_updateCompanyAreaCompanyRegionID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaCompanyRegionID"("CompanyAreaIDIn" bigint, "CompanyRegionIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaCompanyRegionID"("CompanyAreaIDIn" bigint, "CompanyRegionIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 16531)
-- Name: fn_updateCompanyAreaIsActive(bigint, boolean); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaIsActive"("CompanyAreaIDIn" bigint, "IsActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaIsActive"("CompanyAreaIDIn" bigint, "IsActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 439 (class 1255 OID 16532)
-- Name: fn_updateCompanyAreaLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaLastEditBy"("CompanyAreaIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaLastEditBy"("CompanyAreaIDIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 440 (class 1255 OID 16533)
-- Name: fn_updateCompanyAreaLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaLastEditDeviceType"("CompanyAreaIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaLastEditDeviceType"("CompanyAreaIDIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 441 (class 1255 OID 16534)
-- Name: fn_updateCompanyAreaLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyAreaLastEditOn"("CompanyAreaIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyAreaLastEditOn"("CompanyAreaIDIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 16535)
-- Name: fn_updateCompanyBranchAddressDetailsAddressLine1(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine1"("CompanyBranchAddressIDIn" bigint, "AddressLine1In" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine1"("CompanyBranchAddressIDIn" bigint, "AddressLine1In" text) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 16536)
-- Name: fn_updateCompanyBranchAddressDetailsAddressLine2(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine2"("CompanyBranchAddressIDIn" bigint, "AddressLine2In" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine2"("CompanyBranchAddressIDIn" bigint, "AddressLine2In" text) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 16537)
-- Name: fn_updateCompanyBranchAddressDetailsAddressLine3(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine3"("CompanyBranchAddressIDIn" bigint, "AddressLine3In" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsAddressLine3"("CompanyBranchAddressIDIn" bigint, "AddressLine3In" text) OWNER TO postgres;

--
-- TOC entry 445 (class 1255 OID 16538)
-- Name: fn_updateCompanyBranchAddressDetailsCityID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsCityID"("CompanyBranchAddressIDIn" bigint, "CityIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsCityID"("CompanyBranchAddressIDIn" bigint, "CityIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 446 (class 1255 OID 16539)
-- Name: fn_updateCompanyBranchAddressDetailsCountryID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsCountryID"("CompanyBranchAddressIDIn" bigint, "CountryIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsCountryID"("CompanyBranchAddressIDIn" bigint, "CountryIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 16540)
-- Name: fn_updateCompanyBranchAddressDetailsGeoLocation(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsGeoLocation"("CompanyBranchAddressIDIn" bigint, "GeoLocationIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsGeoLocation"("CompanyBranchAddressIDIn" bigint, "GeoLocationIn" text) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 16541)
-- Name: fn_updateCompanyBranchAddressDetailsLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditBy"("CompanyBranchAddressIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditBy"("CompanyBranchAddressIDIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 449 (class 1255 OID 16542)
-- Name: fn_updateCompanyBranchAddressDetailsLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditDeviceType"("CompanyBranchAddressIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditDeviceType"("CompanyBranchAddressIDIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 450 (class 1255 OID 16543)
-- Name: fn_updateCompanyBranchAddressDetailsLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditOn"("CompanyBranchAddressIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsLastEditOn"("CompanyBranchAddressIDIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 16544)
-- Name: fn_updateCompanyBranchAddressDetailsLatitude(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLatitude"("CompanyBranchAddressIDIn" bigint, "LatitudeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsLatitude"("CompanyBranchAddressIDIn" bigint, "LatitudeIn" text) OWNER TO postgres;

--
-- TOC entry 452 (class 1255 OID 16545)
-- Name: fn_updateCompanyBranchAddressDetailsLongitude(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsLongitude"("CompanyBranchAddressIDIn" bigint, "LongitudeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsLongitude"("CompanyBranchAddressIDIn" bigint, "LongitudeIn" text) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 16546)
-- Name: fn_updateCompanyBranchAddressDetailsPincode(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsPincode"("CompanyBranchAddressIDIn" bigint, "PincodeIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsPincode"("CompanyBranchAddressIDIn" bigint, "PincodeIn" bigint) OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 16547)
-- Name: fn_updateCompanyBranchAddressDetailsStateID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchAddressDetailsStateID"("CompanyBranchAddressIDIn" bigint, "StateIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchAddressDetailsStateID"("CompanyBranchAddressIDIn" bigint, "StateIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 455 (class 1255 OID 16548)
-- Name: fn_updateCompanyBranchCompanyAreaID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyAreaID"("CompanyBranchIDIn" bigint, "CompanyAreaIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyAreaID"("CompanyBranchIDIn" bigint, "CompanyAreaIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 16549)
-- Name: fn_updateCompanyBranchCompanyBranchAddressID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchAddressID"("CompanyBranchIDIn" bigint, "CompanyBranchAddressIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyBranchAddressID"("CompanyBranchIDIn" bigint, "CompanyBranchAddressIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 457 (class 1255 OID 16550)
-- Name: fn_updateCompanyBranchCompanyBranchCode(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchCode"("CompanyBranchIDIn" bigint, "CompanyBranchCodeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyBranchCode"("CompanyBranchIDIn" bigint, "CompanyBranchCodeIn" text) OWNER TO postgres;

--
-- TOC entry 458 (class 1255 OID 16551)
-- Name: fn_updateCompanyBranchCompanyBranchName(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchName"("CompanyBranchIDIn" bigint, "CompanyBranchNameIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyBranchName"("CompanyBranchIDIn" bigint, "CompanyBranchNameIn" text) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 16552)
-- Name: fn_updateCompanyBranchCompanyBranchPrimaryContactID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchPrimaryContactID"("CompanyBranchIDIn" bigint, "CompanyBranchPrimaryContactIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyBranchPrimaryContactID"("CompanyBranchIDIn" bigint, "CompanyBranchPrimaryContactIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 16553)
-- Name: fn_updateCompanyBranchCompanyBranchType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyBranchType"("CompanyBranchIDIn" bigint, "CompanyBranchTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyBranchType"("CompanyBranchIDIn" bigint, "CompanyBranchTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 16554)
-- Name: fn_updateCompanyBranchCompanyID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyID"("CompanyBranchIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyID"("CompanyBranchIDIn" bigint, "CompanyIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 16555)
-- Name: fn_updateCompanyBranchCompanyRegionID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchCompanyRegionID"("CompanyBranchIDIn" bigint, "CompanyRegionIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchCompanyRegionID"("CompanyBranchIDIn" bigint, "CompanyRegionIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 16556)
-- Name: fn_updateCompanyBranchIsActive(bigint, boolean); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchIsActive"("CompanyBranchIDIn" bigint, "IsActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchIsActive"("CompanyBranchIDIn" bigint, "IsActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 16557)
-- Name: fn_updateCompanyBranchLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchLastEditBy"("CompanyBranchIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchLastEditBy"("CompanyBranchIDIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 16558)
-- Name: fn_updateCompanyBranchLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchLastEditDeviceType"("CompanyBranchIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchLastEditDeviceType"("CompanyBranchIDIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 16559)
-- Name: fn_updateCompanyBranchLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchLastEditOn"("CompanyBranchIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchLastEditOn"("CompanyBranchIDIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 16560)
-- Name: fn_updateCompanyBranchTypeCompanyBranchPosition(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchPosition"("idIn" bigint, "CompanyBranchPositionIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchPosition"("idIn" bigint, "CompanyBranchPositionIn" integer) OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 16561)
-- Name: fn_updateCompanyBranchTypeCompanyBranchTypeName(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchTypeName"("idIn" bigint, "CompanyBranchTypeNameIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchTypeCompanyBranchTypeName"("idIn" bigint, "CompanyBranchTypeNameIn" text) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 16562)
-- Name: fn_updateCompanyBranchTypeCompanyId(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 16563)
-- Name: fn_updateCompanyBranchTypeLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 16564)
-- Name: fn_updateCompanyBranchTypeLatEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyBranchTypeLatEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyBranchTypeLatEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 16565)
-- Name: fn_updateCompanyCityId(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyCityId"("CompanyIdIn" bigint, "CityIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyCityId"("CompanyIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 16566)
-- Name: fn_updateCompanyCompanyAddress(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyCompanyAddress"("CompanyIdIn" bigint, "CompanyAddressIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyCompanyAddress"("CompanyIdIn" bigint, "CompanyAddressIn" bigint) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 16567)
-- Name: fn_updateCompanyCompanyCode(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyCompanyCode"("CompanyIdIn" bigint, "CompanyCodeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyCompanyCode"("CompanyIdIn" bigint, "CompanyCodeIn" text) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 16568)
-- Name: fn_updateCompanyCompanyName(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyCompanyName"("CompanyIdIn" bigint, "CompanyNameIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyCompanyName"("CompanyIdIn" bigint, "CompanyNameIn" text) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 16569)
-- Name: fn_updateCompanyExecutiveBaseCityID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveBaseCityID"("CompanyExecutiveIDIn" bigint, "BaseCityIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveBaseCityID"("CompanyExecutiveIDIn" bigint, "BaseCityIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 16570)
-- Name: fn_updateCompanyExecutiveCompanyBranchID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveCompanyBranchID"("CompanyExecutiveIDIn" bigint, "CompanyBranchIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveCompanyBranchID"("CompanyExecutiveIDIn" bigint, "CompanyBranchIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 16571)
-- Name: fn_updateCompanyExecutiveCompanyID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveCompanyID"("CompanyExecutiveIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveCompanyID"("CompanyExecutiveIDIn" bigint, "CompanyIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 16572)
-- Name: fn_updateCompanyExecutiveContactNumber(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveContactNumber"("CompanyExecutiveIDIn" bigint, "ContactNumberIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveContactNumber"("CompanyExecutiveIDIn" bigint, "ContactNumberIn" text) OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 16573)
-- Name: fn_updateCompanyExecutiveExecutiveName(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveExecutiveName"("CompanyExecutiveIDIn" bigint, "ExecutiveNameIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveExecutiveName"("CompanyExecutiveIDIn" bigint, "ExecutiveNameIn" text) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 16574)
-- Name: fn_updateCompanyExecutiveLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveLastEditBy"("CompanyExecutiveIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveLastEditBy"("CompanyExecutiveIDIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 16575)
-- Name: fn_updateCompanyExecutiveLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveLastEditDeviceType"("CompanyExecutiveIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveLastEditDeviceType"("CompanyExecutiveIDIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 16576)
-- Name: fn_updateCompanyExecutiveLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveLastEditOn"("CompanyExecutiveIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveLastEditOn"("CompanyExecutiveIDIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 16577)
-- Name: fn_updateCompanyExecutiveLoginID(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutiveLoginID"("CompanyExecutiveIDIn" bigint, "LoginIDIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutiveLoginID"("CompanyExecutiveIDIn" bigint, "LoginIDIn" text) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 16578)
-- Name: fn_updateCompanyExecutivePassword(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyExecutivePassword"("CompanyExecutiveIDIn" bigint, "PasswordIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyExecutivePassword"("CompanyExecutiveIDIn" bigint, "PasswordIn" text) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 16579)
-- Name: fn_updateCompanyIsActive(bigint, boolean); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyIsActive"("CompanyIdIn" bigint, "IsActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyIsActive"("CompanyIdIn" bigint, "IsActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 16580)
-- Name: fn_updateCompanyLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyLastEditDeviceType"("CompanyIdIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyLastEditDeviceType"("CompanyIdIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 16581)
-- Name: fn_updateCompanyLastEditedBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyLastEditedBy"("CompanyIdIn" bigint, "LastEditedByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyLastEditedBy"("CompanyIdIn" bigint, "LastEditedByIn" bigint) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 16582)
-- Name: fn_updateCompanyLastEditedOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyLastEditedOn"("CompanyIdIn" bigint, "LastEditedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyLastEditedOn"("CompanyIdIn" bigint, "LastEditedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 16583)
-- Name: fn_updateCompanyOwnerContactId(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyOwnerContactId"("CompanyIdIn" bigint, "OwnerContactIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyOwnerContactId"("CompanyIdIn" bigint, "OwnerContactIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 16584)
-- Name: fn_updateCompanyRegionCompanyID(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionCompanyID"("CompanyRegionIDIn" bigint, "CompanyIDIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionCompanyID"("CompanyRegionIDIn" bigint, "CompanyIDIn" bigint) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 16585)
-- Name: fn_updateCompanyRegionCompanyRegionCode(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionCompanyRegionCode"("CompanyRegionIDIn" bigint, "CompanyRegionCodeIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionCompanyRegionCode"("CompanyRegionIDIn" bigint, "CompanyRegionCodeIn" text) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 16586)
-- Name: fn_updateCompanyRegionCompanyRegionDescription(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionCompanyRegionDescription"("CompanyRegionIDIn" bigint, "CompanyRegionDescriptionIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionCompanyRegionDescription"("CompanyRegionIDIn" bigint, "CompanyRegionDescriptionIn" text) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 16587)
-- Name: fn_updateCompanyRegionCompanyRegionName(bigint, text); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionCompanyRegionName"("CompanyRegionIDIn" bigint, "CompanyRegionNameIn" text) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionCompanyRegionName"("CompanyRegionIDIn" bigint, "CompanyRegionNameIn" text) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 16588)
-- Name: fn_updateCompanyRegionIsActive(bigint, boolean); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionIsActive"("CompanyRegionIDIn" bigint, "IsActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionIsActive"("CompanyRegionIDIn" bigint, "IsActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 16589)
-- Name: fn_updateCompanyRegionLastEditBy(bigint, bigint); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionLastEditBy"("CompanyRegionIDIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionLastEditBy"("CompanyRegionIDIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 16590)
-- Name: fn_updateCompanyRegionLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionLastEditDeviceType"("CompanyRegionIDIn" bigint, "LastEditDeviceTypeIn" integer) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionLastEditDeviceType"("CompanyRegionIDIn" bigint, "LastEditDeviceTypeIn" integer) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 16591)
-- Name: fn_updateCompanyRegionLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: company; Owner: postgres
--

CREATE FUNCTION company."fn_updateCompanyRegionLastEditOn"("CompanyRegionIDIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION company."fn_updateCompanyRegionLastEditOn"("CompanyRegionIDIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 16592)
-- Name: fn_insertCompanyExecutiveGeoLocation(bigint, bigint, timestamp without time zone, text, text, text, text, text, text, text, text, text, text); Type: FUNCTION; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE FUNCTION "companyExecutiveGeoLocation"."fn_insertCompanyExecutiveGeoLocation"("CompanyExecutiveIdIn" bigint, "CompanyIdIn" bigint, "EntryDateAndTimeIn" timestamp without time zone, "LatitudeIn" text, "LongitudeIn" text, "CountryIn" text, "StateIn" text, "CityIn" text, "AreaIn" text, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text) RETURNS boolean
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


ALTER FUNCTION "companyExecutiveGeoLocation"."fn_insertCompanyExecutiveGeoLocation"("CompanyExecutiveIdIn" bigint, "CompanyIdIn" bigint, "EntryDateAndTimeIn" timestamp without time zone, "LatitudeIn" text, "LongitudeIn" text, "CountryIn" text, "StateIn" text, "CityIn" text, "AreaIn" text, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text) OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 16593)
-- Name: fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate(bigint, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone) RETURNS TABLE("Country" text, "State" text, "City" text, "Area" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "EntryDateAndTime" timestamp without time zone)
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


ALTER FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 16594)
-- Name: fn_selectCompanyExecutiveGeoLocationAddressByDate(bigint, date); Type: FUNCTION; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByDate"("CompanyExecutiveIdIn" bigint, "DateIn" date) RETURNS TABLE("Country" text, "State" text, "City" text, "Area" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "EntryDateAndTime" timestamp without time zone)
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


ALTER FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationAddressByDate"("CompanyExecutiveIdIn" bigint, "DateIn" date) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 16595)
-- Name: fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate(bigint, timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone) RETURNS TABLE("CompanyExecutiveGeoLocationId" bigint, "Latitude" text, "Longitude" text, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CompanyId" bigint, "CompanyName" text, "EntryDateAndTime" timestamp without time zone)
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


ALTER FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyBetweenDate"("CompanyExecutiveIdIn" bigint, "StartDateIn" timestamp without time zone, "EndDateIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 16596)
-- Name: fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId(bigint); Type: FUNCTION; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("CompanyExecutiveGeoLocationId" bigint, "Latitude" text, "Longitude" text, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CompanyId" bigint, "CompanyName" text, "EntryDateAndTime" timestamp without time zone)
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


ALTER FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 16597)
-- Name: fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(bigint, date); Type: FUNCTION; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "DateIn" date) RETURNS TABLE("CompanyExecutiveGeoLocationId" bigint, "Latitude" text, "Longitude" text, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CompanyId" bigint, "CompanyName" text, "EntryDateAndTime" timestamp without time zone)
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


ALTER FUNCTION "companyExecutiveGeoLocation"."fn_selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate"("CompanyExecutiveIdIn" bigint, "DateIn" date) OWNER TO postgres;

--
-- TOC entry 506 (class 1255 OID 16598)
-- Name: fn_checkExecutiveEnquiryAccess(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_checkExecutiveEnquiryAccess"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
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


ALTER FUNCTION enquiry."fn_checkExecutiveEnquiryAccess"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 16599)
-- Name: fn_deleteEnquiryAccessList(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_deleteEnquiryAccessList"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_deleteEnquiryAccessList"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 16600)
-- Name: fn_deleteEnquiryProductList(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_deleteEnquiryProductList"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_deleteEnquiryProductList"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 16601)
-- Name: fn_deleteEnquiryType(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_deleteEnquiryType"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_deleteEnquiryType"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 16602)
-- Name: fn_deleteMainEnquiry(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_deleteMainEnquiry"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_deleteMainEnquiry"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 512 (class 1255 OID 16603)
-- Name: fn_insertEnquiry(bigint, text, bigint, bigint, bigint, bigint, bigint, bigint, text, text, text, text, text, text, timestamp without time zone, timestamp without time zone, bigint, timestamp without time zone); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_insertEnquiry"("CompanyIdIn" bigint, "EnquiryRemarksIn" text, "EnquiryTypeIn" bigint, "ClientIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text, "LatitudeIn" text, "LongitudeIn" text, "startDateAndTimeIn" timestamp without time zone, "deadlineDateAndTimeIn" timestamp without time zone, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS TABLE("EnquiryId" bigint)
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


ALTER FUNCTION enquiry."fn_insertEnquiry"("CompanyIdIn" bigint, "EnquiryRemarksIn" text, "EnquiryTypeIn" bigint, "ClientIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint, "AddressLine1In" text, "AddressLine2In" text, "AddressLine3In" text, "PincodeIn" text, "LatitudeIn" text, "LongitudeIn" text, "startDateAndTimeIn" timestamp without time zone, "deadlineDateAndTimeIn" timestamp without time zone, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 16604)
-- Name: fn_insertEnquiryAccessList(bigint, bigint, timestamp without time zone); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_insertEnquiryAccessList"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_insertEnquiryAccessList"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 16605)
-- Name: fn_insertEnquiryProductList(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_insertEnquiryProductList"("EnquiryIdIn" bigint, "ProductIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_insertEnquiryProductList"("EnquiryIdIn" bigint, "ProductIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 16606)
-- Name: fn_insertEnquiryType(text, text, bigint, bigint, timestamp without time zone); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_insertEnquiryType"("EnquiryTypeNameIn" text, "EnquiryTypeColorCodeIn" text, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_insertEnquiryType"("EnquiryTypeNameIn" text, "EnquiryTypeColorCodeIn" text, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 16607)
-- Name: fn_selectCompanyExecutiveEnquiryAccessDependency(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectCompanyExecutiveEnquiryAccessDependency"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("EnquiryAccessListId") 
FROM enquiry."EnquiryAccessList"
WHERE "EnquiryId"="EnquiryIdIn"
AND "CompanyExecutiveId"="CompanyExecutiveIdIn"
AND	"MarkForDelete"=FALSE
$$;


ALTER FUNCTION enquiry."fn_selectCompanyExecutiveEnquiryAccessDependency"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 517 (class 1255 OID 16608)
-- Name: fn_selectEnquiryAccessListByEnquiryId(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryAccessListByEnquiryId"("EnquiryIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "OwnerFlag" boolean, "AccessApplicationTime" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryAccessListByEnquiryId"("EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 518 (class 1255 OID 16609)
-- Name: fn_selectEnquiryAndProductIdByProductListId(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryAndProductIdByProductListId"("ProductIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "ProductId" bigint)
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


ALTER FUNCTION enquiry."fn_selectEnquiryAndProductIdByProductListId"("ProductIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 519 (class 1255 OID 16610)
-- Name: fn_selectEnquiryByArea(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByArea"("AreaIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByArea"("AreaIDIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 521 (class 1255 OID 16611)
-- Name: fn_selectEnquiryByCity(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByCity"("CityIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByCity"("CityIDIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 16612)
-- Name: fn_selectEnquiryByClientId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByClientId"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByClientId"("ClientIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 523 (class 1255 OID 16613)
-- Name: fn_selectEnquiryByCompanyExecutiveId(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 524 (class 1255 OID 16614)
-- Name: fn_selectEnquiryByCountry(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByCountry"("CountryIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByCountry"("CountryIDIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 525 (class 1255 OID 16615)
-- Name: fn_selectEnquiryByEnquiryTypeId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByEnquiryTypeId"("EnquiryTypeIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByEnquiryTypeId"("EnquiryTypeIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 16616)
-- Name: fn_selectEnquiryByProductId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByProductId"("ProductIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByProductId"("ProductIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 527 (class 1255 OID 16617)
-- Name: fn_selectEnquiryByState(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryByState"("StateIDIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryAccessListId" bigint, "EnquiryId" bigint, "CompanyId" bigint, "CompanyName" text, "EnquiryRemarks" text, "EnquiryType" bigint, "EnquiryTypeName" text, "EnquiryLocationId" bigint, "CountryId" bigint, "CountryName" text, "StateId" bigint, "StateName" text, "CityId" bigint, "CityName" text, "AreaId" bigint, "AreaName" text, "AddressLine1" text, "AddressLine2" text, "AddressLine3" text, "Pincode" text, "Latitude" text, "Longitude" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryClientId" bigint, "ClientId" bigint, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryByState"("StateIDIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 528 (class 1255 OID 16618)
-- Name: fn_selectEnquiryDetailsForProductTicketInsert(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryDetailsForProductTicketInsert"("EnquiryIdIn" bigint) RETURNS TABLE("EnquiryRemarks" text, "startDateAndTime" timestamp without time zone, "deadlineDateAndTime" timestamp without time zone, "EnquiryType" bigint, "CompanyId" bigint)
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


ALTER FUNCTION enquiry."fn_selectEnquiryDetailsForProductTicketInsert"("EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 529 (class 1255 OID 16619)
-- Name: fn_selectEnquiryNonAddedProducts(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryNonAddedProducts"("EnquiryIdIn" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
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


ALTER FUNCTION enquiry."fn_selectEnquiryNonAddedProducts"("EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 530 (class 1255 OID 16620)
-- Name: fn_selectEnquiryProductList(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryProductList"("EnquiryIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "EnquiryProductListId" bigint, "ProductId" bigint, "productName" text, "ProductCharges" double precision)
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


ALTER FUNCTION enquiry."fn_selectEnquiryProductList"("EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 531 (class 1255 OID 16621)
-- Name: fn_selectEnquiryTypeByCompanyId(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryTypeByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE("EnquiryTypeId" bigint, "EnquiryTypeName" text, "EnquiryTypeColorCode" text, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryTypeByCompanyId"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 16622)
-- Name: fn_selectEnquiryTypeByOwnerId(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectEnquiryTypeByOwnerId"("OwnerIdIn" bigint) RETURNS TABLE("EnquiryTypeId" bigint, "EnquiryTypeName" text, "EnquiryTypeColorCode" text, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION enquiry."fn_selectEnquiryTypeByOwnerId"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 16623)
-- Name: fn_selectNonExistingCompanyExecutivesInEnquiry(bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiry"("EnquiryIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
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


ALTER FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiry"("EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 16624)
-- Name: fn_selectNonExistingCompanyExecutivesInEnquiryByCompanyExecutiv(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiryByCompanyExecutiv"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
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


ALTER FUNCTION enquiry."fn_selectNonExistingCompanyExecutivesInEnquiryByCompanyExecutiv"("EnquiryIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 16625)
-- Name: fn_updateEnquiryClient(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryClient"("ClientIdIn" bigint, "EnquiryIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryClient"("ClientIdIn" bigint, "EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 16626)
-- Name: fn_updateEnquiryLocationAddressLine1(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationAddressLine1"("idIn" bigint, "AddressLine1In" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationAddressLine1"("idIn" bigint, "AddressLine1In" text) OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 16627)
-- Name: fn_updateEnquiryLocationAddressLine2(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationAddressLine2"("idIn" bigint, "AddressLine2In" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationAddressLine2"("idIn" bigint, "AddressLine2In" text) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 16628)
-- Name: fn_updateEnquiryLocationAddressLine3(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationAddressLine3"("idIn" bigint, "AddressLine3In" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationAddressLine3"("idIn" bigint, "AddressLine3In" text) OWNER TO postgres;

--
-- TOC entry 542 (class 1255 OID 16629)
-- Name: fn_updateEnquiryLocationAreaId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationAreaId"("idIn" bigint, "AreaIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationAreaId"("idIn" bigint, "AreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 543 (class 1255 OID 16630)
-- Name: fn_updateEnquiryLocationCityId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationCityId"("idIn" bigint, "CityIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationCityId"("idIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 544 (class 1255 OID 16631)
-- Name: fn_updateEnquiryLocationCountryId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationCountryId"("idIn" bigint, "CountryIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationCountryId"("idIn" bigint, "CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 16632)
-- Name: fn_updateEnquiryLocationLatitude(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationLatitude"("idIn" bigint, "LatitudeIn" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationLatitude"("idIn" bigint, "LatitudeIn" text) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 16633)
-- Name: fn_updateEnquiryLocationLongitude(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationLongitude"("idIn" bigint, "LongitudeIn" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationLongitude"("idIn" bigint, "LongitudeIn" text) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 16634)
-- Name: fn_updateEnquiryLocationPincode(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationPincode"("idIn" bigint, "PincodeIn" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationPincode"("idIn" bigint, "PincodeIn" text) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 16635)
-- Name: fn_updateEnquiryLocationStateId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryLocationStateId"("idIn" bigint, "StateIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryLocationStateId"("idIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 16636)
-- Name: fn_updateEnquiryTypeCompanyId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryTypeCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 16637)
-- Name: fn_updateEnquiryTypeEnquiryTypeColorCode(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeColorCode"("idIn" bigint, "EnquiryTypeColorCodeIn" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeColorCode"("idIn" bigint, "EnquiryTypeColorCodeIn" text) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 16638)
-- Name: fn_updateEnquiryTypeEnquiryTypeName(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeName"("idIn" bigint, "EnquiryTypeNameIn" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryTypeEnquiryTypeName"("idIn" bigint, "EnquiryTypeNameIn" text) OWNER TO postgres;

--
-- TOC entry 540 (class 1255 OID 16639)
-- Name: fn_updateEnquiryTypeLastEditBy(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryTypeLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 16640)
-- Name: fn_updateEnquiryTypeLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateEnquiryTypeLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateEnquiryTypeLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 550 (class 1255 OID 16641)
-- Name: fn_updateMainEnquiryCompanyId(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateMainEnquiryCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateMainEnquiryCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 16642)
-- Name: fn_updateMainEnquiryEnquiryRemarks(bigint, text); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateMainEnquiryEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateMainEnquiryEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 16643)
-- Name: fn_updateMainEnquiryEnquiryType(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateMainEnquiryEnquiryType"("idIn" bigint, "EnquiryTypeIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateMainEnquiryEnquiryType"("idIn" bigint, "EnquiryTypeIn" bigint) OWNER TO postgres;

--
-- TOC entry 553 (class 1255 OID 16644)
-- Name: fn_updateMainEnquiryLastEditBy(bigint, bigint); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateMainEnquiryLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateMainEnquiryLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 16645)
-- Name: fn_updateMainEnquiryLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: enquiry; Owner: postgres
--

CREATE FUNCTION enquiry."fn_updateMainEnquiryLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION enquiry."fn_updateMainEnquiryLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 555 (class 1255 OID 16646)
-- Name: fn_selectClientByArea(bigint, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectClientByArea"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectClientByArea"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 556 (class 1255 OID 16647)
-- Name: fn_selectClientByCity(bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectClientByCity"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectClientByCity"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 16648)
-- Name: fn_selectClientByCompany(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectClientByCompany"("CompanyIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectClientByCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 16649)
-- Name: fn_selectClientByCountry(bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectClientByCountry"("OwnerContactIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectClientByCountry"("OwnerContactIdIn" bigint, "CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 16650)
-- Name: fn_selectClientByOwner(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectClientByOwner"("OwnerContactIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectClientByOwner"("OwnerContactIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 16651)
-- Name: fn_selectClientByState(bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectClientByState"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("ClientId" bigint, "Latitude" text, "Longitude" text, "ContactName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectClientByState"("OwnerContactIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 563 (class 1255 OID 16652)
-- Name: fn_selectCompanyBranchByCity(bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 16653)
-- Name: fn_selectCompanyBranchByCompany(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCompany"("CompanyIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 16654)
-- Name: fn_selectCompanyBranchByCountry(bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 16655)
-- Name: fn_selectCompanyBranchByOwner(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByOwner"("OwnerIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByOwner"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 16656)
-- Name: fn_selectCompanyBranchByState(bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyBranchId" bigint, "Latitude" text, "Longitude" text, "CompanyBranchName" text, "CompanyBranchCode" text, "CompanyName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyBranchByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 570 (class 1255 OID 16657)
-- Name: fn_selectCompanyByCity(bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 571 (class 1255 OID 16658)
-- Name: fn_selectCompanyByCountry(bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 16659)
-- Name: fn_selectCompanyByOwner(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByOwner"("OwnerIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyByOwner"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 16660)
-- Name: fn_selectCompanyByState(bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "CompanyCode" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 574 (class 1255 OID 16661)
-- Name: fn_selectCompanyExecutiveGeoByCity(bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 575 (class 1255 OID 16662)
-- Name: fn_selectCompanyExecutiveGeoByCompany(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCompany"("CompanyIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 16663)
-- Name: fn_selectCompanyExecutiveGeoByCountry(bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 16664)
-- Name: fn_selectCompanyExecutiveGeoByOwner(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByOwner"("OwnerIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByOwner"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 16665)
-- Name: fn_selectCompanyExecutiveGeoByState(bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "Latitude" text, "Longitude" text, "ExecutiveName" text, "CompanyName" text, "CompanyBranchName" text, "MarkForDelete" boolean)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectCompanyExecutiveGeoByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 16666)
-- Name: fn_selectEnquiryByArea(bigint, bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByArea"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByArea"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint, "AreaIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 582 (class 1255 OID 16667)
-- Name: fn_selectEnquiryByCity(bigint, bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByCity"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint, "CityIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 16668)
-- Name: fn_selectEnquiryByCompany(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompany"("CompanyIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompany"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 585 (class 1255 OID 16669)
-- Name: fn_selectEnquiryByCompanyExecutive(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompanyExecutive"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByCompanyExecutive"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 586 (class 1255 OID 16670)
-- Name: fn_selectEnquiryByCountry(bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByCountry"("OwnerIdIn" bigint, "CountryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 16671)
-- Name: fn_selectEnquiryByOwner(bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByOwner"("OwnerIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByOwner"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 16672)
-- Name: fn_selectEnquiryByState(bigint, bigint, bigint); Type: FUNCTION; Schema: geoMapPlotting; Owner: postgres
--

CREATE FUNCTION "geoMapPlotting"."fn_selectEnquiryByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) RETURNS TABLE("EnquiryId" bigint, "Latitude" text, "Longitude" text, "CompanyName" text, "ClientName" text, "ContactPerson" text, "EmailId" text, "ContactNumber" text, "EnquiryTypeName" text)
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


ALTER FUNCTION "geoMapPlotting"."fn_selectEnquiryByState"("OwnerIdIn" bigint, "CountryIdIn" bigint, "StateIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 16673)
-- Name: fn_deleteArea(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_deleteArea"("p_AreaID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_deleteArea"("p_AreaID" bigint) OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 16674)
-- Name: fn_deleteBusinessAreaFromCompany(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_deleteBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_deleteBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 16675)
-- Name: fn_deleteBusinessCityFromCompany(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_deleteBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_deleteBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 16676)
-- Name: fn_deleteCity(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_deleteCity"("p_CityID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_deleteCity"("p_CityID" bigint) OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 16677)
-- Name: fn_deleteCountry(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_deleteCountry"("p_CountryID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_deleteCountry"("p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 16678)
-- Name: fn_deleteState(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_deleteState"("p_StateID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_deleteState"("p_StateID" bigint) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 16679)
-- Name: fn_insertIntoArea(bigint, bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_insertIntoArea"("p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_insertIntoArea"("p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 592 (class 1255 OID 16680)
-- Name: fn_insertIntoBusinessAreaForCompany(bigint, bigint, bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_insertIntoBusinessAreaForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_insertIntoBusinessAreaForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityID" bigint, "p_AreaName" text, "p_AreaCode" text, "p_AreaDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 593 (class 1255 OID 16681)
-- Name: fn_insertIntoBusinessCityForCompany(bigint, bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_insertIntoBusinessCityForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_insertIntoBusinessCityForCompany"("p_CompanyID" bigint, "p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 16682)
-- Name: fn_insertIntoCity(bigint, bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_insertIntoCity"("p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_insertIntoCity"("p_CountryID" bigint, "p_StateID" bigint, "p_CityName" text, "p_CityCode" text, "p_CityDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 16683)
-- Name: fn_insertIntoCountry(text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_insertIntoCountry"("p_CountryName" text, "p_CountryCode" text, "p_CountryDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_insertIntoCountry"("p_CountryName" text, "p_CountryCode" text, "p_CountryDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 596 (class 1255 OID 16684)
-- Name: fn_insertIntoState(bigint, text, text, text, timestamp without time zone, bigint, integer, timestamp without time zone, bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_insertIntoState"("p_CountryID" bigint, "p_StateName" text, "p_StateCode" text, "p_StateDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_insertIntoState"("p_CountryID" bigint, "p_StateName" text, "p_StateCode" text, "p_StateDescription" text, "p_CreatedOn" timestamp without time zone, "p_CreatedBy" bigint, "p_DeviceType" integer, "p_LastEditOn" timestamp without time zone, "p_LastEditBy" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 16685)
-- Name: fn_revokeArea(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_revokeArea"("p_AreaID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_revokeArea"("p_AreaID" bigint) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 16686)
-- Name: fn_revokeBusinessAreaFromCompany(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_revokeBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_revokeBusinessAreaFromCompany"("p_BusinessAreaForCompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 16687)
-- Name: fn_revokeBusinessCityFromCompany(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_revokeBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_revokeBusinessCityFromCompany"("p_BusinessCityForCompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 600 (class 1255 OID 16688)
-- Name: fn_revokeCity(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_revokeCity"("p_CityID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_revokeCity"("p_CityID" bigint) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 16689)
-- Name: fn_revokeCountry(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_revokeCountry"("p_CountryID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_revokeCountry"("p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 16690)
-- Name: fn_revokeState(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_revokeState"("p_StateID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_revokeState"("p_StateID" bigint) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 16691)
-- Name: fn_searchInArea(text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_searchInArea"(search_con text) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaName" text, "AreaCode" text, "AreaID" bigint, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_searchInArea"(search_con text) OWNER TO postgres;

--
-- TOC entry 602 (class 1255 OID 16692)
-- Name: fn_searchInBusinessAreaForCompany(text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_searchInBusinessAreaForCompany"(search_con text) RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_searchInBusinessAreaForCompany"(search_con text) OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 16693)
-- Name: fn_searchInBusinessCityForCompany(text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_searchInBusinessCityForCompany"(search_con text) RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_searchInBusinessCityForCompany"(search_con text) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 16694)
-- Name: fn_searchInCity(text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_searchInCity"(search_con text) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityName" text, "CityCode" text, "CityID" bigint, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_searchInCity"(search_con text) OWNER TO postgres;

--
-- TOC entry 605 (class 1255 OID 16695)
-- Name: fn_searchInCountry(text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_searchInCountry"(search_con text) RETURNS TABLE("CountryName" text, "CountryCode" text, "CountryID" bigint, "CountryDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT "CountryName", "CountryCode", "CountryID", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType"
FROM location.countryinfo WHERE 
"CountryName" LIKE CONCAT('%',search_con,'%') OR "CountryCode" LIKE CONCAT('%',search_con,'%') OR 
"CountryDescription" LIKE CONCAT('%',search_con,'%')
AND "MarkForDelete"=false;
	
$$;


ALTER FUNCTION location."fn_searchInCountry"(search_con text) OWNER TO postgres;

--
-- TOC entry 606 (class 1255 OID 16696)
-- Name: fn_searchInState(text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_searchInState"(search_con text) RETURNS TABLE("CountryName" text, "CountryID" bigint, "StateName" text, "StateCode" text, "StateID" bigint, "StateDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_searchInState"(search_con text) OWNER TO postgres;

--
-- TOC entry 607 (class 1255 OID 16697)
-- Name: fn_selectAreaUsingCity(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectAreaUsingCity"(areaid bigint) RETURNS TABLE(area_name text, pin_code text, id integer)
    LANGUAGE sql STRICT
    AS $$SELECT area_name,pin_code,id FROM location.areainfo WHERE city_id=areaid;$$;


ALTER FUNCTION location."fn_selectAreaUsingCity"(areaid bigint) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 16698)
-- Name: fn_selectAreaUsingCityId(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectAreaUsingCityId"("p_CityID" bigint) RETURNS TABLE("AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text)
    LANGUAGE sql
    AS $$

SELECT "AreaID", "AreaName", "AreaCode", "AreaDescription"
	FROM location.areainfo WHERE "CityID"="p_CityID" AND "MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectAreaUsingCityId"("p_CityID" bigint) OWNER TO postgres;

--
-- TOC entry 608 (class 1255 OID 16699)
-- Name: fn_selectBusinessAreaUsingCityId(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectBusinessAreaUsingCityId"("p_CityID" bigint, "p_OwnerID" bigint) RETURNS TABLE("AreaID" bigint, "AreaName" text)
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


ALTER FUNCTION location."fn_selectBusinessAreaUsingCityId"("p_CityID" bigint, "p_OwnerID" bigint) OWNER TO postgres;

--
-- TOC entry 609 (class 1255 OID 16700)
-- Name: fn_selectBusinessCityUsingStateId(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectBusinessCityUsingStateId"("p_StateID" bigint, "p_OwnerID" bigint) RETURNS TABLE("CityID" bigint, "CityName" text)
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


ALTER FUNCTION location."fn_selectBusinessCityUsingStateId"("p_StateID" bigint, "p_OwnerID" bigint) OWNER TO postgres;

--
-- TOC entry 610 (class 1255 OID 16701)
-- Name: fn_selectCityUsingState(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectCityUsingState"(stateid bigint) RETURNS TABLE(city_name text, id integer)
    LANGUAGE sql STRICT
    AS $$SELECT city_name,id FROM location.cityinfo WHERE state_id=stateid;$$;


ALTER FUNCTION location."fn_selectCityUsingState"(stateid bigint) OWNER TO postgres;

--
-- TOC entry 611 (class 1255 OID 16702)
-- Name: fn_selectCityUsingStateId(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectCityUsingStateId"("p_StateID" bigint) RETURNS TABLE("CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text)
    LANGUAGE sql
    AS $$

SELECT "CityID", "CityName", "CityCode", "CityDescription"
	FROM location.cityinfo WHERE "StateID"="p_StateID" AND "MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectCityUsingStateId"("p_StateID" bigint) OWNER TO postgres;

--
-- TOC entry 612 (class 1255 OID 16703)
-- Name: fn_selectFromArea(); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromArea"() RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaName" text, "AreaCode" text, "AreaID" bigint, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromArea"() OWNER TO postgres;

--
-- TOC entry 613 (class 1255 OID 16704)
-- Name: fn_selectFromAreaById(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromAreaById"("p_AreaID" bigint) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaName" text, "AreaCode" text, "AreaID" bigint, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromAreaById"("p_AreaID" bigint) OWNER TO postgres;

--
-- TOC entry 614 (class 1255 OID 16705)
-- Name: fn_selectFromBusinessAreaForCompany(); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromBusinessAreaForCompany"() RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromBusinessAreaForCompany"() OWNER TO postgres;

--
-- TOC entry 615 (class 1255 OID 16706)
-- Name: fn_selectFromBusinessAreaForCompanyByAreaId(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromBusinessAreaForCompanyByAreaId"("p_BusinessAreaForCompanyAreaID" bigint) RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromBusinessAreaForCompanyByAreaId"("p_BusinessAreaForCompanyAreaID" bigint) OWNER TO postgres;

--
-- TOC entry 617 (class 1255 OID 16707)
-- Name: fn_selectFromBusinessAreaForCompanyById(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromBusinessAreaForCompanyById"("p_CompanyID" bigint) RETURNS TABLE("BusinessAreaForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "AreaID" bigint, "AreaName" text, "AreaCode" text, "AreaDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromBusinessAreaForCompanyById"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 618 (class 1255 OID 16708)
-- Name: fn_selectFromBusinessCityForCompany(); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromBusinessCityForCompany"() RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromBusinessCityForCompany"() OWNER TO postgres;

--
-- TOC entry 619 (class 1255 OID 16709)
-- Name: fn_selectFromBusinessCityForCompanyByCompanyId(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromBusinessCityForCompanyByCompanyId"("p_CompanyID" bigint) RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromBusinessCityForCompanyByCompanyId"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 16710)
-- Name: fn_selectFromBusinessCityForCompanyById(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromBusinessCityForCompanyById"("p_BusinessCityForCompanyID" bigint) RETURNS TABLE("BusinessCityForCompanyID" bigint, "CompanyID" bigint, "CompanyName" text, "CityID" bigint, "CityName" text, "CityCode" text, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromBusinessCityForCompanyById"("p_BusinessCityForCompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 16711)
-- Name: fn_selectFromCity(); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromCity"() RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityName" text, "CityCode" text, "CityID" bigint, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromCity"() OWNER TO postgres;

--
-- TOC entry 622 (class 1255 OID 16712)
-- Name: fn_selectFromCityById(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromCityById"("p_CityID" bigint) RETURNS TABLE("CountryID" bigint, "CountryName" text, "StateID" bigint, "StateName" text, "CityName" text, "CityCode" text, "CityID" bigint, "CityDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
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


ALTER FUNCTION location."fn_selectFromCityById"("p_CityID" bigint) OWNER TO postgres;

--
-- TOC entry 616 (class 1255 OID 16713)
-- Name: fn_selectFromCountry(); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromCountry"() RETURNS TABLE("CountryName" text, "CountryCode" text, "CountryID" bigint, "CountryDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT "CountryName", "CountryCode", "CountryID", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType"
	FROM location.countryinfo WHERE "MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectFromCountry"() OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 16714)
-- Name: fn_selectFromCountryById(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromCountryById"("p_CountryID" bigint) RETURNS TABLE("CountryName" text, "CountryCode" text, "CountryID" bigint, "CountryDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT "CountryName", "CountryCode", "CountryID", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType"
	FROM location.countryinfo WHERE "CountryID"="p_CountryID" AND "MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectFromCountryById"("p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 624 (class 1255 OID 16715)
-- Name: fn_selectFromState(); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromState"() RETURNS TABLE("CountryName" text, "CountryID" bigint, "StateName" text, "StateCode" text, "StateID" bigint, "StateDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryName", st."CountryID", st."StateName", st."StateCode", st."StateID", st."StateDescription", 
st."IsActive", st."CreatedOn", st."CreatedBy", st."DeviceType", st."LastEditOn", st."LastEditBy", st."LastEditDeviceType"
    FROM location.stateinfo AS st
	INNER JOIN location.countryinfo AS cou
	ON st."CountryID"=cou."CountryID"
	WHERE st."MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectFromState"() OWNER TO postgres;

--
-- TOC entry 625 (class 1255 OID 16716)
-- Name: fn_selectFromStateById(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectFromStateById"("p_StateID" bigint) RETURNS TABLE("CountryName" text, "CountryID" bigint, "StateName" text, "StateCode" text, "StateID" bigint, "StateDescription" text, "IsActive" boolean, "CreatedOn" timestamp without time zone, "CreatedBy" bigint, "DeviceType" integer, "LastEditOn" timestamp without time zone, "LastEditBy" bigint, "LastEditDeviceType" integer)
    LANGUAGE sql
    AS $$

SELECT cou."CountryName", st."CountryID", st."StateName", st."StateCode", st."StateID", st."StateDescription", 
st."IsActive", st."CreatedOn", st."CreatedBy", st."DeviceType", st."LastEditOn", st."LastEditBy", st."LastEditDeviceType"
    FROM location.stateinfo AS st
	INNER JOIN location.countryinfo AS cou
	ON st."CountryID"=cou."CountryID"
	WHERE st."StateID"="p_StateID" AND st."MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectFromStateById"("p_StateID" bigint) OWNER TO postgres;

--
-- TOC entry 626 (class 1255 OID 16717)
-- Name: fn_selectStateUsingCountry(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectStateUsingCountry"(countryid bigint) RETURNS TABLE(state_name text, id integer)
    LANGUAGE sql STRICT
    AS $$SELECT state_name,id FROM location.stateinfo WHERE country_id=countryid;$$;


ALTER FUNCTION location."fn_selectStateUsingCountry"(countryid bigint) OWNER TO postgres;

--
-- TOC entry 627 (class 1255 OID 16718)
-- Name: fn_selectStateUsingCountryId(bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_selectStateUsingCountryId"("p_CountryID" bigint) RETURNS TABLE("StateID" bigint, "StateName" text, "StateCode" text, "StateDescription" text)
    LANGUAGE sql
    AS $$

SELECT "StateID", "StateName", "StateCode", "StateDescription"
	FROM location.stateinfo WHERE "CountryID"="p_CountryID" AND "MarkForDelete"=false;

$$;


ALTER FUNCTION location."fn_selectStateUsingCountryId"("p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 628 (class 1255 OID 16719)
-- Name: fn_updateAreaAreaCode(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaAreaCode"("p_AreaID" bigint, "p_AreaCode" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaAreaCode"("p_AreaID" bigint, "p_AreaCode" text) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 16720)
-- Name: fn_updateAreaAreaDescription(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaAreaDescription"("p_AreaID" bigint, "p_AreaDescription" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaAreaDescription"("p_AreaID" bigint, "p_AreaDescription" text) OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 16721)
-- Name: fn_updateAreaAreaName(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaAreaName"("p_AreaID" bigint, "p_AreaName" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaAreaName"("p_AreaID" bigint, "p_AreaName" text) OWNER TO postgres;

--
-- TOC entry 631 (class 1255 OID 16722)
-- Name: fn_updateAreaCityID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaCityID"("p_AreaID" bigint, "p_CityID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaCityID"("p_AreaID" bigint, "p_CityID" bigint) OWNER TO postgres;

--
-- TOC entry 632 (class 1255 OID 16723)
-- Name: fn_updateAreaCountryID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaCountryID"("p_AreaID" bigint, "p_CountryID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaCountryID"("p_AreaID" bigint, "p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 633 (class 1255 OID 16724)
-- Name: fn_updateAreaDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaDeviceType"("p_AreaID" bigint, "p_DeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaDeviceType"("p_AreaID" bigint, "p_DeviceType" integer) OWNER TO postgres;

--
-- TOC entry 634 (class 1255 OID 16725)
-- Name: fn_updateAreaIsActive(bigint, boolean); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaIsActive"("p_AreaID" bigint, "p_IsActive" boolean) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaIsActive"("p_AreaID" bigint, "p_IsActive" boolean) OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 16726)
-- Name: fn_updateAreaLastEditBy(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaLastEditBy"("p_AreaID" bigint, "p_LastEditBy" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaLastEditBy"("p_AreaID" bigint, "p_LastEditBy" bigint) OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 16727)
-- Name: fn_updateAreaLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaLastEditDeviceType"("p_AreaID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaLastEditDeviceType"("p_AreaID" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 16728)
-- Name: fn_updateAreaLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaLastEditOn"("p_AreaID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaLastEditOn"("p_AreaID" bigint, "p_LastEditOn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 639 (class 1255 OID 16729)
-- Name: fn_updateAreaStateID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateAreaStateID"("p_AreaID" bigint, "p_StateID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateAreaStateID"("p_AreaID" bigint, "p_StateID" bigint) OWNER TO postgres;

--
-- TOC entry 640 (class 1255 OID 16730)
-- Name: fn_updateBusinessAreaForCompanyCityID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyCityID"("p_BusinessAreaForCompanyID" bigint, "p_CityID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyCityID"("p_BusinessAreaForCompanyID" bigint, "p_CityID" bigint) OWNER TO postgres;

--
-- TOC entry 641 (class 1255 OID 16731)
-- Name: fn_updateBusinessAreaForCompanyCompanyID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyCompanyID"("p_BusinessAreaForCompanyID" bigint, "p_CompanyID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyCompanyID"("p_BusinessAreaForCompanyID" bigint, "p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 642 (class 1255 OID 16732)
-- Name: fn_updateBusinessAreaForCompanyDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_DeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_DeviceType" integer) OWNER TO postgres;

--
-- TOC entry 643 (class 1255 OID 16733)
-- Name: fn_updateBusinessAreaForCompanyIsActive(bigint, boolean); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyIsActive"("p_BusinessAreaForCompanyID" bigint, "p_IsActive" boolean) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyIsActive"("p_BusinessAreaForCompanyID" bigint, "p_IsActive" boolean) OWNER TO postgres;

--
-- TOC entry 644 (class 1255 OID 16734)
-- Name: fn_updateBusinessAreaForCompanyLastEditBy(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyLastEditBy"("p_BusinessAreaForCompanyID" bigint, "p_LastEditBy" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyLastEditBy"("p_BusinessAreaForCompanyID" bigint, "p_LastEditBy" bigint) OWNER TO postgres;

--
-- TOC entry 645 (class 1255 OID 16735)
-- Name: fn_updateBusinessAreaForCompanyLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyLastEditDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyLastEditDeviceType"("p_BusinessAreaForCompanyID" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 646 (class 1255 OID 16736)
-- Name: fn_updateBusinessAreaForCompanyLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessAreaForCompanyLastEditOn"("p_BusinessAreaForCompanyID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessAreaForCompanyLastEditOn"("p_BusinessAreaForCompanyID" bigint, "p_LastEditOn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 647 (class 1255 OID 16737)
-- Name: fn_updateBusinessCityForCompanyCompanyID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessCityForCompanyCompanyID"("p_BusinessCityForCompanyID" bigint, "p_CompanyID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessCityForCompanyCompanyID"("p_BusinessCityForCompanyID" bigint, "p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 648 (class 1255 OID 16738)
-- Name: fn_updateBusinessCityForCompanyDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessCityForCompanyDeviceType"("p_BusinessCityForCompanyID" bigint, "p_DeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessCityForCompanyDeviceType"("p_BusinessCityForCompanyID" bigint, "p_DeviceType" integer) OWNER TO postgres;

--
-- TOC entry 649 (class 1255 OID 16739)
-- Name: fn_updateBusinessCityForCompanyIsActive(bigint, boolean); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessCityForCompanyIsActive"("p_BusinessCityForCompanyID" bigint, "p_IsActive" boolean) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessCityForCompanyIsActive"("p_BusinessCityForCompanyID" bigint, "p_IsActive" boolean) OWNER TO postgres;

--
-- TOC entry 650 (class 1255 OID 16740)
-- Name: fn_updateBusinessCityForCompanyLastEditBy(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessCityForCompanyLastEditBy"("p_BusinessCityForCompanyID" bigint, "p_LastEditBy" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessCityForCompanyLastEditBy"("p_BusinessCityForCompanyID" bigint, "p_LastEditBy" bigint) OWNER TO postgres;

--
-- TOC entry 651 (class 1255 OID 16741)
-- Name: fn_updateBusinessCityForCompanyLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessCityForCompanyLastEditDeviceType"("p_BusinessCityForCompanyID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessCityForCompanyLastEditDeviceType"("p_BusinessCityForCompanyID" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 652 (class 1255 OID 16742)
-- Name: fn_updateBusinessCityForCompanyLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateBusinessCityForCompanyLastEditOn"("p_BusinessCityForCompanyID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION location."fn_updateBusinessCityForCompanyLastEditOn"("p_BusinessCityForCompanyID" bigint, "p_LastEditOn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 16743)
-- Name: fn_updateCityCityCode(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityCityCode"("p_CityID" bigint, "p_CityCode" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityCityCode"("p_CityID" bigint, "p_CityCode" text) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 16744)
-- Name: fn_updateCityCityDescription(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityCityDescription"("p_CityID" bigint, "p_CityDescription" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityCityDescription"("p_CityID" bigint, "p_CityDescription" text) OWNER TO postgres;

--
-- TOC entry 655 (class 1255 OID 16745)
-- Name: fn_updateCityCityName(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityCityName"("p_CityID" bigint, "p_CityName" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityCityName"("p_CityID" bigint, "p_CityName" text) OWNER TO postgres;

--
-- TOC entry 656 (class 1255 OID 16746)
-- Name: fn_updateCityCountryID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityCountryID"("p_CityID" bigint, "p_CountryID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityCountryID"("p_CityID" bigint, "p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 657 (class 1255 OID 16747)
-- Name: fn_updateCityDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityDeviceType"("p_CityID" bigint, "p_DeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityDeviceType"("p_CityID" bigint, "p_DeviceType" integer) OWNER TO postgres;

--
-- TOC entry 658 (class 1255 OID 16748)
-- Name: fn_updateCityIsActive(bigint, boolean); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityIsActive"("p_CityID" bigint, "p_IsActive" boolean) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityIsActive"("p_CityID" bigint, "p_IsActive" boolean) OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 16749)
-- Name: fn_updateCityLastEditBy(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityLastEditBy"("p_CityID" bigint, "p_LastEditBy" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityLastEditBy"("p_CityID" bigint, "p_LastEditBy" bigint) OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 16750)
-- Name: fn_updateCityLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityLastEditDeviceType"("p_CityID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityLastEditDeviceType"("p_CityID" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 661 (class 1255 OID 16751)
-- Name: fn_updateCityLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityLastEditOn"("p_CityID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityLastEditOn"("p_CityID" bigint, "p_LastEditOn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 16752)
-- Name: fn_updateCityStateID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCityStateID"("p_CityID" bigint, "p_StateID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCityStateID"("p_CityID" bigint, "p_StateID" bigint) OWNER TO postgres;

--
-- TOC entry 663 (class 1255 OID 16753)
-- Name: fn_updateCountryCountryCode(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryCountryCode"("p_CountryID" bigint, "p_CountryCode" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryCountryCode"("p_CountryID" bigint, "p_CountryCode" text) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 16754)
-- Name: fn_updateCountryCountryDescription(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryCountryDescription"("p_CountryID" bigint, "p_CountryDescription" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryCountryDescription"("p_CountryID" bigint, "p_CountryDescription" text) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 16755)
-- Name: fn_updateCountryCountryName(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryCountryName"("p_CountryID" bigint, "p_CountryName" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryCountryName"("p_CountryID" bigint, "p_CountryName" text) OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 16756)
-- Name: fn_updateCountryDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryDeviceType"("p_CountryID" bigint, "p_DeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryDeviceType"("p_CountryID" bigint, "p_DeviceType" integer) OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 16757)
-- Name: fn_updateCountryIsActive(bigint, boolean); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryIsActive"("p_CountryID" bigint, "p_IsActive" boolean) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryIsActive"("p_CountryID" bigint, "p_IsActive" boolean) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 16758)
-- Name: fn_updateCountryLastEditBy(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryLastEditBy"("p_CountryID" bigint, "p_LastEditBy" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryLastEditBy"("p_CountryID" bigint, "p_LastEditBy" bigint) OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 16759)
-- Name: fn_updateCountryLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryLastEditDeviceType"("p_CountryID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryLastEditDeviceType"("p_CountryID" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 670 (class 1255 OID 16760)
-- Name: fn_updateCountryLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateCountryLastEditOn"("p_CountryID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION location."fn_updateCountryLastEditOn"("p_CountryID" bigint, "p_LastEditOn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 636 (class 1255 OID 16761)
-- Name: fn_updateStateCountryID(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateCountryID"("p_StateID" bigint, "p_CountryID" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateCountryID"("p_StateID" bigint, "p_CountryID" bigint) OWNER TO postgres;

--
-- TOC entry 671 (class 1255 OID 16762)
-- Name: fn_updateStateDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateDeviceType"("p_StateID" bigint, "p_DeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateDeviceType"("p_StateID" bigint, "p_DeviceType" integer) OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 16763)
-- Name: fn_updateStateIsActive(bigint, boolean); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateIsActive"("p_StateID" bigint, "p_IsActive" boolean) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateIsActive"("p_StateID" bigint, "p_IsActive" boolean) OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 16764)
-- Name: fn_updateStateLastEditBy(bigint, bigint); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateLastEditBy"("p_StateID" bigint, "p_LastEditBy" bigint) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateLastEditBy"("p_StateID" bigint, "p_LastEditBy" bigint) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 16765)
-- Name: fn_updateStateLastEditDeviceType(bigint, integer); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateLastEditDeviceType"("p_StateID" bigint, "p_LastEditDeviceType" integer) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateLastEditDeviceType"("p_StateID" bigint, "p_LastEditDeviceType" integer) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 16766)
-- Name: fn_updateStateLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateLastEditOn"("p_StateID" bigint, "p_LastEditOn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateLastEditOn"("p_StateID" bigint, "p_LastEditOn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 676 (class 1255 OID 16767)
-- Name: fn_updateStateStateCode(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateStateCode"("p_StateID" bigint, "p_StateCode" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateStateCode"("p_StateID" bigint, "p_StateCode" text) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 16768)
-- Name: fn_updateStateStateDescription(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateStateDescription"("p_StateID" bigint, "p_StateDescription" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateStateDescription"("p_StateID" bigint, "p_StateDescription" text) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 16769)
-- Name: fn_updateStateStateName(bigint, text); Type: FUNCTION; Schema: location; Owner: postgres
--

CREATE FUNCTION location."fn_updateStateStateName"("p_StateID" bigint, "p_StateName" text) RETURNS boolean
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


ALTER FUNCTION location."fn_updateStateStateName"("p_StateID" bigint, "p_StateName" text) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 16770)
-- Name: fn_insertNotification(bigint, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: notification; Owner: postgres
--

CREATE FUNCTION notification."fn_insertNotification"("p_CompanyExecutiveID" bigint, "p_CompanyExecutiveName" text, "p_NotificationSubject" text, "p_NotificationDescription" text, "p_NotificationTime" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION notification."fn_insertNotification"("p_CompanyExecutiveID" bigint, "p_CompanyExecutiveName" text, "p_NotificationSubject" text, "p_NotificationDescription" text, "p_NotificationTime" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 16771)
-- Name: fn_revokeMarkForDelete(bigint); Type: FUNCTION; Schema: notification; Owner: postgres
--

CREATE FUNCTION notification."fn_revokeMarkForDelete"("p_NotificationID" bigint) RETURNS boolean
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


ALTER FUNCTION notification."fn_revokeMarkForDelete"("p_NotificationID" bigint) OWNER TO postgres;

--
-- TOC entry 681 (class 1255 OID 16772)
-- Name: fn_selectNotifications(bigint); Type: FUNCTION; Schema: notification; Owner: postgres
--

CREATE FUNCTION notification."fn_selectNotifications"("p_CompanyExecutiveID" bigint) RETURNS TABLE("CompanyExecutiveID" bigint, "CompanyExecutiveName" text, "NotificationSubject" text, "NotificationDescription" text, "ReadIndex" boolean, "NotificationTime" timestamp without time zone, "NotificationID" bigint)
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


ALTER FUNCTION notification."fn_selectNotifications"("p_CompanyExecutiveID" bigint) OWNER TO postgres;

--
-- TOC entry 682 (class 1255 OID 16773)
-- Name: fn_updateJustArrived(bigint, boolean); Type: FUNCTION; Schema: notification; Owner: postgres
--

CREATE FUNCTION notification."fn_updateJustArrived"("p_NotificationID" bigint, "p_JustArrived" boolean) RETURNS boolean
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


ALTER FUNCTION notification."fn_updateJustArrived"("p_NotificationID" bigint, "p_JustArrived" boolean) OWNER TO postgres;

--
-- TOC entry 683 (class 1255 OID 16774)
-- Name: fn_updateMarkForDelete(bigint); Type: FUNCTION; Schema: notification; Owner: postgres
--

CREATE FUNCTION notification."fn_updateMarkForDelete"("p_NotificationID" bigint) RETURNS boolean
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


ALTER FUNCTION notification."fn_updateMarkForDelete"("p_NotificationID" bigint) OWNER TO postgres;

--
-- TOC entry 684 (class 1255 OID 16775)
-- Name: fn_updateReadIndex(bigint, boolean); Type: FUNCTION; Schema: notification; Owner: postgres
--

CREATE FUNCTION notification."fn_updateReadIndex"("p_NotificationID" bigint, "p_ReadIndex" boolean) RETURNS boolean
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


ALTER FUNCTION notification."fn_updateReadIndex"("p_NotificationID" bigint, "p_ReadIndex" boolean) OWNER TO postgres;

--
-- TOC entry 685 (class 1255 OID 16776)
-- Name: fn_checkOwnerDeleteStatus(bigint); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_checkOwnerDeleteStatus"("OwnerIdIn" bigint) RETURNS bigint
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyId") FROM company."Company" WHERE "OwnerContactId"="OwnerIdIn"
$$;


ALTER FUNCTION owner."fn_checkOwnerDeleteStatus"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 686 (class 1255 OID 16777)
-- Name: fn_deleteOwnerContact(bigint); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_deleteOwnerContact"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION owner."fn_deleteOwnerContact"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 16778)
-- Name: fn_insertOwnerContact(text, text, text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_insertOwnerContact"("ownerNameIn" text, "ownerContactIn" text, "ownerEmailIn" text, "SecretKeyIn" text, "UserNameIn" text, "PasswordIn" text, "CreatedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION owner."fn_insertOwnerContact"("ownerNameIn" text, "ownerContactIn" text, "ownerEmailIn" text, "SecretKeyIn" text, "UserNameIn" text, "PasswordIn" text, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 689 (class 1255 OID 16779)
-- Name: fn_loginOwnerContact(text, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_loginOwnerContact"("UserNameIn" text, "SecretKeyIn" text) RETURNS TABLE("OwnerId" bigint)
    LANGUAGE sql
    AS $$
SELECT
		id
FROM "owner"."OwnerContact"
WHERE "owner"."OwnerContact"."ownerEmail"="UserNameIn"
AND "owner"."OwnerContact"."SecretKey"="SecretKeyIn"
AND "owner"."OwnerContact"."MarkForDelete"=false
$$;


ALTER FUNCTION owner."fn_loginOwnerContact"("UserNameIn" text, "SecretKeyIn" text) OWNER TO postgres;

--
-- TOC entry 690 (class 1255 OID 16780)
-- Name: fn_selectOwnerAssestsCount(bigint); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_selectOwnerAssestsCount"("OwnerIdIn" bigint) RETURNS TABLE("NumberOfClients" bigint, "NumberOfCompanies" bigint, "NumberOfBranches" bigint, "NumberOfProducts" bigint, "NumberOfTickets" bigint, "NumberOfExecutives" bigint)
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


ALTER FUNCTION owner."fn_selectOwnerAssestsCount"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 691 (class 1255 OID 16781)
-- Name: fn_selectOwnerContactByOwnerId(bigint); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_selectOwnerContactByOwnerId"("OwnerId" bigint) RETURNS TABLE(id bigint, "ownerName" text, "ownerContact" text, "ownerEmail" text, "UserName" text, "Password" text, "LastEditOn" timestamp without time zone, "CreatedOn" timestamp without time zone, "isActive" boolean)
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


ALTER FUNCTION owner."fn_selectOwnerContactByOwnerId"("OwnerId" bigint) OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 16782)
-- Name: fn_selectOwnerContactCredentials(bigint); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_selectOwnerContactCredentials"("OwnerId" bigint) RETURNS TABLE("ownerContact" text, "ownerEmail" text, "UserName" text)
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


ALTER FUNCTION owner."fn_selectOwnerContactCredentials"("OwnerId" bigint) OWNER TO postgres;

--
-- TOC entry 693 (class 1255 OID 16783)
-- Name: fn_selectTopExecutives(bigint); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_selectTopExecutives"("OwnerIdIn" bigint) RETURNS TABLE("ExecutiveName" text, "ExecutivePLRate" integer)
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


ALTER FUNCTION owner."fn_selectTopExecutives"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 694 (class 1255 OID 16784)
-- Name: fn_updateOwnerContactLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 695 (class 1255 OID 16785)
-- Name: fn_updateOwnerContactPassword(bigint, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactPassword"("idIn" bigint, "PasswordIn" text) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactPassword"("idIn" bigint, "PasswordIn" text) OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 16786)
-- Name: fn_updateOwnerContactSecretKey(bigint, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactSecretKey"("idIn" bigint, "SecretKeyIn" text) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactSecretKey"("idIn" bigint, "SecretKeyIn" text) OWNER TO postgres;

--
-- TOC entry 697 (class 1255 OID 16787)
-- Name: fn_updateOwnerContactUserName(bigint, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactUserName"("idIn" bigint, "UserNameIn" text) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactUserName"("idIn" bigint, "UserNameIn" text) OWNER TO postgres;

--
-- TOC entry 698 (class 1255 OID 16788)
-- Name: fn_updateOwnerContactisActive(bigint, boolean); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactisActive"("idIn" bigint, "isActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 699 (class 1255 OID 16789)
-- Name: fn_updateOwnerContactownerContact(bigint, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactownerContact"("idIn" bigint, "ownerContactIn" text) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactownerContact"("idIn" bigint, "ownerContactIn" text) OWNER TO postgres;

--
-- TOC entry 700 (class 1255 OID 16790)
-- Name: fn_updateOwnerContactownerEmail(bigint, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactownerEmail"("idIn" bigint, "ownerEmailIn" text) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactownerEmail"("idIn" bigint, "ownerEmailIn" text) OWNER TO postgres;

--
-- TOC entry 701 (class 1255 OID 16791)
-- Name: fn_updateOwnerContactownerName(bigint, text); Type: FUNCTION; Schema: owner; Owner: postgres
--

CREATE FUNCTION owner."fn_updateOwnerContactownerName"("idIn" bigint, "ownerNameIn" text) RETURNS boolean
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


ALTER FUNCTION owner."fn_updateOwnerContactownerName"("idIn" bigint, "ownerNameIn" text) OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 16792)
-- Name: fn_checkPositionDeleteStatus(bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_checkPositionDeleteStatus"("PositionIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("CompanyExecutiveID") 
FROM company."CompanyExecutive" 
WHERE "LastEditDeviceType"="PositionIdIn";
$$;


ALTER FUNCTION "position"."fn_checkPositionDeleteStatus"("PositionIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 16793)
-- Name: fn_deletePositions(bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_deletePositions"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION "position"."fn_deletePositions"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 704 (class 1255 OID 16794)
-- Name: fn_insertCompanyExecutiveMasterList(text, text, text, text, text, text, text, text, text); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_insertCompanyExecutiveMasterList"("CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text) RETURNS TABLE("idForAccess" bigint)
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


ALTER FUNCTION "position"."fn_insertCompanyExecutiveMasterList"("CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text) OWNER TO postgres;

--
-- TOC entry 705 (class 1255 OID 16795)
-- Name: fn_insertPositions(text, integer, bigint, bigint, timestamp without time zone, text, text, text, text, text, text, text, text, text); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_insertPositions"("PositionNameIn" text, "PositionPriorityIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text) RETURNS boolean
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


ALTER FUNCTION "position"."fn_insertPositions"("PositionNameIn" text, "PositionPriorityIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "CompanyIn" text, "CompanyBranchIn" text, "CompanyExecutiveIn" text, "ClientIn" text, "ProductIn" text, "LocationIn" text, "EnquiryIn" text, "TicketIn" text, "PositionIn" text) OWNER TO postgres;

--
-- TOC entry 706 (class 1255 OID 16796)
-- Name: fn_selectPositions(bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_selectPositions"("OwnerIdIn" bigint) RETURNS TABLE(id bigint, "PositionName" text, "PositionPriority" integer, "CompanyId" bigint, "CompanyName" text, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean, "Company" text, "CompanyBranch" text, "CompanyExecutive" text, "Client" text, "Product" text, "Location" text, "Enquiry" text, "Ticket" text, "Position" text)
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


ALTER FUNCTION "position"."fn_selectPositions"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 707 (class 1255 OID 16797)
-- Name: fn_selectPositionsByPositionId(bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_selectPositionsByPositionId"("PositionId" bigint) RETURNS TABLE(id bigint, "PositionName" text, "PositionPriority" integer, "CompanyId" bigint, "CompanyName" text, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean, "Company" text, "CompanyBranch" text, "CompanyExecutive" text, "Client" text, "Product" text, "Location" text, "Enquiry" text, "Ticket" text, "Position" text)
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


ALTER FUNCTION "position"."fn_selectPositionsByPositionId"("PositionId" bigint) OWNER TO postgres;

--
-- TOC entry 687 (class 1255 OID 16798)
-- Name: fn_updatePositionsCompanyId(bigint, bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 16799)
-- Name: fn_updatePositionsExecutiveMasterId(bigint, bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsExecutiveMasterId"("idIn" bigint, "ExecutiveMasterIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsExecutiveMasterId"("idIn" bigint, "ExecutiveMasterIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 708 (class 1255 OID 16800)
-- Name: fn_updatePositionsLastEditBy(bigint, bigint); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 709 (class 1255 OID 16801)
-- Name: fn_updatePositionsLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 710 (class 1255 OID 16802)
-- Name: fn_updatePositionsPositionName(bigint, text); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsPositionName"("idIn" bigint, "PositionNameIn" text) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsPositionName"("idIn" bigint, "PositionNameIn" text) OWNER TO postgres;

--
-- TOC entry 711 (class 1255 OID 16803)
-- Name: fn_updatePositionsPositionPriority(bigint, integer); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsPositionPriority"("idIn" bigint, "PositionPriorityIn" integer) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsPositionPriority"("idIn" bigint, "PositionPriorityIn" integer) OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 16804)
-- Name: fn_updatePositionsisActive(bigint, boolean); Type: FUNCTION; Schema: position; Owner: postgres
--

CREATE FUNCTION "position"."fn_updatePositionsisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
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


ALTER FUNCTION "position"."fn_updatePositionsisActive"("idIn" bigint, "isActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 713 (class 1255 OID 16805)
-- Name: fn_selectPriority(); Type: FUNCTION; Schema: priority; Owner: postgres
--

CREATE FUNCTION priority."fn_selectPriority"() RETURNS TABLE("PriorityId" bigint, "PriorityName" text, "PriorityPosition" smallint)
    LANGUAGE sql
    AS $$
SELECT
		"PriorityId",
		"PriorityName",
		"PriorityPosition"
FROM "priority"."Priority"

$$;


ALTER FUNCTION priority."fn_selectPriority"() OWNER TO postgres;

--
-- TOC entry 714 (class 1255 OID 16806)
-- Name: fn_deleteProduct(bigint); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_deleteProduct"("idIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "MarkForDelete" = true WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_deleteProduct"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 715 (class 1255 OID 16807)
-- Name: fn_insertProduct(text, text, bigint, double precision, bigint, timestamp without time zone); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_insertProduct"("productNameIn" text, "productDescriptionIn" text, "companyIdIn" bigint, "costIn" double precision, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION product."fn_insertProduct"("productNameIn" text, "productDescriptionIn" text, "companyIdIn" bigint, "costIn" double precision, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 716 (class 1255 OID 16808)
-- Name: fn_selectProduct(); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_selectProduct"() RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
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


ALTER FUNCTION product."fn_selectProduct"() OWNER TO postgres;

--
-- TOC entry 717 (class 1255 OID 16809)
-- Name: fn_selectProductByCompanyId(bigint); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_selectProductByCompanyId"("CompanyIdIn" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
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


ALTER FUNCTION product."fn_selectProductByCompanyId"("CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 718 (class 1255 OID 16810)
-- Name: fn_selectProductByOwnerId(bigint); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_selectProductByOwnerId"("OwnerIdIn" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
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


ALTER FUNCTION product."fn_selectProductByOwnerId"("OwnerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 719 (class 1255 OID 16811)
-- Name: fn_selectProductByProductId(bigint); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_selectProductByProductId"("ProductId" bigint) RETURNS TABLE(id bigint, "productName" text, "productDescription" text, "companyId" bigint, "companyName" text, cost double precision, "LastEditBy" bigint, "LastEditOn" timestamp without time zone, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "isActive" boolean)
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


ALTER FUNCTION product."fn_selectProductByProductId"("ProductId" bigint) OWNER TO postgres;

--
-- TOC entry 720 (class 1255 OID 16812)
-- Name: fn_updateProductLastEditBy(bigint, bigint); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "LastEditBy" = "LastEditByIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 721 (class 1255 OID 16813)
-- Name: fn_updateProductLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "LastEditOn" = "LastEditOnIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 722 (class 1255 OID 16814)
-- Name: fn_updateProductcompanyId(bigint, bigint); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductcompanyId"("idIn" bigint, "companyIdIn" bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "companyId" = "companyIdIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductcompanyId"("idIn" bigint, "companyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 723 (class 1255 OID 16815)
-- Name: fn_updateProductcost(bigint, double precision); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductcost"("idIn" bigint, "costIn" double precision) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "cost" = "costIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductcost"("idIn" bigint, "costIn" double precision) OWNER TO postgres;

--
-- TOC entry 724 (class 1255 OID 16816)
-- Name: fn_updateProductisActive(bigint, boolean); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductisActive"("idIn" bigint, "isActiveIn" boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "isActive" = "isActiveIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductisActive"("idIn" bigint, "isActiveIn" boolean) OWNER TO postgres;

--
-- TOC entry 725 (class 1255 OID 16817)
-- Name: fn_updateProductproductDescription(bigint, text); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductproductDescription"("idIn" bigint, "productDescriptionIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "productDescription" = "productDescriptionIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductproductDescription"("idIn" bigint, "productDescriptionIn" text) OWNER TO postgres;

--
-- TOC entry 726 (class 1255 OID 16818)
-- Name: fn_updateProductproductName(bigint, text); Type: FUNCTION; Schema: product; Owner: postgres
--

CREATE FUNCTION product."fn_updateProductproductName"("idIn" bigint, "productNameIn" text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
BEGIN
UPDATE "product"."Product" SET "productName" = "productNameIn" WHERE "id" = "idIn"; RETURN true;

EXCEPTION WHEN OTHERS THEN
RETURN false;
ROLLBACK;
END;
$$;


ALTER FUNCTION product."fn_updateProductproductName"("idIn" bigint, "productNameIn" text) OWNER TO postgres;

--
-- TOC entry 727 (class 1255 OID 16819)
-- Name: fn_checkExecutiveOwnerFlag(bigint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fn_checkExecutiveOwnerFlag"("idIn" bigint) RETURNS bigint
    LANGUAGE sql
    AS $$ 
SELECT COUNT("CRMAccessListId") FROM public."CRMAccessList"	WHERE "CorrespondingId"="idIn" AND "OwnerFlag"=true AND "MarkForDelete"=false;
$$;


ALTER FUNCTION public."fn_checkExecutiveOwnerFlag"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 728 (class 1255 OID 16820)
-- Name: fn_loadUserByEmailId(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."fn_loadUserByEmailId"("EmailIdIn" text) RETURNS TABLE("CorrespondingName" text, "CorrespondingEmailId" text, "CorrespondingPassword" text, "CorrespondingContactNumber" text, "CorrespondingPosition" integer, "OwnerFlag" boolean)
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


ALTER FUNCTION public."fn_loadUserByEmailId"("EmailIdIn" text) OWNER TO postgres;

--
-- TOC entry 729 (class 1255 OID 16821)
-- Name: AreaNStatus(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."AreaNStatus"("p_CompanyID" bigint) RETURNS TABLE("AreaName" text, "TotalTickets" bigint, "Prospects" bigint, "CallBack" bigint, "DemoPending" bigint, "Quotation" bigint, "PaymentPending" bigint, "Closure" bigint, "Dead" bigint)
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


ALTER FUNCTION report."AreaNStatus"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 730 (class 1255 OID 16822)
-- Name: AreaPriorityReport(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."AreaPriorityReport"("p_CompanyID" bigint) RETURNS TABLE("AreaName" text, "TotalTickets" bigint, "Immediate" bigint, "High" bigint, "Normal" bigint, "Low" bigint)
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


ALTER FUNCTION report."AreaPriorityReport"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 731 (class 1255 OID 16823)
-- Name: AreaTimeReport(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."AreaTimeReport"("p_CompanyID" bigint) RETURNS TABLE("AreaName" text, "TotalTickets" bigint, "Today" bigint, "Tomorrow" bigint, "NextWeek" bigint, "NextMonth" bigint, "NextQuarter" bigint)
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


ALTER FUNCTION report."AreaTimeReport"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 734 (class 1255 OID 16824)
-- Name: CityNStatus(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."CityNStatus"("p_CompanyID" bigint) RETURNS TABLE("CityName" text, "TotalTickets" bigint, "Prospects" bigint, "CallBack" bigint, "DemoPending" bigint, "Quotation" bigint, "PaymentPending" bigint, "Closure" bigint, "Dead" bigint)
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


ALTER FUNCTION report."CityNStatus"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 735 (class 1255 OID 16825)
-- Name: CityPriorityReport(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."CityPriorityReport"("p_CompanyID" bigint) RETURNS TABLE("CityName" text, "TotalTickets" bigint, "Immediate" bigint, "High" bigint, "Normal" bigint, "Low" bigint)
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


ALTER FUNCTION report."CityPriorityReport"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 736 (class 1255 OID 16826)
-- Name: CityTimeReport(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."CityTimeReport"("p_CompanyID" bigint) RETURNS TABLE("CityName" text, "TotalTickets" bigint, "Today" bigint, "Tomorrow" bigint, "NextWeek" bigint, "NextMonth" bigint, "NextQuarter" bigint)
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


ALTER FUNCTION report."CityTimeReport"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 737 (class 1255 OID 16827)
-- Name: ExecutiveReport(bigint); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."ExecutiveReport"("p_CompanyID" bigint) RETURNS TABLE("CompanyExecutiveName" text, "TotalTickets" bigint, "TicketCompleted" bigint, "TicketDelayed" bigint, "TicketPending" bigint, "PLRate" integer)
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


ALTER FUNCTION report."ExecutiveReport"("p_CompanyID" bigint) OWNER TO postgres;

--
-- TOC entry 738 (class 1255 OID 16828)
-- Name: ProductReport(); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."ProductReport"() RETURNS TABLE("ProductName" text, "TotalTickets" bigint, "NumOfClient" bigint, "Closure" bigint, "TotalRevenue" double precision)
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


ALTER FUNCTION report."ProductReport"() OWNER TO postgres;

--
-- TOC entry 739 (class 1255 OID 16829)
-- Name: StateNStatusReport(); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."StateNStatusReport"() RETURNS TABLE("StateName" text, "TotalTickets" bigint, "Prospects" bigint, "CallBack" bigint, "DemoPending" bigint, "Quotation" bigint, "PaymentPending" bigint, "Closure" bigint, "Dead" bigint)
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


ALTER FUNCTION report."StateNStatusReport"() OWNER TO postgres;

--
-- TOC entry 741 (class 1255 OID 16830)
-- Name: StatePriorityReport(); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."StatePriorityReport"() RETURNS TABLE("StateName" text, "TotalTickets" bigint, "Immediate" bigint, "High" bigint, "Normal" bigint, "Low" bigint)
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


ALTER FUNCTION report."StatePriorityReport"() OWNER TO postgres;

--
-- TOC entry 742 (class 1255 OID 16831)
-- Name: StateTimeReport(); Type: FUNCTION; Schema: report; Owner: postgres
--

CREATE FUNCTION report."StateTimeReport"() RETURNS TABLE("StateName" text, "TotalTickets" bigint, "Today" bigint, "Tomorrow" bigint, "NextWeek" bigint, "NextMonth" bigint, "NextQuarter" bigint)
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


ALTER FUNCTION report."StateTimeReport"() OWNER TO postgres;

--
-- TOC entry 743 (class 1255 OID 16832)
-- Name: fn_deleteStatus(bigint); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_deleteStatus"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION status."fn_deleteStatus"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 744 (class 1255 OID 16833)
-- Name: fn_insertStatus(text, text, integer, bigint, bigint, timestamp without time zone); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_insertStatus"("StatusNameIn" text, "StatusColorCodeIn" text, "WorkProgressIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION status."fn_insertStatus"("StatusNameIn" text, "StatusColorCodeIn" text, "WorkProgressIn" integer, "CompanyIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 745 (class 1255 OID 16834)
-- Name: fn_selectStatus(); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_selectStatus"() RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION status."fn_selectStatus"() OWNER TO postgres;

--
-- TOC entry 746 (class 1255 OID 16835)
-- Name: fn_selectStatusByCompanyId(bigint); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_selectStatusByCompanyId"("companyIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION status."fn_selectStatusByCompanyId"("companyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 747 (class 1255 OID 16836)
-- Name: fn_selectStatusByOwnerId(bigint); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_selectStatusByOwnerId"("ownerIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION status."fn_selectStatusByOwnerId"("ownerIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 748 (class 1255 OID 16837)
-- Name: fn_updateStatusCompanyId(bigint, bigint); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_updateStatusCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION status."fn_updateStatusCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 749 (class 1255 OID 16838)
-- Name: fn_updateStatusLastEditBy(bigint, bigint); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_updateStatusLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION status."fn_updateStatusLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 750 (class 1255 OID 16839)
-- Name: fn_updateStatusLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_updateStatusLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION status."fn_updateStatusLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 751 (class 1255 OID 16840)
-- Name: fn_updateStatusStatusColorCode(bigint, text); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_updateStatusStatusColorCode"("idIn" bigint, "StatusColorCodeIn" text) RETURNS boolean
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


ALTER FUNCTION status."fn_updateStatusStatusColorCode"("idIn" bigint, "StatusColorCodeIn" text) OWNER TO postgres;

--
-- TOC entry 732 (class 1255 OID 16841)
-- Name: fn_updateStatusStatusName(bigint, text); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_updateStatusStatusName"("idIn" bigint, "StatusNameIn" text) RETURNS boolean
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


ALTER FUNCTION status."fn_updateStatusStatusName"("idIn" bigint, "StatusNameIn" text) OWNER TO postgres;

--
-- TOC entry 733 (class 1255 OID 16842)
-- Name: fn_updateStatusWorkProgress(bigint, integer); Type: FUNCTION; Schema: status; Owner: postgres
--

CREATE FUNCTION status."fn_updateStatusWorkProgress"("idIn" bigint, "WorkProgressIn" integer) RETURNS boolean
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


ALTER FUNCTION status."fn_updateStatusWorkProgress"("idIn" bigint, "WorkProgressIn" integer) OWNER TO postgres;

--
-- TOC entry 740 (class 1255 OID 16843)
-- Name: fn_checkExecutiveTicketAccess(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_checkExecutiveTicketAccess"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
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


ALTER FUNCTION ticket."fn_checkExecutiveTicketAccess"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 511 (class 1255 OID 16844)
-- Name: fn_deleteMainTicket(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_deleteMainTicket"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION ticket."fn_deleteMainTicket"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 752 (class 1255 OID 16845)
-- Name: fn_deleteTicketAccessList(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_deleteTicketAccessList"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION ticket."fn_deleteTicketAccessList"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 753 (class 1255 OID 16846)
-- Name: fn_deleteTicketFollowupDates(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_deleteTicketFollowupDates"("idIn" bigint) RETURNS boolean
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


ALTER FUNCTION ticket."fn_deleteTicketFollowupDates"("idIn" bigint) OWNER TO postgres;

--
-- TOC entry 754 (class 1255 OID 16847)
-- Name: fn_getDeadlineDateOfTicket(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_getDeadlineDateOfTicket"("TicketIdIn" bigint) RETURNS TABLE("DeadlineDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT "DeadlineDateAndTime" FROM ticket."TicketDateAndTimelines" 
JOIN ticket."MainTicket" ON ticket."TicketDateAndTimelines"."TicketId"=ticket."MainTicket"."TicketId"
WHERE ticket."TicketDateAndTimelines"."TicketId"="TicketIdIn"
AND ticket."MainTicket"."MarkForDelete"=false;
$$;


ALTER FUNCTION ticket."fn_getDeadlineDateOfTicket"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 755 (class 1255 OID 16848)
-- Name: fn_getStartDateOfTicket(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_getStartDateOfTicket"("TicketIdIn" bigint) RETURNS TABLE("StartDateAndTime" timestamp without time zone)
    LANGUAGE sql
    AS $$
SELECT "StartDateAndTime" FROM ticket."TicketDateAndTimelines" 
JOIN ticket."MainTicket" ON ticket."TicketDateAndTimelines"."TicketId"=ticket."MainTicket"."TicketId"
WHERE ticket."TicketDateAndTimelines"."TicketId"="TicketIdIn"
AND ticket."MainTicket"."MarkForDelete"=false;
$$;


ALTER FUNCTION ticket."fn_getStartDateOfTicket"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 756 (class 1255 OID 16849)
-- Name: fn_insertTicket(bigint, text, text, bigint, timestamp without time zone, timestamp with time zone, timestamp without time zone, bigint, bigint, integer, bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_insertTicket"("EnquiryIdIn" bigint, "EnquiryRemarksIn" text, "TicketRemarksIn" text, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "StartDateAndTimeIn" timestamp with time zone, "DeadlineDateAndTimeIn" timestamp without time zone, "ProductIdIn" bigint, "TicketTypeIn" bigint, "TicketPriorityIn" integer, "CompanyIdIn" bigint, "StatusIdIn" bigint) RETURNS TABLE("TicketID" bigint)
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


ALTER FUNCTION ticket."fn_insertTicket"("EnquiryIdIn" bigint, "EnquiryRemarksIn" text, "TicketRemarksIn" text, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone, "StartDateAndTimeIn" timestamp with time zone, "DeadlineDateAndTimeIn" timestamp without time zone, "ProductIdIn" bigint, "TicketTypeIn" bigint, "TicketPriorityIn" integer, "CompanyIdIn" bigint, "StatusIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 757 (class 1255 OID 16850)
-- Name: fn_insertTicketAccessList(bigint, bigint, timestamp without time zone); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_insertTicketAccessList"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION ticket."fn_insertTicketAccessList"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint, "AccessApplicationTimeIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 758 (class 1255 OID 16851)
-- Name: fn_insertTicketFollowupDates(bigint, timestamp without time zone); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_insertTicketFollowupDates"("TicketIdIn" bigint, "FollowupDateAndTimeIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION ticket."fn_insertTicketFollowupDates"("TicketIdIn" bigint, "FollowupDateAndTimeIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 759 (class 1255 OID 16852)
-- Name: fn_insertTicketStatus(bigint, bigint, bigint, timestamp without time zone); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_insertTicketStatus"("TicketIdIn" bigint, "StatusIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION ticket."fn_insertTicketStatus"("TicketIdIn" bigint, "StatusIdIn" bigint, "CreatedByIn" bigint, "CreatedOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 760 (class 1255 OID 16853)
-- Name: fn_selectCompanyExecutivePLUpdateList(date); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectCompanyExecutivePLUpdateList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "CurrentWorkProgress" integer, "ThresholdWorkProgress" integer, "TicketId" bigint)
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


ALTER FUNCTION ticket."fn_selectCompanyExecutivePLUpdateList"("CurrentDateIn" date) OWNER TO postgres;

--
-- TOC entry 761 (class 1255 OID 16854)
-- Name: fn_selectCompanyExecutiveTicketAccessDependency(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectCompanyExecutiveTicketAccessDependency"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("Check" bigint)
    LANGUAGE sql
    AS $$
SELECT COUNT("TicketAccessList") 
FROM ticket."TicketAccessList"
WHERE "TicketId"="TicketIdIn"
AND "CompanyExecutiveId"="CompanyExecutiveIdIn"
AND	"MarkForDelete"=FALSE
$$;


ALTER FUNCTION ticket."fn_selectCompanyExecutiveTicketAccessDependency"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 763 (class 1255 OID 16855)
-- Name: fn_selectCurrentDeadlineDateExecutiveList(date); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectCurrentDeadlineDateExecutiveList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ProductName" text, "ClientName" text)
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


ALTER FUNCTION ticket."fn_selectCurrentDeadlineDateExecutiveList"("CurrentDateIn" date) OWNER TO postgres;

--
-- TOC entry 764 (class 1255 OID 16856)
-- Name: fn_selectCurrentFollowupDateExecutiveList(date); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectCurrentFollowupDateExecutiveList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ProductName" text, "ClientName" text)
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


ALTER FUNCTION ticket."fn_selectCurrentFollowupDateExecutiveList"("CurrentDateIn" date) OWNER TO postgres;

--
-- TOC entry 765 (class 1255 OID 16857)
-- Name: fn_selectDeadlineCrossoverExecutiveList(date); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectDeadlineCrossoverExecutiveList"("CurrentDateIn" date) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ProductName" text, "ClientName" text)
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


ALTER FUNCTION ticket."fn_selectDeadlineCrossoverExecutiveList"("CurrentDateIn" date) OWNER TO postgres;

--
-- TOC entry 766 (class 1255 OID 16858)
-- Name: fn_selectMainTicketIdByEnquiryAndProductId(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectMainTicketIdByEnquiryAndProductId"("EnquiryIdIn" bigint, "ProductIdIn" bigint) RETURNS TABLE("TicketId" bigint)
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


ALTER FUNCTION ticket."fn_selectMainTicketIdByEnquiryAndProductId"("EnquiryIdIn" bigint, "ProductIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 767 (class 1255 OID 16859)
-- Name: fn_selectMainTicketIdByEnquiryId(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectMainTicketIdByEnquiryId"("EnquiryIdIn" bigint) RETURNS TABLE("TicketId" bigint)
    LANGUAGE sql
    AS $$
SELECT
		"TicketId"
FROM "ticket"."MainTicket"
WHERE "ticket"."MainTicket"."EnquiryId"="EnquiryIdIn"
AND"ticket"."MainTicket"."MarkForDelete"=false
$$;


ALTER FUNCTION ticket."fn_selectMainTicketIdByEnquiryId"("EnquiryIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 768 (class 1255 OID 16860)
-- Name: fn_selectNonExistingCompanyExecutivesInTicket(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicket"("TicketIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
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


ALTER FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicket"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 769 (class 1255 OID 16861)
-- Name: fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutive(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutive"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) RETURNS TABLE("CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "ContactNumber" text, "CompanyId" bigint)
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


ALTER FUNCTION ticket."fn_selectNonExistingCompanyExecutivesInTicketByCompanyExecutive"("TicketIdIn" bigint, "CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 770 (class 1255 OID 16862)
-- Name: fn_selectTicketAccessListByTicketId(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectTicketAccessListByTicketId"("TicketIdIn" bigint) RETURNS TABLE("TicketAccessListId" bigint, "TicketId" bigint, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "OwnerFlag" boolean, "AccessApplicationTime" timestamp without time zone)
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


ALTER FUNCTION ticket."fn_selectTicketAccessListByTicketId"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 771 (class 1255 OID 16863)
-- Name: fn_selectTicketDetailsByCompanyExecutiveId(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectTicketDetailsByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) RETURNS TABLE("TicketId" bigint, "EnquiryId" bigint, "TicketAccessListId" bigint, "CompanyExecutiveId" bigint, "CompanyExecutiveName" text, "EnquiryRemarks" text, "TicketRemarks" text, "StartDateAndTime" timestamp without time zone, "DeadlineDateAndTime" timestamp without time zone, "ProductId" bigint, "ProductName" text, "TicketType" bigint, "TicketTypeName" text, "TicketPriority" integer, "TicketPriorityName" text, "CompanyId" bigint, "CompanyName" text, "StatusId" bigint, "StatusName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION ticket."fn_selectTicketDetailsByCompanyExecutiveId"("CompanyExecutiveIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 772 (class 1255 OID 16864)
-- Name: fn_selectTicketFollowupDates(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectTicketFollowupDates"("TicketIdIn" bigint) RETURNS TABLE("TicketFollowupDatesId" bigint, "TicketId" bigint, "FollowupDateAndTime" timestamp without time zone)
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


ALTER FUNCTION ticket."fn_selectTicketFollowupDates"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 773 (class 1255 OID 16865)
-- Name: fn_selectTicketStatusLogOfTicket(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectTicketStatusLogOfTicket"("TicketIdIn" bigint) RETURNS TABLE("TicketStatusId" bigint, "TicketId" bigint, "StatusId" bigint, "StatusName" text, "WorkProgress" integer, "StatusColorCode" text, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION ticket."fn_selectTicketStatusLogOfTicket"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 774 (class 1255 OID 16866)
-- Name: fn_selectTicketValidStatus(bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 775 (class 1255 OID 16867)
-- Name: fn_selectTicketValidStatus(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint, "CompanyIdIn" bigint) RETURNS TABLE("StatusId" bigint, "StatusName" text, "StatusColorCode" text, "WorkProgress" integer, "CompanyId" bigint, "CompanyName" text, "CreatedBy" bigint, "CreatedOn" timestamp without time zone, "LastEditBy" bigint, "LastEditOn" timestamp without time zone)
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


ALTER FUNCTION ticket."fn_selectTicketValidStatus"("TicketIdIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 776 (class 1255 OID 16868)
-- Name: fn_updateMainTicketEnquiryRemarks(bigint, text); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateMainTicketEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateMainTicketEnquiryRemarks"("idIn" bigint, "EnquiryRemarksIn" text) OWNER TO postgres;

--
-- TOC entry 777 (class 1255 OID 16869)
-- Name: fn_updateMainTicketLastEditBy(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateMainTicketLastEditBy"("idIn" bigint, "LastEditByIn" bigint) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateMainTicketLastEditBy"("idIn" bigint, "LastEditByIn" bigint) OWNER TO postgres;

--
-- TOC entry 778 (class 1255 OID 16870)
-- Name: fn_updateMainTicketLastEditOn(bigint, timestamp without time zone); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateMainTicketLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateMainTicketLastEditOn"("idIn" bigint, "LastEditOnIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 779 (class 1255 OID 16871)
-- Name: fn_updateMainTicketTicketRemarks(bigint, text); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateMainTicketTicketRemarks"("idIn" bigint, "TicketRemarksIn" text) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateMainTicketTicketRemarks"("idIn" bigint, "TicketRemarksIn" text) OWNER TO postgres;

--
-- TOC entry 780 (class 1255 OID 16872)
-- Name: fn_updateTicketDateAndTimelinesDeadlineDateAndTime(bigint, timestamp without time zone); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateTicketDateAndTimelinesDeadlineDateAndTime"("idIn" bigint, "DeadlineDateAndTimeIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateTicketDateAndTimelinesDeadlineDateAndTime"("idIn" bigint, "DeadlineDateAndTimeIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 781 (class 1255 OID 16873)
-- Name: fn_updateTicketDateAndTimelinesStartDateAndTime(bigint, timestamp without time zone); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateTicketDateAndTimelinesStartDateAndTime"("idIn" bigint, "StartDateAndTimeIn" timestamp without time zone) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateTicketDateAndTimelinesStartDateAndTime"("idIn" bigint, "StartDateAndTimeIn" timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 782 (class 1255 OID 16874)
-- Name: fn_updateTicketMetaDataCompanyId(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateTicketMetaDataCompanyId"("idIn" bigint, "CompanyIdIn" bigint) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateTicketMetaDataCompanyId"("idIn" bigint, "CompanyIdIn" bigint) OWNER TO postgres;

--
-- TOC entry 783 (class 1255 OID 16875)
-- Name: fn_updateTicketMetaDataTicketPriority(bigint, integer); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateTicketMetaDataTicketPriority"("idIn" bigint, "TicketPriorityIn" integer) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateTicketMetaDataTicketPriority"("idIn" bigint, "TicketPriorityIn" integer) OWNER TO postgres;

--
-- TOC entry 762 (class 1255 OID 16876)
-- Name: fn_updateTicketMetaDataTicketType(bigint, bigint); Type: FUNCTION; Schema: ticket; Owner: postgres
--

CREATE FUNCTION ticket."fn_updateTicketMetaDataTicketType"("idIn" bigint, "TicketTypeIn" bigint) RETURNS boolean
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


ALTER FUNCTION ticket."fn_updateTicketMetaDataTicketType"("idIn" bigint, "TicketTypeIn" bigint) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16877)
-- Name: CallTransaction; Type: TABLE; Schema: callTransactions; Owner: postgres
--

CREATE TABLE "callTransactions"."CallTransaction" (
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


ALTER TABLE "callTransactions"."CallTransaction" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16884)
-- Name: CallTransaction_CallTransactionId_seq; Type: SEQUENCE; Schema: callTransactions; Owner: postgres
--

CREATE SEQUENCE "callTransactions"."CallTransaction_CallTransactionId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "callTransactions"."CallTransaction_CallTransactionId_seq" OWNER TO postgres;

--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 217
-- Name: CallTransaction_CallTransactionId_seq; Type: SEQUENCE OWNED BY; Schema: callTransactions; Owner: postgres
--

ALTER SEQUENCE "callTransactions"."CallTransaction_CallTransactionId_seq" OWNED BY "callTransactions"."CallTransaction"."CallTransactionId";


--
-- TOC entry 218 (class 1259 OID 16886)
-- Name: CallTransaction_ClientId_seq; Type: SEQUENCE; Schema: callTransactions; Owner: postgres
--

CREATE SEQUENCE "callTransactions"."CallTransaction_ClientId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "callTransactions"."CallTransaction_ClientId_seq" OWNER TO postgres;

--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 218
-- Name: CallTransaction_ClientId_seq; Type: SEQUENCE OWNED BY; Schema: callTransactions; Owner: postgres
--

ALTER SEQUENCE "callTransactions"."CallTransaction_ClientId_seq" OWNED BY "callTransactions"."CallTransaction"."ClientId";


--
-- TOC entry 219 (class 1259 OID 16888)
-- Name: CallTransaction_CompanyExecutiveId_seq; Type: SEQUENCE; Schema: callTransactions; Owner: postgres
--

CREATE SEQUENCE "callTransactions"."CallTransaction_CompanyExecutiveId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "callTransactions"."CallTransaction_CompanyExecutiveId_seq" OWNER TO postgres;

--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 219
-- Name: CallTransaction_CompanyExecutiveId_seq; Type: SEQUENCE OWNED BY; Schema: callTransactions; Owner: postgres
--

ALTER SEQUENCE "callTransactions"."CallTransaction_CompanyExecutiveId_seq" OWNED BY "callTransactions"."CallTransaction"."CompanyExecutiveId";


--
-- TOC entry 220 (class 1259 OID 16890)
-- Name: Client; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client."Client" (
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


ALTER TABLE client."Client" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16898)
-- Name: ClientLocation; Type: TABLE; Schema: client; Owner: postgres
--

CREATE TABLE client."ClientLocation" (
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


ALTER TABLE client."ClientLocation" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16906)
-- Name: ClientLocation_ClientLocationId_seq; Type: SEQUENCE; Schema: client; Owner: postgres
--

CREATE SEQUENCE client."ClientLocation_ClientLocationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client."ClientLocation_ClientLocationId_seq" OWNER TO postgres;

--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 222
-- Name: ClientLocation_ClientLocationId_seq; Type: SEQUENCE OWNED BY; Schema: client; Owner: postgres
--

ALTER SEQUENCE client."ClientLocation_ClientLocationId_seq" OWNED BY client."ClientLocation"."ClientLocationId";


--
-- TOC entry 223 (class 1259 OID 16908)
-- Name: Client_ClientId_seq; Type: SEQUENCE; Schema: client; Owner: postgres
--

CREATE SEQUENCE client."Client_ClientId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client."Client_ClientId_seq" OWNER TO postgres;

--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 223
-- Name: Client_ClientId_seq; Type: SEQUENCE OWNED BY; Schema: client; Owner: postgres
--

ALTER SEQUENCE client."Client_ClientId_seq" OWNED BY client."Client"."ClientId";


--
-- TOC entry 224 (class 1259 OID 16910)
-- Name: Company; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."Company" (
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


ALTER TABLE company."Company" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16918)
-- Name: CompanyAddressDetails; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyAddressDetails" (
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


ALTER TABLE company."CompanyAddressDetails" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16925)
-- Name: CompanyAddressDetails_CompanyAddressID_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyAddressDetails_CompanyAddressID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyAddressDetails_CompanyAddressID_seq" OWNER TO postgres;

--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 226
-- Name: CompanyAddressDetails_CompanyAddressID_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyAddressDetails_CompanyAddressID_seq" OWNED BY company."CompanyAddressDetails"."CompanyAddressID";


--
-- TOC entry 227 (class 1259 OID 16927)
-- Name: CompanyArea; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyArea" (
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


ALTER TABLE company."CompanyArea" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16935)
-- Name: CompanyArea_CompanyAreaID_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyArea_CompanyAreaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyArea_CompanyAreaID_seq" OWNER TO postgres;

--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 228
-- Name: CompanyArea_CompanyAreaID_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyArea_CompanyAreaID_seq" OWNED BY company."CompanyArea"."CompanyAreaID";


--
-- TOC entry 229 (class 1259 OID 16937)
-- Name: CompanyBranch; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyBranch" (
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


ALTER TABLE company."CompanyBranch" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16945)
-- Name: CompanyBranchAddressDetails; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyBranchAddressDetails" (
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


ALTER TABLE company."CompanyBranchAddressDetails" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16952)
-- Name: CompanyBranchAddressDetails_CompanyBranchAddressID_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq" OWNER TO postgres;

--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 231
-- Name: CompanyBranchAddressDetails_CompanyBranchAddressID_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq" OWNED BY company."CompanyBranchAddressDetails"."CompanyBranchAddressID";


--
-- TOC entry 232 (class 1259 OID 16954)
-- Name: CompanyBranchType; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyBranchType" (
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


ALTER TABLE company."CompanyBranchType" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16961)
-- Name: CompanyBranchType_CompanyBranchTypeId_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyBranchType_CompanyBranchTypeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyBranchType_CompanyBranchTypeId_seq" OWNER TO postgres;

--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 233
-- Name: CompanyBranchType_CompanyBranchTypeId_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyBranchType_CompanyBranchTypeId_seq" OWNED BY company."CompanyBranchType"."CompanyBranchTypeId";


--
-- TOC entry 234 (class 1259 OID 16963)
-- Name: CompanyBranch_CompanyBranchID_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyBranch_CompanyBranchID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyBranch_CompanyBranchID_seq" OWNER TO postgres;

--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 234
-- Name: CompanyBranch_CompanyBranchID_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyBranch_CompanyBranchID_seq" OWNED BY company."CompanyBranch"."CompanyBranchID";


--
-- TOC entry 235 (class 1259 OID 16965)
-- Name: CompanyExecutive; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyExecutive" (
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


ALTER TABLE company."CompanyExecutive" OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16973)
-- Name: CompanyExecutivePL; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyExecutivePL" (
    id bigint NOT NULL,
    "executiveId" bigint NOT NULL,
    "PLRate" integer DEFAULT 0 NOT NULL,
    "dateOfEntry" timestamp without time zone NOT NULL
);


ALTER TABLE company."CompanyExecutivePL" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16977)
-- Name: CompanyExecutivePL_id_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyExecutivePL_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyExecutivePL_id_seq" OWNER TO postgres;

--
-- TOC entry 4206 (class 0 OID 0)
-- Dependencies: 237
-- Name: CompanyExecutivePL_id_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyExecutivePL_id_seq" OWNED BY company."CompanyExecutivePL".id;


--
-- TOC entry 238 (class 1259 OID 16979)
-- Name: CompanyExecutive_ExecutiveID_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyExecutive_ExecutiveID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyExecutive_ExecutiveID_seq" OWNER TO postgres;

--
-- TOC entry 4207 (class 0 OID 0)
-- Dependencies: 238
-- Name: CompanyExecutive_ExecutiveID_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyExecutive_ExecutiveID_seq" OWNED BY company."CompanyExecutive"."CompanyExecutiveID";


--
-- TOC entry 239 (class 1259 OID 16981)
-- Name: CompanyRegion; Type: TABLE; Schema: company; Owner: postgres
--

CREATE TABLE company."CompanyRegion" (
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


ALTER TABLE company."CompanyRegion" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16989)
-- Name: CompanyRegion_CompanyRegionID_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."CompanyRegion_CompanyRegionID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."CompanyRegion_CompanyRegionID_seq" OWNER TO postgres;

--
-- TOC entry 4208 (class 0 OID 0)
-- Dependencies: 240
-- Name: CompanyRegion_CompanyRegionID_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."CompanyRegion_CompanyRegionID_seq" OWNED BY company."CompanyRegion"."CompanyRegionID";


--
-- TOC entry 241 (class 1259 OID 16991)
-- Name: Company_CompanyId_seq; Type: SEQUENCE; Schema: company; Owner: postgres
--

CREATE SEQUENCE company."Company_CompanyId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE company."Company_CompanyId_seq" OWNER TO postgres;

--
-- TOC entry 4209 (class 0 OID 0)
-- Dependencies: 241
-- Name: Company_CompanyId_seq; Type: SEQUENCE OWNED BY; Schema: company; Owner: postgres
--

ALTER SEQUENCE company."Company_CompanyId_seq" OWNED BY company."Company"."CompanyId";


--
-- TOC entry 242 (class 1259 OID 16993)
-- Name: CompanyExecutiveGeoLocation; Type: TABLE; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" (
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


ALTER TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16999)
-- Name: CompanyExecutiveGeoLocationAddress; Type: TABLE; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" (
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


ALTER TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17005)
-- Name: CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq; Type: SEQUENCE; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq" OWNER TO postgres;

--
-- TOC entry 4210 (class 0 OID 0)
-- Dependencies: 244
-- Name: CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq; Type: SEQUENCE OWNED BY; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq" OWNED BY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"."CompanyExecutiveGeoLocationAddressId";


--
-- TOC entry 245 (class 1259 OID 17007)
-- Name: CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq; Type: SEQUENCE; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq" OWNER TO postgres;

--
-- TOC entry 4211 (class 0 OID 0)
-- Dependencies: 245
-- Name: CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq; Type: SEQUENCE OWNED BY; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER SEQUENCE "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq" OWNED BY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"."CompanyExecutiveGeoLocationId";


--
-- TOC entry 246 (class 1259 OID 17009)
-- Name: EnquiryAccessList; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."EnquiryAccessList" (
    "EnquiryAccessListId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "CompanyExecutiveId" bigint NOT NULL,
    "CompanyExecutiveName" text NOT NULL,
    "AccessApplicationTime" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);


ALTER TABLE enquiry."EnquiryAccessList" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17016)
-- Name: EnquiryAccessList_EnquiryAccessListId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."EnquiryAccessList_EnquiryAccessListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."EnquiryAccessList_EnquiryAccessListId_seq" OWNER TO postgres;

--
-- TOC entry 4212 (class 0 OID 0)
-- Dependencies: 247
-- Name: EnquiryAccessList_EnquiryAccessListId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."EnquiryAccessList_EnquiryAccessListId_seq" OWNED BY enquiry."EnquiryAccessList"."EnquiryAccessListId";


--
-- TOC entry 248 (class 1259 OID 17018)
-- Name: EnquiryClient; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."EnquiryClient" (
    "EnquiryClientId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "ClientName" text NOT NULL,
    "ContactPerson" text NOT NULL,
    "EmailId" text NOT NULL,
    "ContactNumber" text NOT NULL,
    "ClientId" bigint NOT NULL
);


ALTER TABLE enquiry."EnquiryClient" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 17024)
-- Name: EnquiryClient_EnquiryClientId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."EnquiryClient_EnquiryClientId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."EnquiryClient_EnquiryClientId_seq" OWNER TO postgres;

--
-- TOC entry 4213 (class 0 OID 0)
-- Dependencies: 249
-- Name: EnquiryClient_EnquiryClientId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."EnquiryClient_EnquiryClientId_seq" OWNED BY enquiry."EnquiryClient"."EnquiryClientId";


--
-- TOC entry 250 (class 1259 OID 17026)
-- Name: EnquiryDateAndTimelines; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."EnquiryDateAndTimelines" (
    "EnquiryDateAndTimelinesId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "startDateAndTime" timestamp without time zone NOT NULL,
    "deadlineDateAndTime" timestamp without time zone NOT NULL
);


ALTER TABLE enquiry."EnquiryDateAndTimelines" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 17029)
-- Name: EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq" OWNER TO postgres;

--
-- TOC entry 4214 (class 0 OID 0)
-- Dependencies: 251
-- Name: EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq" OWNED BY enquiry."EnquiryDateAndTimelines"."EnquiryDateAndTimelinesId";


--
-- TOC entry 252 (class 1259 OID 17031)
-- Name: EnquiryLocation; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."EnquiryLocation" (
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


ALTER TABLE enquiry."EnquiryLocation" OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 17037)
-- Name: EnquiryLocation_EnquiryLocationId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."EnquiryLocation_EnquiryLocationId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."EnquiryLocation_EnquiryLocationId_seq" OWNER TO postgres;

--
-- TOC entry 4215 (class 0 OID 0)
-- Dependencies: 253
-- Name: EnquiryLocation_EnquiryLocationId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."EnquiryLocation_EnquiryLocationId_seq" OWNED BY enquiry."EnquiryLocation"."EnquiryLocationId";


--
-- TOC entry 254 (class 1259 OID 17039)
-- Name: EnquiryProductList; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."EnquiryProductList" (
    "EnquiryProductListId" bigint NOT NULL,
    "EnquiryId" bigint NOT NULL,
    "ProductId" bigint NOT NULL,
    "ProductName" text NOT NULL,
    "ProductCharges" double precision NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);


ALTER TABLE enquiry."EnquiryProductList" OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 17046)
-- Name: EnquiryProductList_EnquiryProductListId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."EnquiryProductList_EnquiryProductListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."EnquiryProductList_EnquiryProductListId_seq" OWNER TO postgres;

--
-- TOC entry 4216 (class 0 OID 0)
-- Dependencies: 255
-- Name: EnquiryProductList_EnquiryProductListId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."EnquiryProductList_EnquiryProductListId_seq" OWNED BY enquiry."EnquiryProductList"."EnquiryProductListId";


--
-- TOC entry 256 (class 1259 OID 17048)
-- Name: EnquiryType; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."EnquiryType" (
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


ALTER TABLE enquiry."EnquiryType" OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 17055)
-- Name: EnquiryType_EnquiryTypeId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."EnquiryType_EnquiryTypeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."EnquiryType_EnquiryTypeId_seq" OWNER TO postgres;

--
-- TOC entry 4217 (class 0 OID 0)
-- Dependencies: 257
-- Name: EnquiryType_EnquiryTypeId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."EnquiryType_EnquiryTypeId_seq" OWNED BY enquiry."EnquiryType"."EnquiryTypeId";


--
-- TOC entry 258 (class 1259 OID 17057)
-- Name: MainEnquiry; Type: TABLE; Schema: enquiry; Owner: postgres
--

CREATE TABLE enquiry."MainEnquiry" (
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


ALTER TABLE enquiry."MainEnquiry" OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 17064)
-- Name: MainEnquiry_EnquiryId_seq; Type: SEQUENCE; Schema: enquiry; Owner: postgres
--

CREATE SEQUENCE enquiry."MainEnquiry_EnquiryId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE enquiry."MainEnquiry_EnquiryId_seq" OWNER TO postgres;

--
-- TOC entry 4218 (class 0 OID 0)
-- Dependencies: 259
-- Name: MainEnquiry_EnquiryId_seq; Type: SEQUENCE OWNED BY; Schema: enquiry; Owner: postgres
--

ALTER SEQUENCE enquiry."MainEnquiry_EnquiryId_seq" OWNED BY enquiry."MainEnquiry"."EnquiryId";


--
-- TOC entry 260 (class 1259 OID 17066)
-- Name: seq_id; Type: SEQUENCE; Schema: location; Owner: postgres
--

CREATE SEQUENCE location.seq_id
    START WITH 100
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location.seq_id OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 17068)
-- Name: areainfo; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location.areainfo (
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


ALTER TABLE location.areainfo OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 17077)
-- Name: businessCityForCompany; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location."businessCityForCompany" (
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


ALTER TABLE location."businessCityForCompany" OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 17082)
-- Name: businessCityForCompany_BusinessCityForCompanyID_seq; Type: SEQUENCE; Schema: location; Owner: postgres
--

CREATE SEQUENCE location."businessCityForCompany_BusinessCityForCompanyID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location."businessCityForCompany_BusinessCityForCompanyID_seq" OWNER TO postgres;

--
-- TOC entry 4219 (class 0 OID 0)
-- Dependencies: 263
-- Name: businessCityForCompany_BusinessCityForCompanyID_seq; Type: SEQUENCE OWNED BY; Schema: location; Owner: postgres
--

ALTER SEQUENCE location."businessCityForCompany_BusinessCityForCompanyID_seq" OWNED BY location."businessCityForCompany"."BusinessCityForCompanyID";


--
-- TOC entry 264 (class 1259 OID 17084)
-- Name: businessAreaForCompany; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location."businessAreaForCompany" (
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


ALTER TABLE location."businessAreaForCompany" OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 17090)
-- Name: cityinfo; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location.cityinfo (
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


ALTER TABLE location.cityinfo OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 17099)
-- Name: countryinfo; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location.countryinfo (
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


ALTER TABLE location.countryinfo OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 17108)
-- Name: stateinfo; Type: TABLE; Schema: location; Owner: postgres
--

CREATE TABLE location.stateinfo (
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


ALTER TABLE location.stateinfo OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 17116)
-- Name: stateinfo_StateID_seq; Type: SEQUENCE; Schema: location; Owner: postgres
--

CREATE SEQUENCE location."stateinfo_StateID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE location."stateinfo_StateID_seq" OWNER TO postgres;

--
-- TOC entry 4220 (class 0 OID 0)
-- Dependencies: 268
-- Name: stateinfo_StateID_seq; Type: SEQUENCE OWNED BY; Schema: location; Owner: postgres
--

ALTER SEQUENCE location."stateinfo_StateID_seq" OWNED BY location.stateinfo."StateID";


--
-- TOC entry 269 (class 1259 OID 17118)
-- Name: Notification; Type: TABLE; Schema: notification; Owner: postgres
--

CREATE TABLE notification."Notification" (
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


ALTER TABLE notification."Notification" OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 17127)
-- Name: Notification_NotificationID_seq; Type: SEQUENCE; Schema: notification; Owner: postgres
--

CREATE SEQUENCE notification."Notification_NotificationID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notification."Notification_NotificationID_seq" OWNER TO postgres;

--
-- TOC entry 4221 (class 0 OID 0)
-- Dependencies: 270
-- Name: Notification_NotificationID_seq; Type: SEQUENCE OWNED BY; Schema: notification; Owner: postgres
--

ALTER SEQUENCE notification."Notification_NotificationID_seq" OWNED BY notification."Notification"."NotificationID";


--
-- TOC entry 271 (class 1259 OID 17129)
-- Name: OwnerContact; Type: TABLE; Schema: owner; Owner: postgres
--

CREATE TABLE owner."OwnerContact" (
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


ALTER TABLE owner."OwnerContact" OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 17138)
-- Name: OwnerContact_id_seq; Type: SEQUENCE; Schema: owner; Owner: postgres
--

CREATE SEQUENCE owner."OwnerContact_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE owner."OwnerContact_id_seq" OWNER TO postgres;

--
-- TOC entry 4222 (class 0 OID 0)
-- Dependencies: 272
-- Name: OwnerContact_id_seq; Type: SEQUENCE OWNED BY; Schema: owner; Owner: postgres
--

ALTER SEQUENCE owner."OwnerContact_id_seq" OWNED BY owner."OwnerContact".id;


--
-- TOC entry 273 (class 1259 OID 17140)
-- Name: CompanyExecutiveMasterList; Type: TABLE; Schema: position; Owner: postgres
--

CREATE TABLE "position"."CompanyExecutiveMasterList" (
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


ALTER TABLE "position"."CompanyExecutiveMasterList" OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 17146)
-- Name: CompanyExecutiveMasterList_id_seq; Type: SEQUENCE; Schema: position; Owner: postgres
--

CREATE SEQUENCE "position"."CompanyExecutiveMasterList_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "position"."CompanyExecutiveMasterList_id_seq" OWNER TO postgres;

--
-- TOC entry 4223 (class 0 OID 0)
-- Dependencies: 274
-- Name: CompanyExecutiveMasterList_id_seq; Type: SEQUENCE OWNED BY; Schema: position; Owner: postgres
--

ALTER SEQUENCE "position"."CompanyExecutiveMasterList_id_seq" OWNED BY "position"."CompanyExecutiveMasterList".id;


--
-- TOC entry 275 (class 1259 OID 17148)
-- Name: Positions; Type: TABLE; Schema: position; Owner: postgres
--

CREATE TABLE "position"."Positions" (
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


ALTER TABLE "position"."Positions" OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 17157)
-- Name: Positions_id_seq; Type: SEQUENCE; Schema: position; Owner: postgres
--

CREATE SEQUENCE "position"."Positions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "position"."Positions_id_seq" OWNER TO postgres;

--
-- TOC entry 4224 (class 0 OID 0)
-- Dependencies: 276
-- Name: Positions_id_seq; Type: SEQUENCE OWNED BY; Schema: position; Owner: postgres
--

ALTER SEQUENCE "position"."Positions_id_seq" OWNED BY "position"."Positions".id;


--
-- TOC entry 277 (class 1259 OID 17159)
-- Name: Priority; Type: TABLE; Schema: priority; Owner: postgres
--

CREATE TABLE priority."Priority" (
    "PriorityId" bigint NOT NULL,
    "PriorityName" text NOT NULL,
    "PriorityPosition" smallint NOT NULL
);


ALTER TABLE priority."Priority" OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 17165)
-- Name: Priority_PriorityId_seq; Type: SEQUENCE; Schema: priority; Owner: postgres
--

CREATE SEQUENCE priority."Priority_PriorityId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE priority."Priority_PriorityId_seq" OWNER TO postgres;

--
-- TOC entry 4225 (class 0 OID 0)
-- Dependencies: 278
-- Name: Priority_PriorityId_seq; Type: SEQUENCE OWNED BY; Schema: priority; Owner: postgres
--

ALTER SEQUENCE priority."Priority_PriorityId_seq" OWNED BY priority."Priority"."PriorityId";


--
-- TOC entry 279 (class 1259 OID 17167)
-- Name: Product; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product."Product" (
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


ALTER TABLE product."Product" OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 17175)
-- Name: Product_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product."Product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product."Product_id_seq" OWNER TO postgres;

--
-- TOC entry 4226 (class 0 OID 0)
-- Dependencies: 280
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product."Product_id_seq" OWNED BY product."Product".id;


--
-- TOC entry 281 (class 1259 OID 17177)
-- Name: CRMAccessList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CRMAccessList" (
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


ALTER TABLE public."CRMAccessList" OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 17184)
-- Name: CRMAccessList_CRMAccessListId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CRMAccessList_CRMAccessListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CRMAccessList_CRMAccessListId_seq" OWNER TO postgres;

--
-- TOC entry 4227 (class 0 OID 0)
-- Dependencies: 282
-- Name: CRMAccessList_CRMAccessListId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CRMAccessList_CRMAccessListId_seq" OWNED BY public."CRMAccessList"."CRMAccessListId";


--
-- TOC entry 283 (class 1259 OID 17186)
-- Name: EmailPurpose; Type: TABLE; Schema: purposes; Owner: postgres
--

CREATE TABLE purposes."EmailPurpose" (
    "EmailPurposeId" bigint NOT NULL,
    "EmailPurposeTitle" text NOT NULL,
    "EmailPurposeDescription" text NOT NULL
);


ALTER TABLE purposes."EmailPurpose" OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 17192)
-- Name: EmailPurpose_EmailPurposeId_seq; Type: SEQUENCE; Schema: purposes; Owner: postgres
--

CREATE SEQUENCE purposes."EmailPurpose_EmailPurposeId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE purposes."EmailPurpose_EmailPurposeId_seq" OWNER TO postgres;

--
-- TOC entry 4228 (class 0 OID 0)
-- Dependencies: 284
-- Name: EmailPurpose_EmailPurposeId_seq; Type: SEQUENCE OWNED BY; Schema: purposes; Owner: postgres
--

ALTER SEQUENCE purposes."EmailPurpose_EmailPurposeId_seq" OWNED BY purposes."EmailPurpose"."EmailPurposeId";


--
-- TOC entry 285 (class 1259 OID 17194)
-- Name: Status; Type: TABLE; Schema: status; Owner: postgres
--

CREATE TABLE status."Status" (
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


ALTER TABLE status."Status" OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 17201)
-- Name: Status_StatusId_seq; Type: SEQUENCE; Schema: status; Owner: postgres
--

CREATE SEQUENCE status."Status_StatusId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE status."Status_StatusId_seq" OWNER TO postgres;

--
-- TOC entry 4229 (class 0 OID 0)
-- Dependencies: 286
-- Name: Status_StatusId_seq; Type: SEQUENCE OWNED BY; Schema: status; Owner: postgres
--

ALTER SEQUENCE status."Status_StatusId_seq" OWNED BY status."Status"."StatusId";


--
-- TOC entry 287 (class 1259 OID 17203)
-- Name: MainTicket; Type: TABLE; Schema: ticket; Owner: postgres
--

CREATE TABLE ticket."MainTicket" (
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


ALTER TABLE ticket."MainTicket" OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 17210)
-- Name: MainTicket_TicketId_seq; Type: SEQUENCE; Schema: ticket; Owner: postgres
--

CREATE SEQUENCE ticket."MainTicket_TicketId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket."MainTicket_TicketId_seq" OWNER TO postgres;

--
-- TOC entry 4230 (class 0 OID 0)
-- Dependencies: 288
-- Name: MainTicket_TicketId_seq; Type: SEQUENCE OWNED BY; Schema: ticket; Owner: postgres
--

ALTER SEQUENCE ticket."MainTicket_TicketId_seq" OWNED BY ticket."MainTicket"."TicketId";


--
-- TOC entry 289 (class 1259 OID 17212)
-- Name: TicketAccessList; Type: TABLE; Schema: ticket; Owner: postgres
--

CREATE TABLE ticket."TicketAccessList" (
    "TicketAccessListId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "CompanyExecutiveId" bigint NOT NULL,
    "CompanyExecutiveName" text NOT NULL,
    "AccessApplicationTime" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);


ALTER TABLE ticket."TicketAccessList" OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 17219)
-- Name: TicketAccessList_TicketAccessListId_seq; Type: SEQUENCE; Schema: ticket; Owner: postgres
--

CREATE SEQUENCE ticket."TicketAccessList_TicketAccessListId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket."TicketAccessList_TicketAccessListId_seq" OWNER TO postgres;

--
-- TOC entry 4231 (class 0 OID 0)
-- Dependencies: 290
-- Name: TicketAccessList_TicketAccessListId_seq; Type: SEQUENCE OWNED BY; Schema: ticket; Owner: postgres
--

ALTER SEQUENCE ticket."TicketAccessList_TicketAccessListId_seq" OWNED BY ticket."TicketAccessList"."TicketAccessListId";


--
-- TOC entry 291 (class 1259 OID 17221)
-- Name: TicketDateAndTimelines; Type: TABLE; Schema: ticket; Owner: postgres
--

CREATE TABLE ticket."TicketDateAndTimelines" (
    "TicketDateAndTimelinesId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "StartDateAndTime" timestamp without time zone NOT NULL,
    "DeadlineDateAndTime" timestamp without time zone NOT NULL
);


ALTER TABLE ticket."TicketDateAndTimelines" OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 17224)
-- Name: TicketDateAndTimelines_TicketDateAndTimelinesId_seq; Type: SEQUENCE; Schema: ticket; Owner: postgres
--

CREATE SEQUENCE ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq" OWNER TO postgres;

--
-- TOC entry 4232 (class 0 OID 0)
-- Dependencies: 292
-- Name: TicketDateAndTimelines_TicketDateAndTimelinesId_seq; Type: SEQUENCE OWNED BY; Schema: ticket; Owner: postgres
--

ALTER SEQUENCE ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq" OWNED BY ticket."TicketDateAndTimelines"."TicketDateAndTimelinesId";


--
-- TOC entry 293 (class 1259 OID 17226)
-- Name: TicketFollowupDates; Type: TABLE; Schema: ticket; Owner: postgres
--

CREATE TABLE ticket."TicketFollowupDates" (
    "TicketFollowupDatesId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "FollowupDateAndTime" timestamp without time zone NOT NULL,
    "MarkForDelete" boolean DEFAULT false NOT NULL
);


ALTER TABLE ticket."TicketFollowupDates" OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 17230)
-- Name: TicketFollowupDates_TicketFollowupDatesId_seq; Type: SEQUENCE; Schema: ticket; Owner: postgres
--

CREATE SEQUENCE ticket."TicketFollowupDates_TicketFollowupDatesId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket."TicketFollowupDates_TicketFollowupDatesId_seq" OWNER TO postgres;

--
-- TOC entry 4233 (class 0 OID 0)
-- Dependencies: 294
-- Name: TicketFollowupDates_TicketFollowupDatesId_seq; Type: SEQUENCE OWNED BY; Schema: ticket; Owner: postgres
--

ALTER SEQUENCE ticket."TicketFollowupDates_TicketFollowupDatesId_seq" OWNED BY ticket."TicketFollowupDates"."TicketFollowupDatesId";


--
-- TOC entry 295 (class 1259 OID 17232)
-- Name: TicketMetaData; Type: TABLE; Schema: ticket; Owner: postgres
--

CREATE TABLE ticket."TicketMetaData" (
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


ALTER TABLE ticket."TicketMetaData" OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 17238)
-- Name: TicketMetaData_TicketMetaDataId_seq; Type: SEQUENCE; Schema: ticket; Owner: postgres
--

CREATE SEQUENCE ticket."TicketMetaData_TicketMetaDataId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket."TicketMetaData_TicketMetaDataId_seq" OWNER TO postgres;

--
-- TOC entry 4234 (class 0 OID 0)
-- Dependencies: 296
-- Name: TicketMetaData_TicketMetaDataId_seq; Type: SEQUENCE OWNED BY; Schema: ticket; Owner: postgres
--

ALTER SEQUENCE ticket."TicketMetaData_TicketMetaDataId_seq" OWNED BY ticket."TicketMetaData"."TicketMetaDataId";


--
-- TOC entry 297 (class 1259 OID 17240)
-- Name: TicketStatus; Type: TABLE; Schema: ticket; Owner: postgres
--

CREATE TABLE ticket."TicketStatus" (
    "TicketStatusId" bigint NOT NULL,
    "TicketId" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "StatusName" text NOT NULL,
    "LastEditBy" bigint NOT NULL,
    "LastEditOn" timestamp without time zone NOT NULL
);


ALTER TABLE ticket."TicketStatus" OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 17246)
-- Name: TicketStatus_TicketStatusId_seq; Type: SEQUENCE; Schema: ticket; Owner: postgres
--

CREATE SEQUENCE ticket."TicketStatus_TicketStatusId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ticket."TicketStatus_TicketStatusId_seq" OWNER TO postgres;

--
-- TOC entry 4235 (class 0 OID 0)
-- Dependencies: 298
-- Name: TicketStatus_TicketStatusId_seq; Type: SEQUENCE OWNED BY; Schema: ticket; Owner: postgres
--

ALTER SEQUENCE ticket."TicketStatus_TicketStatusId_seq" OWNED BY ticket."TicketStatus"."TicketStatusId";


--
-- TOC entry 3627 (class 2604 OID 17248)
-- Name: CallTransaction CallTransactionId; Type: DEFAULT; Schema: callTransactions; Owner: postgres
--

ALTER TABLE ONLY "callTransactions"."CallTransaction" ALTER COLUMN "CallTransactionId" SET DEFAULT nextval('"callTransactions"."CallTransaction_CallTransactionId_seq"'::regclass);


--
-- TOC entry 3630 (class 2604 OID 17249)
-- Name: Client ClientId; Type: DEFAULT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."Client" ALTER COLUMN "ClientId" SET DEFAULT nextval('client."Client_ClientId_seq"'::regclass);


--
-- TOC entry 3633 (class 2604 OID 17250)
-- Name: ClientLocation ClientLocationId; Type: DEFAULT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation" ALTER COLUMN "ClientLocationId" SET DEFAULT nextval('client."ClientLocation_ClientLocationId_seq"'::regclass);


--
-- TOC entry 3636 (class 2604 OID 17251)
-- Name: Company CompanyId; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."Company" ALTER COLUMN "CompanyId" SET DEFAULT nextval('company."Company_CompanyId_seq"'::regclass);


--
-- TOC entry 3638 (class 2604 OID 17252)
-- Name: CompanyAddressDetails CompanyAddressID; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyAddressDetails" ALTER COLUMN "CompanyAddressID" SET DEFAULT nextval('company."CompanyAddressDetails_CompanyAddressID_seq"'::regclass);


--
-- TOC entry 3641 (class 2604 OID 17253)
-- Name: CompanyArea CompanyAreaID; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyArea" ALTER COLUMN "CompanyAreaID" SET DEFAULT nextval('company."CompanyArea_CompanyAreaID_seq"'::regclass);


--
-- TOC entry 3644 (class 2604 OID 17254)
-- Name: CompanyBranch CompanyBranchID; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch" ALTER COLUMN "CompanyBranchID" SET DEFAULT nextval('company."CompanyBranch_CompanyBranchID_seq"'::regclass);


--
-- TOC entry 3646 (class 2604 OID 17255)
-- Name: CompanyBranchAddressDetails CompanyBranchAddressID; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails" ALTER COLUMN "CompanyBranchAddressID" SET DEFAULT nextval('company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq"'::regclass);


--
-- TOC entry 3648 (class 2604 OID 17256)
-- Name: CompanyBranchType CompanyBranchTypeId; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchType" ALTER COLUMN "CompanyBranchTypeId" SET DEFAULT nextval('company."CompanyBranchType_CompanyBranchTypeId_seq"'::regclass);


--
-- TOC entry 3651 (class 2604 OID 17257)
-- Name: CompanyExecutive CompanyExecutiveID; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive" ALTER COLUMN "CompanyExecutiveID" SET DEFAULT nextval('company."CompanyExecutive_ExecutiveID_seq"'::regclass);


--
-- TOC entry 3653 (class 2604 OID 17258)
-- Name: CompanyExecutivePL id; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutivePL" ALTER COLUMN id SET DEFAULT nextval('company."CompanyExecutivePL_id_seq"'::regclass);


--
-- TOC entry 3656 (class 2604 OID 17259)
-- Name: CompanyRegion CompanyRegionID; Type: DEFAULT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyRegion" ALTER COLUMN "CompanyRegionID" SET DEFAULT nextval('company."CompanyRegion_CompanyRegionID_seq"'::regclass);


--
-- TOC entry 3657 (class 2604 OID 17260)
-- Name: CompanyExecutiveGeoLocation CompanyExecutiveGeoLocationId; Type: DEFAULT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" ALTER COLUMN "CompanyExecutiveGeoLocationId" SET DEFAULT nextval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq"'::regclass);


--
-- TOC entry 3658 (class 2604 OID 17261)
-- Name: CompanyExecutiveGeoLocationAddress CompanyExecutiveGeoLocationAddressId; Type: DEFAULT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress" ALTER COLUMN "CompanyExecutiveGeoLocationAddressId" SET DEFAULT nextval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq"'::regclass);


--
-- TOC entry 3660 (class 2604 OID 17262)
-- Name: EnquiryAccessList EnquiryAccessListId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryAccessList" ALTER COLUMN "EnquiryAccessListId" SET DEFAULT nextval('enquiry."EnquiryAccessList_EnquiryAccessListId_seq"'::regclass);


--
-- TOC entry 3661 (class 2604 OID 17263)
-- Name: EnquiryClient EnquiryClientId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryClient" ALTER COLUMN "EnquiryClientId" SET DEFAULT nextval('enquiry."EnquiryClient_EnquiryClientId_seq"'::regclass);


--
-- TOC entry 3662 (class 2604 OID 17264)
-- Name: EnquiryDateAndTimelines EnquiryDateAndTimelinesId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines" ALTER COLUMN "EnquiryDateAndTimelinesId" SET DEFAULT nextval('enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq"'::regclass);


--
-- TOC entry 3663 (class 2604 OID 17265)
-- Name: EnquiryLocation EnquiryLocationId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation" ALTER COLUMN "EnquiryLocationId" SET DEFAULT nextval('enquiry."EnquiryLocation_EnquiryLocationId_seq"'::regclass);


--
-- TOC entry 3665 (class 2604 OID 17266)
-- Name: EnquiryProductList EnquiryProductListId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryProductList" ALTER COLUMN "EnquiryProductListId" SET DEFAULT nextval('enquiry."EnquiryProductList_EnquiryProductListId_seq"'::regclass);


--
-- TOC entry 3667 (class 2604 OID 17267)
-- Name: EnquiryType EnquiryTypeId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryType" ALTER COLUMN "EnquiryTypeId" SET DEFAULT nextval('enquiry."EnquiryType_EnquiryTypeId_seq"'::regclass);


--
-- TOC entry 3669 (class 2604 OID 17268)
-- Name: MainEnquiry EnquiryId; Type: DEFAULT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."MainEnquiry" ALTER COLUMN "EnquiryId" SET DEFAULT nextval('enquiry."MainEnquiry_EnquiryId_seq"'::regclass);


--
-- TOC entry 3675 (class 2604 OID 17269)
-- Name: businessCityForCompany BusinessCityForCompanyID; Type: DEFAULT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessCityForCompany" ALTER COLUMN "BusinessCityForCompanyID" SET DEFAULT nextval('location."businessCityForCompany_BusinessCityForCompanyID_seq"'::regclass);


--
-- TOC entry 3687 (class 2604 OID 17270)
-- Name: stateinfo StateID; Type: DEFAULT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.stateinfo ALTER COLUMN "StateID" SET DEFAULT nextval('location."stateinfo_StateID_seq"'::regclass);


--
-- TOC entry 3691 (class 2604 OID 17271)
-- Name: Notification NotificationID; Type: DEFAULT; Schema: notification; Owner: postgres
--

ALTER TABLE ONLY notification."Notification" ALTER COLUMN "NotificationID" SET DEFAULT nextval('notification."Notification_NotificationID_seq"'::regclass);


--
-- TOC entry 3695 (class 2604 OID 17272)
-- Name: CompanyExecutiveMasterList id; Type: DEFAULT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."CompanyExecutiveMasterList" ALTER COLUMN id SET DEFAULT nextval('"position"."CompanyExecutiveMasterList_id_seq"'::regclass);


--
-- TOC entry 3698 (class 2604 OID 17273)
-- Name: Positions id; Type: DEFAULT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."Positions" ALTER COLUMN id SET DEFAULT nextval('"position"."Positions_id_seq"'::regclass);


--
-- TOC entry 3700 (class 2604 OID 17274)
-- Name: Priority PriorityId; Type: DEFAULT; Schema: priority; Owner: postgres
--

ALTER TABLE ONLY priority."Priority" ALTER COLUMN "PriorityId" SET DEFAULT nextval('priority."Priority_PriorityId_seq"'::regclass);


--
-- TOC entry 3703 (class 2604 OID 17275)
-- Name: Product id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product."Product" ALTER COLUMN id SET DEFAULT nextval('product."Product_id_seq"'::regclass);


--
-- TOC entry 3705 (class 2604 OID 17276)
-- Name: CRMAccessList CRMAccessListId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CRMAccessList" ALTER COLUMN "CRMAccessListId" SET DEFAULT nextval('public."CRMAccessList_CRMAccessListId_seq"'::regclass);


--
-- TOC entry 3706 (class 2604 OID 17277)
-- Name: EmailPurpose EmailPurposeId; Type: DEFAULT; Schema: purposes; Owner: postgres
--

ALTER TABLE ONLY purposes."EmailPurpose" ALTER COLUMN "EmailPurposeId" SET DEFAULT nextval('purposes."EmailPurpose_EmailPurposeId_seq"'::regclass);


--
-- TOC entry 3708 (class 2604 OID 17278)
-- Name: Status StatusId; Type: DEFAULT; Schema: status; Owner: postgres
--

ALTER TABLE ONLY status."Status" ALTER COLUMN "StatusId" SET DEFAULT nextval('status."Status_StatusId_seq"'::regclass);


--
-- TOC entry 3710 (class 2604 OID 17279)
-- Name: MainTicket TicketId; Type: DEFAULT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."MainTicket" ALTER COLUMN "TicketId" SET DEFAULT nextval('ticket."MainTicket_TicketId_seq"'::regclass);


--
-- TOC entry 3712 (class 2604 OID 17280)
-- Name: TicketAccessList TicketAccessListId; Type: DEFAULT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketAccessList" ALTER COLUMN "TicketAccessListId" SET DEFAULT nextval('ticket."TicketAccessList_TicketAccessListId_seq"'::regclass);


--
-- TOC entry 3713 (class 2604 OID 17281)
-- Name: TicketDateAndTimelines TicketDateAndTimelinesId; Type: DEFAULT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketDateAndTimelines" ALTER COLUMN "TicketDateAndTimelinesId" SET DEFAULT nextval('ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq"'::regclass);


--
-- TOC entry 3715 (class 2604 OID 17282)
-- Name: TicketFollowupDates TicketFollowupDatesId; Type: DEFAULT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketFollowupDates" ALTER COLUMN "TicketFollowupDatesId" SET DEFAULT nextval('ticket."TicketFollowupDates_TicketFollowupDatesId_seq"'::regclass);


--
-- TOC entry 3716 (class 2604 OID 17283)
-- Name: TicketMetaData TicketMetaDataId; Type: DEFAULT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketMetaData" ALTER COLUMN "TicketMetaDataId" SET DEFAULT nextval('ticket."TicketMetaData_TicketMetaDataId_seq"'::regclass);


--
-- TOC entry 3717 (class 2604 OID 17284)
-- Name: TicketStatus TicketStatusId; Type: DEFAULT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketStatus" ALTER COLUMN "TicketStatusId" SET DEFAULT nextval('ticket."TicketStatus_TicketStatusId_seq"'::regclass);


--
-- TOC entry 4106 (class 0 OID 16877)
-- Dependencies: 216
-- Data for Name: CallTransaction; Type: TABLE DATA; Schema: callTransactions; Owner: postgres
--



--
-- TOC entry 4110 (class 0 OID 16890)
-- Dependencies: 220
-- Data for Name: Client; Type: TABLE DATA; Schema: client; Owner: postgres
--



--
-- TOC entry 4111 (class 0 OID 16898)
-- Dependencies: 221
-- Data for Name: ClientLocation; Type: TABLE DATA; Schema: client; Owner: postgres
--



--
-- TOC entry 4114 (class 0 OID 16910)
-- Dependencies: 224
-- Data for Name: Company; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4115 (class 0 OID 16918)
-- Dependencies: 225
-- Data for Name: CompanyAddressDetails; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4117 (class 0 OID 16927)
-- Dependencies: 227
-- Data for Name: CompanyArea; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4119 (class 0 OID 16937)
-- Dependencies: 229
-- Data for Name: CompanyBranch; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4120 (class 0 OID 16945)
-- Dependencies: 230
-- Data for Name: CompanyBranchAddressDetails; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4122 (class 0 OID 16954)
-- Dependencies: 232
-- Data for Name: CompanyBranchType; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4125 (class 0 OID 16965)
-- Dependencies: 235
-- Data for Name: CompanyExecutive; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4126 (class 0 OID 16973)
-- Dependencies: 236
-- Data for Name: CompanyExecutivePL; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4129 (class 0 OID 16981)
-- Dependencies: 239
-- Data for Name: CompanyRegion; Type: TABLE DATA; Schema: company; Owner: postgres
--



--
-- TOC entry 4132 (class 0 OID 16993)
-- Dependencies: 242
-- Data for Name: CompanyExecutiveGeoLocation; Type: TABLE DATA; Schema: companyExecutiveGeoLocation; Owner: postgres
--



--
-- TOC entry 4133 (class 0 OID 16999)
-- Dependencies: 243
-- Data for Name: CompanyExecutiveGeoLocationAddress; Type: TABLE DATA; Schema: companyExecutiveGeoLocation; Owner: postgres
--



--
-- TOC entry 4136 (class 0 OID 17009)
-- Dependencies: 246
-- Data for Name: EnquiryAccessList; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4138 (class 0 OID 17018)
-- Dependencies: 248
-- Data for Name: EnquiryClient; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4140 (class 0 OID 17026)
-- Dependencies: 250
-- Data for Name: EnquiryDateAndTimelines; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4142 (class 0 OID 17031)
-- Dependencies: 252
-- Data for Name: EnquiryLocation; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4144 (class 0 OID 17039)
-- Dependencies: 254
-- Data for Name: EnquiryProductList; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4146 (class 0 OID 17048)
-- Dependencies: 256
-- Data for Name: EnquiryType; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4148 (class 0 OID 17057)
-- Dependencies: 258
-- Data for Name: MainEnquiry; Type: TABLE DATA; Schema: enquiry; Owner: postgres
--



--
-- TOC entry 4151 (class 0 OID 17068)
-- Dependencies: 261
-- Data for Name: areainfo; Type: TABLE DATA; Schema: location; Owner: postgres
--



--
-- TOC entry 4154 (class 0 OID 17084)
-- Dependencies: 264
-- Data for Name: businessAreaForCompany; Type: TABLE DATA; Schema: location; Owner: postgres
--



--
-- TOC entry 4152 (class 0 OID 17077)
-- Dependencies: 262
-- Data for Name: businessCityForCompany; Type: TABLE DATA; Schema: location; Owner: postgres
--



--
-- TOC entry 4155 (class 0 OID 17090)
-- Dependencies: 265
-- Data for Name: cityinfo; Type: TABLE DATA; Schema: location; Owner: postgres
--



--
-- TOC entry 4156 (class 0 OID 17099)
-- Dependencies: 266
-- Data for Name: countryinfo; Type: TABLE DATA; Schema: location; Owner: postgres
--

INSERT INTO location.countryinfo ("CountryName", "CountryCode", "CountryID", "MarkForDelete", "CountryDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType") VALUES ('INDIA', 'IND', 122, false, 'INDIA', true, '2020-09-05 15:40:10', 145, 1, '2020-09-05 15:40:10', 145, 1);


--
-- TOC entry 4157 (class 0 OID 17108)
-- Dependencies: 267
-- Data for Name: stateinfo; Type: TABLE DATA; Schema: location; Owner: postgres
--

INSERT INTO location.stateinfo ("StateName", "StateCode", "MarkForDelete", "StateDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "CountryID", "StateID") VALUES ('MAHARASHTRA', 'MH', false, 'MAHARASHTRA', true, '2020-09-20 05:30:00', 193, 1, '2020-09-20 05:30:00', 193, 1, 122, 4);
INSERT INTO location.stateinfo ("StateName", "StateCode", "MarkForDelete", "StateDescription", "IsActive", "CreatedOn", "CreatedBy", "DeviceType", "LastEditOn", "LastEditBy", "LastEditDeviceType", "CountryID", "StateID") VALUES ('GUJARAT', 'GJ', false, 'GUJARAT', true, '2020-09-20 05:30:00', 193, 1, '2020-09-20 05:30:00', 193, 1, 122, 5);


--
-- TOC entry 4159 (class 0 OID 17118)
-- Dependencies: 269
-- Data for Name: Notification; Type: TABLE DATA; Schema: notification; Owner: postgres
--



--
-- TOC entry 4161 (class 0 OID 17129)
-- Dependencies: 271
-- Data for Name: OwnerContact; Type: TABLE DATA; Schema: owner; Owner: postgres
--



--
-- TOC entry 4163 (class 0 OID 17140)
-- Dependencies: 273
-- Data for Name: CompanyExecutiveMasterList; Type: TABLE DATA; Schema: position; Owner: postgres
--



--
-- TOC entry 4165 (class 0 OID 17148)
-- Dependencies: 275
-- Data for Name: Positions; Type: TABLE DATA; Schema: position; Owner: postgres
--



--
-- TOC entry 4167 (class 0 OID 17159)
-- Dependencies: 277
-- Data for Name: Priority; Type: TABLE DATA; Schema: priority; Owner: postgres
--

INSERT INTO priority."Priority" ("PriorityId", "PriorityName", "PriorityPosition") VALUES (1, 'LOW', 1);
INSERT INTO priority."Priority" ("PriorityId", "PriorityName", "PriorityPosition") VALUES (2, 'NORMAL', 2);
INSERT INTO priority."Priority" ("PriorityId", "PriorityName", "PriorityPosition") VALUES (3, 'HIGH', 3);
INSERT INTO priority."Priority" ("PriorityId", "PriorityName", "PriorityPosition") VALUES (4, 'IMMEDIATE', 4);


--
-- TOC entry 4169 (class 0 OID 17167)
-- Dependencies: 279
-- Data for Name: Product; Type: TABLE DATA; Schema: product; Owner: postgres
--



--
-- TOC entry 4171 (class 0 OID 17177)
-- Dependencies: 281
-- Data for Name: CRMAccessList; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4173 (class 0 OID 17186)
-- Dependencies: 283
-- Data for Name: EmailPurpose; Type: TABLE DATA; Schema: purposes; Owner: postgres
--

INSERT INTO purposes."EmailPurpose" ("EmailPurposeId", "EmailPurposeTitle", "EmailPurposeDescription") VALUES (1, 'Followup Date Notification', 'The purpose of this is to notify/inform/make aware the CompanyExecutive of his/her Followup Date arrival');
INSERT INTO purposes."EmailPurpose" ("EmailPurposeId", "EmailPurposeTitle", "EmailPurposeDescription") VALUES (2, 'Deadline Date Notification', 'The purpose of this is to notify/inform/make aware the CompanyExecutive of his/her Deadline Date arrival');


--
-- TOC entry 4175 (class 0 OID 17194)
-- Dependencies: 285
-- Data for Name: Status; Type: TABLE DATA; Schema: status; Owner: postgres
--



--
-- TOC entry 4177 (class 0 OID 17203)
-- Dependencies: 287
-- Data for Name: MainTicket; Type: TABLE DATA; Schema: ticket; Owner: postgres
--



--
-- TOC entry 4179 (class 0 OID 17212)
-- Dependencies: 289
-- Data for Name: TicketAccessList; Type: TABLE DATA; Schema: ticket; Owner: postgres
--



--
-- TOC entry 4181 (class 0 OID 17221)
-- Dependencies: 291
-- Data for Name: TicketDateAndTimelines; Type: TABLE DATA; Schema: ticket; Owner: postgres
--



--
-- TOC entry 4183 (class 0 OID 17226)
-- Dependencies: 293
-- Data for Name: TicketFollowupDates; Type: TABLE DATA; Schema: ticket; Owner: postgres
--



--
-- TOC entry 4185 (class 0 OID 17232)
-- Dependencies: 295
-- Data for Name: TicketMetaData; Type: TABLE DATA; Schema: ticket; Owner: postgres
--



--
-- TOC entry 4187 (class 0 OID 17240)
-- Dependencies: 297
-- Data for Name: TicketStatus; Type: TABLE DATA; Schema: ticket; Owner: postgres
--



--
-- TOC entry 4236 (class 0 OID 0)
-- Dependencies: 217
-- Name: CallTransaction_CallTransactionId_seq; Type: SEQUENCE SET; Schema: callTransactions; Owner: postgres
--

SELECT pg_catalog.setval('"callTransactions"."CallTransaction_CallTransactionId_seq"', 101, true);


--
-- TOC entry 4237 (class 0 OID 0)
-- Dependencies: 218
-- Name: CallTransaction_ClientId_seq; Type: SEQUENCE SET; Schema: callTransactions; Owner: postgres
--

SELECT pg_catalog.setval('"callTransactions"."CallTransaction_ClientId_seq"', 1, false);


--
-- TOC entry 4238 (class 0 OID 0)
-- Dependencies: 219
-- Name: CallTransaction_CompanyExecutiveId_seq; Type: SEQUENCE SET; Schema: callTransactions; Owner: postgres
--

SELECT pg_catalog.setval('"callTransactions"."CallTransaction_CompanyExecutiveId_seq"', 1, false);


--
-- TOC entry 4239 (class 0 OID 0)
-- Dependencies: 222
-- Name: ClientLocation_ClientLocationId_seq; Type: SEQUENCE SET; Schema: client; Owner: postgres
--

SELECT pg_catalog.setval('client."ClientLocation_ClientLocationId_seq"', 52, true);


--
-- TOC entry 4240 (class 0 OID 0)
-- Dependencies: 223
-- Name: Client_ClientId_seq; Type: SEQUENCE SET; Schema: client; Owner: postgres
--

SELECT pg_catalog.setval('client."Client_ClientId_seq"', 52, true);


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 226
-- Name: CompanyAddressDetails_CompanyAddressID_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyAddressDetails_CompanyAddressID_seq"', 6, true);


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 228
-- Name: CompanyArea_CompanyAreaID_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyArea_CompanyAreaID_seq"', 13, true);


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 231
-- Name: CompanyBranchAddressDetails_CompanyBranchAddressID_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyBranchAddressDetails_CompanyBranchAddressID_seq"', 173, true);


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 233
-- Name: CompanyBranchType_CompanyBranchTypeId_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyBranchType_CompanyBranchTypeId_seq"', 21, true);


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 234
-- Name: CompanyBranch_CompanyBranchID_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyBranch_CompanyBranchID_seq"', 174, true);


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 237
-- Name: CompanyExecutivePL_id_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyExecutivePL_id_seq"', 21, true);


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 238
-- Name: CompanyExecutive_ExecutiveID_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyExecutive_ExecutiveID_seq"', 209, true);


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 240
-- Name: CompanyRegion_CompanyRegionID_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."CompanyRegion_CompanyRegionID_seq"', 183, true);


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 241
-- Name: Company_CompanyId_seq; Type: SEQUENCE SET; Schema: company; Owner: postgres
--

SELECT pg_catalog.setval('company."Company_CompanyId_seq"', 148, true);


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 244
-- Name: CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq; Type: SEQUENCE SET; Schema: companyExecutiveGeoLocation; Owner: postgres
--

SELECT pg_catalog.setval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAd_CompanyExecutiveGeoLocationAd_seq"', 48, true);


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 245
-- Name: CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq; Type: SEQUENCE SET; Schema: companyExecutiveGeoLocation; Owner: postgres
--

SELECT pg_catalog.setval('"companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationId_seq"', 48, true);


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 247
-- Name: EnquiryAccessList_EnquiryAccessListId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."EnquiryAccessList_EnquiryAccessListId_seq"', 99, true);


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 249
-- Name: EnquiryClient_EnquiryClientId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."EnquiryClient_EnquiryClientId_seq"', 98, true);


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 251
-- Name: EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."EnquiryDateAndTimelines_EnquiryDateAndTimelinesId_seq"', 93, true);


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 253
-- Name: EnquiryLocation_EnquiryLocationId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."EnquiryLocation_EnquiryLocationId_seq"', 98, true);


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 255
-- Name: EnquiryProductList_EnquiryProductListId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."EnquiryProductList_EnquiryProductListId_seq"', 240, true);


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 257
-- Name: EnquiryType_EnquiryTypeId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."EnquiryType_EnquiryTypeId_seq"', 14, true);


--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 259
-- Name: MainEnquiry_EnquiryId_seq; Type: SEQUENCE SET; Schema: enquiry; Owner: postgres
--

SELECT pg_catalog.setval('enquiry."MainEnquiry_EnquiryId_seq"', 98, true);


--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 263
-- Name: businessCityForCompany_BusinessCityForCompanyID_seq; Type: SEQUENCE SET; Schema: location; Owner: postgres
--

SELECT pg_catalog.setval('location."businessCityForCompany_BusinessCityForCompanyID_seq"', 24, true);


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 260
-- Name: seq_id; Type: SEQUENCE SET; Schema: location; Owner: postgres
--

SELECT pg_catalog.setval('location.seq_id', 128, true);


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 268
-- Name: stateinfo_StateID_seq; Type: SEQUENCE SET; Schema: location; Owner: postgres
--

SELECT pg_catalog.setval('location."stateinfo_StateID_seq"', 5, true);


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 270
-- Name: Notification_NotificationID_seq; Type: SEQUENCE SET; Schema: notification; Owner: postgres
--

SELECT pg_catalog.setval('notification."Notification_NotificationID_seq"', 420, true);


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 272
-- Name: OwnerContact_id_seq; Type: SEQUENCE SET; Schema: owner; Owner: postgres
--

SELECT pg_catalog.setval('owner."OwnerContact_id_seq"', 6, true);


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 274
-- Name: CompanyExecutiveMasterList_id_seq; Type: SEQUENCE SET; Schema: position; Owner: postgres
--

SELECT pg_catalog.setval('"position"."CompanyExecutiveMasterList_id_seq"', 46, true);


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 276
-- Name: Positions_id_seq; Type: SEQUENCE SET; Schema: position; Owner: postgres
--

SELECT pg_catalog.setval('"position"."Positions_id_seq"', 37, true);


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 278
-- Name: Priority_PriorityId_seq; Type: SEQUENCE SET; Schema: priority; Owner: postgres
--

SELECT pg_catalog.setval('priority."Priority_PriorityId_seq"', 4, true);


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 280
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: product; Owner: postgres
--

SELECT pg_catalog.setval('product."Product_id_seq"', 22, true);


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 282
-- Name: CRMAccessList_CRMAccessListId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CRMAccessList_CRMAccessListId_seq"', 66, true);


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 284
-- Name: EmailPurpose_EmailPurposeId_seq; Type: SEQUENCE SET; Schema: purposes; Owner: postgres
--

SELECT pg_catalog.setval('purposes."EmailPurpose_EmailPurposeId_seq"', 2, true);


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 286
-- Name: Status_StatusId_seq; Type: SEQUENCE SET; Schema: status; Owner: postgres
--

SELECT pg_catalog.setval('status."Status_StatusId_seq"', 26, true);


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 288
-- Name: MainTicket_TicketId_seq; Type: SEQUENCE SET; Schema: ticket; Owner: postgres
--

SELECT pg_catalog.setval('ticket."MainTicket_TicketId_seq"', 238, true);


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 290
-- Name: TicketAccessList_TicketAccessListId_seq; Type: SEQUENCE SET; Schema: ticket; Owner: postgres
--

SELECT pg_catalog.setval('ticket."TicketAccessList_TicketAccessListId_seq"', 360, true);


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 292
-- Name: TicketDateAndTimelines_TicketDateAndTimelinesId_seq; Type: SEQUENCE SET; Schema: ticket; Owner: postgres
--

SELECT pg_catalog.setval('ticket."TicketDateAndTimelines_TicketDateAndTimelinesId_seq"', 238, true);


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 294
-- Name: TicketFollowupDates_TicketFollowupDatesId_seq; Type: SEQUENCE SET; Schema: ticket; Owner: postgres
--

SELECT pg_catalog.setval('ticket."TicketFollowupDates_TicketFollowupDatesId_seq"', 28, true);


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 296
-- Name: TicketMetaData_TicketMetaDataId_seq; Type: SEQUENCE SET; Schema: ticket; Owner: postgres
--

SELECT pg_catalog.setval('ticket."TicketMetaData_TicketMetaDataId_seq"', 238, true);


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 298
-- Name: TicketStatus_TicketStatusId_seq; Type: SEQUENCE SET; Schema: ticket; Owner: postgres
--

SELECT pg_catalog.setval('ticket."TicketStatus_TicketStatusId_seq"', 276, true);


--
-- TOC entry 3719 (class 2606 OID 17286)
-- Name: CallTransaction callTransaction_pkey; Type: CONSTRAINT; Schema: callTransactions; Owner: postgres
--

ALTER TABLE ONLY "callTransactions"."CallTransaction"
    ADD CONSTRAINT "callTransaction_pkey" PRIMARY KEY ("CallTransactionId");


--
-- TOC entry 3723 (class 2606 OID 17288)
-- Name: Client PK_Client; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "PK_Client" PRIMARY KEY ("ClientId");


--
-- TOC entry 3728 (class 2606 OID 17290)
-- Name: ClientLocation PK_ClientLocation; Type: CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "PK_ClientLocation" PRIMARY KEY ("ClientLocationId");


--
-- TOC entry 3744 (class 2606 OID 17292)
-- Name: CompanyArea CompanyArea_pkey; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "CompanyArea_pkey" PRIMARY KEY ("CompanyAreaID");


--
-- TOC entry 3748 (class 2606 OID 17294)
-- Name: CompanyBranch CompanyBranch_pkey; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "CompanyBranch_pkey" PRIMARY KEY ("CompanyBranchID");


--
-- TOC entry 3763 (class 2606 OID 17296)
-- Name: CompanyExecutive CompanyExecutive_pkey; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "CompanyExecutive_pkey" PRIMARY KEY ("CompanyExecutiveID");


--
-- TOC entry 3772 (class 2606 OID 17298)
-- Name: CompanyRegion CompanyRegion_pkey; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "CompanyRegion_pkey" PRIMARY KEY ("CompanyRegionID");


--
-- TOC entry 3734 (class 2606 OID 17300)
-- Name: Company PK_Company; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "PK_Company" PRIMARY KEY ("CompanyId");


--
-- TOC entry 3739 (class 2606 OID 17302)
-- Name: CompanyAddressDetails PK_CompanyAddressDetails; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "PK_CompanyAddressDetails" PRIMARY KEY ("CompanyAddressID");


--
-- TOC entry 3755 (class 2606 OID 17304)
-- Name: CompanyBranchAddressDetails PK_CompanyBranchAddressDetails; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "PK_CompanyBranchAddressDetails" PRIMARY KEY ("CompanyBranchAddressID");


--
-- TOC entry 3760 (class 2606 OID 17306)
-- Name: CompanyBranchType PK_CompanyBranchType; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "PK_CompanyBranchType" PRIMARY KEY ("CompanyBranchTypeId");


--
-- TOC entry 3769 (class 2606 OID 17308)
-- Name: CompanyExecutivePL PK_CompanyExecutivePL; Type: CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutivePL"
    ADD CONSTRAINT "PK_CompanyExecutivePL" PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 17310)
-- Name: CompanyExecutiveGeoLocation PK_CompanyExecutiveGeoLocation; Type: CONSTRAINT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "PK_CompanyExecutiveGeoLocation" PRIMARY KEY ("CompanyExecutiveGeoLocationId");


--
-- TOC entry 3780 (class 2606 OID 17312)
-- Name: CompanyExecutiveGeoLocationAddress PK_CompanyExecutiveGeoLocationAddress; Type: CONSTRAINT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"
    ADD CONSTRAINT "PK_CompanyExecutiveGeoLocationAddress" PRIMARY KEY ("CompanyExecutiveGeoLocationAddressId");


--
-- TOC entry 3790 (class 2606 OID 17314)
-- Name: EnquiryDateAndTimelines EnquiryDateAndTimelines_pkey; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines"
    ADD CONSTRAINT "EnquiryDateAndTimelines_pkey" PRIMARY KEY ("EnquiryDateAndTimelinesId");


--
-- TOC entry 3782 (class 2606 OID 17316)
-- Name: EnquiryAccessList PK_EnquiryAccessList; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryAccessList"
    ADD CONSTRAINT "PK_EnquiryAccessList" PRIMARY KEY ("EnquiryAccessListId");


--
-- TOC entry 3786 (class 2606 OID 17318)
-- Name: EnquiryClient PK_EnquiryClient; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryClient"
    ADD CONSTRAINT "PK_EnquiryClient" PRIMARY KEY ("EnquiryClientId");


--
-- TOC entry 3792 (class 2606 OID 17320)
-- Name: EnquiryLocation PK_EnquiryLocation; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "PK_EnquiryLocation" PRIMARY KEY ("EnquiryLocationId");


--
-- TOC entry 3799 (class 2606 OID 17322)
-- Name: EnquiryProductList PK_EnquiryProductList; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryProductList"
    ADD CONSTRAINT "PK_EnquiryProductList" PRIMARY KEY ("EnquiryProductListId");


--
-- TOC entry 3803 (class 2606 OID 17324)
-- Name: EnquiryType PK_EnquiryType; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "PK_EnquiryType" PRIMARY KEY ("EnquiryTypeId");


--
-- TOC entry 3806 (class 2606 OID 17326)
-- Name: MainEnquiry PK_MainEnquiry; Type: CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "PK_MainEnquiry" PRIMARY KEY ("EnquiryId");


--
-- TOC entry 3821 (class 2606 OID 17328)
-- Name: cityinfo PK_cityinfo; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.cityinfo
    ADD CONSTRAINT "PK_cityinfo" PRIMARY KEY ("CityID");


--
-- TOC entry 3823 (class 2606 OID 17330)
-- Name: countryinfo PK_countryinfo; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.countryinfo
    ADD CONSTRAINT "PK_countryinfo" PRIMARY KEY ("CountryID");


--
-- TOC entry 3812 (class 2606 OID 17332)
-- Name: areainfo areainfo_pkey; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.areainfo
    ADD CONSTRAINT areainfo_pkey PRIMARY KEY ("AreaID");


--
-- TOC entry 3818 (class 2606 OID 17334)
-- Name: businessAreaForCompany businessAreaForCompany_pkey; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "businessAreaForCompany_pkey" PRIMARY KEY ("BusinessAreaForCompanyID");


--
-- TOC entry 3814 (class 2606 OID 17336)
-- Name: businessCityForCompany businessCityForCompany_pkey; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessCityForCompany"
    ADD CONSTRAINT "businessCityForCompany_pkey" PRIMARY KEY ("BusinessCityForCompanyID");


--
-- TOC entry 3825 (class 2606 OID 17338)
-- Name: stateinfo stateinfo_pkey; Type: CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.stateinfo
    ADD CONSTRAINT stateinfo_pkey PRIMARY KEY ("StateID");


--
-- TOC entry 3827 (class 2606 OID 17340)
-- Name: Notification PK_Notification; Type: CONSTRAINT; Schema: notification; Owner: postgres
--

ALTER TABLE ONLY notification."Notification"
    ADD CONSTRAINT "PK_Notification" PRIMARY KEY ("NotificationID");


--
-- TOC entry 3830 (class 2606 OID 17342)
-- Name: OwnerContact PK_OwnerContact; Type: CONSTRAINT; Schema: owner; Owner: postgres
--

ALTER TABLE ONLY owner."OwnerContact"
    ADD CONSTRAINT "PK_OwnerContact" PRIMARY KEY (id);


--
-- TOC entry 3832 (class 2606 OID 17344)
-- Name: CompanyExecutiveMasterList PK_CompanyExecutiveMasterList; Type: CONSTRAINT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."CompanyExecutiveMasterList"
    ADD CONSTRAINT "PK_CompanyExecutiveMasterList" PRIMARY KEY (id);


--
-- TOC entry 3834 (class 2606 OID 17346)
-- Name: Positions PK_Positions; Type: CONSTRAINT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "PK_Positions" PRIMARY KEY (id);


--
-- TOC entry 3838 (class 2606 OID 17348)
-- Name: Priority Priority_pkey; Type: CONSTRAINT; Schema: priority; Owner: postgres
--

ALTER TABLE ONLY priority."Priority"
    ADD CONSTRAINT "Priority_pkey" PRIMARY KEY ("PriorityId");


--
-- TOC entry 3840 (class 2606 OID 17350)
-- Name: Priority U_PriorityPosition; Type: CONSTRAINT; Schema: priority; Owner: postgres
--

ALTER TABLE ONLY priority."Priority"
    ADD CONSTRAINT "U_PriorityPosition" UNIQUE ("PriorityPosition");


--
-- TOC entry 3842 (class 2606 OID 17352)
-- Name: Product PK_Product; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "PK_Product" PRIMARY KEY (id);


--
-- TOC entry 3845 (class 2606 OID 17354)
-- Name: CRMAccessList CRMAccessList_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CRMAccessList"
    ADD CONSTRAINT "CRMAccessList_pkey" PRIMARY KEY ("CRMAccessListId");


--
-- TOC entry 3847 (class 2606 OID 17356)
-- Name: CRMAccessList U_CorrespondingId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CRMAccessList"
    ADD CONSTRAINT "U_CorrespondingId" UNIQUE ("CorrespondingId");


--
-- TOC entry 3849 (class 2606 OID 17358)
-- Name: EmailPurpose EmailPurpose_pkey; Type: CONSTRAINT; Schema: purposes; Owner: postgres
--

ALTER TABLE ONLY purposes."EmailPurpose"
    ADD CONSTRAINT "EmailPurpose_pkey" PRIMARY KEY ("EmailPurposeId");


--
-- TOC entry 3851 (class 2606 OID 17360)
-- Name: Status PK_Status; Type: CONSTRAINT; Schema: status; Owner: postgres
--

ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "PK_Status" PRIMARY KEY ("StatusId");


--
-- TOC entry 3854 (class 2606 OID 17362)
-- Name: MainTicket PK_MainTicket; Type: CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "PK_MainTicket" PRIMARY KEY ("TicketId");


--
-- TOC entry 3859 (class 2606 OID 17364)
-- Name: TicketAccessList PK_TicketAccessList; Type: CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "PK_TicketAccessList" PRIMARY KEY ("TicketAccessListId");


--
-- TOC entry 3862 (class 2606 OID 17366)
-- Name: TicketDateAndTimelines PK_TicketDateAndTimelines; Type: CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketDateAndTimelines"
    ADD CONSTRAINT "PK_TicketDateAndTimelines" PRIMARY KEY ("TicketDateAndTimelinesId");


--
-- TOC entry 3864 (class 2606 OID 17368)
-- Name: TicketFollowupDates PK_TicketFollowupDates; Type: CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketFollowupDates"
    ADD CONSTRAINT "PK_TicketFollowupDates" PRIMARY KEY ("TicketFollowupDatesId");


--
-- TOC entry 3866 (class 2606 OID 17370)
-- Name: TicketMetaData PK_TicketMetaData; Type: CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "PK_TicketMetaData" PRIMARY KEY ("TicketMetaDataId");


--
-- TOC entry 3872 (class 2606 OID 17372)
-- Name: TicketStatus PK_TicketStatus; Type: CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketStatus"
    ADD CONSTRAINT "PK_TicketStatus" PRIMARY KEY ("TicketStatusId");


--
-- TOC entry 3720 (class 1259 OID 17373)
-- Name: fki_FK_CallTransaction_ClientId; Type: INDEX; Schema: callTransactions; Owner: postgres
--

CREATE INDEX "fki_FK_CallTransaction_ClientId" ON "callTransactions"."CallTransaction" USING btree ("ClientId");


--
-- TOC entry 3721 (class 1259 OID 17374)
-- Name: fki_FK_CallTransaction_CompanyExecutive; Type: INDEX; Schema: callTransactions; Owner: postgres
--

CREATE INDEX "fki_FK_CallTransaction_CompanyExecutive" ON "callTransactions"."CallTransaction" USING btree ("CompanyExecutiveId");


--
-- TOC entry 3729 (class 1259 OID 17375)
-- Name: fki_FK_ClientLocation_Area; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_ClientLocation_Area" ON client."ClientLocation" USING btree ("Area");


--
-- TOC entry 3730 (class 1259 OID 17376)
-- Name: fki_FK_ClientLocation_City; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_ClientLocation_City" ON client."ClientLocation" USING btree ("City");


--
-- TOC entry 3731 (class 1259 OID 17377)
-- Name: fki_FK_ClientLocation_Country; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_ClientLocation_Country" ON client."ClientLocation" USING btree ("Country");


--
-- TOC entry 3732 (class 1259 OID 17378)
-- Name: fki_FK_ClientLocation_State; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_ClientLocation_State" ON client."ClientLocation" USING btree ("State");


--
-- TOC entry 3724 (class 1259 OID 17379)
-- Name: fki_FK_Client_Company; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_Client_Company" ON client."Client" USING btree ("CompanyId");


--
-- TOC entry 3725 (class 1259 OID 17380)
-- Name: fki_FK_CreatedBy; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_CreatedBy" ON client."Client" USING btree ("CreatedBy");


--
-- TOC entry 3726 (class 1259 OID 17381)
-- Name: fki_FK_LastEditBy; Type: INDEX; Schema: client; Owner: postgres
--

CREATE INDEX "fki_FK_LastEditBy" ON client."Client" USING btree ("LastEditBy");


--
-- TOC entry 3740 (class 1259 OID 17382)
-- Name: fki_FK_CompanyAddressDetails_City; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyAddressDetails_City" ON company."CompanyAddressDetails" USING btree ("CityID");


--
-- TOC entry 3741 (class 1259 OID 17383)
-- Name: fki_FK_CompanyAddressDetails_Country; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyAddressDetails_Country" ON company."CompanyAddressDetails" USING btree ("CountryID");


--
-- TOC entry 3742 (class 1259 OID 17384)
-- Name: fki_FK_CompanyAddressDetails_State; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyAddressDetails_State" ON company."CompanyAddressDetails" USING btree ("StateID");


--
-- TOC entry 3745 (class 1259 OID 17385)
-- Name: fki_FK_CompanyAddress_CompanyRegion; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyAddress_CompanyRegion" ON company."CompanyArea" USING btree ("CompanyRegionID");


--
-- TOC entry 3746 (class 1259 OID 17386)
-- Name: fki_FK_CompanyArea_Company; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyArea_Company" ON company."CompanyArea" USING btree ("CompanyID");


--
-- TOC entry 3749 (class 1259 OID 17387)
-- Name: fki_FK_CompanyBranch; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranch" ON company."CompanyBranch" USING btree ("CompanyID");


--
-- TOC entry 3756 (class 1259 OID 17388)
-- Name: fki_FK_CompanyBranchAddressDetails_City; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranchAddressDetails_City" ON company."CompanyBranchAddressDetails" USING btree ("CityID");


--
-- TOC entry 3757 (class 1259 OID 17389)
-- Name: fki_FK_CompanyBranchAddressDetails_Country; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranchAddressDetails_Country" ON company."CompanyBranchAddressDetails" USING btree ("CountryID");


--
-- TOC entry 3758 (class 1259 OID 17390)
-- Name: fki_FK_CompanyBranchAddressDetails_State; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranchAddressDetails_State" ON company."CompanyBranchAddressDetails" USING btree ("StateID");


--
-- TOC entry 3761 (class 1259 OID 17391)
-- Name: fki_FK_CompanyBranchType_Company; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranchType_Company" ON company."CompanyBranchType" USING btree ("CompanyId");


--
-- TOC entry 3750 (class 1259 OID 17392)
-- Name: fki_FK_CompanyBranch_CompanyArea; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranch_CompanyArea" ON company."CompanyBranch" USING btree ("CompanyAreaID");


--
-- TOC entry 3751 (class 1259 OID 17393)
-- Name: fki_FK_CompanyBranch_CompanyBranchAddressDetails; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranch_CompanyBranchAddressDetails" ON company."CompanyBranch" USING btree ("CompanyBranchAddressID");


--
-- TOC entry 3752 (class 1259 OID 17394)
-- Name: fki_FK_CompanyBranch_CompanyExecutive; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranch_CompanyExecutive" ON company."CompanyBranch" USING btree ("CompanyBranchPrimaryContactID");


--
-- TOC entry 3753 (class 1259 OID 17395)
-- Name: fki_FK_CompanyBranch_CompanyRegion; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyBranch_CompanyRegion" ON company."CompanyBranch" USING btree ("CompanyRegionID");


--
-- TOC entry 3770 (class 1259 OID 17396)
-- Name: fki_FK_CompanyExecutivePL_CompanyExecutive; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutivePL_CompanyExecutive" ON company."CompanyExecutivePL" USING btree ("executiveId");


--
-- TOC entry 3764 (class 1259 OID 17397)
-- Name: fki_FK_CompanyExecutive_City; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutive_City" ON company."CompanyExecutive" USING btree ("BaseCityID");


--
-- TOC entry 3765 (class 1259 OID 17398)
-- Name: fki_FK_CompanyExecutive_Company; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutive_Company" ON company."CompanyExecutive" USING btree ("CompanyID");


--
-- TOC entry 3766 (class 1259 OID 17399)
-- Name: fki_FK_CompanyExecutive_CompanyBranch; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutive_CompanyBranch" ON company."CompanyExecutive" USING btree ("CompanyBranchID");


--
-- TOC entry 3767 (class 1259 OID 17400)
-- Name: fki_FK_CompanyExecutive_Position; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutive_Position" ON company."CompanyExecutive" USING btree ("DeviceType");


--
-- TOC entry 3773 (class 1259 OID 17401)
-- Name: fki_FK_CompanyRegion_Company; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyRegion_Company" ON company."CompanyRegion" USING btree ("CompanyID");


--
-- TOC entry 3735 (class 1259 OID 17402)
-- Name: fki_FK_Company_City; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_Company_City" ON company."Company" USING btree ("CityId");


--
-- TOC entry 3736 (class 1259 OID 17403)
-- Name: fki_FK_Company_CompanyAddressDetails; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_Company_CompanyAddressDetails" ON company."Company" USING btree ("CompanyAddress");


--
-- TOC entry 3737 (class 1259 OID 17404)
-- Name: fki_FK_Company_OwnerContact; Type: INDEX; Schema: company; Owner: postgres
--

CREATE INDEX "fki_FK_Company_OwnerContact" ON company."Company" USING btree ("OwnerContactId");


--
-- TOC entry 3776 (class 1259 OID 17405)
-- Name: fki_FK_CompanyExecutiveGeoLocation_Company; Type: INDEX; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutiveGeoLocation_Company" ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" USING btree ("CompanyId");


--
-- TOC entry 3777 (class 1259 OID 17406)
-- Name: fki_FK_CompanyExecutiveGeoLocation_CompanyExecutive; Type: INDEX; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutiveGeoLocation_CompanyExecutive" ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" USING btree ("CompanyExecutiveId");


--
-- TOC entry 3778 (class 1259 OID 17407)
-- Name: fki_FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationA; Type: INDEX; Schema: companyExecutiveGeoLocation; Owner: postgres
--

CREATE INDEX "fki_FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationA" ON "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation" USING btree ("CompanyExecutiveGeoLocationAddressId");


--
-- TOC entry 3783 (class 1259 OID 17408)
-- Name: fki_FK_EnquiryAccessList_CRMAccessList; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryAccessList_CRMAccessList" ON enquiry."EnquiryAccessList" USING btree ("CompanyExecutiveId");


--
-- TOC entry 3784 (class 1259 OID 17409)
-- Name: fki_FK_EnquiryAccessList_Enquiry; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryAccessList_Enquiry" ON enquiry."EnquiryAccessList" USING btree ("EnquiryId");


--
-- TOC entry 3787 (class 1259 OID 17410)
-- Name: fki_FK_EnquiryClient_Client; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryClient_Client" ON enquiry."EnquiryClient" USING btree ("ClientId");


--
-- TOC entry 3788 (class 1259 OID 17411)
-- Name: fki_FK_EnquiryClient_MainEnquiry; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryClient_MainEnquiry" ON enquiry."EnquiryClient" USING btree ("EnquiryId");


--
-- TOC entry 3793 (class 1259 OID 17412)
-- Name: fki_FK_EnquiryLocation_Area; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryLocation_Area" ON enquiry."EnquiryLocation" USING btree ("AreaId");


--
-- TOC entry 3794 (class 1259 OID 17413)
-- Name: fki_FK_EnquiryLocation_City; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryLocation_City" ON enquiry."EnquiryLocation" USING btree ("CityId");


--
-- TOC entry 3795 (class 1259 OID 17414)
-- Name: fki_FK_EnquiryLocation_Country; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryLocation_Country" ON enquiry."EnquiryLocation" USING btree ("CountryId");


--
-- TOC entry 3796 (class 1259 OID 17415)
-- Name: fki_FK_EnquiryLocation_MainEnquiry; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryLocation_MainEnquiry" ON enquiry."EnquiryLocation" USING btree ("EnquiryId");


--
-- TOC entry 3797 (class 1259 OID 17416)
-- Name: fki_FK_EnquiryLocation_State; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryLocation_State" ON enquiry."EnquiryLocation" USING btree ("StateId");


--
-- TOC entry 3800 (class 1259 OID 17417)
-- Name: fki_FK_EnquiryProductList_MainEnquiry; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryProductList_MainEnquiry" ON enquiry."EnquiryProductList" USING btree ("EnquiryId");


--
-- TOC entry 3801 (class 1259 OID 17418)
-- Name: fki_FK_EnquiryProductList_Product; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryProductList_Product" ON enquiry."EnquiryProductList" USING btree ("ProductId");


--
-- TOC entry 3804 (class 1259 OID 17419)
-- Name: fki_FK_EnquiryType_Company; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_EnquiryType_Company" ON enquiry."EnquiryType" USING btree ("CompanyId");


--
-- TOC entry 3807 (class 1259 OID 17420)
-- Name: fki_FK_MainEnquiry_Company; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_MainEnquiry_Company" ON enquiry."MainEnquiry" USING btree ("CompanyId");


--
-- TOC entry 3808 (class 1259 OID 17421)
-- Name: fki_FK_MainEnquiry_CompanyExecutive(CreatedBy); Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_MainEnquiry_CompanyExecutive(CreatedBy)" ON enquiry."MainEnquiry" USING btree ("CreatedBy");


--
-- TOC entry 3809 (class 1259 OID 17422)
-- Name: fki_FK_MainEnquiry_CompanyExecutive(LastEditBy); Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_MainEnquiry_CompanyExecutive(LastEditBy)" ON enquiry."MainEnquiry" USING btree ("LastEditBy");


--
-- TOC entry 3810 (class 1259 OID 17423)
-- Name: fki_FK_MainEnquiry_EnquiryType; Type: INDEX; Schema: enquiry; Owner: postgres
--

CREATE INDEX "fki_FK_MainEnquiry_EnquiryType" ON enquiry."MainEnquiry" USING btree ("EnquiryType");


--
-- TOC entry 3819 (class 1259 OID 17424)
-- Name: fki_FK_BusinessAreaForCompany_BusinessCityForCompany; Type: INDEX; Schema: location; Owner: postgres
--

CREATE INDEX "fki_FK_BusinessAreaForCompany_BusinessCityForCompany" ON location."businessAreaForCompany" USING btree ("CityID");


--
-- TOC entry 3815 (class 1259 OID 17425)
-- Name: fki_businessCity_CityInfo; Type: INDEX; Schema: location; Owner: postgres
--

CREATE INDEX "fki_businessCity_CityInfo" ON location."businessCityForCompany" USING btree ("CityID");


--
-- TOC entry 3816 (class 1259 OID 17426)
-- Name: fki_businessCity_OwnerId; Type: INDEX; Schema: location; Owner: postgres
--

CREATE INDEX "fki_businessCity_OwnerId" ON location."businessCityForCompany" USING btree ("CompanyID");


--
-- TOC entry 3828 (class 1259 OID 17427)
-- Name: fki_FK_Notification_CRMAccessList; Type: INDEX; Schema: notification; Owner: postgres
--

CREATE INDEX "fki_FK_Notification_CRMAccessList" ON notification."Notification" USING btree ("CompanyExecutiveID");


--
-- TOC entry 3835 (class 1259 OID 17428)
-- Name: fki_FK_Positions_Company; Type: INDEX; Schema: position; Owner: postgres
--

CREATE INDEX "fki_FK_Positions_Company" ON "position"."Positions" USING btree ("CompanyId");


--
-- TOC entry 3836 (class 1259 OID 17429)
-- Name: fki_FK_Positions_CompanyExecutiveMasterList; Type: INDEX; Schema: position; Owner: postgres
--

CREATE INDEX "fki_FK_Positions_CompanyExecutiveMasterList" ON "position"."Positions" USING btree ("ExecutiveMasterId");


--
-- TOC entry 3843 (class 1259 OID 17430)
-- Name: fki_FK_product_company; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX "fki_FK_product_company" ON product."Product" USING btree ("companyId");


--
-- TOC entry 3852 (class 1259 OID 17431)
-- Name: fki_FK_Status_Company; Type: INDEX; Schema: status; Owner: postgres
--

CREATE INDEX "fki_FK_Status_Company" ON status."Status" USING btree ("CompanyId");


--
-- TOC entry 3855 (class 1259 OID 17432)
-- Name: fki_FK_MainTicket_CompanyExcutive(LastEditBy); Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_MainTicket_CompanyExcutive(LastEditBy)" ON ticket."MainTicket" USING btree ("LastEditBy");


--
-- TOC entry 3856 (class 1259 OID 17433)
-- Name: fki_FK_MainTicket_CompanyExecutive; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_MainTicket_CompanyExecutive" ON ticket."MainTicket" USING btree ("CreatedBy");


--
-- TOC entry 3857 (class 1259 OID 17434)
-- Name: fki_FK_MainTicket_MainEnquiry; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_MainTicket_MainEnquiry" ON ticket."MainTicket" USING btree ("EnquiryId");


--
-- TOC entry 3860 (class 1259 OID 17435)
-- Name: fki_FK_TicketAccessList_Owner; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_TicketAccessList_Owner" ON ticket."TicketAccessList" USING btree ("CompanyExecutiveId");


--
-- TOC entry 3867 (class 1259 OID 17436)
-- Name: fki_FK_TicketMetaData_EnquiryType; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_TicketMetaData_EnquiryType" ON ticket."TicketMetaData" USING btree ("TicketType");


--
-- TOC entry 3868 (class 1259 OID 17437)
-- Name: fki_FK_TicketMetaData_MainTicket; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_TicketMetaData_MainTicket" ON ticket."TicketMetaData" USING btree ("TicketId");


--
-- TOC entry 3869 (class 1259 OID 17438)
-- Name: fki_FK_TicketMetaData_Priority; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_TicketMetaData_Priority" ON ticket."TicketMetaData" USING btree ("TicketPriority");


--
-- TOC entry 3870 (class 1259 OID 17439)
-- Name: fki_FK_TicketMetaData_Product; Type: INDEX; Schema: ticket; Owner: postgres
--

CREATE INDEX "fki_FK_TicketMetaData_Product" ON ticket."TicketMetaData" USING btree ("ProductId");


--
-- TOC entry 3873 (class 2606 OID 17440)
-- Name: CallTransaction FK_CallTransaction_ClientId; Type: FK CONSTRAINT; Schema: callTransactions; Owner: postgres
--

ALTER TABLE ONLY "callTransactions"."CallTransaction"
    ADD CONSTRAINT "FK_CallTransaction_ClientId" FOREIGN KEY ("ClientId") REFERENCES client."Client"("ClientId");


--
-- TOC entry 3874 (class 2606 OID 17445)
-- Name: CallTransaction FK_CallTransaction_CompanyExecutive; Type: FK CONSTRAINT; Schema: callTransactions; Owner: postgres
--

ALTER TABLE ONLY "callTransactions"."CallTransaction"
    ADD CONSTRAINT "FK_CallTransaction_CompanyExecutive" FOREIGN KEY ("CompanyExecutiveId") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");


--
-- TOC entry 3878 (class 2606 OID 17450)
-- Name: ClientLocation FK_ClientLocation_Area; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_Area" FOREIGN KEY ("Area") REFERENCES location."businessAreaForCompany"("BusinessAreaForCompanyID");


--
-- TOC entry 3879 (class 2606 OID 17455)
-- Name: ClientLocation FK_ClientLocation_City; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_City" FOREIGN KEY ("City") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");


--
-- TOC entry 3880 (class 2606 OID 17460)
-- Name: ClientLocation FK_ClientLocation_Country; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_Country" FOREIGN KEY ("Country") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3881 (class 2606 OID 17465)
-- Name: ClientLocation FK_ClientLocation_State; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_ClientLocation_State" FOREIGN KEY ("State") REFERENCES location.stateinfo("StateID");


--
-- TOC entry 3875 (class 2606 OID 17470)
-- Name: Client FK_Client_Company; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "FK_Client_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3876 (class 2606 OID 17475)
-- Name: Client FK_CreatedBy; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3882 (class 2606 OID 17480)
-- Name: ClientLocation FK_CreatedBy; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3877 (class 2606 OID 17485)
-- Name: Client FK_LastEditBy; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."Client"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3883 (class 2606 OID 17490)
-- Name: ClientLocation FK_LastEditBy; Type: FK CONSTRAINT; Schema: client; Owner: postgres
--

ALTER TABLE ONLY client."ClientLocation"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3888 (class 2606 OID 17495)
-- Name: CompanyAddressDetails FK_CompanyAddressDetails_City; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "FK_CompanyAddressDetails_City" FOREIGN KEY ("CityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");


--
-- TOC entry 3889 (class 2606 OID 17500)
-- Name: CompanyAddressDetails FK_CompanyAddressDetails_Country; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "FK_CompanyAddressDetails_Country" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3890 (class 2606 OID 17505)
-- Name: CompanyAddressDetails FK_CompanyAddressDetails_State; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyAddressDetails"
    ADD CONSTRAINT "FK_CompanyAddressDetails_State" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");


--
-- TOC entry 3891 (class 2606 OID 17510)
-- Name: CompanyArea FK_CompanyAddress_CompanyRegion; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_CompanyAddress_CompanyRegion" FOREIGN KEY ("CompanyRegionID") REFERENCES company."CompanyRegion"("CompanyRegionID");


--
-- TOC entry 3892 (class 2606 OID 17515)
-- Name: CompanyArea FK_CompanyArea_Company; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_CompanyArea_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3902 (class 2606 OID 17520)
-- Name: CompanyBranchAddressDetails FK_CompanyBranchAddressDetails_City; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CompanyBranchAddressDetails_City" FOREIGN KEY ("CityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");


--
-- TOC entry 3903 (class 2606 OID 17525)
-- Name: CompanyBranchAddressDetails FK_CompanyBranchAddressDetails_Country; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CompanyBranchAddressDetails_Country" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3904 (class 2606 OID 17530)
-- Name: CompanyBranchAddressDetails FK_CompanyBranchAddressDetails_State; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CompanyBranchAddressDetails_State" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");


--
-- TOC entry 3907 (class 2606 OID 17535)
-- Name: CompanyBranchType FK_CompanyBranchType_Company; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "FK_CompanyBranchType_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3895 (class 2606 OID 17540)
-- Name: CompanyBranch FK_CompanyBranch_Company; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3896 (class 2606 OID 17545)
-- Name: CompanyBranch FK_CompanyBranch_CompanyArea; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyArea" FOREIGN KEY ("CompanyAreaID") REFERENCES company."CompanyArea"("CompanyAreaID");


--
-- TOC entry 3897 (class 2606 OID 17550)
-- Name: CompanyBranch FK_CompanyBranch_CompanyBranchAddressDetails; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyBranchAddressDetails" FOREIGN KEY ("CompanyBranchAddressID") REFERENCES company."CompanyBranchAddressDetails"("CompanyBranchAddressID");


--
-- TOC entry 3898 (class 2606 OID 17555)
-- Name: CompanyBranch FK_CompanyBranch_CompanyExecutive; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyExecutive" FOREIGN KEY ("CompanyBranchPrimaryContactID") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");


--
-- TOC entry 3899 (class 2606 OID 17560)
-- Name: CompanyBranch FK_CompanyBranch_CompanyRegion; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CompanyBranch_CompanyRegion" FOREIGN KEY ("CompanyRegionID") REFERENCES company."CompanyRegion"("CompanyRegionID");


--
-- TOC entry 3915 (class 2606 OID 17565)
-- Name: CompanyExecutivePL FK_CompanyExecutivePL_CompanyExecutive; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutivePL"
    ADD CONSTRAINT "FK_CompanyExecutivePL_CompanyExecutive" FOREIGN KEY ("executiveId") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");


--
-- TOC entry 3910 (class 2606 OID 17570)
-- Name: CompanyExecutive FK_CompanyExecutive_City; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CompanyExecutive_City" FOREIGN KEY ("BaseCityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");


--
-- TOC entry 3911 (class 2606 OID 17575)
-- Name: CompanyExecutive FK_CompanyExecutive_Company; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CompanyExecutive_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3912 (class 2606 OID 17580)
-- Name: CompanyExecutive FK_CompanyExecutive_CompanyBranch; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CompanyExecutive_CompanyBranch" FOREIGN KEY ("CompanyBranchID") REFERENCES company."CompanyBranch"("CompanyBranchID");


--
-- TOC entry 3916 (class 2606 OID 17585)
-- Name: CompanyRegion FK_CompanyRegion_Company; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "FK_CompanyRegion_Company" FOREIGN KEY ("CompanyID") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3884 (class 2606 OID 17590)
-- Name: Company FK_Company_CompanyAddressDetails; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_Company_CompanyAddressDetails" FOREIGN KEY ("CompanyAddress") REFERENCES company."CompanyAddressDetails"("CompanyAddressID");


--
-- TOC entry 3885 (class 2606 OID 17595)
-- Name: Company FK_Company_OwnerContact; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_Company_OwnerContact" FOREIGN KEY ("OwnerContactId") REFERENCES owner."OwnerContact"(id);


--
-- TOC entry 3886 (class 2606 OID 17600)
-- Name: Company FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3893 (class 2606 OID 17605)
-- Name: CompanyArea FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3900 (class 2606 OID 17610)
-- Name: CompanyBranch FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3905 (class 2606 OID 17615)
-- Name: CompanyBranchAddressDetails FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3908 (class 2606 OID 17620)
-- Name: CompanyBranchType FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3913 (class 2606 OID 17625)
-- Name: CompanyExecutive FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3917 (class 2606 OID 17630)
-- Name: CompanyRegion FK_CreatedBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3887 (class 2606 OID 17635)
-- Name: Company FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."Company"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3894 (class 2606 OID 17640)
-- Name: CompanyArea FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyArea"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3901 (class 2606 OID 17645)
-- Name: CompanyBranch FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranch"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3906 (class 2606 OID 17650)
-- Name: CompanyBranchAddressDetails FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchAddressDetails"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3909 (class 2606 OID 17655)
-- Name: CompanyBranchType FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyBranchType"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3914 (class 2606 OID 17660)
-- Name: CompanyExecutive FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyExecutive"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3918 (class 2606 OID 17665)
-- Name: CompanyRegion FK_LastEditBy; Type: FK CONSTRAINT; Schema: company; Owner: postgres
--

ALTER TABLE ONLY company."CompanyRegion"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3919 (class 2606 OID 17670)
-- Name: CompanyExecutiveGeoLocation FK_CompanyExecutiveGeoLocation_Company; Type: FK CONSTRAINT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "FK_CompanyExecutiveGeoLocation_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3920 (class 2606 OID 17675)
-- Name: CompanyExecutiveGeoLocation FK_CompanyExecutiveGeoLocation_CompanyExecutive; Type: FK CONSTRAINT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "FK_CompanyExecutiveGeoLocation_CompanyExecutive" FOREIGN KEY ("CompanyExecutiveId") REFERENCES company."CompanyExecutive"("CompanyExecutiveID");


--
-- TOC entry 3921 (class 2606 OID 17680)
-- Name: CompanyExecutiveGeoLocation FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationAddre; Type: FK CONSTRAINT; Schema: companyExecutiveGeoLocation; Owner: postgres
--

ALTER TABLE ONLY "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocation"
    ADD CONSTRAINT "FK_CompanyExecutiveGeoLocation_CompanyExecutiveGeoLocationAddre" FOREIGN KEY ("CompanyExecutiveGeoLocationAddressId") REFERENCES "companyExecutiveGeoLocation"."CompanyExecutiveGeoLocationAddress"("CompanyExecutiveGeoLocationAddressId");


--
-- TOC entry 3937 (class 2606 OID 17685)
-- Name: MainEnquiry FK_CreatedBy; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3934 (class 2606 OID 17690)
-- Name: EnquiryType FK_CreatedBy; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3922 (class 2606 OID 17695)
-- Name: EnquiryAccessList FK_EnquiryAccessList_CRMAccessList; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryAccessList"
    ADD CONSTRAINT "FK_EnquiryAccessList_CRMAccessList" FOREIGN KEY ("CompanyExecutiveId") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3923 (class 2606 OID 17700)
-- Name: EnquiryAccessList FK_EnquiryAccessList_Enquiry; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryAccessList"
    ADD CONSTRAINT "FK_EnquiryAccessList_Enquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");


--
-- TOC entry 3924 (class 2606 OID 17705)
-- Name: EnquiryClient FK_EnquiryClient_Client; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryClient"
    ADD CONSTRAINT "FK_EnquiryClient_Client" FOREIGN KEY ("ClientId") REFERENCES client."Client"("ClientId");


--
-- TOC entry 3925 (class 2606 OID 17710)
-- Name: EnquiryClient FK_EnquiryClient_MainEnquiry; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryClient"
    ADD CONSTRAINT "FK_EnquiryClient_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");


--
-- TOC entry 3926 (class 2606 OID 17715)
-- Name: EnquiryDateAndTimelines FK_EnquiryDateAndTimelines_MainEnquiry; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryDateAndTimelines"
    ADD CONSTRAINT "FK_EnquiryDateAndTimelines_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");


--
-- TOC entry 3927 (class 2606 OID 17720)
-- Name: EnquiryLocation FK_EnquiryLocation_Area; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_Area" FOREIGN KEY ("AreaId") REFERENCES location."businessAreaForCompany"("BusinessAreaForCompanyID");


--
-- TOC entry 3928 (class 2606 OID 17725)
-- Name: EnquiryLocation FK_EnquiryLocation_City; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_City" FOREIGN KEY ("CityId") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");


--
-- TOC entry 3929 (class 2606 OID 17730)
-- Name: EnquiryLocation FK_EnquiryLocation_Country; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_Country" FOREIGN KEY ("CountryId") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3930 (class 2606 OID 17735)
-- Name: EnquiryLocation FK_EnquiryLocation_MainEnquiry; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");


--
-- TOC entry 3931 (class 2606 OID 17740)
-- Name: EnquiryLocation FK_EnquiryLocation_State; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryLocation"
    ADD CONSTRAINT "FK_EnquiryLocation_State" FOREIGN KEY ("StateId") REFERENCES location.stateinfo("StateID");


--
-- TOC entry 3932 (class 2606 OID 17745)
-- Name: EnquiryProductList FK_EnquiryProductList_MainEnquiry; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryProductList"
    ADD CONSTRAINT "FK_EnquiryProductList_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");


--
-- TOC entry 3933 (class 2606 OID 17750)
-- Name: EnquiryProductList FK_EnquiryProductList_Product; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryProductList"
    ADD CONSTRAINT "FK_EnquiryProductList_Product" FOREIGN KEY ("ProductId") REFERENCES product."Product"(id);


--
-- TOC entry 3935 (class 2606 OID 17755)
-- Name: EnquiryType FK_EnquiryType_Company; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "FK_EnquiryType_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3938 (class 2606 OID 17760)
-- Name: MainEnquiry FK_LastEditBy; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3936 (class 2606 OID 17765)
-- Name: EnquiryType FK_LastEditBy; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."EnquiryType"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3939 (class 2606 OID 17770)
-- Name: MainEnquiry FK_MainEnquiry_Company; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_MainEnquiry_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3940 (class 2606 OID 17775)
-- Name: MainEnquiry FK_MainEnquiry_EnquiryType; Type: FK CONSTRAINT; Schema: enquiry; Owner: postgres
--

ALTER TABLE ONLY enquiry."MainEnquiry"
    ADD CONSTRAINT "FK_MainEnquiry_EnquiryType" FOREIGN KEY ("EnquiryType") REFERENCES enquiry."EnquiryType"("EnquiryTypeId");


--
-- TOC entry 3945 (class 2606 OID 17780)
-- Name: businessAreaForCompany FK_BusinessAreaForCompany_BusinessCityForCompany; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "FK_BusinessAreaForCompany_BusinessCityForCompany" FOREIGN KEY ("CityID") REFERENCES location."businessCityForCompany"("BusinessCityForCompanyID");


--
-- TOC entry 3941 (class 2606 OID 17785)
-- Name: areainfo area_CountryID; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.areainfo
    ADD CONSTRAINT "area_CountryID" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3942 (class 2606 OID 17790)
-- Name: areainfo area_StateID; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.areainfo
    ADD CONSTRAINT "area_StateID" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");


--
-- TOC entry 3946 (class 2606 OID 17795)
-- Name: businessAreaForCompany businessArea_AreaInfo; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "businessArea_AreaInfo" FOREIGN KEY ("AreaID") REFERENCES location.areainfo("AreaID");


--
-- TOC entry 3947 (class 2606 OID 17800)
-- Name: businessAreaForCompany businessArea_OwnerId; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessAreaForCompany"
    ADD CONSTRAINT "businessArea_OwnerId" FOREIGN KEY ("CompanyID") REFERENCES owner."OwnerContact"(id);


--
-- TOC entry 3943 (class 2606 OID 17805)
-- Name: businessCityForCompany businessCity_CityInfo; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessCityForCompany"
    ADD CONSTRAINT "businessCity_CityInfo" FOREIGN KEY ("CityID") REFERENCES location.cityinfo("CityID");


--
-- TOC entry 3944 (class 2606 OID 17810)
-- Name: businessCityForCompany businessCity_OwnerId; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location."businessCityForCompany"
    ADD CONSTRAINT "businessCity_OwnerId" FOREIGN KEY ("CompanyID") REFERENCES owner."OwnerContact"(id);


--
-- TOC entry 3948 (class 2606 OID 17815)
-- Name: cityinfo city_CountryID; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.cityinfo
    ADD CONSTRAINT "city_CountryID" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3949 (class 2606 OID 17820)
-- Name: cityinfo city_StateID; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.cityinfo
    ADD CONSTRAINT "city_StateID" FOREIGN KEY ("StateID") REFERENCES location.stateinfo("StateID");


--
-- TOC entry 3950 (class 2606 OID 17825)
-- Name: stateinfo state_CountryID; Type: FK CONSTRAINT; Schema: location; Owner: postgres
--

ALTER TABLE ONLY location.stateinfo
    ADD CONSTRAINT "state_CountryID" FOREIGN KEY ("CountryID") REFERENCES location.countryinfo("CountryID");


--
-- TOC entry 3951 (class 2606 OID 17830)
-- Name: Notification FK_Notification_CRMAccessList; Type: FK CONSTRAINT; Schema: notification; Owner: postgres
--

ALTER TABLE ONLY notification."Notification"
    ADD CONSTRAINT "FK_Notification_CRMAccessList" FOREIGN KEY ("CompanyExecutiveID") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3952 (class 2606 OID 17835)
-- Name: Positions FK_CreatedBy; Type: FK CONSTRAINT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3953 (class 2606 OID 17840)
-- Name: Positions FK_LastEditBy; Type: FK CONSTRAINT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3954 (class 2606 OID 17845)
-- Name: Positions FK_Positions_Company; Type: FK CONSTRAINT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_Positions_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3955 (class 2606 OID 17850)
-- Name: Positions FK_Positions_CompanyExecutiveMasterList; Type: FK CONSTRAINT; Schema: position; Owner: postgres
--

ALTER TABLE ONLY "position"."Positions"
    ADD CONSTRAINT "FK_Positions_CompanyExecutiveMasterList" FOREIGN KEY ("ExecutiveMasterId") REFERENCES "position"."CompanyExecutiveMasterList"(id);


--
-- TOC entry 3956 (class 2606 OID 17855)
-- Name: Product FK_CreatedBy; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3957 (class 2606 OID 17860)
-- Name: Product FK_LastEditBy; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3958 (class 2606 OID 17865)
-- Name: Product FK_product_company; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product."Product"
    ADD CONSTRAINT "FK_product_company" FOREIGN KEY ("companyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3959 (class 2606 OID 17870)
-- Name: Status FK_CreatedBy; Type: FK CONSTRAINT; Schema: status; Owner: postgres
--

ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3960 (class 2606 OID 17875)
-- Name: Status FK_LastEditBy; Type: FK CONSTRAINT; Schema: status; Owner: postgres
--

ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3961 (class 2606 OID 17880)
-- Name: Status FK_Status_Company; Type: FK CONSTRAINT; Schema: status; Owner: postgres
--

ALTER TABLE ONLY status."Status"
    ADD CONSTRAINT "FK_Status_Company" FOREIGN KEY ("CompanyId") REFERENCES company."Company"("CompanyId");


--
-- TOC entry 3965 (class 2606 OID 17885)
-- Name: TicketAccessList FK_CompanyExecutiveId; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "FK_CompanyExecutiveId" FOREIGN KEY ("CompanyExecutiveId") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3962 (class 2606 OID 17890)
-- Name: MainTicket FK_CreatedBy; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "FK_CreatedBy" FOREIGN KEY ("CreatedBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3963 (class 2606 OID 17895)
-- Name: MainTicket FK_LastEditBy; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "FK_LastEditBy" FOREIGN KEY ("LastEditBy") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3964 (class 2606 OID 17900)
-- Name: MainTicket FK_MainTicket_MainEnquiry; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."MainTicket"
    ADD CONSTRAINT "FK_MainTicket_MainEnquiry" FOREIGN KEY ("EnquiryId") REFERENCES enquiry."MainEnquiry"("EnquiryId");


--
-- TOC entry 3966 (class 2606 OID 17905)
-- Name: TicketAccessList FK_TicketAccessList_CRMAccessList; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "FK_TicketAccessList_CRMAccessList" FOREIGN KEY ("CompanyExecutiveId") REFERENCES public."CRMAccessList"("CorrespondingId");


--
-- TOC entry 3967 (class 2606 OID 17910)
-- Name: TicketAccessList FK_TicketAccessList_MainTicket; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketAccessList"
    ADD CONSTRAINT "FK_TicketAccessList_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");


--
-- TOC entry 3968 (class 2606 OID 17915)
-- Name: TicketDateAndTimelines FK_TicketDateAndTimelines_MainTicket; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketDateAndTimelines"
    ADD CONSTRAINT "FK_TicketDateAndTimelines_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");


--
-- TOC entry 3969 (class 2606 OID 17920)
-- Name: TicketFollowupDates FK_TicketFollowupDates_MainTicket; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketFollowupDates"
    ADD CONSTRAINT "FK_TicketFollowupDates_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");


--
-- TOC entry 3970 (class 2606 OID 17925)
-- Name: TicketMetaData FK_TicketMetaData_EnquiryType; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_EnquiryType" FOREIGN KEY ("TicketType") REFERENCES enquiry."EnquiryType"("EnquiryTypeId");


--
-- TOC entry 3971 (class 2606 OID 17930)
-- Name: TicketMetaData FK_TicketMetaData_MainTicket; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");


--
-- TOC entry 3972 (class 2606 OID 17935)
-- Name: TicketMetaData FK_TicketMetaData_Priority; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_Priority" FOREIGN KEY ("TicketPriority") REFERENCES priority."Priority"("PriorityId");


--
-- TOC entry 3973 (class 2606 OID 17940)
-- Name: TicketMetaData FK_TicketMetaData_Product; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketMetaData"
    ADD CONSTRAINT "FK_TicketMetaData_Product" FOREIGN KEY ("ProductId") REFERENCES product."Product"(id);


--
-- TOC entry 3974 (class 2606 OID 17945)
-- Name: TicketStatus FK_TicketStatus_MainTicket; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketStatus"
    ADD CONSTRAINT "FK_TicketStatus_MainTicket" FOREIGN KEY ("TicketId") REFERENCES ticket."MainTicket"("TicketId");


--
-- TOC entry 3975 (class 2606 OID 17950)
-- Name: TicketStatus FK_TicketStatus_Status; Type: FK CONSTRAINT; Schema: ticket; Owner: postgres
--

ALTER TABLE ONLY ticket."TicketStatus"
    ADD CONSTRAINT "FK_TicketStatus_Status" FOREIGN KEY ("StatusId") REFERENCES status."Status"("StatusId");


-- Completed on 2021-08-02 19:02:56 IST

--
-- PostgreSQL database dump complete
--

