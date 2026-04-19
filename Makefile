.PHONY: all clean techlead manager

# Build both versions
all: techlead manager

# Build Tech Lead version
techlead:
	@echo "Building Tech Lead version..."
	@echo '\managerfalse\input{john-stamp-resume.tex}' > build-wrapper-techlead.tex
	@pdflatex -interaction=nonstopmode -jobname=john-stamp-resume-techlead build-wrapper-techlead.tex > /dev/null 2>&1 || true
	@pdflatex -interaction=nonstopmode -jobname=john-stamp-resume-techlead build-wrapper-techlead.tex > /dev/null 2>&1 || true
	@if [ -f john-stamp-resume-techlead.pdf ]; then echo "✓ john-stamp-resume-techlead.pdf created"; else echo "✗ Failed to create tech lead PDF"; exit 1; fi

# Build Engineering Manager version
manager:
	@echo "Building Engineering Manager version..."
	@echo '\managertrue\input{john-stamp-resume.tex}' > build-wrapper-manager.tex
	@pdflatex -interaction=nonstopmode -jobname=john-stamp-resume-manager build-wrapper-manager.tex > /dev/null 2>&1 || true
	@pdflatex -interaction=nonstopmode -jobname=john-stamp-resume-manager build-wrapper-manager.tex > /dev/null 2>&1 || true
	@if [ -f john-stamp-resume-manager.pdf ]; then echo "✓ john-stamp-resume-manager.pdf created"; else echo "✗ Failed to create manager PDF"; exit 1; fi

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	@rm -f *.aux *.log *.out build-wrapper-*.tex
	@echo "✓ Clean complete"

# Clean everything including PDFs
distclean: clean
	@rm -f john-stamp-resume-techlead.pdf john-stamp-resume-manager.pdf
	@echo "✓ All generated files removed"
