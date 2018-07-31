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

public class CommandSearch2 implements Command 
{
	private String next;
	SearchRepository sepo = new SearchRepository();
	public CommandSearch2( String _next ){
	next = _next;
}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			
			System.out.println("commandSearch2");
			String age = request.getParameter("age");	
			String sal = request.getParameter("sal");		
			String edu = request.getParameter("edu");
			String job = request.getParameter("job");
			String gender =request.getParameter("gender");
			

		
			
							
				System.out.println("~~"+gender+":"+age+":" + sal +":" + edu +":" + job +":");
				
				request.setAttribute("age", age);
				request.setAttribute("sal",sal);
				request.setAttribute("edu", edu);
				request.setAttribute("job", job);
				request.setAttribute("gender", gender);
				
			
				List<Member> list = sepo.searchMember(gender,age,sal,edu,job);
				
				
				for (int i = 0; i < list.size(); i++) {
					System.out.println("첫번째 리턴값!!");
					System.out.println(list.get(i).getmName());
					System.out.println(list.get(i).getmBirth());
					System.out.println(list.get(i).getmEdu());
					System.out.println(list.get(i).getmJob());
					System.out.println(list.get(i).getmRemarry());
				}
				request.setAttribute("list", list);

			
			
			
		
// 디비에서 검색을 해서
//request.setAttribute("list", @@@@@ );
		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}
		
		return next;
	}
}
