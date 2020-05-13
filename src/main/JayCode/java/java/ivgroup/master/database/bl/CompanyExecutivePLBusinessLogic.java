package ivgroup.master.database.bl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.CompanyExecutivePLDAOImpl;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForAllYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForMonth;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLInsert;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLSelect;

@Service
public class CompanyExecutivePLBusinessLogic 
{
	@Autowired
	CompanyExecutivePLDAOImpl cpldl;

	public ResponseEntity<Void> addCompanyExecutivePL(CompanyExecutivePLInsert cpli)
	{
		if(cpli==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=cpldl.addCompanyExecutivePL(cpli);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	public ResponseEntity<List<CompanyExecutivePLSelect>> selectCompanyExecutivePLByExecutiveId(Long companyExecutiveId) 
	{
		List<CompanyExecutivePLSelect> lcpl=new ArrayList<CompanyExecutivePLSelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.BAD_REQUEST);
		}
		try {
			lcpl=cpldl.selectCompanyExecutivePLByExecutiveId(companyExecutiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcpl.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutivePLSelect>> selectCompanyExecutivePLByExecutiveIdAndDate(Long companyExecutiveId,Date date)  
	{
		List<CompanyExecutivePLSelect> lcpl=new ArrayList<CompanyExecutivePLSelect>();
		if(companyExecutiveId==null||date==null)
		{
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.BAD_REQUEST);
		}
		try {
			lcpl=cpldl.selectCompanyExecutivePLByExecutiveIdAndDate(companyExecutiveId, date);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcpl.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutivePLSelect>> selectCompanyExecutivePLByExecutiveIdBetweenDate(Long companyExecutiveId,Date dateStart, Date dateEnd)  
	{
		List<CompanyExecutivePLSelect> lcpl=new ArrayList<CompanyExecutivePLSelect>();
		if(companyExecutiveId==null||dateStart==null||dateEnd==null)
		{
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.BAD_REQUEST);
		}
		try {
			lcpl=cpldl.selectCompanyExecutivePLByExecutiveIdBetweenDate(companyExecutiveId, dateStart, dateEnd);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcpl.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutivePLSelect>>(lcpl,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>> selectCompanyExecutiveMonthReport(Long companyExecutive,Integer monthNumber, Integer yearNumber)  
	{
		List<CompanyExecutivePLGeneralSelectForMonth> lcpl=new ArrayList<CompanyExecutivePLGeneralSelectForMonth>();
		if(companyExecutive==null||monthNumber==null||yearNumber==null)
		{
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>>(lcpl,HttpStatus.BAD_REQUEST);
		}
		try {
			lcpl=cpldl.selectCompanyExecutiveMonthReport(companyExecutive, monthNumber, yearNumber);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>>(lcpl,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>>(lcpl,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcpl.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>>(lcpl,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>>(lcpl,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>> selectCompanyExecutiveYearReport(Long companyExecutive,Integer yearNumber)  
	{
		List<CompanyExecutivePLGeneralSelectForYear> lcpl=new ArrayList<CompanyExecutivePLGeneralSelectForYear>();
		if(companyExecutive==null||yearNumber==null)
		{
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>>(lcpl,HttpStatus.BAD_REQUEST);
		}
		try {
			lcpl=cpldl.selectCompanyExecutiveYearReport(companyExecutive, yearNumber);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>>(lcpl,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>>(lcpl,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcpl.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>>(lcpl,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>>(lcpl,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>> selectCompanyExecutiveAllYearsReport(Long companyExecutive)  
	{
		List<CompanyExecutivePLGeneralSelectForAllYear> lcpl=new ArrayList<CompanyExecutivePLGeneralSelectForAllYear>();
		if(companyExecutive==null)
		{
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>>(lcpl,HttpStatus.BAD_REQUEST);
		}
		try {
			lcpl=cpldl.selectCompanyExecutiveAllYearsReport(companyExecutive);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>>(lcpl,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>>(lcpl,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcpl.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>>(lcpl,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>>(lcpl,HttpStatus.OK);
	}

}
