package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.PositionDAOImpl;
import ivgroup.master.database.dto.position.PositionCompanyExecutiveMasterListInsert;
import ivgroup.master.database.dto.position.PositionInsert;
import ivgroup.master.database.dto.position.PositionSelect;
import ivgroup.master.database.dto.position.PositionUpdate;

@Service
public class PositionBusinessLogic
{

	@Autowired
	PositionDAOImpl pdi;

	public ResponseEntity<List<PositionSelect>> selectPosition(Long ownerId)
	{
		List<PositionSelect> lps = new ArrayList<PositionSelect>();
		if (ownerId == null)
		{
			return new ResponseEntity<List<PositionSelect>>(lps, HttpStatus.BAD_REQUEST);
		}
		try
		{
			lps = pdi.selectPosition(ownerId);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<List<PositionSelect>>(lps, HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<List<PositionSelect>>(lps, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (lps.isEmpty())
		{
			return new ResponseEntity<List<PositionSelect>>(lps, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<PositionSelect>>(lps, HttpStatus.OK);
	}

	public ResponseEntity<Void> addPosition(Long companyExecutiveId, PositionInsert pi)
	{
		if (pi == null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		if (pi.getPositionPriority() > 25)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}

		Long executivePriority = null;
		try
		{
			executivePriority = pdi.getExecutivePriority(companyExecutiveId);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (executivePriority < pi.getPositionPriority())
		{
			Boolean rs = false;
			try
			{
				rs = pdi.addPosition(pi);
			} catch (ClassNotFoundException e)
			{
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException e)
			{
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (!rs)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
		} else
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	private ResponseEntity<Void> updatePositionName(Connection c, Long positionId, String positionName)
	{
		Boolean rs = false;
		try
		{
			rs = pdi.updatePositionName(c, positionId, positionName);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updatePositionPriority(Connection c, Long positionId, Integer positionPriority)
	{

		Boolean rs = false;
		if (positionPriority > 25)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try
		{
			rs = pdi.updatePositionPriority(c, positionId, positionPriority);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updatePositionCompanyId(Connection c, Long positionId, Long companyId)
	{
		Boolean rs = false;
		try
		{
			rs = pdi.updatePositionCompanyId(c, positionId, companyId);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updatePositionExecutiveMasterId(Connection c, Long positionId, PositionUpdate pu)
	{
		Long idForAccess = null;
		Boolean rs = false;
		try
		{
			idForAccess = pdi.addCompanyExecutiveMasterList(
					new PositionCompanyExecutiveMasterListInsert(
							pu.getCompany(), pu.getCompanyBranch(), pu.getCompanyExecutive(), pu.getClient(),
							pu.getProduct(), pu.getLocation(), pu.getEnquiry(), pu.getTicket(), pu.getPosition()
					)
			);
			rs = pdi.updatePositionExecutiveMasterId(c, positionId, idForAccess);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updatePositionIsActive(Connection c, Long positionId, Boolean isActive)
	{
		Boolean rs = false;
		try
		{
			rs = pdi.updatePositionIsActive(c, positionId, isActive);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updatePositionLastEditBy(Connection c, Long positionId, Long lastEditBy)
	{
		Boolean rs = false;
		try
		{
			rs = pdi.updatePositionLastEditBy(c, positionId, lastEditBy);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updatePositionLastEditOn(Connection c, Long positionId, Timestamp lastEditOn)
	{
		Boolean rs = false;
		try
		{
			rs = pdi.updatePositionLastEditOn(c, positionId, lastEditOn);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> updateFields(Long companyExecutiveId, Long positionId, PositionUpdate pu)
	{
		if (pu == null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long executivePriority = null;
		try
		{
			executivePriority = pdi.getExecutivePriority(companyExecutiveId);
		} catch (ClassNotFoundException e)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

			Connection c = null;
			try
			{
				c = ConnectionProvider.getConnection();
			} catch (ClassNotFoundException e)
			{
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException e)
			{

				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			ResponseEntity<Void> rs = null;
			Boolean wentIn = false;
			if (pu.getPositionName() != null)
			{
				rs = updatePositionName(c, positionId, pu.getPositionName());
				wentIn = true;
			}
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			
			if (pu.getPositionPriority() != null)
			{
				if (executivePriority<pu.getPositionPriority() )
				{
				rs = updatePositionPriority(c, positionId, pu.getPositionPriority());
				wentIn = true;
				}
			} 
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			if (pu.getCompanyId() != null)
			{
				rs = updatePositionCompanyId(c, positionId, pu.getCompanyId());
				wentIn = true;
			}
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			if (pu.getCompany() != null || pu.getCompanyBranch() != null || pu.getCompanyExecutive() != null
					|| pu.getEnquiry() != null || pu.getTicket() != null || pu.getPosition() != null
					|| pu.getClient() != null || pu.getProduct() != null || pu.getLocation() != null)
			{
				rs = updatePositionExecutiveMasterId(c, positionId, pu);
				wentIn = true;
			}
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			if (pu.getIsActive() != null)
			{
				rs = updatePositionIsActive(c, positionId, pu.getIsActive());
				wentIn = true;
			}
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			if (pu.getLastEditBy() != null)
			{
				rs = updatePositionLastEditBy(c, positionId, pu.getLastEditBy());
				wentIn = true;
			}
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			if (pu.getLastEditOn() != null)
			{
				rs = updatePositionLastEditOn(c, positionId, pu.getLastEditOn());
				wentIn = true;
			}
			if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn)
			{
				wentIn = false;
				return rs;
			}
			rs = null;
			try
			{
				c.close();
			} catch (SQLException e)
			{
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> deletePosition(Long positionId)
	{
		Integer check = null;
		try
		{
			check = pdi.checkPositionDeleteStatus(positionId);
		} catch (ClassNotFoundException e1)
		{
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e1)
		{
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (check == 0)
		{
			Boolean rs = false;
			try
			{
				rs = pdi.deletePosition(positionId);
			} catch (ClassNotFoundException e)
			{
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException e)
			{
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (!rs)
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
		} else
		{
			return new ResponseEntity<Void>(HttpStatus.FAILED_DEPENDENCY);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
