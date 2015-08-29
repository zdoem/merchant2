<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/jsp/template_includes.jsp" %>
<%@ include file="/jsp/template_header.jsp" %>
<title>Master Data of Merchant</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function onSAVE() {
  
	if(document.forms[0].fName.value==''){
		alert("กรุณากรอก  ชื่อลูกค้าด้วย...");
		document.forms[0].fName.focus();
	}else 	if(document.forms[0].lName.value==''){
		alert("กรุณากรอก  นามสกุลลูกค้าด้วย...");
		document.forms[0].lName.focus();
	}else{
	    document.forms[0].action="<%=request.getContextPath()%>/CustomerSaveAction.dog";
	    document.forms[0].submit();
	}
    
  } 
 
 </script>
</head>
<body>
<div id="main">
<h4>ข้อมูลพื้นฐาน  -> <font color="#f26f21">เพิ่ม ลูกค้า</font></h4>

<form:form method="post" action="">
  <table width="600px">
   
     <tr>
      <th>&nbsp; รหัสลูกค้า : Auto Generate
        <br/>
      </th>
    </tr>
    
        <tr>
      <th>&nbsp; ชื่อ :
        <br/>
        <form:input path="fname" size="45"/>
		<font color="#FF0000">&nbsp;*</font>
      </th>
    </tr> 
    
    <tr>
      <th>&nbsp; นามสกุล :
        <br/>
         <form:input path="lname" size="45"/>
		<font color="#FF0000">&nbsp;*</font>
      </th>
    </tr> 
    
     <tr>
      <th>&nbsp; เบอร์บ้าน:
        <br/>
         <form:input path="salary" size="45"/>
      </th>
    </tr> 



    <tr>
      <td>     
         <p class="submit"><input type="button" value=" ADD " onclick="javascript:onSAVE();"/>&nbsp;&nbsp;<input type="reset" value=" Reset "/></p>
      </td>
    </tr>
  </table>
</form:form>

<%@ include file="/jsp/template_footer.jsp" %>
    