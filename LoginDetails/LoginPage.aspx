<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="SocietyManagementSystem.LoginDetails.LoginPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../screen.css" type="text/css" media="screen" title="default" />
<!--  jquery core -->
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>

<!-- Custom jquery scripts -->
     <script src="js/custom_jquery.js" type="text/javascript"></script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
    <script src="js/jquery.pngFix.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () { $(document).pngFix(); });
    </script>
</head>
<body>
<form id="form1" runat="server">
    &nbsp;<!-- Start: login-holder --><div id="login-holder">

	<!-- start logo -->
	<div id="logo-login">
		<a href=""><img src="" width="156" height="40" 
            alt="" /></a>
	</div>
	<!-- end logo -->
	
	<div class="clear"></div>
	
	<!--  start loginbox ................................................................................. -->
	<div id="loginbox">
	
	<!--  start login-inner -->
	<div id="login-inner">
		
		<asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" 
            RememberMeText="Check Me If Admin " TitleText="" Width="305px">
            <CheckBoxStyle CssClass="login-check" />
            <LoginButtonStyle CssClass="submit-login" />
            <TextBoxStyle CssClass="login-inp" />
        </asp:Login>
	</div>
 	<!--  end login-inner -->
	<div class="clear"></div>
	
 </div>
 <!--  end loginbox -->
 </div>
    
</form>
</body>
</html>
