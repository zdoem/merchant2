package com.test.test;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import com.ipro.dao.service.Common;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;


public class TestReport1 {
	static{
		String dataSource = "jdbc/Datasource_merchant";
		//Common.setConfigForConnectionPool("", dataSource);		
		/*Common.setConfig(host, port, dns, usr, pwd);*/
		Common.setConfig("localhost", "3306", "db_merchant", "root", "root", "");
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		JasperReport jasperReport;
		JasperPrint jasperPrint;
		JasperDesign jasperDesign;
		Connection conn = null;
		
		Map param= new HashMap();
		param.put("INVOICE_ID", "25550606001");
		try {
				
		               // โหลดไฟล์ jrxml
			 conn = Common.open();
			//jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("\\")+"rptInvoice2.jrxml");
			jasperDesign = JRXmlLoader.load("D://temp//_REPORT4//rptInvoice2x.jrxml");
		
	                    // คอมไพล์ report จะได้ไฟล์ report3.jasper
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
	                    // ส่ง parameters กับ connection ของ database ให้ jasper ทำการ fill report
			jasperPrint = JasperFillManager.fillReport(jasperReport,param,conn);
	                    // export report ออกไปเป็นไฟล์ demo.pdf
			JasperExportManager.exportReportToPdfFile(jasperPrint,"D:/demoM.pdf");
			
			//build & display example preview printing
			JasperViewer jvw = new JasperViewer(jasperPrint,false);
			jvw.setVisible(true);
			
		}catch (JRException e) {
			e.printStackTrace();
		}

	    	
		finally{
			if (conn != null){
				try {conn.close();} 
				catch (Exception ignored) {}
			}
		}

	}

}
