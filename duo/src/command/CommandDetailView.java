package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Member;
import mybatis.session.MemberRepository;


public class CommandDetailView implements Command 
{
	private String next;
	MemberRepository repo = new MemberRepository();
	public CommandDetailView( String _next ){
		next = _next;
	}
	

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{

		
		try{
			String mId= request.getParameter("m_id");
			
			System.out.println(mId);

			Member member = repo.selectMemberByPk(mId);
			 System.out.println(member.getmPic()+"commanddetail");
			 request.setAttribute("paramDetail", member );


		   
		}catch( Exception ex ){
			throw new CommandException("CommandList < 목록보기시 > " +ex.toString()); 
		}
		
		return next;
	}
	
		
}
