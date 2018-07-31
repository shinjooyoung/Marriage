package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.*;
import mybatis.session.ListRepository;


public class CommandReceivedList implements Command 
{
	private String next;
	ListRepository repo = new ListRepository();
	public CommandReceivedList( String _next ){
		System.out.println("커멘드");
		next = _next;
	}
	

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
//		try{
//			request.setCharacterEncoding("euc-kr");
//			String contentType = request.getContentType();
/*			
			String userId = request.getParameter("userId");
			
			List<HeartAndMember> list = repo.selectHeartByOut(userId);
			HttpSession session = request.getSession();
			
			session.setAttribute("sendList",list);
			session.setAttribute("receiveList",list);
			next="myPageForm.jsp";
		*/	   
//			List<HeartAndMember> list = 
//	        HttpSession session = request.getSession();
//	        Purchase purchase =new Purchase();
	         
//	        HeartAndMember ham=new HeartAndMember();
//	        ham.gethNO(request.getAttribute("h_no"));
//	        ham.gethSendid(request.getAttribute("h_sendid"));
//	        ham.gethStat(request.getParameter("h_stat"));
//			String mId=request.getParameter("mId");
//			String mName=request.getParameter("mName");
//			String mBirth=request.getParameter("mBirth");
//			String mHstat=request.getParameter("mHstat");
//		    List <Member> mList =repo.selectCommentByPk(id, pass);
//		    request.setAttribute("param", mList);
			//session 써가지고 id값 얻어오기 reque(userId)
			//repo.selectHeartById(id);
	         
//	        purchase.setpId((String)session.getAttribute("userId"));
	        
//			String userId = request.getParameter("userId");

//		}catch(Exception ex ){
//			throw new CommandException("CommandList.java < 목록보기시 > " + ex.toString() ); 
//		}
		
		
			
		
		try{
			HttpSession session = request.getSession();
			 System.out.println((String)session.getAttribute("userId"));

			List <HeartAndMember> OutList = repo.selectHeartByOut((String)session.getAttribute("userId"));
			List <HeartAndMember> InList = repo.selectHeartByIn((String)session.getAttribute("userId"));

			 System.out.println("하이");
			 request.setAttribute("paramOut", OutList );
			 request.setAttribute("paramIn", InList );


		   
		}catch( Exception ex ){
			throw new CommandException("CommandList < 목록보기시 > " +ex.toString()); 
		}
		
		return next;
	}
	
		
}
