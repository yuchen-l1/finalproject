# ------------------------------------------------------------------
#  Base image: R 4.3.2 + tidyverse + LaTeX tools via rocker/tidyverse
# ------------------------------------------------------------------
FROM rocker/tidyverse:4.3.2

# ------------------------------------------------------------------
#  Install system libraries required for building R packages
#  and for rendering RMarkdown documents
# ------------------------------------------------------------------
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------
#  Install TinyTeX so PDF output is possible (optional but safe)
# ------------------------------------------------------------------
RUN R -e "install.packages('tinytex'); tinytex::install_tinytex()"
ENV PATH="${PATH}:/root/bin"

# ------------------------------------------------------------------
#  Set working directory inside the container
# ------------------------------------------------------------------
WORKDIR /workspace

# ------------------------------------------------------------------
#  Copy only essential project files (never use `COPY . .`)
# ------------------------------------------------------------------
COPY renv.lock renv.lock
COPY code        code
COPY data        data

# ------------------------------------------------------------------
#  Restore R package environment from renv.lock
# ------------------------------------------------------------------
RUN R -e "install.packages('renv'); renv::restore()"

# ------------------------------------------------------------------
#  Entry point: render the main report to /output
#  with knit_root_dir set to /workspace so data/ paths resolve
# ------------------------------------------------------------------
ENTRYPOINT ["bash", "-c", "mkdir -p /output && Rscript -e \"rmarkdown::render('code/final_project_2.Rmd', output_dir='/output', knit_root_dir='/workspace')\""]