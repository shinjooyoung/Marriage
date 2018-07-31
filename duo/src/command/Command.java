package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import board.model.BoardException;

public interface Command {
	public String execute( HttpServletRequest request, HttpServletResponse response  ) throws CommandException;
}
