all: refman.pdf

pdf: refman.pdf

refman.pdf: clean refman.tex
	pdflatex refman
	makeindex refman.tex
	pdflatex refman
	latex_count=5 ; \
	while egrep -s 'Rerun (LaTeX|to get cross-references right)' refman.log && [ $$latex_count -gt 0 ] ;\
	    do \
	      echo "Rerunning latex...." ;\
	      pdflatex refman ;\
	      latex_count=`expr $$latex_count - 1` ;\
	    done


clean:
	rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *.brf *.blg *.bbl refman.pdf
