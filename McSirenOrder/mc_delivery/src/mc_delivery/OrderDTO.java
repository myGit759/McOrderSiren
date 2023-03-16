package mc_delivery;

import java.sql.Date;

//IDX      NOT NULL NUMBER 
//MEM_IDX           NUMBER 
//PRO_IDX           NUMBER 
//SALES    NOT NULL NUMBER 
//ORD_DATE          DATE

public class OrderDTO {
   private int idx;
   private int mem_idx;
   private int sales;
   private Date ord_date;
   
public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public int getMem_idx() {
	return mem_idx;
}
public void setMem_idx(int mem_idx) {
	this.mem_idx = mem_idx;
}
public int getSales() {
	return sales;
}
public void setSales(int sales) {
	this.sales = sales;
}
public Date getOrd_date() {
	return ord_date;
}
public void setOrd_date(Date ord_date) {
	this.ord_date = ord_date;
}
   
   
}
