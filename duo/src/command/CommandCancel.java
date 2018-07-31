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
import mybatis.session.*;

public class CommandCancel implements Command 
{
	private String next;
	MemberRepository repo = new MemberRepository();
	SureRepository Srepo=new SureRepository();
	
	public CommandCancel( ){
		next=null;
	}	
	public CommandCancel( String _next ){
		next = _next;
	}
	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			request.setCharacterEncoding("euc-kr");
			HttpSession session = request.getSession();
			String user =(String)session.getAttribute("userId");
			
			Member member=repo.selectMemberByPk(user);//왼쪽박스
					
			int Selho=Integer.parseInt(request.getParameter("selhno"));
			int re = Srepo.deleteHeart(Selho);
						
			String result =null;
			if(re>0)
			{
				result ="OK";
			}
		
			request.setAttribute("left_box", member);
				 
			response.setCharacterEncoding("UTF-8"); 
			response.getWriter().print(result);

		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}

		return next;
	}
	

}
