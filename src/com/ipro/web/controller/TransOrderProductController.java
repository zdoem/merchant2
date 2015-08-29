package com.ipro.web.controller;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.ipro.dao.service.Common;
import com.ipro.dao.service.GenerateAutoID;
import com.ipro.dao.service.MasterBrandProduct;
import com.ipro.dao.service.MasterBrandProductImpl;
import com.ipro.dao.service.MasterProduct;
import com.ipro.dao.service.MasterProductImpl;
import com.ipro.dao.service.MasterTypeProduct;
import com.ipro.dao.service.MasterTypeProductImpl;
import com.ipro.dao.service.TransOrderProduct;
import com.ipro.dao.service.TransOrderProductImpl;
import com.ipro.model.bean.BrandProduct;
import com.ipro.model.bean.PaymentBean;
import com.ipro.model.bean.ProductBean;
import com.ipro.model.bean.TypeProduct;
import com.ipro.model.domain.ProductForm;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

@Controller
public class TransOrderProductController   {
	//*********Show all parameter All by pass Request query.
	private static void EchoParamRQ(HttpServletRequest request){
		String paramNames = "";
		System.out.println("---------[ Parameter List] ------------");
		for(Enumeration e = request.getParameterNames();e.hasMoreElements(); ){
			paramNames = (String)e.nextElement();
			System.out.println(paramNames+" = "+request.getParameter(paramNames));
		}		
		System.out.println("---------- [Parameter List] -----------");		
	}	
	
	//*********mapping url path
	@RequestMapping("/TransOrderFormLoad")
	public ModelAndView doFormLoadAction(HttpServletRequest request) {
			System.out.println("--->Show  TransOrderFormLoad.dog");		
			//HttpSession session = request.getSession(false); 
			//if(session.getAttribute("arrOrderList")!=null){
			//	session.removeAttribute("arrOrderList");
			//}		
			//mapping jsp file ,bean name,Object Form
			return new ModelAndView("TransOrderProductForm", "command", null );
	}
	
	//*********mapping url path
	@RequestMapping("/PaymentLoadInvoiceForm")
	public ModelAndView doFormLoadInvoiceAction(HttpServletRequest request) {
			System.out.println("--->Show  PaymentLoadInvoiceForm.dog");		
			request.setAttribute("invoice_ref",request.getParameter("invoice_ref"));
			
			return new ModelAndView("PaymentInvoicePrint", "command", null );
	}
	
		
	//*************doAction GetData  Form
	@RequestMapping("/SearchProduct")
	public ModelAndView doFectchAction(HttpServletRequest request,
				HttpServletResponse response)throws Exception {
				HttpSession session = request.getSession();
				System.out.println("---> SearchProduct.dog");				
				if(request.getParameter("pId")==null || request.getParameter("pId").equals("")){
					return new ModelAndView("msg_errors", "command",null);	
				}else{				
					MasterProduct  pService= new MasterProductImpl();							
					ProductBean obj = new ProductBean();						
					//Get Data
					obj = pService.getProduct(request.getParameter("pId")); 				
					if(obj == null){
							return new ModelAndView("msg_errors", "command",null);			
					}else{						
							/*******************************
							* for BrandProductDDL
							********************************* */
							MasterBrandProduct bpService = new MasterBrandProductImpl();
							ArrayList bResult = bpService.listBrandProduct();
							BrandProduct  brand = new BrandProduct();//From Bean OBJ	
						 	Map<String,String> mapBrand = new LinkedHashMap<String,String>();		
							if(bResult!=null && bResult.size()>0){
								Iterator it = bResult.iterator();
								while(it.hasNext()){
										brand =(BrandProduct)it.next();
										mapBrand.put(brand.getbId()+"".trim(),brand.getbName());
									}
								}
								session.setAttribute("bProductListDDL", mapBrand);										
								/*******************************
								 * for typeProduct DDL
								 ********************************* */
								MasterTypeProduct tService = new MasterTypeProductImpl();
								ArrayList tResult = tService.listTypeProduct();	
								TypeProduct  typePro = new TypeProduct();		
								 Map<String,String> mapType = new LinkedHashMap<String,String>();		
								 if(tResult!=null && tResult.size()>0){
									Iterator it = tResult.iterator();
									while(it.hasNext()){
										typePro =(TypeProduct)it.next();
										mapType.put(typePro.getTypeId()+"".trim(),typePro.getTypeName());
									}
								}
								session.setAttribute("tProductListDDL", mapType);								
								//*********mapping Form
								ProductForm eForm = new ProductForm();
								eForm.setProductId(obj.getProductId());
								eForm.setProductName(obj.getProductName());
								eForm.setBrandProductIdDDL(obj.getBrandProductId());
								eForm.setTypeProductIdDDL(obj.getTypeProductId());
								eForm.setPriceCost(obj.getPriceCost());
								eForm.setPriceSale(obj.getPriceSale());
								eForm.setProductItem(1);
								eForm.setProductDateStart(obj.getProductDateStart());
								eForm.setProductDateExpire(obj.getProductDateExpire());
								eForm.setProductDesc(obj.getProductDesc());														
							return new ModelAndView("TransAddProductForm", "command",eForm);
						}
					}
			}
	
