package com.ipro.dao.service;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Logger;
import com.ipro.model.bean.PaymentBean;
import com.ipro.model.bean.ProductBean;

/*
 * date:2012-01-19
 * author: pradoem wongkraso
 * contact : go2doem@gmail.com,destar_@hotmail.com
 * description: 
 * 
 * */
public class TransPurchaseProductImpl extends Common implements TransPurchaseProduct{
	private static org.apache.log4j.Logger Log = Logger.getLogger(TransPurchaseProductImpl.class);
	static String INSTANT_DB_NAME = "db_merchant";
	static {
		String dataSource = "jdbc/Datasource_merchant";
		Common.setConfigForConnectionPool("", dataSource);
		/* Common.setConfig(host, port, dns, usr, pwd); */
	}

	public ArrayList FindListProduct(String id, String pName) throws Exception {
		// Log.debug("List WatchdogForm..");
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ProductBean obj= null;
		ArrayList result = new ArrayList();		
		try {			
				conn = open();
				// Common.beginTransaction(conn);
				Log.debug("-->Query.");
				// setTransaction
				sql = " SELECT p.product_id,"+
				          " p.product_name ,"+
				          " p.type_product_id  ,"+
				          " p.brand_product_id ,"+
				          " p.price_cost,"+
				          " p.price_sale ,"+
				          " p.product_item ,"+
				          " p.product_date_start,"+
				          " p.product_date_expire ,"+
				          " p.product_desc ,"+
				          " b.brand_product_name,"+
				          " t.type_product_name"+
				          " FROM product p, brand_product b, type_product t"+
				          " WHERE (p.delete_flag <> 'D' OR   p.delete_flag  is null  OR p.delete_flag <> '' ) "+
				          " and b.brand_product_id = p.brand_product_id "+
				          " and t.type_product_id = p.type_product_id ";
				if(!"".equals(id) && id!= null){
					sql +=" and (p.product_id = ? OR p.product_id LIKE ? )";
				}
				if(!"".equals(pName) && pName!= null){
					sql +=" and  (p.product_name = ? OR product_name LIKE ? )";
				}
				
				System.out.println("SQL : "+sql);
				int i = 1;
				pstmt = conn.prepareStatement(sql);
				if(!"".equals(id) && id!= null){
					pstmt.setString(i++, id);
					pstmt.setString(i++, "%"+id+"%");
				}
				if(!"".equals(pName) && pName!= null){
					pstmt.setString(i++, pName);
					pstmt.setString(i++, "%"+pName+"%");
				}
			   								
				rs = pstmt.executeQuery();
				Log.debug("--->execute SQL Query.");
				int c = 0;
				while (rs.next()) {
						obj = new ProductBean();
						obj.setProductId(rs.getString("product_id"));
						obj.setProductName(rs.getString("product_name"));
						obj.setTypeProductId(rs.getString("type_product_id"));
						obj.setBrandProductId(rs.getString("brand_product_id"));
						obj.setPriceCost(rs.getFloat("price_cost"));
						obj.setPriceSale(rs.getFloat("price_sale"));
						obj.setProductItem(rs.getInt("product_item"));
						obj.setProductDateStart(rs.getString("product_date_start"));
						obj.setProductDateExpire(rs.getString("product_date_expire"));
						obj.setProductDesc(rs.getString("product_desc"));
						obj.setBrandProductName(rs.getString("brand_product_name"));
						obj.setTypeProductName(rs.getString("type_product_name"));			
						result.add(obj);
						c++;
				}
				// Log.debug("get UserInfo FetchSize :"+c);
				// Commit Transaction
				Log.debug("--->Query completed.");
			} catch (Exception e) {
				e.printStackTrace();
				Log.debug("Exception : "+e.getMessage());
			} finally {
				// close
				try {
					rs.close();
					pstmt.close();
					close(conn);
				}catch (Exception e) {
				}
			}
		 return result;
	}

