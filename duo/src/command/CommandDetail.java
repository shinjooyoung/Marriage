package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mybatis.model.*;
import mybatis.model.HeartAndMember;
import mybatis.session.ListRepository;
import mybatis.session.MemberRepository;
 
public class CommandDetail implements Command {

	private String next;
	MemberRepository repo = new MemberRepository();
	public CommandDetail( String _next ){
		next = _next;
}
	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException{
			 
		try{
			HttpSession session = request.getSession();
			 System.out.println((String)session.getAttribute("userId")+ "command");

			Member detail = repo.selectMemberByPk(request.getParameter("detail"));
//			 
//			 
//			 request.setAttribute("selectDetail", Detail );
			
			 JSONObject jsonObject = new JSONObject();
		        
//	           JSONArray personArray = new JSONArray();
	        
	           JSONObject personInfo = new JSONObject();
	       
	              personInfo = new JSONObject();
	              personInfo.put("id",detail.getmId());
	              personInfo.put("name", detail.getmName());
	              personInfo.put("age",detail.getmBirth());
	              personInfo.put("edu",detail.getmEdu());
	              personInfo.put("img",detail.getmPic());
	              personInfo.put("job", detail.getmJob());
	              personInfo.put("remarry",detail.getmRemarry());
	              personInfo.put("sal", detail.getmSal());
	              personInfo.put("tel", detail.getmTel());
	         
	           jsonObject.put("member",personInfo);

	           String jsonInfo = jsonObject.toJSONString();

	          response.setCharacterEncoding("UTF-8"); 
	         response.getWriter().print(jsonInfo);
			
			
			 this.next=null;
		}catch( Exception ex ){
			throw new CommandException("CommandList < 목록보기시 > " +ex.toString()); 
		}
		
		return next;
	}
	
		
}