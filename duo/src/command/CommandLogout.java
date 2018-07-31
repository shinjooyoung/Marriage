package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Member;
import mybatis.session.MemberRepository;

public class CommandLogout implements Command 
{
	private String next;
		MemberRepository repo = new MemberRepository();
	public CommandLogout( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			
		    
		    HttpSession session = request.getSession();
		 
		   //session.removeAttribute("userId");
	
		    session.invalidate();//세션종료 
		
		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}
		
		return next;
	}
}
