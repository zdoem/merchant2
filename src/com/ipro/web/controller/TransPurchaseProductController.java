package com.ipro.web.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.ipro.dao.service.GenerateAutoID;
import com.ipro.dao.service.MasterBrandProduct;
import com.ipro.dao.service.MasterBrandProductImpl;
import com.ipro.dao.service.MasterProduct;
import com.ipro.dao.service.MasterProductImpl;
import com.ipro.dao.service.MasterTypeProduct;
import com.ipro.dao.service.MasterTypeProductImpl;
import com.ipro.dao.service.TransPurchaseProduct;
import com.ipro.dao.service.TransPurchaseProductImpl;
import com.ipro.model.bean.BrandProduct;
import com.ipro.model.bean.ProductBean;
import com.ipro.model.bean.TypeProduct;
import com.ipro.model.domain.ProductForm;

@Controller
public class TransPurchaseProductController {
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
	@RequestMapping("/TransPurchase1FormLoad")
	public ModelAndView doForm1LoadAction(HttpServletRequest request) {
			System.out.println("--->Show  TransPurchase1FormLoad.dog");		
			HttpSession session = request.getSession(false); 			
			try{
		  		synchronized(session) { 		
					 // Clear all session
				     session.invalidate();
				}
		  }
		  catch(Exception e){}			
			//mapping jsp file ,bean name,Object Form
			return new ModelAndView("TransPurchaseForm", "command", null );
	}
	
	
	//*********mapping url path
	@RequestMapping("/TransPurchaseFormLoad")
	public ModelAndView doFormLoadAction(HttpServletRequest request) {
			System.out.println("--->Show  TransPurchaseFormLoad.dog");		
			HttpSession session = request.getSession(false); 		
			//mapping jsp file ,bean name,Object Form
			return new ModelAndView("TransPurchaseForm", "command", null );
	}
	
	
	//Purchase into Database
	//1.
	//2.
	//3.
	@RequestMapping("/TransConfirmPurchase")
	public String doConfirmPurchaseAction(HttpServletRequest request) {
				System.out.println("--->Show  TransConfirmPurchase.dog");		
				HttpSession session = request.getSession(false); 				
				EchoParamRQ(request);					
				Object obj=null;
		    	ArrayList arrList= null;
		    	String forwardForm = "";
		     	try{
		     		String invoidId ="";
			     	obj = session.getAttribute("purchaseArrList");
			     	arrList = (ArrayList)obj; 	
			     	if(arrList!=null && arrList.size()>0){			     		
			     		//Log.debug("-->Starting transOrder.");
			     		invoidId =  GenerateAutoID.getAutoIdFromTable("p_invoice", "purchase");  		     		
			     		
			     		TransPurchaseProduct  trnProd = new TransPurchaseProductImpl();
			     		boolean isPurchase = trnProd.insertTransPurchase(arrList, invoidId);
			     		
			     		request.setAttribute("purchaseArrList", arrList);
			     		session.removeAttribute("purchaseArrList");//remove
			     		request.setAttribute("inVoidId", invoidId);
			     		//forwardForm = "PaymentForm";
			     		
			     		if(isPurchase){
			     			return "redirect:error.dog?msg=Update Data is Error&url=TransPurchaseFormLoad.dog";
			     		}else{			     			
			     			return "redirect:success.dog?msg=Purchase product successfully..&url=home.dog";
			     		}			     		
			     		//session.removeAttribute("arrOrderList");//remove
			   			//session.setAttribute("arrOrderList",arrList);//add
			     		//1.if isOrder GOTO  PAYMENT PAGE			     		
			     	}else{			     		
			     		//forwardForm = "TransOrderProductForm";
			     		return "redirect:TransPurchaseFormLoad.dog";
			     	}
		     	}catch(Exception e){
		     	 	System.out.println("-->>Ex get arrList: "+e.toString());
		     	 	return "redirect:error.dog?msg=Update Data is Error&url=TransPurchaseFormLoad.dog";
		      } 	     	
	}
	
	//*************doAction GetData  Form
	@RequestMapping("/PurchaseRetrieve")
	public ModelAndView doFectchAction(HttpServletRequest request,
				HttpServletResponse response)throws Exception {
				HttpSession session = request.getSession();
				System.out.println("---> PurchaseRetrieve.dog");
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
						eForm.setProductItem(obj.getProductItem());
						eForm.setProductDateStart(obj.getProductDateStart());
						eForm.setProductDateExpire(obj.getProductDateExpire());
						eForm.setProductDesc(obj.getProductDesc());						
					
				return new ModelAndView("TransPurchaseAddForm", "command",eForm);
			} 
	}	
	                
	//*********ADD Session
	@RequestMapping(value = "/PurchasePutSessionAction", method = RequestMethod.POST)
	public String doPurchasePutSessionAction(@ModelAttribute("eForm")
			ProductForm eForm, BindingResult result,HttpServletRequest request)  {
			try{		
						HttpSession session = request.getSession(false); 
						System.out.println("--->Purchase  PurchasePutSessionAction.dog");
						EchoParamRQ(request);
						Object oby = new Object();			    						
						ArrayList arrList = new ArrayList();
				     	try{
				     		oby = session.getAttribute("purchaseArrList");
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
									obj.setPriceCost(eForm.getPriceCost());
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
							obj.setPriceCost(eForm.getPriceCost());
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
	       				session.setAttribute("purchaseArrList",arrList);//add	
						return "redirect:TransPurchaseFormLoad.dog";
				}catch(Exception e){
						return "redirect:error.dog?msg=Update Data is Error&url=home.dog";
				}
		 }
	
	   //TODO:
		//1. check session
		//2. delete session
		//3. view
		//Session get Request
		//*********mapping url path
		@RequestMapping("/TransPurchaseDelete")
		public ModelAndView doDeleteSessionAction(HttpServletRequest request) {
				System.out.println("--->Show  TransPurchaseDelete.dog");		
				HttpSession session = request.getSession(false); 			
				EchoParamRQ(request);			
				String productId = request.getParameter("prodId")==null?"0":request.getParameter("prodId");
				String tempRecNo = request.getParameter("recId")==null?"0":request.getParameter("recId");
				int recNo = Integer.parseInt(tempRecNo);				
				Object obj=null;
		    	ArrayList arrList= null;
		     	try{
			     	obj = session.getAttribute("purchaseArrList");
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
			        	session.removeAttribute("purchaseArrList");//remove
			   			session.setAttribute("purchaseArrList",arrList);//add	
					} 
		     	}catch(Exception e){
		     	 	System.out.println("-->>Ex get arrList: "+e.toString());
		      	} 	     	
				//mapping jsp file ,bean name,Object Form
				return new ModelAndView("TransPurchaseForm", "command", null );
		}
	
	//*************doAction GetData  Form
	@RequestMapping("/SearchProductByName")
	public ModelAndView doFectchDataAction(HttpServletRequest request,
			HttpServletResponse response)throws Exception {
			//HttpSession session = request.getSession();					
			ArrayList result = new ArrayList();
			System.out.println("---> SearchProductByName.dog");						
			TransPurchaseProduct tService = new TransPurchaseProductImpl();										
			String id = request.getParameter("pId");
			String pName = request.getParameter("pName");
						
			//Get Data		
			result = tService.FindListProduct(id, pName);
			if(result == null){
				System.out.println("Find Not Found..No record.");
				return new ModelAndView("msg_errors", "command",null);			
			}else{	
				request.setAttribute("arrPurchaseList", result);
				return new ModelAndView("TransPurchaseListForm", "command",null);
			}
		}
}

//Purchase