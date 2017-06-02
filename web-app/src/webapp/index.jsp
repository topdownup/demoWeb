<%--
  Created by IntelliJ IDEA.
  UserInfo: lixulong
  Date: 2017/6/2
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="js/bootstrap/css/bootstrap.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function() {
            $(".btn").click(function(){
                $(this).button("loading").delay(1000).queue(function() {
                    $(this).button("reset");
                    $(this).dequeue();
                });
            });
        });
    </script>

</head>
<body>
<p>
    <button type="button" class="btn btn-primary btn-lg">大的原始按钮</button>
    <button type="button" class="btn btn-default btn-lg">大的按钮</button></p><p>
    <button type="button" class="btn btn-primary">默认大小的原始按钮</button>
    <button type="button" class="btn btn-default">默认大小的按钮</button></p><p>
    <button type="button" class="btn btn-primary btn-sm">小的原始按钮</button>
    <button type="button" class="btn btn-default btn-sm">小的按钮</button></p><p>
    <button type="button" class="btn btn-primary btn-xs">特别小的原始按钮</button>
    <button type="button" class="btn btn-default btn-xs">特别小的按钮</button></p><p>
    <button type="button" class="btn btn-primary btn-lg btn-block">块级的原始按钮</button>
    <button type="button" class="btn btn-default btn-lg btn-block">块级的按钮</button>
</p>

<hr>
<button type="button" class="btn btn-default">默认</button>
<button type="button" class="btn btn-primary">首要</button>
<button type="button" class="btn btn-info">信息</button>
<button type="button" class="btn btn-success">成功</button>
<button type="button" class="btn btn-warning">警告</button>
<button type="button" class="btn btn-danger">错误</button>
<hr>
</body>
</html>
