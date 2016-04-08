PHP PDF libraries
=================

Zend_Pdf
--------

It's ok, but I think there must be better out there.

Biggest annoyances were:

 - X and Y text placement only (hard for wrapping text)
 - No auto page breaking
 - When importing another PDF to write on top of it, you cannot mix and match different ones. This makes it hard to say grab a 'first page' template, add a bunch of 'normal' templates, and close with a 'footer' template, all from different PDF files.

FPDF
----

http://www.fpdf.org/

Very old and seems popular. However seems limited - x and y text placing only, etc. No unicode support. Seems to have died.

FPDI
----

http://www.setasign.de/products/pdf-php-solutions/fpdi/

A tool for taking existing PDFs and putting them into FPDF (or even TCPDF)

Html2Fpdf
---------

http://html2fpdf.sourceforge.net/

Seems a little dodgy? Might be ok for real simple stuff.

DomPdf
------

http://code.google.com/p/dompdf/

A better looking HTML to PDF app. I would try this over html2fpdf for sure.

TCPDF
-----

http://sourceforge.net/projects/tcpdf/files/

Enhanced version of FPDF.

Has text wrapping, auto page breaking. Importing of PDF can be done using FPDI.

Still quite hard to use. Importing fonts is difficult. Function calls and parameters are horrible.
