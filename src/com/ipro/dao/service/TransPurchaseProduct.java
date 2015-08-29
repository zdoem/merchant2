package com.ipro.dao.service;

import java.util.ArrayList;
import java.util.List;
import com.ipro.model.bean.PaymentBean;

public interface TransPurchaseProduct {
	public ArrayList  FindListProduct(String id,String pName) throws Exception;
	public boolean insertTransPurchase(List list,String invoiceId) throws Exception;
	public boolean updateTransPurchase(PaymentBean obj) throws Exception;
}
