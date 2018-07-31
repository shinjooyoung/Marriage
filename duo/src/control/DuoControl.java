package control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.*;



public class DuoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;   
	private String  error = "error.jsp";

    public DuoControl() {
    	super();       
   		initCommand();
        // TODO Auto-generated constructor stub
    }
    private void initCommand(){
		commandMap = new HashMap();
		commandMap.put("main-page",	new CommandNull("main.jsp"));
		commandMap.put("login",	new CommandNull("login.jsp"));
		commandMap.put("confirm_login",new CommandLogin("login.jsp"));
		commandMap.put("logout",new CommandLogout("main.jsp"));
		commandMap.put("join",new CommandNull("join.jsp"));
		commandMap.put("confirm_join", new CommandJoin("main.jsp"));
		
		
		commandMap.put("searchMan", new CommandNull("man.jsp"));
		commandMap.put("searchWoman", new CommandNull("woman.jsp"));
		
		commandMap.put("purchase", new CommandNull("purchase.jsp"));
		
		commandMap.put("mypage", new CommandMyMain("myPageForm.jsp"));
	}
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}
		
		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get( cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response  );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher("/"+nextPage);
		reqDp.forward( request, response );
		
	}


}
