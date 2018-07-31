package command;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.session.SearchRepository;


public class CommandSendHeart implements Command 
{
	private String next=null; 
		
	SearchRepository repo = new SearchRepository();
	public CommandSendHeart(){
	
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			HttpSession session = request.getSession();
			String sId= (String) session.getAttribute("userId");
			String rId= request.getParameter("rId");
			System.out.println("보내는사람"+sId);
			System.out.println("받는사람"+rId);

			 repo.SendHeart(sId, rId);
			 System.out.println("하트보내기성공했나");
			

			
		}catch( Exception ex ){
			throw new CommandException("CommandSend < 하트보내기시보기시 > " +ex.toString()); 
		}
		
		return next;
	}
}
