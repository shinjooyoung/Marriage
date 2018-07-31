package command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mybatis.model.*;
import mybatis.session.MemberRepository;

public class CommandMyMain implements Command 
{
	private String next;
	MemberRepository repo = new MemberRepository();
	public CommandMyMain( ){
		next=null;
	}	
	public CommandMyMain( String _next ){
		next = _next;
	}
	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			request.setCharacterEncoding("euc-kr");
			HttpSession session = request.getSession();
			String user =(String)session.getAttribute("userId");
			
			Member member=repo.selectMemberByPk(user);
			System.out.println(member.getmId()+"commandmymanin");
			
			request.setAttribute("left_box", member);
		 

		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}

		return next;
	}
	

}
