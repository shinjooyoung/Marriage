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

public class CommandSure implements Command 
{
	private String next;
	MemberRepository repo = new MemberRepository();
	SureRepository Srepo=new SureRepository();
	
	public CommandSure( ){
		next=null;
	}	
	public CommandSure( String _next ){
		next = _next;
	}
	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			request.setCharacterEncoding("euc-kr");
			HttpSession session = request.getSession();
			String user =(String)session.getAttribute("userId");
			
			Member member=repo.selectMemberByPk(user);//왼쪽박스
					
			int Selho=Integer.parseInt(request.getParameter("selhno"));
			
			String hStat =request.getParameter("hStat");
			String mStat = null;
			String send =request.getParameter("send");
			System.out.println("eerr");
			if(hStat.equals("수락"))
			{
				mStat="수락";
				int up=Srepo.updateHnum(user,send);
				System.out.println(up+"up");
			}
			else
			{
				mStat="대기중";
				Srepo.updateHnum(send,null);
			}
			
			int re =Srepo.updateHeart(Selho, hStat);// 업데이트 하트상태 
			re =re + Srepo.updateMember(user,send,mStat); //업데이트 유저 
			
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
