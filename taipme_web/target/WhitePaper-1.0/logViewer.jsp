<%@include file="common.jsp" %>


<html>
	<style type="text/css">
	<!--
		BODY
		{
			background:white;
			font-size:14px;
			font-family:Verdana,Helvetica,sans-serif;
			text-align:center;
			color:black;
		}	
		.log
		{
			margin-top: 0px; 
			margin-right: auto; 
			margin-bottom: 0px; 
			margin-left: 0px;		
			font-size:10px;
		}			
		
	-->
  </style>
  
  <title>Log4j Console - Viewer</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
  <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
  <META HTTP-EQUIV="expires" CONTENT="-1">
  
<script>
function reload()
{
	var f = document.forms[0];
	f.action='logViewer.jsp';
	f.submit();
}

function donwloadLog()
{
	var f = document.forms[0];
	if(f.appenderName.value!=null && f.appenderName.value!='')
	{
		if(f.downloadOld!=null)
			f.downloadOld.value='false';			
		f.action='logDownload.jsp';
		f.submit();
	}
}

function donwloadOldLog()
{
	var f = document.forms[0];
	var name = f.oldFile.value;
	if(name!=null && name!='')
	{
		f.downloadOld.value='true';			
		f.action='logDownload.jsp';
		f.submit();
	}
}

function logout()
{
	var f = document.forms[0];
	f.actionToDo.value = 'logout';
	f.action='adminConsole.jsp';
	f.submit();
}

function aggiorna()
{
	var f = document.forms[0];
	f.action='logViewer.jsp';
	f.submit();
}

</script>  
  
</head>
<body>

<%
	//----------check login----------
	boolean logged = false;
	String hashedPassword = (String)session.getAttribute(HASHEDPASSWORDSESSIONKEY);
	if(!HASHEDPASSWORD.equals(hashedPassword))
	{
		request.getRequestDispatcher("adminConsole.jsp").forward(request, response);	
	}
	//----------end check login----------

String righe = request.getParameter("righe");
int rowsToShow = 50;
if(righe!=null)
	rowsToShow = Integer.parseInt(righe);

String appenderName = request.getParameter("appenderName");	
boolean appenderChoosen = appenderName!=null && appenderName.length()>0;

Collection allAppenders = getAllAppenders();
List fileAppenders = new ArrayList();
for(Iterator iter = allAppenders.iterator();iter.hasNext();)
{
	Appender anAppender = (Appender) iter.next();
	if(anAppender instanceof FileAppender)
		fileAppenders.add(anAppender);
}

FileAppender fileAppender = null;
File file = null;
File[] oldFiles = null;
String oldFile = request.getParameter("oldFile");

if(appenderChoosen)
{
	fileAppender = (FileAppender)getAppender(appenderName);
	
	String fileName = fileAppender.getFile();
	file = new File(fileName);
	final String realFileName = file.getName();
	
	if(RollingFileAppender.class.isInstance(fileAppender) || DailyRollingFileAppender.class.isInstance(fileAppender))
	{
		FilenameFilter filter = new FilenameFilter() {
			public boolean accept(File dir, String name) 
			{
				return name.startsWith(realFileName) && !name.equals(realFileName);
			}
		};	
		oldFiles = file.getParentFile().listFiles(filter);			
	 	oldFiles = oldFiles!=null&&oldFiles.length==0?null:oldFiles;
	}

}
%>

<p> Log Utilities: Log Viewer <a class="log" id="logoutLink" href="javascript:logout()">logout</a></p>

<form action="logViewer.jsp" method="post">

<input type="hidden" name="actionToDo" value="">

<div align=left>
<a href='adminConsole.jsp'>back to adminConsole</a>
<br>
<br>
Appender: 
<select name="appenderName" onChange="reload()">
		<option value="">selezionare..</option>
		<%for(int i=0;i<fileAppenders.size();i++) { %>
			<option value="<%=((FileAppender)fileAppenders.get(i)).getName()%>" <%=(((FileAppender)fileAppenders.get(i)).getName().equals(appenderName))?"selected":""%> >
				<%=((FileAppender)fileAppenders.get(i)).getName()%>
			</option>
		<% } %>