	//*********ADD Session
	@RequestMapping(value = "/OrderAddProductAction", method = RequestMethod.POST)
	public String doOrdderAddAction(@ModelAttribute("eForm")
			ProductForm eForm, BindingResult result,HttpServletRequest request)  {
				try{		
					HttpSession session = request.getSession(false); 
					System.out.println("--->Order  OrderProductAction.dog");
					EchoParamRQ(request);
					Object oby = new Object();			    						
					ArrayList arrList = new ArrayList();
			     	try{
			     		oby = session.getAttribute("arrOrderList");
				     	arrList = (ArrayList)oby; 
			      	}catch(Exception e){
			     	 	System.out.println("<<------------Exception View");
			      	}  					
			     	//*********************************************				     	
			     	//*********check duplicate  product
			     	boolean isDup = true;
			     	ProductBean obj = null;			     	
			     	if(arrList!=null && arrList.size()>0){
			     		ProductBean  prod = null;
			     		int items = 0;
			     		int i = 0;
			     		
						System.out.println("Check duplicate process.");
						Iterator it=arrList.iterator();
			        	while(it.hasNext()){
			        		prod =(ProductBean)it.next();
			        		if(prod.getProductId().equals(eForm.getProductId())){
			        			items = prod.getProductItem()+eForm.getProductItem();
			        			arrList.remove(i);
			        		    obj = new ProductBean();
								obj.setProductName(eForm.getProductName());
								obj.setBrandProductId(eForm.getBrandProductIdDDL());
								obj.setTypeProductId(eForm.getTypeProductIdDDL());
								//obj.setPriceCost(eForm.getPriceCost());
								obj.setPriceSale(eForm.getPriceSale());
								obj.setProductItem(items);
								obj.setProductDateStart(eForm.getProductDateStart());
								obj.setProductDateExpire(eForm.getProductDateExpire());
								obj.setProductDesc(eForm.getProductDesc());
								obj.setProductId(eForm.getProductId());			        			
								isDup = false;
				    		    break;
			        		}
			        		i++;
			        	}
			     	}			     	
			     	//*****Not duplicate krup
			     	if(isDup){
						obj = new ProductBean();
						obj.setProductName(eForm.getProductName());
						obj.setBrandProductId(eForm.getBrandProductIdDDL());
						obj.setTypeProductId(eForm.getTypeProductIdDDL());
						//obj.setPriceCost(eForm.getPriceCost());
						obj.setPriceSale(eForm.getPriceSale());
						obj.setProductItem(eForm.getProductItem());
						obj.setProductDateStart(eForm.getProductDateStart());
						obj.setProductDateExpire(eForm.getProductDateExpire());
						obj.setProductDesc(eForm.getProductDesc());
						obj.setProductId(eForm.getProductId());					
			     	}			     	
					if(arrList == null){
						arrList = new ArrayList();				
					}
					arrList.add(obj);				
					//session.removeAttribute("arrOrderList");//remove
       				session.setAttribute("arrOrderList",arrList);//add	
					return "redirect:TransOrderFormLoad.dog";
			}catch(Exception e){
					return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
			}
	 }
	
