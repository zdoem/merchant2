<%@ include file="/jsp/template_includes.jsp" %>
<%@ include file="/jsp/template_header.jsp" %>
<%@ include file="/jsp/template_includes2.jsp" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@page import="java.util.List" %>	
<%@page import="java.util.*" %>
<%@page import="com.ipro.model.bean.ProductBean" %>	
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Master Data of Merchant</title>
<script type="text/javascript">

function  doSearch(){
	var id = document.forms[0].pId.value;	   
	document.forms[0].action="<%=request.getContextPath()%>/SearchProductByName.dog";
    document.forms[0].submit();
}

function doAdd(id){
	//if(confirm("คุณต้องการลบรายการ  ID  "+id+" ใช่หรือไม่?")){
			document.forms[0].action="<%=request.getContextPath()%>/PurchaseRetrieve.dog?pId="+id;
    		document.forms[0].submit();
	//}
}

function onPurchase(){
	document.forms[0].action="<%=request.getContextPath()%>/TransConfirmOrder.dog";
    document.forms[0].submit();
}
</script>
</head>

<%
ArrayList list =(ArrayList)request.getAttribute("arrPurchaseList");
String contextPath = request.getContextPath();
%>

<body>
<br>
<br>
<center>
<%-- // show only current page worth of data
<form:form  commandName="ProductForm" method="POST" action="ProductList.dog">
 --%>
 
<form:form  method="POST" action="">
<table width="800px" border="1" bordercolor="#FFFFFF">
<tr><td colspan="9" align="left"><h4>SEARCH -> <font color="#f26f21">PRUDUCTS</font></h4></td>
</tr>

<tr>
<td colspan="9">

<table width="800px" border="2" bordercolor="#FFFFFF">
<tr>
<td valign="middle" width="220px">	
&nbsp; รหัสสินค้า :
        <br/>
		<input name="pId" size="25" type="text"/>
		<font color="#FF0000">&nbsp;*</font>
</td><!--		
<td valign="middle">		
&nbsp; ชื่อสินค้า :
        <br/>
		<input name="productName" size="25" type="text"/>
		<font color="#FF0000">&nbsp;*</font>

</td>-->	
<td valign="middle">		
		<p class="submit"><input type="button" value=" SEARCH " onclick="javascript:doSearch();"/></p>
</td>
</tr>	
</table>		
</td>      
</tr> 


<tr bgcolor="#497c09">
	<th style="color:#FFFFFF;font-weight:bold;text-align:center" width="10%">รหัสสินค้า</th>
	<th style="color:#FFFFFF;font-weight:bold;text-align:center">ชื่อสินค้า</th>	
	<th style="color:#FFFFFF;font-weight:bold;text-align:center" >จำนวนสินค้าคงเหลือ</th>
	<th style="color:#FFFFFF;font-weight:bold;text-align:center">ราคาต้นทุนต่อหน่วย</th>
	<th style="color:#FFFFFF;font-weight:bold;text-align:center">ราคาขาย</th>	
	<th style="color:#FFFFFF;font-weight:bold;text-align:center" width="5%">PURCHASE</th>
</tr>
<%  
   float total = 0.0f;
   int sumItems = 0;
   int i = 0;
   if(list!=null &&list.size()> 0){
	    Iterator it = list.iterator();
	     while(it.hasNext()){
	    	 float vSum = 0.0f;
	    	 ProductBean obj =(ProductBean)it.next();
	          i++;
	          vSum = obj.getProductItem() * obj.getPriceSale();
	          
	          sumItems +=obj.getProductItem();
	          total += vSum;
%>

    <tr height="20px">
    	<td align="center"><%=obj.getProductId() %></td>
    	<td><%=obj.getProductName() %></td>
    	<td align="right"><%=obj.getProductItem()%></td>
    	<td align="right"><%=obj.getPriceCost() %></td>
    	<td align="right"><%=obj.getPriceSale() %></td>
    	<td align="center"><a href="javascript:doAdd('<%=obj.getProductId() %>')">ADD</a></td>
    </tr>
<%
       } //End while 
       //End if
    }else{
  %>
  	   <tr>
		    <td align="center"  colspan="7">&nbsp;ยังไม่มีข้อมูล </td>
	   </tr>
  <%} %>

<tr><td  colspan="9" align="right" >
&nbsp;
</td>
</tr>
</table>

</form:form>


</body>
</html>
<%@ include file="/jsp/template_footer.jsp" %>
</center>