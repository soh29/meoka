<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
</head>
<body>
<form role="form" method="post">
	<input name="bno" type="hidden" value="${boardVO.bno }">
	<input name="groupno" type="hidden" value="${boardVO.groupno }">
	<input name="grouporder" type="hidden" value="${boardVO.grouporder }">
	<input name="depth" type="hidden" value="${boardVO.depth }">
	
	제목<input type="text" name="title"><br>
	작성자<input type="text" name="writer"><br>
	내용<textarea name="content"></textarea>
	<button type="submit">작성</button>
</form>
</body>
</html>
