<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>设置-古籍网</title>
    <link rel="Shortcut Icon" href="image/guji.ico" >
</head>
<% User user=(User)session.getAttribute("user");
    if(user!=null){%>
<%@ include file="HeaderWithUser.jsp"%>
<%}else{ %>
<%@ include file="Header.jsp"%>
<%} %>
<link href="CSS/webuploader.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="Scripts/webuploader.min.js"></script>
<body onload="load()">

<div class="sokk-body">
    <div class="container">
        <div class="row">
            <div class="col-md-2 sokk-index-left">
                <ul style="margin-bottom:10px;" class="nav nav-stacked sokk-shelf-nav">
                    <li class="start active"><a href="Setting.jsp">基本设置</a></li>
                </ul></div>
            <div class="col-md-10"><h4>用户基本设置</h4>
                <form onsubmit="" class="form" action="process_setting.jsp">
                    <table class="table">

                        <tr><td>上传头像</td><td>
                            <div class="uploadavatar">
                                <div id="list" data-identity="c9f4D%2BNiwCftOsPSwubFUneu11mJbizQdWIvbX30Ak615sKYQIp8GpcqwOjVN4E" class="uploader-list">
                                    <div class="file-item thumbnail" id="thelist">
                                        <%String touxiang="'"+user.getTouxiang()+"'"; %>
                                        <img alt='..' src=<%out.print(touxiang); %> style="height:100%; weight:100%;">
                                        <div class="info">当前头像</div></div></div>
                                <div class="btns"><div id="picker">选择新头像</div></div></div></td></tr>

                        <tr><td>性别</td><td><label class="radio-inline">
                            <input type="radio" name="gender" checked="checked" value="男">男</label>
                            <label class="radio-inline"><input type="radio" name="gender" value="女">女</label></td></tr>

                        <tr> <td>签名</td><td>
<textarea name="pageword" style="min-height:80px;" placeholder="签名会在个人主页里显示" class="form-control">
</textarea>
                        </td></tr>

                        <tr>
                            <td></td><td><button class="btn btn-primary" id="upbtn">保存设置</button></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>



<%@ include file="Footer.jsp"%>



<span style="font-size:14px;"><script type="text/javascript">
  $(function(){
      /*init webuploader*/
      var $list=$("#thelist");
      var thumbnailWidth = 100;   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算，具体可以看api文档
      var thumbnailHeight = 100;

      var uploader = WebUploader.create({
          // 选完文件后，是否自动上传。
          auto: true,

          // swf文件路径
          swf: 'image/Uploader.swf',

          // 文件接收服务端。
          server: '/test/UploadServlet',

          // 选择文件的按钮。可选。
          // 内部根据当前运行是创建，可能是input元素，也可能是flash.
          pick: '#picker',

          // 只允许选择图片文件。
          accept: {
              title: 'Images',
              extensions: 'gif,jpg,jpeg,bmp,png',
              mimeTypes: 'image/*'
          },
          method:'POST',
      });
      // 当有文件添加进来的时候
      uploader.on( 'fileQueued', function( file ) {  // webuploader事件.当选择文件后，文件被加载到文件队列中，触发该事件。等效于 uploader.onFileueued = function(file){...} ，类似js的事件定义。
          var $li = $(
              '<div id="' + file.id + '" class="file-item thumbnail">' +
              '<img>' +
              '<div class="info">' + file.name + '</div>' +
              '</div>'
              ),
              $img = $li.find('img');
          // $list为容器jQuery实例
          $list.empty();
          $list.append( $li );

          // 创建缩略图
          // 如果为非图片文件，可以不用调用此方法。
          // thumbnailWidth x thumbnailHeight 为 100 x 100
          uploader.makeThumb( file, function( error, src ) {   //webuploader方法
              if ( error ) {
                  $img.replaceWith('<span>不能预览</span>');
                  return;
              }
              $img.attr( 'src', src );
          }, thumbnailWidth, thumbnailHeight );
      });
      // 文件上传过程中创建进度条实时显示。
      uploader.on( 'uploadProgress', function( file, percentage ) {
          var $li = $( '#'+file.id ),
              $percent = $li.find('.progress span');
          // 避免重复创建
          if ( !$percent.length ) {
              $percent = $('<p class="progress"><span></span></p>')
                  .appendTo( $li )
                  .find('span');
          }
          $percent.css( 'width', percentage * 100 + '%' );
      });
      // 文件上传成功，给item添加成功class, 用样式标记上传成功。
      uploader.on( 'uploadSuccess', function( file ) {
          $( '#'+file.id ).addClass('upload-state-done');
      });

      // 文件上传失败，显示上传出错。
      uploader.on( 'uploadError', function( file ) {
          var $li = $( '#'+file.id ),
              $error = $li.find('div.error');
          // 避免重复创建
          if ( !$error.length ) {
              $error = $('<div class="error"></div>').appendTo( $li );
          }
          $error.text('上传失败');
      });
      // 完成上传完了，成功或者失败，先删除进度条。
      uploader.on( 'uploadComplete', function( file ) {
          $( '#'+file.id ).find('.progress').remove();
      });
      $btn.on( 'click', function() {
          console.log("上传...");
          uploader.upload();
          console.log("上传成功");
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

<script type="text/javascript">
    function load(){
        var gender=document.getElementsByName("gender");
        var pageword=document.getElementsByName("pageword");
        if (<%="'"+((User)session.getAttribute("user")).getGender()+"'"%>=='男')
        {
            gender[0].setAttribute("checked","checked");
        }
    else{
            gender[1].setAttribute("checked","checked");
        }
        pageword[0].value=<%="'"+((User)session.getAttribute("user")).getQianming()+"'"%>;
    };
</script>

</body>
</html>