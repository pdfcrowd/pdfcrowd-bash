all dist clean:

TEST_HTML='<html><body>Uploaded content!</body></html>'
test:
	@./pdfcrowd.sh http://www.web-to-pdf.com -show-curl-cmd -no-config -out ../test_files/out/sh_client_uri.pdf
	@./pdfcrowd.sh ../test_files/in/simple.html -use-ssl -show-curl-cmd -no-config -out ../test_files/out/sh_client_upload.pdf
	@echo "$TEST_HTML" | ./pdfcrowd.sh - -no-config -out ../test_files/out/sh_client_content.pdf
	@./pdfcrowd.sh @ -show-curl-cmd -no-config


