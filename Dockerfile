FROM r-base:4.1.0
WORKDIR /main
RUN R -e "options(repos = \
  list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2021-06-09/')); \
  install.packages('readr'); install.packages('ggplot2')"
CMD ["Rscript", "__main__.R"]

