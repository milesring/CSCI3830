<%@ page errorPage="/WEB-INF/errorPage.jsp"
	import="java.util.Iterator,csci3830_Assignment2.*, java.util.LinkedList" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% LinkedList<Question> questionList; %>
<% questionList = (LinkedList<Question>)session.getAttribute("questionList"); %>
<% 
	if(questionList == null){
 		questionList = new LinkedList<>();
 	}

	if(request.getParameter("userAnswer")=="" && request.getParameter("userQuestion")!=null){
		Question temp = new Question();
		temp.setQuestion(request.getParameter("userQuestion"));
		questionList.add(temp);
	}
	else if(request.getParameter("userAnswer")!=null && request.getParameter("userQuestion")!=null){
		Question temp = new Question();
		temp.setQuestion(request.getParameter("userQuestion"));
		temp.setAnswer(request.getParameter("userAnswer"));
		questionList.add(temp);
	}
	else if(request.getParameter("userAnswer")==null && request.getParameter("userQuestion")!=null){
		Question temp = new Question();
		temp.setQuestion(request.getParameter("userQuestion"));
		questionList.add(temp);
	}	
	else if(request.getParameter("userAnswer")!= null && request.getParameter("answerLoc") != null){
		questionList.get(Integer.parseInt(request.getParameter("answerLoc"))).setAnswer(request.getParameter("userAnswer"));
		
	}
	else if(request.getParameter("userQuestion")!=null) {
 		Question temp = new Question();
 		temp.setQuestion(request.getParameter("userQuestion")); 
 		questionList.add(temp); 
 	}  
 %>

<%
	if(questionList != null){
%>
<%
		for(int i=0;i<questionList.size();++i){
%>
						Question <%= i+1 %>:
						</br>
						<%= questionList.get(i).getQuestion() %>
						</br>
						</br>
<%						
						if(questionList.get(i).getAnswer() != null){
%>
						Answer:
						</br>
						<%= questionList.get(i).getAnswer() %>
</br></br><%						
						} else {
%>						</br>
						Enter answer:
						</br>
						
						
						<% session.setAttribute("questionList", questionList); %>
						<form action="questions.jsp" method="POST">
						<input type="text" name="userAnswer" length="70"/>
						<input type="text" name="answerLoc" hidden value="<%=i%>">
						<input type="submit" value="Submit"/>
						</form>
						</br>
					<% if(i==questionList.size()-1) {%>
						New question:
						<form action="questions.jsp" method="POST">
						<input type="text" name="userQuestion" length="70"/>
						<input type="submit" value="Submit"/>
						</form>
					<%} %>
						
<% 						
						}
		}
%>
</br>
</br>
<% if(questionList.getLast().getQuestion()!=null && questionList.getLast().getAnswer()!=null){ %>
			Enter new question (leave answer blank if no answer):
			</br>
			<form action="questions.jsp" method="POST">
			Question
			<input type="text" name="userQuestion" length="70"/>
			Answer
			<input type="text" name="userAnswer" length="70"/>
			<input type="submit" value="Submit"/>
			</form>
<%		}
	}
%>
</body>
</html>