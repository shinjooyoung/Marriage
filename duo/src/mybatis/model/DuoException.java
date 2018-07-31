package mybatis.model;

public class DuoException extends Exception
{
  public DuoException(){
  		super();
  	}
  	
  public DuoException(String error){
  		super( error );
  	}
 		
}