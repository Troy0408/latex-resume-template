# 强制重新检查可选照片，以便新增、删除或切换图片时也能刷新输出。
.PHONY: all zh_CN clean
all: zh_CN

zh_CN:
	latexmk -g -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=build -jobname=resume resume-zh_CN.tex

clean:
	latexmk -C -xelatex -outdir=build -jobname=resume resume-zh_CN.tex
