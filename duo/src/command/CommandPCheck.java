package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Purchase;
import mybatis.session.PurchaseRepository;

public class CommandPCheck implements Command{

	PurchaseRepository repo = new PurchaseRepository();


	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
			String result = null;
			HttpSession session = request.getSession();
		try{
			System.out.println("하이");

			
			request.setCharacterEncoding("euc-kr");
			System.out.println(request.getParameter("u_id"));
			System.out.println(request.getParameter((String)session.getAttribute("userId")));
			
			int re = repo.checkPurchase((String)session.getAttribute("userId"));
			
			if(re>=1)
			{
				result="OK";
			}
			else if(re==0)
			{
				result="NO";
			}

		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}

		return result;
	}
	

}