	//TODO: step by step
	//1. get session
	//2. Generate ORDER_INVOICE_ID
	//3. CREATE ORDER _RECORD (Master table)
	//4. CREATE ORDER ITEMS  (Second table)
	//5. SHOW  INVICE ORDER FORM PAYIN 
	//*********mapping url path
	@RequestMapping("/TransConfirmOrder")
	public ModelAndView doConfirmOrderAction(HttpServletRequest request) {
				System.out.println("--->Show  TransConfirmOrder.dog");		
				HttpSession session = request.getSession(false); 				
				EchoParamRQ(request);					
				Object obj=null;
		    	ArrayList arrList= null;
		    	String forwardForm = "";
		     	try{
		     		String invoidId ="";
			     	obj = session.getAttribute("arrOrderList");
			     	arrList = (ArrayList)obj; 	
			     	if(arrList!=null && arrList.size()>0){			     		
			     		//Log.debug("-->Starting transOrder.");	
			     		invoidId =  GenerateAutoID.getAutoIdFromTable("o_invoice", "ioder");  
						//Log.debug("-->after generate INVOID_ID.");	
			     		TransOrderProduct trnProd = new TransOrderProductImpl();			     		
			     		boolean isOrder = trnProd.insertTransOrder(arrList,invoidId);
			     		//session.removeAttribute("arrOrderList");//remove
			   			//session.setAttribute("arrOrderList",arrList);//add
			     		//1.if isOrder GOTO  PAYMENT PAGE			     		
			     		request.setAttribute("arrOrderList", arrList);
			     		session.removeAttribute("arrOrderList");//remove
			     		request.setAttribute("inVoidId", invoidId);
			     		forwardForm = "PaymentForm";
			     	}else{			     		
			     		forwardForm = "TransOrderProductForm";
			     	}
		     	}catch(Exception e){
		     	 	System.out.println("-->>Ex get arrList: "+e.toString());
		      	} 	     	
			//mapping jsp file ,bean name,Object Form
			return new ModelAndView(forwardForm, "command", null );
	}
	
	//TODO:
	//1. check session
	//2. delete session
	//3. view
	//Session get Request
	//*********mapping url path
	@RequestMapping("/TransOrderDelete")
	public ModelAndView doDeleteSessionAction(HttpServletRequest request) {
			System.out.println("--->Show  TransOrderDelete.dog");		
			HttpSession session = request.getSession(false); 			
			EchoParamRQ(request);			
			String productId = request.getParameter("prodId")==null?"0":request.getParameter("prodId");
			String tempRecNo = request.getParameter("recId")==null?"0":request.getParameter("recId");
			int recNo = Integer.parseInt(tempRecNo);				
			Object obj=null;
	    	ArrayList arrList= null;
	     	try{
		     	obj = session.getAttribute("arrOrderList");
		     	arrList = (ArrayList)obj; 
		     	if(arrList!=null && arrList.size()>0){
		     		ProductBean  prod = null;	     		
					System.out.println("Delete process.");
					Iterator it=arrList.iterator();
		        	while(it.hasNext()){
		        		prod =(ProductBean)it.next();
		           		//System.out.println(lockObj.getILock()+","+lockObj.getIModel());
		           		if(prod.getProductId().equals(productId)){
		           			arrList.remove(recNo);
			      			System.out.println("Remove productId :"+productId);
			      			System.out.println("Remove seq:"+recNo);
			    		    break;
		         		}
					 }			     	
		        	session.removeAttribute("arrOrderList");//remove
		   			session.setAttribute("arrOrderList",arrList);//add	
				} 
	     	}catch(Exception e){
	     	 	System.out.println("-->>Ex get arrList: "+e.toString());
	      	} 	     	
			//mapping jsp file ,bean name,Object Form
			return new ModelAndView("TransOrderProductForm", "command", null );
	}
	
