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

 

public class ListControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;   
	private String  error = "error.jsp";

    public ListControl() {
    	super();       
   		initCommand();
        // TODO Auto-generated constructor stub
    }
    private void initCommand(){
    	System.out.println("리스트컨트롤");
		commandMap = new HashMap();

		commandMap.put("showHeart",	new CommandList("myPageForm.jsp"));
		commandMap.put("showPay",	new CommandShowPay("myPayForm.jsp"));

		commandMap.put("sure",	new CommandSure());
		commandMap.put("cancel",new CommandCancel());
		commandMap.put("mypage", new CommandNull("myPageForm.jsp"));
		commandMap.put("detail", new CommandDetail("detailForm.jsp"));
    	
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
		
		System.out.println( request.getParameter("cmd")+cmdKey + " cmdKey");
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

		if(nextPage!=null) {
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher("/"+nextPage);
		reqDp.forward( request, response );
		}
	}


}
