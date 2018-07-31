package command;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.model.Member;
import mybatis.session.MemberRepository;
import mybatis.session.SearchRepository;

public class CommandSearch3 implements Command 
{
	private String next;
	SearchRepository sepo = new SearchRepository();
	
	public CommandSearch3() {
		// TODO Auto-generated constructor stub
		next=null;
	}
	public CommandSearch3( String _next ){
	next = _next;
}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			
			System.out.println("commandSearch3");
			String age = request.getParameter("age");	
			String sal = request.getParameter("sal");		
			String edu = request.getParameter("edu");
			String job = request.getParameter("job");
			String gender =request.getParameter("gender");
			//System.out.println(age.trim().length() + "length");
			if(age.trim().length()==0) {System.out.println("null"); age=null;}
			
				next=null;
				List<Member> list = sepo.searchMember(gender,age,sal,edu,job);
				
				JSONObject jsonObject = new JSONObject();
			     
		        JSONArray personArray = new JSONArray();
		     
		        JSONObject personInfo = new JSONObject();
		        
		        for(int i=0;i<list.size();i++)
		        {
		        	personInfo = new JSONObject();
		        	personInfo.put("id",list.get(i).getmId());
		        	personInfo.put("name", list.get(i).getmName());
		        	personInfo.put("age",list.get(i).getmBirth());
		        	personInfo.put("edu",list.get(i).getmEdu());
		        	personInfo.put("job", list.get(i).getmJob());
		        	personInfo.put("pic", list.get(i).getmPic());
		        	personInfo.put("remarry",list.get(i).getmRemarry());
		        	personInfo.put("sal", list.get(i).getmSal());
		        	personArray.add(personInfo);	
		        	System.out.println(list.get(i).getmPic()+"pic");
		        System.out.println("name :" +list.get(i).getmName());
		        }
		        jsonObject.put("member",personArray);

		        String jsonInfo = jsonObject.toJSONString();

		    	response.setCharacterEncoding("UTF-8"); 
				response.getWriter().print(jsonInfo);
		
//request.setAttribute("list", @@@@@ );
		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}
		
		return next;
	}
}
