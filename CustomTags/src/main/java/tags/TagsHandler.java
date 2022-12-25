package tags;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class TagsHandler extends TagSupport{
@Override
public int doStartTag() throws JspException {
	// TODO Auto-generated method stub
	try {
		JspWriter out = pageContext.getOut();
		out.println("<h1>Hello To Custom Tags</h1>");
		out.println("Welcome Here");
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return super.doStartTag();
}
}
