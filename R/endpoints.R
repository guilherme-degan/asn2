source("funcoes.R")

#* Soma dois números
#* @get /soma
somar_dois_numeros <- function(a, b) {
  soma(as.numeric(a), as.numeric(b))
}


#* Padrao
#* @get /
function() {
  "O Cloud Run já tá atualizado"
}

# httr::GET("http://naoseioq.gcp.io/soma", query = list(a = 5, b = 10))

