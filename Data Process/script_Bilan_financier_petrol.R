#if("read" %in% rownames(installed.packages()) == FALSE) {install.packages("read")}


#library(readxl)
##import data
##read.table(sep=";",header=T, row.name=1)
#library(read)
myData <- read.csv("~/Téléchargements/Bilan financier groupes pétroliers.csv", row.names=1, header=T, sep=";")
#View(myData)
#myData <- read_excel("~/Téléchargements/Bilan financier groupes pétroliers.xlsx", sheet = "Feuil1", range = "B2:J18", col_names = TRUE, col_types = c("numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
n_col <- ncol(myData)

## nombre de ligne
n_row <- nrow(myData)

#la moyenne
moy <- summary(myData)

Xt <- t(moy)

var <- var(myData)

covariance <- cov(myData)

correlation <- cor(myData)

m <- rbind(1, n_col:0)[1,]

plot(myData$IMM, myData$EXP)

##ajout de noms
text(myData$IMM, myData$EXP, rownames(myData))

##Sauvegardage
png(filename = "immexp.png")
plot(myData$IMM, myData$EXP)
text(myData$IMM, myData$EXP, rownames(myData))
dev.off()



##correlation forte
#pairs(myData)

##Créer des données centrée

centre <- scale(myData, center = TRUE, scale = FALSE)

##Créer des données centrée reduite scale à true

centre_Reduit <- scale(myData, center = TRUE, scale = TRUE)

##La moyenne centre réduit
moy_cr <- summary(centre_Reduit)

##covariance cr
covariance_cr <- cov(centre_Reduit)

##correlation cr
correlation_cr <- cor(centre_Reduit)

##
centre_Reduit_eigen <- eigen(correlation_cr)

## Sauver
write.csv(centre_Reduit_eigen$vectors,file="centre_Reduit_eigen.csv")

##
myData_acp <- princomp(myData,cor=T,scores=T)

## La moyenne acp
myData_acp_moy <- summary(myData_acp)

#Valeur propres
val.propres <- myData_acp$sdev^2

## Le graphe
plot(1:8,val.propres,type="b")

##
princomp1<-myData_acp$loadings[,1]*myData_acp$sdev[1]
princomp2<-myData_acp$loadings[,2]*myData_acp$sdev[2]
corrc1c2<-cbind(princomp1, princomp2)

##
plot( princomp1, princomp2,xlim=c(-1,+1),ylim=c(-1,+1))
abline(h=0,v=0)
text(princomp1, princomp2,labels=colnames(myData))

##
plot(myData_acp$scores[,1],myData_acp$scores[,2])
text(myData_acp$scores[,1],myData_acp$scores[,2],labels=rownames(myData))
abline(h=0,v=0)

##
plot(myData_acp$scores[,1],myData_acp$scores[,3])
text(myData_acp$scores[,1],myData_acp$scores[,3],labels=rownames(myData))
abline(h=0,v=0)

##Test indépendance

