all dist:

TEST_HTML='<html><body>Uploaded content!</body></html>'
COMMON := -show-curl-cmd -no-config
OUT := ./test_files/out

.PHONY: test
test:
	@./pdfcrowd.sh http://www.web-to-pdf.com $(COMMON) -out $(OUT)/sh_client_uri.pdf
	@./pdfcrowd.sh ../test_files/in/simple.html -use-ssl $(COMMON) -out $(OUT)/sh_client_upload.pdf
	@echo "$TEST_HTML" | ./pdfcrowd.sh - $(COMMON) -out $(OUT)/sh_client_content.pdf
	@echo '<div style="background-color:red;height:100%">4 margins</div>' | \
	    ./pdfcrowd.sh - $(COMMON) -margins 0.25in 0.5in 0.75in 1.0in -out $(OUT)/sh_4margins.pdf

	@./pdfcrowd.sh @ $(COMMON)

init:
	test -d ../test_files/out || mkdir -p ../test_files/out
	test -e test_files || ln -s ../test_files/ test_files

clean:
	rm -rf $(OUT)/sh_*.pdf


