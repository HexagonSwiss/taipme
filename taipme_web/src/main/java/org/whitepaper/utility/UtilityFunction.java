
package org.whitepaper.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.lang.RandomStringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;

public class UtilityFunction {
	public UtilityFunction() { }

	
	private static SimpleDateFormat defaultDateFormat = new SimpleDateFormat("dd MMMM yyyy HH:mm", Locale.ITALY); 
	private static SimpleDateFormat defaultDateFormatNoOra = new SimpleDateFormat("dd-MM-yyyy", Locale.ITALY);

	public static boolean isFieldBlank(String value ){
		return ( null == value ||  value.trim().length()==0 ) ;    
	}

	public static boolean isFieldBlank(Object value ){
		boolean isBlank = true ;
		if( null != value ){
			isBlank = false ;
			if(value  instanceof String) {
				isBlank = isFieldBlank((String)value) ;    
			}
		}
		return isBlank ;
	}

	public static  String generateString(){
		int length = 10;
		boolean useLetters = true;
		boolean useNumbers = false;
		String generatedString = RandomStringUtils.random(length, useLetters, useNumbers);
		return generatedString ;
	}
	
	 public static Date getCurrentDate() throws ParseException {
   	   
	   java.util.Date date = new java.util.Date();
   	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   	   String sysDate = sdf.format(date);   
   	   
   	   java.util.Date out = sdf.parse(sysDate);
   	   java.util.Date dateOut = new Date(out.getTime());
   	   return dateOut;   	   
     }
	 
	 public static Date fromStringToDate(String str, String pattern) throws ParseException {
         java.util.Date out = null;
         java.util.Date dateOut = null;
         SimpleDateFormat sdf = new SimpleDateFormat(pattern);

         if (str != null && str.length()>0 ) {
             out = sdf.parse(str);
             dateOut = new Date(out.getTime());
         }
         return dateOut;
     }
     
	
	public static Calendar getTodayDate() {
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		//Date todayDate = today.getTime();
		return today;
	}	
	
	
	
	
    //restituisce la data nel formato per la jsp
	public static String getDataViewNoOra(Date dataIn)  {
    	  
    	if ( null==dataIn )
    		return null;
    	
        String strDate = defaultDateFormatNoOra.format(dataIn);         
    	return strDate;
    }
	
	//restituisce la data nel formato stringa in input
	public static String getDataView(Date dataIn, String typeFormat)  {
  	  
    	if ( null==dataIn )
    		return null;
    	SimpleDateFormat theDateFormat = new SimpleDateFormat(typeFormat, Locale.ITALY);
        String strDate = theDateFormat.format(dataIn);         
    	return strDate;
    }	
	
	public static String getTimestampShort(Date dataIn)  {
  	  
    	if ( null==dataIn )
    		return null;
    	
    	SimpleDateFormat defaultDateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm", Locale.ITALY);    	
        String strDate = defaultDateFormat.format(dataIn);         
    	return strDate;
    }
	
	
	public static Date stringToDate(String s, String typeFormat){

	    Date result = null;
	    try{
	        SimpleDateFormat dateFormat = new SimpleDateFormat(typeFormat);
	        result  = dateFormat.parse(s);
	    }

	    catch(ParseException e){
	        e.printStackTrace();
	    }
	    return result ;
	}	
	
	
	
	//rimuove tutti i tag html tranne il new line
	public static String noHtmlWithBr(String text) {
		
		if ( isFieldBlank(text) )
			return text;
				
		//return text.replaceAll("(<[^>]+>)|(&[^;]+;)","");
		
		Document jsoupDoc = Jsoup.parse(text);
		Document.OutputSettings outputSettings = new Document.OutputSettings();
		outputSettings.prettyPrint(false);
		jsoupDoc.outputSettings(outputSettings);
		jsoupDoc.select("br").before("\\n");
		jsoupDoc.select("p").before("\\n");
		String str = jsoupDoc.html().replaceAll("\\\\n", "\n");
		String strWithNewLines = Jsoup.clean(str, "", Whitelist.none(), outputSettings);		
		return strWithNewLines;
	}

	
	
	
	
}
