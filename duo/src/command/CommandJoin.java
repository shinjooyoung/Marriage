package command;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mybatis.model.*;
import mybatis.session.MemberRepository;

public class CommandJoin implements Command 
{
	private String next;
	MemberRepository repo = new MemberRepository();
	public CommandJoin( String _next ){
		next = _next;
	}

	public String execute( HttpServletRequest request , HttpServletResponse response  ) throws CommandException {
		try{
			request.setCharacterEncoding("euc-kr");

			String contentType = request.getContentType();
			String uploadedItem=null;
			
			if (contentType != null
					&& contentType.toLowerCase().startsWith("multipart/")) {
			
				uploadedItem = saveUploadFile(request);
		
			} 		

			String birth = request.getParameter("u_birth1")+request.getParameter("u_birth2")+request.getParameter("u_birth3");
			String phone = request.getParameter("u_mtel1")+request.getParameter("u_mtel2")+request.getParameter("u_mtel3");
			Member member=new Member();
			member.setmId(request.getParameter("u_id"));
			member.setmPass(request.getParameter("u_pwd"));
			member.setmName(request.getParameter("u_name"));
			member.setmBirth(birth);
			member.setmTel(phone);
			member.setmPic(uploadedItem);
			member.setmGender(request.getParameter("u_sex"));
			member.setmRemarry(request.getParameter("u_married"));
			member.setmEdu(request.getParameter("u_edu"));
			member.setmJob(request.getParameter("u_work"));
			member.setmSal(request.getParameter("u_dwell"));


			int result=repo.insertMember(member);	

			if(result==0)
			{
				System.out.println("회원가입 실패");
			}
			else
			{
				System.out.println("회원가입성공");
			}

		}catch( Exception ex ){
			throw new CommandException(ex.toString()); 
		}

		return next;
	}
	private String saveUploadFile(HttpServletRequest req) throws IOException,
	ServletException {
		Part descPart = req.getPart("u_id");
		String description = readParameterValue(descPart);
		Part filePart = req.getPart("u_pic");
		String fileName = getFileName(filePart);
		String realPath = FileSaveHelper.save("C:\\javaclass\\web\\duo\\WebContent\\upload\\",
				filePart.getInputStream());
		
//
//		PdsItem addRequest = new PdsItem();
//		addRequest.setFileName(fileName);
////		addRequest.setFileSize(filePart.getSize());
//		addRequest.setDescription(description);
//		addRequest.setRealPath(realPath);
		return realPath;
	}

	private String getFileName(Part part) throws UnsupportedEncodingException {
		for (String cd : part.getHeader("Content-Disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	private String readParameterValue(Part part) throws IOException {
		InputStreamReader reader = new InputStreamReader(part.getInputStream(),"euc-kr");
		char[] data = new char[512];
		int len = -1;
		StringBuilder builder = new StringBuilder();
		while ((len = reader.read(data)) != -1) {
			builder.append(data, 0, len);
		}
		return builder.toString();
	}

}
