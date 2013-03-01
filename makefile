all dist clean:

TEST_HTML='<html><body>Uploaded content!</body></html>'
COMMON := -show-curl-cmd -no-config

.PHONY: test
test:
	@./pdfcrowd.sh http://www.web-to-pdf.com $(COMMON) -out ./out/sh_client_uri.pdf
	@./pdfcrowd.sh ../test_files/in/simple.html -use-ssl $(COMMON) -out ./out/sh_client_upload.pdf
	@echo "$TEST_HTML" | ./pdfcrowd.sh - $(COMMON) -out ./out/sh_client_content.pdf
	@echo '<div style="background-color:red;height:100%">4 margins</div>' | \
	    ./pdfcrowd.sh - $(COMMON) -margins 0.25in 0.5in 0.75in 1.0in -out ./out/sh_4margins.pdf

	@./pdfcrowd.sh @ $(COMMON)

clean:
	rm -rf ./out/sh_*.pdf


