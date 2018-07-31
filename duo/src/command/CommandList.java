package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.*;
import mybatis.session.*;


public class CommandList implements Command 
{
	private String next;
	ListRepository repo = new ListRepository();
	MemberRepository Mrepo=new MemberRepository();
	public CommandList( String _next ){
		next = _next;
	}
	

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{

		try{
			
			request.setCharacterEncoding("euc-kr");
			HttpSession session = request.getSession();
			String user =(String)session.getAttribute("userId");
			
			Member member=Mrepo.selectMemberByPk(user);
			
			request.setAttribute("left_box", member);
		 
		

			List <HeartAndMember> OutList = repo.selectHeartByOut((String)session.getAttribute("userId"));
			List <HeartAndMember> InList = repo.selectHeartByIn((String)session.getAttribute("userId"));

		for(int i =0; i<OutList.size();i++)
		{
			System.out.println("commandList Name : "+OutList.get(i).getmName());}
			request.setAttribute("paramOut", OutList );
			 request.setAttribute("paramIn", InList );	


		   
		}catch( Exception ex ){
			throw new CommandException("CommandList < 목록보기시 > " +ex.toString()); 
		}
		
		return next;
	}
	
		
}
