package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.model.Member;
import mybatis.model.Purchase;
import mybatis.session.ListRepository;
import mybatis.session.MemberRepository;

public class CommandShowPay implements Command {

	private String next;
	ListRepository repo = new ListRepository();
	MemberRepository Mrepo = new MemberRepository();
	public CommandShowPay( String _next ){
	next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			
			HttpSession session = request.getSession();
			 List <Purchase> pList = repo.showPay((String)session.getAttribute("userId"));
			 
			 request.setCharacterEncoding("euc-kr");
			
				String user =(String)session.getAttribute("userId");
				
				Member member=Mrepo.selectMemberByPk(user);
				
				request.setAttribute("left_box", member);
			  
			 
			 request.setAttribute("param", pList );	
			
		   
		}catch( Exception ex ){
			throw new CommandException("CommandShowpay < 목록보기시 > " +ex.toString()); 
		}
		
		return next;
	}
}