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

public class CommandCheck implements Command 
{

	MemberRepository repo = new MemberRepository();


	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		String result=null;
		try{
			request.setCharacterEncoding("euc-kr");
			
			Member member =repo.selectMemberByPk(request.getParameter("u_id"));
			
			if(member==null)
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