</select>
<br>

<% if(appenderChoosen) { %>

	Tipologia Appender: <%=fileAppender.getClass().getName()%>
	<br>
	Nome File: <%=file.getName()%> 
	&nbsp; <a class="log" href="javascript:donwloadLog()">download</a>
	<br>
	Dimensione: <%=getHumanReadableSize(file.length())%>
	<br>
	mostra le ultime 
	<input type=text name="righe" size=2 value="<%=rowsToShow%>" />
	righe del file di log
	&nbsp; <a class="log" href="javascript:aggiorna()">aggiorna</a>
	<br>
	<% if(oldFiles!=null) { %>
		<input type=hidden name="downloadOld" value="false" />
		File Precedenti:
		<select name="oldFile">
				<%for(int i=0;i<oldFiles.length;i++) { %>
					<option value="<%=oldFiles[i].getName()%>" <%=oldFiles[i].getName().equals(oldFile)?"selected":""%> >
						<%=oldFiles[i].getName()+" ("+getHumanReadableSize(oldFiles[i].length())+")"%>
					</option>
				<% } %>
		</select>	
		&nbsp; <a class="log" href="javascript:donwloadOldLog()">download</a>
		<br>
	<% } %>
	<hr>
	</div>
	</form>
	
	<div align=left class="log" style="overflow:scroll;width:100%;height:60%">
	<%
	
	if(file.exists() && file.length()>0)
	{
		//supponiamo che per per ogni riga da leggere ci siano circa 200 caratteri
		int charsToRead = 200*rowsToShow;
		if(file.length()<charsToRead)
			charsToRead = (int)file.length();
			
		//leggo il file, partendo dalla posizione che mi interessa
		RandomAccessFile raf = new RandomAccessFile(file, "r");
		long posToStart = raf.length() - charsToRead;
		byte[] bytes = new byte[charsToRead];
		raf.seek(posToStart);
		raf.readFully(bytes);
		raf.close();		
		
		//la stringa con i caratteri richiesti
		String s = new String(bytes);
		
		
		//conta le righe del pezzo che mi sono caricato
		int pos = -1;
		int lines = -1;
		while((pos=s.indexOf('\n',pos+1))!=-1)
			lines++;

		//mi posiziono alla prima delle righe richieste
		pos=-1;
		if(rowsToShow>lines)
			rowsToShow = lines;
		while(lines-->=rowsToShow)
			pos = s.indexOf('\n',pos+1);
		s = s.substring(pos+1);
			
		//mostro le righe richieste, sostituendo '\n' con '<br>'
		StringBuffer sb = new StringBuffer();
		pos=0;
		int pos2 = pos;
		while((pos2 = s.indexOf('\n',pos))!=-1)
		{
			sb.append(s.substring(pos,pos2)).append("<br>");
			pos = pos2+1;
		}
		
		//mostra la stringa con le linee
		out.println(sb.toString());

/*	QUESTA VERSIONE E' COMPATIBILE SOLO CON JAVA 1.4 O SUPERIORE	

		//conta le righe del pezzo che mi sono caricato
		java.util.regex.Matcher matcher = java.util.regex.Pattern.compile("\n").matcher(s);
		int lines = 0;
		while(matcher.find())
			lines++;
		
		//scarto le righe eccedenti rispetto a quelle richieste dall'utente
		matcher = java.util.regex.Pattern.compile("\n").matcher(s);
		boolean found = false;
		while(lines-->rowsToShow && (found = matcher.find()))
			;
		
		
		matcher = java.util.regex.Pattern.compile("\n").matcher(s.substring(found?matcher.start():0+1));
		out.println(matcher.replaceAll("<br>"));
*/		
	}
	
	%>
	</div>
	
<% } %>
	
</body>
</html>