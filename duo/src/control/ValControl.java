package control;

import java.io.IOException;
import java.util.HashMap;
import static java.lang.System.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import command.*;



public class ValControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;   
	private String  error = "error.jsp";

    public ValControl() {
    	super();       
   		initCommand();
        // TODO Auto-generated constructor stub
    }
    private void initCommand(){
		commandMap = new HashMap();
		
		commandMap.put("id_check", new CommandCheck());
		commandMap.put("check_modify", new CommandMCheck());
		commandMap.put("purchase_check", new CommandPCheck());
		
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}
		
		Command cmd = null;
		String result=null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}
			result = cmd.execute( request, response  );	

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			System.out.println("오류 : " + e.getMessage() );
		}
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().print(result);
	}


}
