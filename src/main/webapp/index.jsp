<%@page import="domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-3T网</title>
    <link rel="Shortcut Icon" href="image/logo.ico" >
</head>
<body>
<% User user=(User)session.getAttribute("user"); 
   if(user!=null){%>
<%@ include file="HeaderWithUser.jsp"%>
<%}else{ %>
<%@ include file="Header.jsp"%>
<%} %>

<link href="CSS/webuploader.css" type="text/css" rel="stylesheet"/>
<link href="CSS/index.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="Scripts/webuploader.min.js"></script>

<div class="container" id="ss">
    <div  id="pick">
        <div class="row">
            <div id="filePicker"  class="cp_img_jia"><p><span class="glyphicon glyphicon-folder-open"></span>选择图片</p></div>
        </div>

        <div class="row">  <button id="ctlBtn" class="btn btn-primary up_img_jia"><p><span class="glyphicon glyphicon-open"></span>开始上传</p></button></div>
    </div>
    </div>

<div class="background">
    <div class="row">

        <div id="file">

            <!--用来存放文件信息-->

            <div id="fileList">

            </div>
        </div>

    </div>
</div>
<%@ include file="Footer.jsp"%>


<span style="font-size:14px;">
      <script type="text/javascript">

         $(function () {

             var $ = jQuery,
                 $list = $('#fileList'),

                 // 缩略图大小

                 thumbnailWidth = 90,
                 thumbnailHeight = 90,

                 // Web Uploader实例
                 uploader;

             uploader = WebUploader.create({
                 // 选完文件后，是否自动上传。

                 auto: false,
                 disableGlobalDnd: true,
                 // swf文件路径
                 swf: 'image/Uploader.swf',

                 // 文件接收服务端。

                 server: '/test/UploadServlet',

                 // 选择文件的按钮。可选。
                 // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                 pick: '#filePicker',

                 //只允许选择图片
                 accept: {
                     title: 'Images',
                     extensions: 'gif,jpg,jpeg,bmp,png',
                     mimeTypes: 'image/*'

                 }

             });

             // 当有文件添加进来的时候

             uploader.on('fileQueued', function (file) {
                 var $li = $(

                     '<div id="' + file.id + '" class="cp_img col-lg-1">' +
                     '<img>' +
                     '<div class="cp_img_jian"></div></div>'

                     ),

                     $img = $li.find('img');
                 // $list为容器jQuery实例
                 $list.append($li);
                 // 创建缩略图
                 // 如果为非图片文件，可以不用调用此方法。

                 // thumbnailWidth x thumbnailHeight 为 90x 90
                 uploader.makeThumb(file, function (error, src) {
                     if (error) {
                         $img.replaceWith('<span>不能预览</span>');
                         return;
                     }

                     $img.attr('src', src);
                 }, thumbnailWidth, thumbnailHeight);

             });

             // 文件上传过程中创建进度条实时显示。
             uploader.on('uploadProgress', function (file, percentage) {

                 var $li = $('#' + file.id),
                     $percent = $li.find('.progress span');
                 // 避免重复创建，如果不想显示图4那样的进度条，可以使用下面的代码，把现在使用的注释掉。
                 /*  if (!$percent.length) {
                       $percent = $('<p class="progress"><span></span></p>')
                               .appendTo($li)
                               .find('span');

                   }*/

                 if (!$percent.length) {
                     $percent = $('<div class="progress progress-striped active">' +
                         '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                         '</div>' +
                         '</div>').appendTo($li).find('.progress-bar');

                 }
                 $percent.css('width', percentage * 100 + '%');

             });

             // 文件上传成功，给item添加成功class, 用样式标记上传成功。
             uploader.on('uploadSuccess', function (file, response) {
                 $('#' + file.id).addClass('upload-state-done');

             });

             // 文件上传失败，显示上传出错。
             uploader.on('uploadError', function (file) {
                 var $li = $('#' + file.id),
                     $error = $li.find('div.error');

                 // 避免重复创建
                 if (!$error.length) {
                     $error = $('<div class="error"></div>').appendTo($li);

                 }
                 $error.text('上传失败');

             });

             // 完成上传完了，成功或者失败，先删除进度条。
             uploader.on('uploadComplete', function (file) {
                 $('#' + file.id).find('.progress').remove();

             });

             //所有文件上传完毕
             uploader.on("uploadFinished", function () {
                 //提交表单

             });

             //开始上传

             $("#ctlBtn").click(function () {
                 uploader.upload();

             });

             //显示删除按钮
             $(".cp_img").live("mouseover", function () {
                 $(this).children(".cp_img_jian").css('display', 'block');

             });

             //隐藏删除按钮
             $(".cp_img").live("mouseout", function () {
                 $(this).children(".cp_img_jian").css('display', 'none');

             });

             //执行删除方法，只是从客户端删除
             $list.on("click", ".cp_img_jian", function () {
                 var Id = $(this).parent().attr("id");
                 uploader.removeFile(uploader.getFile(Id, true));
                 $(this).parent().remove();

             });

         });

    </script></span>
<script>$("#file").on("change", function(){
    var formData = new FormData();
    formData.append("file", $("#file")[0].files);
    formData.append("token", $("#token").val());
    $.ajax({
        url: "http://uploadUrl",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(response){
            // 根据返回结果指定界面操作
        }
    });
});
</script>

</body>

</html>