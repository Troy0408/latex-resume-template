# 强制重新检查可选照片，以便新增、删除或切换图片时也能刷新输出。
.PHONY: all zh_CN preview clean
all: zh_CN

zh_CN:
	latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build -jobname=resume resume-zh_CN.tex

preview:
	latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build -jobname=preview examples/preview.tex
	cp build/preview.pdf examples/resume.pdf
	pdftoppm -singlefile -r 144 -png build/preview.pdf images/preview

clean:
	latexmk -C -xelatex -outdir=build -jobname=resume resume-zh_CN.tex
	latexmk -C -xelatex -outdir=build -jobname=preview examples/preview.tex
