package web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TransDate {
	
	public String toString(String str) {
		
		String date = null;
		
		try {
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyyMMdd");
			
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
			
			Date tempDate = beforeFormat.parse(str);
			
			date = afterFormat.format(tempDate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return date;
		
	}
	
	public String toString2(String str) {
		
		String date = null;
		
		try {
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyyMMdd");
			
			Date tempDate = beforeFormat.parse(str);
			
			date = afterFormat.format(tempDate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return date;
		
	}
	
	public String toString3(String str) {
		
		String date = null;
		
		try {
			
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyyMMdd");
			
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			Date tempDate = beforeFormat.parse(str);
			
			date = afterFormat.format(tempDate);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return date;
		
	}
	
	public Date toDate(String str) {
		
		Date tempDate = null;
		
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			
			tempDate = format.parse(str);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return tempDate;

	}
	
	public int interval(String str0, String str1) {
		
		Date format0 = null;
		Date format1 = null;
		try {
			format0 = new SimpleDateFormat("yyyyMMdd").parse(str0);
			format1 = new SimpleDateFormat("yyyyMMdd").parse(str1);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        long sec = (format1.getTime() - format0.getTime()) / 1000;
        long days = sec / (24*60*60);
        
        
        return Math.round(days);
        
	}
		
}

