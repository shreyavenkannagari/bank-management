<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Admin Registration status</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-chunkfive.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style12 {
	color: #000000;
	font-weight: bold;
}
.style13 {color: #000000}
.style10 {color: #FF00FF;
	font-weight: bold;
}
.style30 {color: #FF00FF}
.style34 {color: #6699FF;
	font-weight: bold;
}
.style35 {color: #FF0000}
.style36 {color: #0000FF; font-weight: bold; }
.style38 {color: #FF0000; font-weight: bold; }
.style18 {font-size: 16px;
	color: #00CC00;
}
.style41 {	color: #009900;
	font-size: 14px;
	font-weight: bold;
}
.style39 {color: #0000FF; font-weight: bold; font-size: 14px; }
.style40 {font-size: 14px}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html"><span></span></a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>Home Page</span></a></li>
          <li><a href="index.html"><span>logout</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="article">
        <h2 class="style30"> Admin Registration Status.. </h2>
        <div class="clr"></div>
        <div class="clr"></div>
        <label for="name">
        <%@ include file="connect.jsp" %>
        <%@ page import="java.io.*" %>
        <%@ page import="java.util.*" %>
        <%@ page import="com.oreilly.servlet.*" %>
        <%
			       
					
				    ArrayList list = new ArrayList();
					
					ServletContext context = getServletContext();
					
					String dirName =context.getRealPath("images/");
					
					String paramname=null,bank="",uname="",pass="",email="",mno="",addr="",dob="",gender="",pincode="",location="",image=null,cloud=null,bin = "";
				
					FileInputStream fs=null;
					
					File file1 = null;	
					
					try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024);	
						
						Enumeration params = multi.getParameterNames();
						
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							
							if(paramname.equalsIgnoreCase("userid"))
							{
								uname=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("pass"))
							{
								pass=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("email"))
							{
								email=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("mobile"))
							{
								mno=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("address"))
							{
								addr=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("dob"))
							{
								dob=multi.getParameter(paramname);
							} 
							if(paramname.equalsIgnoreCase("gender"))
							{
								gender=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("bank"))
							{
								bank=multi.getParameter(paramname);
							}
							
						}
							
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath("images\\"+image);
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
								while ((i = fis.read()) != -1) 
								{
									if (i != -1)
									 {
										//System.out.println(i);
										String hex = Integer.toHexString(i);
										// session.put("hex",hex);
										sb1.append(hex);
										
									
										String binFragment = "";
										int iHex;
			 
										for(int i1= 0; i1 < hex.length(); i1++)
										{
											iHex = Integer.parseInt(""+hex.charAt(i1),16);
											binFragment = Integer.toBinaryString(iHex);
			
											while(binFragment.length() < 4)
											{
												binFragment = "0" + binFragment;
											}
											bin += binFragment;
							
						                }
									}	
									
								}
								
							}		
						}
						
						if(uname.equals("")||pass.equals("")||email.equals("")||mno.equals("")||addr.equals("")||dob.equals("")||gender.equals("--Select--")||bank.equals("Select"))
						{
								  %>
        <p>&nbsp;</p>
        <p align="center" class="style40">&nbsp;</p>
        <p align="center" class="style40"><span class="header_01 style37"><strong>Please Enter All Values..</strong></span></p>
        <div class="sidebar">
          <div class="searchform">
            <form id="formsearch" name="formsearch" method="post" action="">
              <span>
              <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
              </span>
              <input name="button_search" src="images/search.gif" class="button_search" type="image" />
            </form>
          </div>
          <div class="clr"></div>
          <div class="gadget">
            <h2 class="star"><span>Sidebar</span> Menu</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="style13"><a href="index.html">Home</a></li>
              <li class="style13"><a href="index.html">Logout</a></li>
              <li><span class="style13"><a href="UserProfile.jsp"></a></span></li>
              <li></li>
            </ul>
          </div>
        </div>
        <p align="center"><a href="AdminRegister.jsp" class="style39">Back</a></p>
        <%
								  
						 }
						else
						{
								FileInputStream fs1 = null;
								String query1="select * from admin  where username='"+uname+"' and bank='"+bank+"'"; 
								Statement st1=connection.createStatement();
								ResultSet rs1=st1.executeQuery(query1);
										
								if ( rs1.next() )
							   {
										%>
        </p>
        </label>
        </span>
        <p align="center" class="style37 style18 style40">&nbsp;</p>
        <p align="center" class="style37 style18 style40"><strong>Vendor Name Already Exist..</strong></p>
        <p align="center"><a href="AdminRegister.jsp" class="style39">Back</a></p>
        <%
										
								}
								else
								{
					   
					   
			PreparedStatement ps=connection.prepareStatement("insert into admin(bank,username,password,email,mobile,address,dob,gender,image) values(?,?,?,?,?,?,?,?,? )");
						ps.setString(1,bank);
						ps.setString(2,uname);
						ps.setString(3,pass);
						ps.setString(4,email);	
						ps.setString(5,mno);
						ps.setString(6,addr);
						ps.setString(7,dob);
						ps.setString(8,gender);
				
						ps.setBinaryStream(9, (InputStream)fs, (int)(file1.length()));	
				       
						
						if(f == 0)
							ps.setObject(9,null);
						else if(f == 12)
						{
							fs1 = (FileInputStream)list.get(0);
							ps.setBinaryStream(9,fs1,fs1.available());
						}	
						int x=ps.executeUpdate();
						if(x>0)
						{
						%>
        <br/>
        <p align="center" class="style41">&nbsp;</p>
        <p align="center" class="style41">Registration Successfull..</p>
        <p align="center"><a href="index.html" class="style39">Back</a>
            <%
			
					}}}}
					catch (Exception e) 
					{
						out.println(e.getMessage());
					}
			%>
        </p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize"></div>
  </div>
  <div class="footer">
</body>
</html>