	@RequestMapping("/TransPayLaterAction")
	public String doPayLaterAction(HttpServletRequest request) {
			System.out.println("--->Show  TransPayLaterAction.dog");		
			HttpSession session = request.getSession(false); 			
			EchoParamRQ(request);		
			//Object obj=null;
	     	try{
	     		//Request parameter
	     		String inVoid = request.getParameter("inVoidId");
	     		//float amount = //request.getParameter("payAmount") == null?0:Float.parseFloat(request.getParameter("payAmount"));
	     		
	     		TransOrderProduct payService = new TransOrderProductImpl();
	     		PaymentBean pay = new PaymentBean();
	     		pay.setInvoidId(inVoid);
	     		pay.setAmount(0.0f);
	     		pay.setFlag("P"); //A:Approved,P:Pending,D:Declined,F:Fail
	     		pay.setType(""); //C:Cash,T:Transfer,D:credit card pay,
	     		pay.setBankRef("");//Bank name /credit card NO.     		
	     		
	     		boolean isUpd = payService.updateTransPayin(pay);	     		
	     		System.out.println("--->Result UpdateRec:"+isUpd);		
				if(isUpd){
					//TODO :Update Error  
					return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
				}else{
					//TODO: Update success.			
					return "redirect:success.dog?msg=Successfully&url=home.dog";
					//request.setAttribute("invoice_ref", inVoid);
					//return "redirect:PaymentLoadInvoiceForm.dog?invoice_ref="+inVoid;
				}	
	     	}catch(Exception e){
	     	 	System.out.println("-->>Ex get arrList: "+e.toString());
	     	 	return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
	      	} 	     	 
	   }
	
	
	@RequestMapping("/TransPayinAction")
	public String doPayinAction(HttpServletRequest request) {
			System.out.println("--->Show  TransPayinAction.dog");		
			HttpSession session = request.getSession(false); 			
			EchoParamRQ(request);		
			//Object obj=null;
	     	try{
	     		//Request parameter
	     		String inVoid = request.getParameter("inVoidId");
	     		float amount = request.getParameter("payAmount")==null?0:Float.parseFloat(request.getParameter("payAmount"));
	     		
	     		TransOrderProduct payService = new TransOrderProductImpl();
	     		PaymentBean pay = new PaymentBean();
	     		pay.setInvoidId(inVoid);
	     		pay.setAmount(amount);
	     		pay.setFlag("A"); //A:Approved,P:Pending,D:Declined,F:Fail
	     		pay.setType("C"); //C:Cash,T:Transfer,D:credit card pay
	     		pay.setBankRef("");//Bank name /credit card NO.     		
	     		
	     		boolean isUpd = payService.updateTransPayin(pay);	     		
	     		System.out.println("--->Result UpdateRec:"+isUpd);		
				if(isUpd){
					//TODO :Update Error  
					return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
				}else{
					//TODO: Update success.			
					//return "redirect:success.dog?msg=Successfully&url=home.dog";
					request.setAttribute("invoice_ref", inVoid);
					return "redirect:PaymentLoadInvoiceForm.dog?invoice_ref="+inVoid;
				}	
	     	}catch(Exception e){
	     	 	System.out.println("-->>Ex get arrList: "+e.toString());
	     	 	return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
	      	} 	     	 
	   }
	
	@RequestMapping("/TransPayinPrintAction")
	public String doPayinPrintAction(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, Exception {
			System.out.println("--->Show  TransPayinAction.dog");		
			//HttpSession session = request.getSession(false); 			
			EchoParamRQ(request);		
		
			//connection db
			String dataSource = "jdbc/Datasource_merchant";
			Connection conn = null; //Common.open();
			
			
			JasperReport jasperReport;
			JasperPrint jasperPrint;
			JasperDesign jasperDesign;
	     	try{
	     		Common.setConfigForConnectionPool("", dataSource);	
	     		conn = Common.open();
	     		
	     		//Request parameter
	     		String inVoid = request.getParameter("invoiceId");
	     		System.out.println("-->>Ex:444 : "+inVoid);
	     		
				Map param = new HashMap();
				param.put("INVOICE_ID", inVoid);
				//System.out.println("Test :"+getServletContext().getRealPath("\\"));
				
				jasperDesign = JRXmlLoader.load("D://temp//_REPORT4//rptInvoice2x.jrxml");
				System.out.println("Test :OK..");
	     					//jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("\\")+"rptInvoice2x.jrxml");
                			// คอมไพล์ report จะได้ไฟล์ report3.jasper
				jasperReport = JasperCompileManager.compileReport(jasperDesign);
			                // ส่ง parameters กับ connection ของ database ให้ jasper ทำการ fill report
				System.out.println("compileReport :OK..");
				jasperPrint = JasperFillManager.fillReport(jasperReport,param,conn);
			                // export report ออกไปเป็นไฟล์ demo.pdf
				JasperExportManager.exportReportToPdfFile(jasperPrint,"D:/demoInv.pdf");
				
				//build & display example preview printing
				JasperViewer jvw = new JasperViewer(jasperPrint,false);
				jvw.setVisible(true);
				
	     		return "redirect:home.dog";	     	
			}catch (Exception e) {//JR
			 	System.out.println("-->>Ex: "+e.toString());
	     	 	e.printStackTrace();
	     	 	return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
			}
	
			finally{ 
				if (conn != null){
					try {conn.close();} 
					catch (Exception ignored) {}
				}
			}
	   }

}
