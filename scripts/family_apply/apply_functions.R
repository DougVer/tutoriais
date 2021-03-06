rm(list=ls())

# cadastrando os produtos
produtos <- c("Macarr�o","Feij�o","Batata Frita","Bife","Leite",
                     "Farinha","Milho","Ervilha","Salm�o","Iorgute",
                     "Cerveja","A��car","Arroz","Tomate", "Alface",
                     "Mel�o","Banana","Queijo","Nescau","Sorvete")

set.seed(123)
precos <- runif(20, min = 2, max = 10)
vendas <- runif(20, min = 20, max = 100)
estoque <- sample(c(20:50), size = 20, replace = TRUE)
  
# cria��o de um dataset
dataset_loja <- data.frame(id_produto = c(1:20), produto = produtos, preco = precos, total_vendas = vendas, total_estoque = estoque)
dataset_loja

# apply

# vetor de colunas num�ricas
apply(X = dataset_loja[,-c(1,2)], MARGIN = 2, sum)

# lapply

# m�dia das vari�veis
lapply(dataset_loja[,-c(1,2)], mean)

# sapply

# mediana de cada vari�vel
sapply(dataset_loja[,-c(1,2)], median)


set.seed(123)
# cadastro de fornecedor
fornecedores <- sample(c("Fornecedor A","Fornecedor B","Fornecedor C", "Fornecedor D"), size = 20, replace = TRUE)
# novo dataset
dataset_loja <- data.frame(cbind(dataset_loja), fornecedor = fornecedores)

# m�dia de pre�o praticado para cada fornecedor
tapply(dataset_loja[,c("preco")], dataset_loja[,ncol(dataset_loja)], mean)

# vapply

# obter o resumo estat�stico das vari�veis
vapply(dataset_loja[,-c(1,2,ncol(dataset_loja))], FUN =  fivenum, 
       FUN.VALUE =  
       c(Min. = 0,
         "1stQu." = 0,
         Media = 0,
         "3rd Qu." = 0,
         Max = 0))
# se desejar comparar, descomente e execute o comando abaixo
# summary(dataset_loja[,-c(1,2,ncol(dataset_loja))])

# mapply
# multiplicando o pre�o pelo total de estoque e depois somando com total de vendas
mapply(FUN = function(x,y,z){(x*y)+z}, dataset_loja[,c("preco")], dataset_loja[,c("total_estoque")], dataset_loja[,c("total_vendas")])

# rapply
# estrutura do dataset
str(dataset_loja)

dataset_loja$preco <- as.integer(dataset_loja$preco)

# aplicando a fun��o a apenas um conjunto de vari�veis
rapply(dataset_loja[,-c(1,2, ncol(dataset_loja))], mean, classes = "integer")

