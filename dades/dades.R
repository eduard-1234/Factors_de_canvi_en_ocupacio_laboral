library(readxl)
bd_original<-read.csv("bd_original.csv",header=TRUE, sep=',')

# Agafem una mostra aleatòria de la base de dades original
set.seed(123)
bd<- bd_original[sample(nrow(bd_original), 5000), ]

# Agreguem la variable textual a la base de dades
library(readr)
opinio <- read_delim("opinions_empleats.csv", delim = ",",
                     show_col_types = FALSE)
set.seed(123)
opinio<- opinio[sample(nrow(opinio), 5000), ]
bd<- cbind(bd, opinio$pros)
colnames(bd)[colnames(bd) == "opinio$pros"] <- "pros"

# Nombre total de files
(n<-nrow(bd))
## [1] 5000
# Nombre total de columnes
(m<-ncol(bd))
## [1] 19
# Nombre total de registres de la matriu
(nxm<-nrow(bd)*ncol(bd))
## [1] 95000
# Nombre total de missings
(na<-sum(is.na(bd)))
## [1] 0
# Percentatge de missings respecte el total
(percent_na<-(na/nxm)*100)
## [1] 0
# Nombre de missings per variable
num_na_variables <- colSums(is.na(bd))
library(knitr)
kable(num_na_variables, col.names = c("Variable", "NOMBRE Missings"))

hist(num_na_variables, main="Histograma del nombre de missings en cada
variable")
