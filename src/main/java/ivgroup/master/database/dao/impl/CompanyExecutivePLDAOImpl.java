package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CompanyExecutivePLDAO;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForAllYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForMonth;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLInsert;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLSelect;

@Service
public class CompanyExecutivePLDAOImpl implements CompanyExecutivePLDAO
{
	@Override
	public Boolean addCompanyExecutivePL(CompanyExecutivePLInsert cpli) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT company.\"fn_insertCompanyExecutivePL\"(?, ?, ?);");
		stmt.setLong(1, cpli.getExecutiveId());
		stmt.setInt(2, cpli.getPLrate());
		stmt.setTimestamp(3, cpli.getTimeOfEntry());
		Boolean rsMain=false;
		ResultSet rs=stmt.executeQuery();
		c.commit();
		if(rs.next())
		{
			rsMain=rs.getBoolean("fn_insertCompanyExecutivePL");
		}
		rs.close();
		stmt.close();
		c.close();
		return rsMain;
	}

	@Override
	public List<CompanyExecutivePLSelect> selectCompanyExecutivePLByExecutiveId(Long companyExecutiveId)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  company.\"fn_selectCompanyExecutivePLByExecutiveId\"(?)  ORDER BY \"dateOfEntry\";");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutivePLSelect> lcpl=new ArrayList<CompanyExecutivePLSelect>();
		while(rs.next())
		{
			lcpl.add(new CompanyExecutivePLSelect(
					rs.getLong("id"),
					rs.getLong("executiveId"),
					rs.getInt("PLRate"),
					rs.getTimestamp("dateOfEntry")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcpl;
	}

	@Override
	public List<CompanyExecutivePLSelect> selectCompanyExecutivePLByExecutiveIdAndDate(Long companyExecutiveId,Date date) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  company.\"fn_selectCompanyExecutivePLByExecutiveIdAndDate\"(?,?) ORDER BY \"dateOfEntry\";");
		stmt.setLong(1, companyExecutiveId);
		stmt.setDate(2, date);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutivePLSelect> lcpl=new ArrayList<CompanyExecutivePLSelect>();
		while(rs.next())
		{
			lcpl.add(new CompanyExecutivePLSelect(
					rs.getLong("id"),
					rs.getLong("executiveId"),
					rs.getInt("PLRate"),
					rs.getTimestamp("dateOfEntry")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcpl;
	}

	@Override
	public List<CompanyExecutivePLSelect> selectCompanyExecutivePLByExecutiveIdBetweenDate(Long companyExecutiveId,Date dateStart, Date dateEnd) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM  company.\"fn_selectCompanyExecutivePLByExecutiveIdBetweenDate\"(?,?,?)ORDER BY \"dateOfEntry\";");
		stmt.setLong(1, companyExecutiveId);
		stmt.setDate(2, dateStart);
		stmt.setDate(3, dateEnd);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutivePLSelect> lcpl=new ArrayList<CompanyExecutivePLSelect>();
		while(rs.next())
		{
			lcpl.add(new CompanyExecutivePLSelect(
					rs.getLong("id"),
					rs.getLong("executiveId"),
					rs.getInt("PLRate"),
					rs.getTimestamp("dateOfEntry")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcpl;
	}

	@Override
	public List<CompanyExecutivePLGeneralSelectForMonth> selectCompanyExecutiveMonthReport(Long companyExecutive,Integer monthNumber, Integer yearNumber) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutivePLByMonth\"(?,?,?);");
		stmt.setLong(1, companyExecutive);
		stmt.setInt(2, monthNumber);
		stmt.setInt(3, yearNumber);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutivePLGeneralSelectForMonth> lcpl=new ArrayList<CompanyExecutivePLGeneralSelectForMonth>();
		while(rs.next())
		{
			lcpl.add(new CompanyExecutivePLGeneralSelectForMonth(
					rs.getDouble("PLRate"),
					rs.getDate("Date")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcpl;
	}

	@Override
	public List<CompanyExecutivePLGeneralSelectForYear> selectCompanyExecutiveYearReport(Long companyExecutive,Integer yearNumber) throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_selectCompanyExecutivePLByYear\"(?,?);");
		stmt.setLong(1, companyExecutive);
		stmt.setInt(2, yearNumber);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutivePLGeneralSelectForYear> lcpl=new ArrayList<CompanyExecutivePLGeneralSelectForYear>();
		while(rs.next())
		{
			lcpl.add(new CompanyExecutivePLGeneralSelectForYear(
					rs.getDouble("PLRate"),
					(int)rs.getDouble("Month")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcpl;
	}

	@Override
	public List<CompanyExecutivePLGeneralSelectForAllYear> selectCompanyExecutiveAllYearsReport(Long companyExecutive)throws SQLException, ClassNotFoundException 
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM \"company\".\"fn_selectCompanyExecutivePLByAllYears\"(?);");
		stmt.setLong(1, companyExecutive);
		ResultSet rs=stmt.executeQuery();
		List<CompanyExecutivePLGeneralSelectForAllYear> lcpl=new ArrayList<CompanyExecutivePLGeneralSelectForAllYear>();
		while(rs.next())
		{
			lcpl.add(new CompanyExecutivePLGeneralSelectForAllYear(
					rs.getDouble("PLRate"),
					(int)rs.getDouble("Year")
					));
		}
		rs.close();
		stmt.close();
		c.close();
		return lcpl;
	}

	@Override
	public Integer selectCompanyExecutiveLastPLEntry(Long companyExecutiveId)throws SQLException, ClassNotFoundException
	{
		Connection c=ConnectionProvider.getConnection();
		CallableStatement stmt=c.prepareCall("SELECT * FROM company.\"fn_selectCompanyExecutivePLLastPLEntry\"(?);");
		stmt.setLong(1, companyExecutiveId);
		ResultSet rs=stmt.executeQuery();
		Integer plRate=null;
		if(rs.next())
		{
			plRate=rs.getInt("PLRate");
		}
		rs.close();
		stmt.close();
		c.close();
		return plRate;
	}

}
