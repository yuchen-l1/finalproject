all: output/final_project_2.html

output/final_project_2.html: code/final_project_2.Rmd data/diabetes.csv
	Rscript -e "rmarkdown::render('code/final_project_2.Rmd', output_file='../output/final_project_2.html')"