<%@ page contentType="application/octet-stream" %>

<%@include file="common.jsp" %>

<% 	

	//----------check login----------
	boolean logged = false;
	String hashedPassword = (String)session.getAttribute(HASHEDPASSWORDSESSIONKEY);
	if(!HASHEDPASSWORD.equals(hashedPassword))
	{
		request.getRequestDispatcher("adminConsole.jsp").forward(request, response);	
	}
	//----------end check login----------


		String appenderName = request.getParameter("appenderName");
		if(appenderName==null)
			return;
		String downloadOld = request.getParameter("downloadOld");
		String oldLogFileName = null;
		if("true".equals(downloadOld))
		{
			//richiesto il download del vecchio file di log
			oldLogFileName = request.getParameter("oldFile");
			if(oldLogFileName==null || oldLogFileName.length()==0)
				return;
		}
		
		String fileName = null;
		File file = null;
		if (appenderName.contains("jboss")){
			String nomefile = appenderName +System.getProperty("file.separator")+"server.log";
			
			file = new File(nomefile);
			
		}
		else{
			Appender appender = getAppender(appenderName);
			if(appender==null)
				return;
			if(!(appender instanceof FileAppender))
				return;		
	
			
			
			if(oldLogFileName==null)
			{
				//file di log attuale
				
				FileAppender fileAppender = (FileAppender)appender;
				fileName = fileAppender.getFile(); 
				file = new File(fileName);
		
				try
				{
					//prova ad effetttuare il flush dell'outputStream che scrive il log, se ci riesce
					Field quietWriterField = WriterAppender.class.getDeclaredField("qw");
					quietWriterField.setAccessible(true);
					QuietWriter qw = (QuietWriter) quietWriterField.get(fileAppender);
					qw.flush();
				}
				catch(Exception e)
				{
					;
				}
			}
			else
			{
				//uno dei file di log precedenti
				FileAppender fileAppender = (FileAppender)appender;
				fileName = fileAppender.getFile(); 
				String dir = new File(fileName).getParent();
				fileName = oldLogFileName;
				file = new File(dir+System.getProperty("file.separator")+fileName);
			}

		}
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));

		String fileNameToShow = file.getName();
		if(!fileNameToShow.toUpperCase().endsWith(".LOG"))
			fileNameToShow += ".log";
		response.addHeader("Content-Disposition", "attachment; fileName=" + fileNameToShow);	 
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buffer = new byte[1024];
		int numRead = 0;
		while((numRead=bis.read(buffer))!=-1)
			bos.write(buffer,0,numRead);
		bos.flush();

%>