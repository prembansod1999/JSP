package tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class Print extends TagSupport{
	private int number;
	private String name;
	public void setNumber(int number) {
		this.number = number;
	}
	
	@Override
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		
		try {
			JspWriter out = pageContext.getOut();
			out.println(this.name+"<br>");
			for(int i =1;i<11;i++) {
				out.println(i*this.number+"<br>");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return super.doStartTag();
	}

	public void setName(String name) {
		this.name = name;
	}
}
