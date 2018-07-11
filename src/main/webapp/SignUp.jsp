<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<title>注册-3T网</title>
<link rel="Shortcut Icon" href="image/guji.ico" >
<%@ include file="Header.jsp"%>
<link rel="stylesheet" href="CSS/bootstrapValidator.min.css"/>
	<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="Scripts/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="Scripts/bootstrapValidator.js"></script>
</head>
<body>
<div class="container">
<div style="margin-top:2em;max-width:600px;" class="center-block">
<div style="padding:15px;margin-bottom:15px;" class="bg-info">欢迎你注册3T网</div>
<form action="process_register.jsp" method="post" autocomplete="off" class="form-horizontal" id="signup">


<div class="form-group">
<label for="inputUserName" class="col-sm-2 control-label">用户名</label>
<div class="col-sm-10">
<input id="inputUserName" type="text" placeholder="用户名可以为中文" name="username" class="form-control">
 <span class="help-block" id="userNameMessage">
 </span>
</div>
</div>


<div class="form-group">
<label for="inputPassword1" class="col-sm-2 control-label">密码</label>
<div class="col-sm-10">
<input id="inputPassword1" type="password" name="password1" class="form-control">
<span class="help-block" id="password1NameMessage">
</span>
</div>
</div>



<div class="form-group">
<label for="inputPassword2" class="col-sm-2 control-label">确认密码</label>
<div class="col-sm-10">
<input id="inputPassword2" type="password" name="password2" class="form-control">
<span class="help-block" id="password2NameMessage">
</span>
</div>
</div>



<div class="form-group">
<div class="col-sm-offset-2 col-sm-10">
<button type="submit" class="btn btn-primary">提交注册</button>
</div>
</div>


</form>
</div>
</div>
<%@ include file="Footer.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
    $('#signup').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
                container: '#userNameMessage',
                validators: {
                    notEmpty: {
                        message: '用户名不能为空！'
                    },
                     stringLength: {
                        min: 2,
                        max: 12,
                        message: '用户名必须在2-12个字符内！'
                    }
                }
            },
            password1: {
                container: '#password1NameMessage',
                validators: {
                    notEmpty: {
                        message: '密码不能为空！'
                    },
            stringLength: {
                min: 8,
                max: 20,
                message: '密码长度必须为8-20！'
            }
                }
            },
            password2: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '密码不能为空！'
                    },
                    identical: {
                        field: 'password1',
                        message: '两次输入的密码不相同！'
                    },
                    stringLength: {
                        min: 8,
                        max: 20,
                        message: '密码长度必须为8-20！'
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>