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



public class ModifyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;   
	private String  error = "error.jsp";

    public ModifyControl() {
    	super();       
   		initCommand();
        // TODO Auto-generated constructor stub
    }
    private void initCommand(){
		commandMap = new HashMap();
		commandMap.put("mypage_modify",new CommandMyMain("myUpdateForm.jsp"));
		commandMap.put("mypage_modify2",new CommandMyMain("myUpdateForm2.jsp"));
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

		if(nextPage !=null) {
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher("/"+nextPage);
		reqDp.forward( request, response );
		}
	}


}
