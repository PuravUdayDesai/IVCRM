package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.PriorityDAOImpl;
import ivgroup.master.database.dto.priority.PrioritySelect;

@Service
public class PriorityBusinessLogic 
{
	@Autowired
	PriorityDAOImpl pdi;
	
	Logger logger =LoggerFactory.getLogger(PriorityBusinessLogic.class);
	
	public ResponseEntity<List<PrioritySelect>> selectPriority()
	{
		List<PrioritySelect> lps=new ArrayList<PrioritySelect>();
		
		try {
			lps=pdi.selectPriority();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<PrioritySelect>>(lps,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<PrioritySelect>>(lps,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(lps.isEmpty())
		{
			return new ResponseEntity<List<PrioritySelect>>(lps,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<PrioritySelect>>(lps,HttpStatus.OK);
	}
}
