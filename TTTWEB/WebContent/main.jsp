<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="com.tictactoe.jsp.TTTConsoleNonOO2P" %>
<jsp:useBean id="gameBean" scope="session" class="com.tictactoe.jsp.TTTConsoleNonOO2P" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<c:set var="ROWS" value="<%= TTTConsoleNonOO2P.ROWS %>" scope="request" />
<c:set var="COLS" value="<%= TTTConsoleNonOO2P.COLS %>" scope="request" />
<c:set var="TABLESIZE" value="${sessionScope.tableSize}"  scope="request" />

<body>
        <h1>Tic Tac Toe</h1>
        
        <form action="GameServlet" method="post">
        	Current Player : 
        	 <c:choose>
                        <c:when test="${currentPlayer == '1'}">
                        	<b>CROSS</b>
                        	<input type="hidden" name="currentPlayer" value="${currentPlayer}"  />
                        </c:when>
                        <c:when test="${currentPlayer == '2'}">
                        	<b>NOUGHT</b>
                        	<input type="hidden" name="currentPlayer" value="${currentPlayer}"  />
                        </c:when>
                        <c:otherwise>
                        	<b>CROSS</b>
                        	<input type="hidden" name="currentPlayer" value="1"  />
                        </c:otherwise>
            </c:choose>
            
            <c:choose>
                        <c:when test="${status == '1'}">
                        	<br /><br />
                        	Game Status : <b>DRAW</b>
                        </c:when>
                        <c:when test="${status == '2'}">
                        	<br /><br />
                        	Game Status : <b>CROSS WON</b>
                        </c:when>
                        <c:when test="${status == '3'}">
                        	<br /><br />
                        	Game Status : <b>NOUGHT WON</b>
                        </c:when>
            </c:choose>

        	<br /><br />
        	Input : <input type="number" name="row" placeholder="row" /> <input type="number" name="col" placeholder="col" /> <input type="submit" value="Submit" />
        	<br /><br />
            <input type="hidden" name="tableSize" value="${TABLESIZE }"  />
        </form>
        
        <table border="1">
               <c:forEach var = "i" begin = "1" end = "${TABLESIZE}"> 
            <tr>
                   <c:forEach var = "j" begin = "1" end = "${TABLESIZE}"> 
                <td>
                      <c:choose>
                        <c:when test="${gameBean.pboard[i-1][j-1] == '1'}">  
                            <img src="img/state_x.png" alt="X"/> <%-- <c:out value="${gameBean.pboard[i-1][j-1]}"></c:out> --%>
                          </c:when>
                        <c:when test="${gameBean.pboard[i-1][j-1] == '2'}">   
                             <img src="img/state_o.png" alt="O"/> <%-- <c:out value="${gameBean.pboard[i-1][j-1]}"></c:out> --%>
                          </c:when>
                        <c:otherwise> 
                                <img src="img/state_null.png" alt="null"/> <%-- <c:out value="${gameBean.pboard[i-1][j-1]}"></c:out> --%>
                        </c:otherwise>
                    </c:choose>  
                </td>    
                  </c:forEach>  
            </tr>
              </c:forEach>  
        </table>
    </body>
</html>