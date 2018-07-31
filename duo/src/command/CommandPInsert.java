package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Purchase;
import mybatis.session.PurchaseRepository;

public class CommandPInsert implements Command {
	
	private String next;
	PurchaseRepository repo = new PurchaseRepository();

	public CommandPInsert( String _next ){
	next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			
			HttpSession session = request.getSession();
			
			Purchase purchase =new Purchase();
			

			purchase.setpId((String)session.getAttribute("userId"));
			purchase.setpRank(request.getParameter("p_rank"));
			 
			
			int result = repo.checkPurchase((String)session.getAttribute("userId"));
			
			if(result==0) repo.insertPurchase(purchase);//신규가입자일경우
			
		   
		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}
		
		return next;
	}
}