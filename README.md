# JSP: Jakarta Server Pages (JSP; formerly JavaServer Pages) 

1. JSP is extension of servlet technology but jsp provides more functionality than the servlet.

JSp supports multiple language with .jsp extension.

1. html
2. css
3. javascript
4. java

<%= %> this tag is used to write java code in the jsp page.

----------------------------------------------------------------------------------------------------------------

# Disadvantage of servlet:

1. static content are generated by java from inside servlet.
Designing servlet is difficult.

2. For every request in servlet you have to write the service method. which is very tidious process.
3. whenever modification is made in static content servlet needs to recompile and redeploy.

----------------------------------------------------------------------------------------------------------------

# JSP standard tag library(JSTL)

Important tags of jsp

----------------------------------------------------------------------------------------------------------------
# 1. Declaration Tag:

<%! 
	It consist of variables and methods.
%>
----------------------------------------------------------------------------------------------------------------
# 2. Scriptlet tag

<% 
	Java Source Code
%> 

1. this tag is used to do operation on the declaration tags element.
2. it is used as execution of service method in Servlet.
3. "out" object is get in jsp we don't need to create it explicitely. It is object of JSPWriter same as PrintWriter.

----------------------------------------------------------------------------------------------------------------

# 3. Expression tag

<%= 
	statement
%>

1. This is used to print the data which is declared and process in declaration tag without any "out" object.

Ex:

<%!
	int a = 50
%>

we can print a using the Scriptlet tag as below:

<% out.println(a); %>

we can print a using the Expression tag as below:

<%= a %>

----------------------------------------------------------------------------------------------------------------
# JSP Directives:

(Directives tag in JSP)

This tags provide direction to deal with jsp pages.

Three types of directive tags are as follow:

# 1. page directive : 

1. this is used to apply changes on all page.
2. This is used to import packages for the page.

Ex:

<%@page import="java.util.Random, java.io.* %>

----------------------------------------------------------------------------------------------------------------

# 2. include directive

<%@include %>

1. This is used to include another file content.

Ex:

<%@include file="header.jsp" %>

----------------------------------------------------------------------------------------------------------------

# 3. taglib directive


1. It is used when we want to use other tag directory in our jsp page.
2. such as jstl jsp standard tag library or custom library created by user.
3. Here you need to provide prefix and uri.
4. prefix means if we want to use taglib tag it can be used by prefix name if prefix="c" then you can use like this as below:


To use this library need to add jstl labraries in the /web_inf/lib/ folder

1. jakarta.servlet.jsp.jstl-2.0.0.jar
2. jakarta.servlet.jsp.jstl-api-2.0.0.jar

This two jars need to be added for Tomcat 10.0.x all versions.

Ex:

<c:set
	var ="name" value="Prem Bansod"
>
</c:set>

1. This will set name "Prem Bansod" to the variable "name".
2. To print the name use "c:out" tag.
Ex:

<c:out value="${name}"></c:out>

3. if tag in the jstl is used to test the conditions:

EX:

<c:if test="${3>2}">This is True</c:if>


"This is True" is printed as this condition is true if condition is not true nothing is printed.
----------------------------------------------------------------------------------------------------------------
# Error Page in JSP:

To handle Exception in jsp we can use page directory two tags:
1. isErrorPage = "true" this is set in the pathofErrorPage 
2. errorPage="pathofErrorPage" this is set in the jsp page where error occured.

Ex:

First.jsp has error occured then add this page directory with errorPage in this as follow:

<%@page errorPage="error.jsp" %>

error.jsp contain is display whenever error occured in First.jsp to show the exception use "exception" variable which is already present.

Ex:

error.jsp

<%@page isErrorPage="true"%>
<%= exception %>


----------------------------------------------------------------------------------------------------------------
To handle 404 error page provide this details in the web.xml file

Ex:

for 404 error

<error-page>
	<error-code>404</error-code>
	<location>/error.jsp</location>
</error-page>

Above implementation shows how to handle error code with the response pages.
----------------------------------------------------------------------------------------------------------------
# Custom tag in JSP i.e. User define tag

Steps
----------------------------------------------------------------------------------------------------------------
# 1. create TagHandler class

we can implement Tag interface or extends TagSupport class to create TagHandler class.

there are different methods in the TagHandler class but for now use 

public int doStartTag() throws JSPException{
	
	//create out object of the JSPWriter using the pageContext.getout() function
	
	JspWriter out = pageContext.getout();
	out.println("<h1>This is First Custom tag</h1>")
	
	
	return SKIP_BODY; //this specify which part of the page need to skip
}

----------------------------------------------------------------------------------------------------------------

# 2. Create Tag Lib Descriptor (TLD) file:

This store the information about the custom tag.

we need to provide this file in the WEB_INF folder. 

EX:

File name is mylib.tld ".tld" is the extension of this file.


<tag>
	<name>mytag</name> //This is name of the Tag
	<tag-class>PackageName.ClassName</tag-class> // Package name is pkg and class name is Abc then this is like <tag-class>pkg.Abc</tag-class>
</tag>


Ex:

<?xml version="1.0" encoding="UTF-8"?>
<taglib xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="https://jakarta.ee/xml/ns/jakartaee" xmlns:web="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee https://jakarta.ee/xml/ns/jakartaee/web-app_5_0.xsd http://xmlns.jcp.org/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd" version="2.1">
<tlib-version>1.0</tlib-version>
<tag>
	<name>mytag</name>
	<tag-class>tags.TagsHandler</tag-class>
</tag>
</taglib>

or


<?xml version="1.0" encoding="UTF-8"?>
<taglib>
<tlib-version>1.0</tlib-version>
<jsp-version>5.0</jsp-version>
<tag>
	<name>mytag</name>
	<tag-class>tags.TagsHandler</tag-class>
</tag>
</taglib>


----------------------------------------------------------------------------------------------------------------

# Custom Tag with Attribute

we need to use <attribute> tag in the .tld file

Ex:

<tag>
	<name>print</name>
	<tag-class>tags.Print</tag-class>
	<attribute>
		<name>number</name>
		<required>true</required> //This Value must be required
	</atttribute>
</tag>

inside .jsp File write like

<t:print number="23"></t:print>

the above tag calls the settor method in the java class 

----------------------------------------------------------------------------------------------------------------
# JSP Implicit Objects:

To Print Anything on browser in servlet we need to create object of PrintWriter
Ex:
PrintWriter out = response.getWriter();

but now in jsp this out object is directly accesible and it is provided implicitly

This object is of JspWriter Class.

JspWriter out = pageContext.getOut();

but in the JSP we can use this object without declaration in scriptlet tag

Ex:

<%

out.println("Hello Implicit Object")

%>

Similarly we have different Objects such as

out of the JspWriter
request of the HttpServletRequest
response of the HttpServletResponse
config of the ServletConfig
application of the ServletContext
session of the HttpSession
page of the Object Class : It is object of the currunt jsp page. as jsp is converted into servlet.
pageContext of the PageContext : It is used in scoping page scope, request scope, session scope, application scope.
exception of Throwable Class: This is used to print the exception.


----------------------------------------------------------------------------------------------------------------
