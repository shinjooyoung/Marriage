package command;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sun.org.apache.xalan.internal.xsltc.runtime.Parameter;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Member;
import mybatis.session.MemberRepository;
import mybatis.session.SearchRepository;

public class CommandSearch implements Command 
{
	private String next=null; 
		
	SearchRepository sepo = new SearchRepository();
	public CommandSearch(){
	
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			HttpSession session = request.getSession();
			String gender = request.getParameter("gender");
			String age = request.getParameter("age");
			String sal = request.getParameter("sal");
			String edu = request.getParameter("edu");
			String job = request.getParameter("job");
			
			
			
			System.out.println(gender+":"+age+":" + sal +":" + edu +":" + job +":");
			
			
		/*	System.out.println(temp);*/
			
			List<Member> list = sepo.searchMember(gender,age,sal,edu,job);
			
			String nu = null;
			
			if(!(age.equals("")) && !(sal.equals(""))&&!(edu.equals(""))&&!(job.equals(""))) {

			System.out.println("들어오나??");
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
			}else {
				List<Member> list2 = sepo.searchMember(gender,age,sal,edu,job);
				request.setAttribute("list", list2);
				
				
				/*ArrayList<Member> mList = new ArrayList<>();
				for (int i = 0; i < list.size(); i++) {
					list.add(list.get(i).getmId());
					String mName = list.get(i).getmName();
					String mBirth = list.get(i).getmBirth();
					String mEdu = list.get(i).getmEdu();
					String mJob = list.get(i).getmJob();
					String mRemarry = list.get(i).getmRemarry();
					}*/
					
				
				
			}			
		}catch( Exception ex ){
			System.out.println("-------------------------------");
			ex.printStackTrace();
			throw new CommandException(ex.toString()); 
		}
		
		return next;
	}
}
