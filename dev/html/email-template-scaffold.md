HTML email template scaffold
============================

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<style type="text/css">
body{width:100%!important;margin:0;padding:0}
body,table,td,p,a,li,blockquote{-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%}
.ExternalClass,.ReadMsgBody{width:100%}
.ExternalClass,.ExternalClass p,.ExternalClass span,.ExternalClass font,.ExternalClass td,.ExternalClass div{line-height:100%}
#outlook a{padding:0}
img{-ms-interpolation-mode:bicubic;border:0;height:auto;line-height:100%;outline:none;text-decoration:none}
a img{border:none}
p{margin:1em 0}
table,td{border-collapse:collapse!important;mso-table-lspace:0;mso-table-rspace:0}
#backgroundTable{width:100%!important;line-height:100%!important;margin:0;padding:0}
</style>
</head>
<body leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" offset="0">
<center>
<table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" id="backgroundTable">
```

New tables:

```
<table cellpadding="0" cellspacing=”0” width=”xx”>
```

New cells:

```
<td width=”xxx” height=”xxx” align=”center”>
```

Avoid padding and margins - use extra tr/td rows with spacer gifs

Style embedders
---------------

http://premailer.dialect.ca/

This one looks interesting too (Downloadable PHP script)
http://www.pelagodesign.com/sidecar/emogrifier/

And this, with API:
http://inlinestyler.torchboxapps.com/
