library(AzureStor)
f = glue::glue
# https://portal.azure.com/#home

# conexao com o storage ---------------------------------------------------
storage_account_name = "asnrocksstorage"
# Sys.setenv(STORAGE_ACCOUNT_KEY = "3bkVIAIKjHPT2P/12JHlRlTHy+uhYqSbdjEw8ECs4/gcDRo1Q0cqWmrH5sU3XWTE0OBidA==")
# system("setx STORAGE_ACCOUNT_KEY 3bkVIAIKjHPT2P/12JHlRlTHy+uhYqSbdjEw8ECs4/gcDRo1Q0cqWmrH5sU3XWTE0OBidA==")
key = Sys.getenv('STORAGE_ACCOUNT_KEY')
blob_con = blob_endpoint(
  endpoint = f("https://{storage_account_name}.blob.core.windows.net/"),
  key = key
)

# criacao/conexao com o blob container ------------------------------------
list_storage_containers(blob_con)
container_name = "data"
container_client = tryCatch(
  expr = {
    create_blob_container(blob_con, name = container_name)
  },
  error = function(e) {
    blob_container(blob_con, name = container_name)
  }
)

list_blobs(container_client)

# upload de arquivos no blob container ------------------------------------
storage_write_csv(mtcars, container_client, file = "mtcars.csv")

download.file("https://avatars.githubusercontent.com/u/1925102", "prof_athos.png", method = "curl")
storage_upload(container_client,  "../../Downloads/prof_athos.png", "prof_athos.png")
storage_upload(container_client,  "data/auto.xlsx", "auto.xlsx")

# download de um arquivo do blob container --------------------------------
storage_download(container_client,  "auto.xlsx", "data/auto.xlsx", overwrite = TRUE)
library(readxl)
auto = read_excel("data/auto.xlsx")

# faz download e carrega -----------------------------------------------
storage_download(container_client,  "models/auto_model_2022-10-04--17-31-38.rds", "data/models/auto_model_2022-10-04--17-31-38.rds", overwrite = TRUE)
model1 = readRDS("data/models/auto_model_2022-10-04--17-31-38.rds")

# carrega direto -------------------------------------------------------
model2 = storage_load_rds(container_client, "models/auto_model_2022-10-04--17-31-38.rds")

library(tidymodels)
predict(model2, auto)

# RDS ------------------------------------------------------------------
x = 2+2

# no R normal ----
saveRDS(x, "data/x.rds")
x_teste = readRDS("data/x.rds")

# no Azure Store -----
storage_save_rds(x, container_client, "x.rds")
x_test = storage_load_rds(container_client, "x.rds")











