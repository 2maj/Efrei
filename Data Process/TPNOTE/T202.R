## <- read.csv("data.csv", row.names=1, header=T, sep=";",is.double(TRUE), dec = ".", allowEscapes=TRUE)

myData <- read.table("data.csv", header = TRUE, sep = ";", row.names=1)

## nombre de colonne
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

plot(myData$X.le.de.France, myData$Hauts.de.France)

##ajout de noms
text(myData$X.le.de.France, myData$Hauts.de.France, rownames(myData))

##Sauvegardage
png(filename = "ile_france_x_hauts_france.png")
plot(myData$X.le.de.France, myData$Hauts.de.France)
text(myData$X.le.de.France, myData$Hauts.de.France, rownames(myData))
dev.off()

##correlation forte
pairs(myData)

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


