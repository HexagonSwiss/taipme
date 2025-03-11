<%@page import="org.apache.log4j.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.lang.reflect.*"%>
<%@page import="org.apache.log4j.helpers.*"%>

<%! 
		public final static String HASHEDPASSWORD="{SHA}6S2mUqxsYYO706FS8FZQyl3aWuQ=";
		public final static String HASHEDPASSWORDSESSIONKEY = "logAdminConsole.hashedPassword.sha";
		
		public boolean isAttached(Category logger, Appender appender) 
		{
			boolean attached = logger.isAttached(appender);
			if(!attached && logger.getAdditivity() && logger.getParent()!=null)
				attached = isAttached(logger.getParent(),appender);
			return attached;
		}
		

    public String hashValue(String value) throws Exception
    {
  	  java.security.MessageDigest messagedigest = java.security.MessageDigest.getInstance("SHA-1");
      messagedigest.update(value.trim().getBytes());
      byte abyte0[] = messagedigest.digest();
      String valueEnc =  org.apache.commons.codec.binary.Base64.encodeBase64String(abyte0);
      valueEnc = "{SHA}" + valueEnc;

     	return valueEnc;     
 	 	}
 	 	
 	 	
 	 	
 	 	private Map appenderMap = null;
 	 	private void initAppenderMap() throws Exception
 	 	{
 	 		appenderMap = new HashMap();
 	 		Logger infoAppenderLog = LogManager.getLogger("infoAppenders");
 	 		if(infoAppenderLog!=null && infoAppenderLog.getLevel()!=null)
 	 		{
				Enumeration enumer = infoAppenderLog.getAllAppenders();
				while(enumer.hasMoreElements())
				{
					Appender appender = (Appender) enumer.nextElement();
					if(!appenderMap.containsKey(appender.getName()))
						appenderMap.put(appender.getName(),appender);
				}
			}
			else
			{
				List allLoggers = getAllLoggers(false);
				Iterator iter = allLoggers.iterator();
				while(iter.hasNext())
				{
					Logger logger = (Logger) iter.next();
					Enumeration enumer = logger.getAllAppenders();
					while(enumer.hasMoreElements())
					{
						Appender appender = (Appender) enumer.nextElement();
						if(!appenderMap.containsKey(appender.getName()))
							appenderMap.put(appender.getName(),appender);
					}					
				}
			}
 	 	}
 	 	
 	 	public Collection getAllAppenders() throws Exception
 	 	{
 	 		if(appenderMap==null)
 	 			initAppenderMap();
 	 		return appenderMap.values();
 	 	}		
 	 	
 	 	public Appender getAppender(String appenderName) throws Exception
 	 	{
 	 		if(appenderMap==null)
 	 			initAppenderMap();
 	 		return (Appender)appenderMap.get(appenderName);
 	 	}		
 	 	
 	 	public List getAllLoggers(boolean considerAll) throws Exception
 	 	{
			Enumeration allLogs = LogManager.getCurrentLoggers();
			List allLogsList = new ArrayList();
			while(allLogs.hasMoreElements())
			{
				Logger logger = (Logger)allLogs.nextElement();
				if(considerAll || logger.getLevel()!=null)
					if(!"infoAppenders".equals(logger.getName()))
						allLogsList.add(logger);
			}
			allLogsList.add(0,LogManager.getRootLogger());
			return allLogsList; 	 	
 	 	}
 	 	
 	 	public static String formatNull(String s)
 	 	{
 	 		return s==null?"-":s;
 	 	}		
 	 	
 	 	
/*
 * Copyright 2002 by Mark A. Kobold The contents of this file are subject to the Mozilla Public License Version 1.1 (the
 * "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT
 * WARRANTY OF ANY KIND, either express or implied. See the License for the specific language governing rights and
 * limitations under the License. The Original Code is iSQL-Viewer, A Mutli-Platform Database Tool. The Initial
 * Developer of the Original Code is Markus A. Kobold. Portions created by Mark A. Kobold are Copyright (C) Copyright
 * (C) 2000 Mark A. Kobold. All Rights Reserved. Contributor(s): Mark A. Kobold <mkobold@sprintpcs.com> .
 * Contributor(s): all the names of the contributors are added in the source code where applicable. If you didn't
 * download this code from the following link, you should check if you aren't using an obsolete version:
 * http://isql.sourceforge.net/
 */ 	 	
    /**
     * Converts a long number representing bytes into human readable format.
     * <p>
     * This value is mainly for formating values like a file size, memory size
     * and so forth, so instead of seeing a large incoherent number you can see
     * something like '308.123KB' or '9.68MB'
     * @param bytes to format into a string.
     * @return human readable format for larger byte counts.
     */
    public static String getHumanReadableSize(long bytes) {

        long mb = (long) Math.pow(2, 20);
        long kb = (long) Math.pow(2, 10);
        long gb = (long) Math.pow(2, 30);
        NumberFormat nf = NumberFormat.getNumberInstance();
        nf.setMaximumFractionDigits(3);
        double relSize = 0.0d;
        long abytes = Math.abs(bytes);
        String id = "";
        if ((abytes / gb) >= 1) {
            relSize = (double) abytes / (double) gb;
            id = "GB";
        } else if ((abytes / mb) >= 1) {
            relSize = (double) abytes / (double) mb;
            id = "MB";
        } else if ((abytes / kb) >= 1) {
            relSize = (double) abytes / (double) kb;
            id = "KB";
        } else {
            relSize = abytes;
            id = "bytes";
        }
        return nf.format((bytes < 0 ? -1 : 1) * relSize) + " "+id;
    } 	 	
    
    
		public static String stackTraceToString(Throwable e)
		{
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			PrintStream ps = new PrintStream(baos);
			e.printStackTrace(ps);
			ps.flush();
			String string = baos.toString();
			ps.close();
			baos = null;
			return string; 
		}    
    
		public static String stringToHTMLString(String string) {
		    StringBuffer sb = new StringBuffer(string.length());
		    // true if last char was blank
		    boolean lastWasBlankChar = false;
		    int len = string.length();
		    char c;
		
		    for (int i = 0; i < len; i++)
		        {
		        c = string.charAt(i);
		        if (c == ' ') {
		            // blank gets extra work,
		            // this solves the problem you get if you replace all
		            // blanks with &nbsp;, if you do that you loss 
		            // word breaking
		            if (lastWasBlankChar) {
		                lastWasBlankChar = false;
		                sb.append("&nbsp;");
		                }
		            else {
		                lastWasBlankChar = true;
		                sb.append(' ');
		                }
		            }
		        else {
		            lastWasBlankChar = false;
		            //
		            // HTML Special Chars
		            if (c == '"')
		                sb.append("&quot;");
		            else if (c == '&')
		                sb.append("&amp;");
		            else if (c == '<')
		                sb.append("&lt;");
		            else if (c == '>')
		                sb.append("&gt;");
		            else if (c == '\n')
		                // Handle Newline PATCH: questo non serve all'interno del textArea
		                //sb.append("&lt;br/&gt;");
		                ;
		            else {
		                int ci = 0xffff & c;
		                if (ci < 160 )
		                    // nothing special only 7 Bit
		                    sb.append(c);
		                else {
		                    // Not 7 Bit use the unicode system
		                    sb.append("&#");
		                    sb.append(new Integer(ci).toString());
		                    sb.append(';');
		                    }
		                }
		            }
		        }
		    return sb.toString();
		}    
 	 	
%>
