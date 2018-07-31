package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.model.Member;
import mybatis.session.MemberRepository;

public class CommandMCheck implements Command {

	
	MemberRepository repo = new MemberRepository();


	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		String result=null;
		try{
			request.setCharacterEncoding("euc-kr");
			
			System.out.println(request.getParameter("u_id"));
			
			String mId=request.getParameter("u_id");
			String mPass=request.getParameter("u_pw");
			
			Member member =repo.selectCommentByPk(mId,mPass);
			
			if(member!=null)
			{
				result="OK";
			}
			else
			{
				result="NO";
			}

		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}

		return result;
	}
	

}

