all dist clean:

TEST_HTML='<html><body>Uploaded content!</body></html>'
COMMON := -show-curl-cmd -no-config

.PHONY: test
test:
	@./pdfcrowd.sh http://www.web-to-pdf.com $(COMMON) -out ./out/sh_client_uri.pdf
	@./pdfcrowd.sh ../test_files/in/simple.html -use-ssl $(COMMON) -out ./out/sh_client_upload.pdf
	@echo "$TEST_HTML" | ./pdfcrowd.sh - $(COMMON) -out ./out/sh_client_content.pdf
	@./pdfcrowd.sh @ $(COMMON)


