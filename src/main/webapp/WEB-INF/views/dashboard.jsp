<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Files</title>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-12">


    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <p>Welcome : ${pageContext.request.userPrincipal.name}
            | <a href="<c:url value="/j_spring_security_logout" />" > Logout</a></p>
    </c:if>

    <h3>Files</h3>
	<table class="table table-striped">
	<th>name</th>
	<th>size</th>
	<th>upload</th>
	<c:forEach items="${files}" var="file">
	<tr>
		<td>${file.name}</td>
		<td>${file.size}</td>
		<td>${file.uploadDate}</td>
	</tr>
	</c:forEach>
	</table>

    <form method="POST" value="file">
        <input type="file">
    </form>

</div>
</div>
</div>
</body>
</html>