	//Insert Purchase krub.
	public boolean insertTransPurchase(List list, String invoiceId)
		throws Exception {
		CallableStatement clbstmt = null;
		Connection conn = null;
		int i = 1;
		//***********
		boolean isInsert = true; //true is fail
		boolean isInsItem = true; //true is fail
		boolean isUpdProduct = true; //true is fail
		boolean isResult = true;
		try{
				//::TODO 	
				conn = open();
				Common.beginTransaction(conn);
				//********************************************************
				
				
				int totalUnit = 0;
				float totalPrice = 0.0f;
				ProductBean prod = null;				
				Iterator it=list.iterator();
	        	while(it.hasNext()){
	        		prod =(ProductBean)it.next();        		
	        		totalPrice = prod.getProductItem() * prod.getPriceSale();
	        		totalUnit  += prod.getProductItem();
	        	}
	        	//*******************************************************
				Log.debug("-->Before Insert.");					
				//Insert to DB
				clbstmt = conn.prepareCall("{call "+INSTANT_DB_NAME+".INSERT_PURCHASE(?,?,?,?,?)}");
				clbstmt.setString(i++,invoiceId);				    
				clbstmt.setFloat(i++,totalPrice);	
				clbstmt.setInt(i++,totalUnit);	
				clbstmt.setString(i++,"99999999999");//CustomerID
				clbstmt.setString(i++,"11111111111");//UserID	
				
				Log.debug("-->Mapping parameter Okay.");	
				isInsert = clbstmt.execute();				
				Log.debug("-->Execute INSERT_PURCHASE successfully. :"+isInsert);		    				
				
				//**************************************************************
				Log.debug("-->Start Insert INSERT_PURCHASE_ITEMS.");
				it=list.iterator();
	        	while(it.hasNext()){
	        		i = 1;
	        		prod =(ProductBean)it.next();	        		
	        		//Insert to DB
					clbstmt = conn.prepareCall("{call "+INSTANT_DB_NAME+".INSERT_PURCHASE_ITEMS(?,?,?,?)}");
					clbstmt.setString(i++,invoiceId);				    
					clbstmt.setString(i++,prod.getProductId());	//p_productId	
					clbstmt.setInt(i++,prod.getProductItem());	
					clbstmt.setFloat(i++,prod.getPriceSale());	
					
					Log.debug("-->Mapping parameter Okay.");	
					isInsItem = clbstmt.execute();				
					Log.debug("-->INSERT_PURCHASE_ITEMS successfully. :"+isInsItem);		
	        	}
	        	//**********************************************************************
/*	        	CREATE PROCEDURE db_merchant.`INSERT_PURCHASE`(
	        			IN p_Id varchar(12),
	        			IN p_total_unit  int,
	        			IN p_total_price  float,
	        			IN p_supp_id    varchar(12),
	        			IN p_usr_id  varchar(12)*/
	        	
/*	        	CREATE PROCEDURE db_merchant.`INSERT_PURCHASE_ITEMS`(
	        			IN p_voiceId varchar(12),
	        			IN p_Id varchar(12),
	        			IN p_unit  int,
	        			IN p_price  float 
	        			)*/	        
	        	
	        	Log.debug("-->Update Product.");
	        	it=list.iterator();
	        	while(it.hasNext()){
	        		i = 1;
	        		prod =(ProductBean)it.next();	        		

		        	Log.debug("-->Before Insert.");					
					//Insert to DB
					clbstmt = conn.prepareCall("{call "+INSTANT_DB_NAME+".UPDATE_PRODUCT_BY_PURCHASE(?,?,?,?)}");
					clbstmt.setString(i++,prod.getProductId());				    
					clbstmt.setFloat(i++,prod.getPriceCost());	
					clbstmt.setFloat(i++,prod.getPriceSale());	
					clbstmt.setInt(i++,prod.getProductItem());
					
					Log.debug("-->Mapping parameter Okay.");	
					isUpdProduct = clbstmt.execute();					    				
		        	Log.debug("-->Update product successfully .:"+isUpdProduct);
	        	}
/*	        	CREATE PROCEDURE db_merchant.`UPDATE_PRODUCT_BY_PURCHASE`(
	        			IN p_id  varchar(12),
	        			IN p_cost   float,
	        			IN p_sale   float,
	        			IN p_item     int(7) 
	        			)
	        	*/
	        	
	        	if(!isInsert && !isInsItem && !isUpdProduct){
	        		isResult = false;
	        		Log.debug("-->Update product successfully .");
	        	}else{
	        		isResult = true;
	        		Log.debug("-->Update product not successfully .");
	        	}
				
	        	//**************************************************************
	        	Common.commitTransaction(conn);
				Log.debug("-->commit successfully.");				
		}catch(Exception e){
			isResult = true;
			e.fillInStackTrace();
			Log.debug("Insert Exception e:"+e.toString());
			//try{
			Common.rollbackTransaction(conn);
			//}catch(Exception ex){}
		}finally{
			try {
				if(clbstmt!=null)
					clbstmt.close();
				if(conn!=null)
					conn.close();
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//*******Return*********
		return isResult;//#End
	}

	public boolean updateTransPurchase(PaymentBean obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	
}
