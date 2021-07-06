FROM rstudio/plumber

COPY . .

EXPOSE 8080

CMD ["Rscript", "R/run_api.R"]
