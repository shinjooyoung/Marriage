package control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.CommandDetailView;
import command.CommandException;
import command.CommandJoin;
import command.CommandLogin;
import command.CommandLogout;
import command.CommandNull;
import command.CommandSearch;
import command.CommandSearch2;
import command.CommandSearch3;
import command.CommandSendHeart;



public class SearchCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap commandMap;    
	private String  error = "error.jsp";
    public SearchCon() {
        super();
        initCommand();
      
    }
    private void initCommand(){
	
    	commandMap = new HashMap();
    	commandMap.put("search", new CommandSearch());
    	commandMap.put("search2",new CommandSearch2("SearchAll2.jsp"));
    	commandMap.put("search3",new CommandSearch3());
    	commandMap.put("detailpk",new CommandDetailView("detail_m.jsp"));
    	commandMap.put("sendHeart",new CommandSendHeart());
    	
    	
	}    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		Command cmd = null;
		System.out.println("cmdkey "+cmdKey);
		cmd = (Command)commandMap.get( cmdKey);
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
			e.printStackTrace();
		}
		if(nextPage!=null) {
		RequestDispatcher reqDp = getServletContext().getRequestDispatcher("/"+nextPage);
		reqDp.forward( request, response );
		}
	
	}
}
