package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Member;
import mybatis.session.MemberRepository;

public class CommandLogin implements Command 
{
	private String next;
		MemberRepository repo = new MemberRepository();
	public CommandLogin( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			
			String mId=request.getParameter("mId");
			String mPass=request.getParameter("mPass");
			Member member=repo.selectCommentByPk(mId,mPass);
		   			
		   if(member!=null)
		   {
			   HttpSession session = request.getSession();
			   session.setAttribute("userId",member.getmId());
			   next ="main.jsp";
		   }
		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}
		
		return next;
	}
}
