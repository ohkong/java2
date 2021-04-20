<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원사진 등록</title>
</head>
<body>
<h3>사진업로드</h3>
<table class="w3-table-all"><tr><td><img id="preview" src=""></td></tr>
<tr><td>
<form action="picture.me" method="post" 
      enctype="multipart/form-data">
  <input type="file" name="picture" id="imageFile" accept="img/*">
  <input type="submit" value="사진등록">
</form></td></tr></table>
<script type="text/javascript">
let imagefile = document.querySelector('#imageFile');
let preview = document.querySelector('#preview');
imagefile.addEventListener('change', function(e) {
  let get_file = e.target.files;  
  let reader = new FileReader();   
  reader.onload = (function (Img) {
    return function(e) {
	  Img.src = e.target.result;
    }
  })(preview);
  if(get_file){   reader.readAsDataURL(get_file[0]);  }
});
</script></body></html>