#################################################
## Jared Studyvin
## 15 July 2016
## summarize the results from the weighted likelihood
#################################################
rm(list=ls())

library(plyr)

userPath <- '~/GoogleDrive/wind/fatality/areaCorrection/likelihoodAC/'
dataPath <- paste0(userPath,'data/')
outPath <- paste0(userPath,'output/')
codePath <- paste0(userPath,'code/')



source(paste0(codePath,'weightFun.R'))
##source(paste0(codePath,'weightedDistribution.R'))
##source(paste0(codePath,'getStartValue.R'))
source(paste0(codePath,'summaryFun.R'))


########################################
## gamma
########################################
## small
load(paste0(outPath,'WL/gammaSmallWL.Rdata'))
load(paste0(dataPath,'gammaSmall.Rdata'))
gammaTrue <- data.frame(plotType=c('RP','FULL'),A=c(sum(weightFun(1:100,type='RP')*diff(CDF(0:100,gammaParam,'gamma'))),sum(weightFun(1:100,type='FULL')*diff(CDF(0:100,gammaParam,'gamma')))))

write.csv(gammaTrue,paste0(outPath,'areaCorResult/gammaTrue.csv'),row.names=FALSE)

<<<<<<< HEAD
gammaSmallAC <- getNHat(resultList=gammaSmallResult,wFun=weightFun,datList=gammaListSmall,plotType=c('FULL','RP'))
=======
gammaSmallAC <- getMHat(resultList=gammaSmallResult,wFun=weightFun,datList=gammaListSmall,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(gammaSmallAC,paste0(outPath,'areaCorResult/gammaSmallWL.csv'),row.names=FALSE)

## mid
load(paste0(outPath,'WL/gammaMidWL.Rdata'))
load(paste0(dataPath,'gammaMid.Rdata'))

<<<<<<< HEAD
gammaMidAC <- getNHat(resultList=gammaMidResult,wFun=weightFun,datList=gammaListMid,plotType=c('FULL','RP'))
=======
gammaMidAC <- getMHat(resultList=gammaMidResult,wFun=weightFun,datList=gammaListMid,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(gammaMidAC,paste0(outPath,'areaCorResult/gammaMidWL.csv'),row.names=FALSE)

## big
load(paste0(outPath,'WL/gammaBigWL.Rdata'))
load(paste0(dataPath,'gammaBig.Rdata'))

<<<<<<< HEAD
gammaBigAC <- getNHat(resultList=gammaBigResult,wFun=weightFun,datList=gammaListBig,plotType=c('FULL','RP'))
=======
gammaBigAC <- getMHat(resultList=gammaBigResult,wFun=weightFun,datList=gammaListBig,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(gammaBigAC,paste0(outPath,'areaCorResult/gammaBigWL.csv'),row.names=FALSE)

########################################
## norm
########################################
## small
load(paste0(outPath,'WL/normSmallWL.Rdata'))
load(paste0(dataPath,'normSmall.Rdata'))
normTrue <- data.frame(plotType=c('RP','FULL'),A=c(sum(weightFun(1:100,type='RP')*diff(CDF(0:100,normParam,'norm'))),sum(weightFun(1:100,type='FULL')*diff(CDF(0:100,normParam,'norm')))))

write.csv(normTrue,paste0(outPath,'areaCorResult/normTrue.csv'),row.names=FALSE)

<<<<<<< HEAD
normSmallAC <- getNHat(resultList=normSmallResult,wFun=weightFun,datList=normListSmall,plotType=c('FULL','RP'))
=======
normSmallAC <- getMHat(resultList=normSmallResult,wFun=weightFun,datList=normListSmall,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(normSmallAC,paste0(outPath,'areaCorResult/normSmallWL.csv'),row.names=FALSE)

## mid
load(paste0(outPath,'WL/normMidWL.Rdata'))
load(paste0(dataPath,'normMid.Rdata'))

<<<<<<< HEAD
normMidAC <- getNHat(resultList=normMidResult,wFun=weightFun,datList=normListMid,plotType=c('FULL','RP'))
=======
normMidAC <- getMHat(resultList=normMidResult,wFun=weightFun,datList=normListMid,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(normMidAC,paste0(outPath,'areaCorResult/normMidWL.csv'),row.names=FALSE)

## big
load(paste0(outPath,'WL/normBigWL.Rdata'))
load(paste0(dataPath,'normBig.Rdata'))

<<<<<<< HEAD
normBigAC <- getNHat(resultList=normBigResult,wFun=weightFun,datList=normListBig,plotType=c('FULL','RP'))
=======
normBigAC <- getMHat(resultList=normBigResult,wFun=weightFun,datList=normListBig,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(normBigAC,paste0(outPath,'areaCorResult/normBigWL.csv'),row.names=FALSE)


########################################
## weibull
########################################
## small
load(paste0(outPath,'WL/weibullSmallWL.Rdata'))
load(paste0(dataPath,'weibullSmall.Rdata'))
weibullTrue <- data.frame(plotType=c('RP','FULL'),A=c(sum(weightFun(1:100,type='RP')*diff(CDF(0:100,weibullParam,'weibull'))),sum(weightFun(1:100,type='FULL')*diff(CDF(0:100,weibullParam,'weibull')))))

write.csv(weibullTrue,paste0(outPath,'areaCorResult/weibullTrue.csv'),row.names=FALSE)

<<<<<<< HEAD
weibullSmallAC <- getNHat(resultList=weibullSmallResult,wFun=weightFun,datList=weibullListSmall,plotType=c('FULL','RP'))
=======
weibullSmallAC <- getMHat(resultList=weibullSmallResult,wFun=weightFun,datList=weibullListSmall,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(weibullSmallAC,paste0(outPath,'areaCorResult/weibullSmallWL.csv'),row.names=FALSE)

## mid
load(paste0(outPath,'WL/weibullMidWL.Rdata'))
load(paste0(dataPath,'weibullMid.Rdata'))

<<<<<<< HEAD
weibullMidAC <- getNHat(resultList=weibullMidResult,wFun=weightFun,datList=weibullListMid,plotType=c('FULL','RP'))
=======
weibullMidAC <- getMHat(resultList=weibullMidResult,wFun=weightFun,datList=weibullListMid,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(weibullMidAC,paste0(outPath,'areaCorResult/weibullMidWL.csv'),row.names=FALSE)

## big
load(paste0(outPath,'WL/weibullBigWL.Rdata'))
load(paste0(dataPath,'weibullBig.Rdata'))

<<<<<<< HEAD
weibullBigAC <- getNHat(resultList=weibullBigResult,wFun=weightFun,datList=weibullListBig,plotType=c('FULL','RP'))
=======
weibullBigAC <- getMHat(resultList=weibullBigResult,wFun=weightFun,datList=weibullListBig,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(weibullBigAC,paste0(outPath,'areaCorResult/weibullBigWL.csv'),row.names=FALSE)


########################################
## llog
########################################
## small
load(paste0(outPath,'WL/llogSmallWL.Rdata'))
load(paste0(dataPath,'llogSmall.Rdata'))
llogTrue <- data.frame(plotType=c('RP','FULL'),A=c(sum(weightFun(1:100,type='RP')*diff(CDF(0:100,llogParam,'llog'))),sum(weightFun(1:100,type='FULL')*diff(CDF(0:100,llogParam,'llog')))))

write.csv(llogTrue,paste0(outPath,'areaCorResult/llogTrue.csv'),row.names=FALSE)

<<<<<<< HEAD
llogSmallAC <- getNHat(resultList=llogSmallResult,wFun=weightFun,datList=llogListSmall,plotType=c('FULL','RP'))
=======
llogSmallAC <- getMHat(resultList=llogSmallResult,wFun=weightFun,datList=llogListSmall,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(llogSmallAC,paste0(outPath,'areaCorResult/llogSmallWL.csv'),row.names=FALSE)

## mid
load(paste0(outPath,'WL/llogMidWL.Rdata'))
load(paste0(dataPath,'llogMid.Rdata'))

<<<<<<< HEAD
llogMidAC <- getNHat(resultList=llogMidResult,wFun=weightFun,datList=llogListMid,plotType=c('FULL','RP'))
=======
llogMidAC <- getMHat(resultList=llogMidResult,wFun=weightFun,datList=llogListMid,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(llogMidAC,paste0(outPath,'areaCorResult/llogMidWL.csv'),row.names=FALSE)

## big
load(paste0(outPath,'WL/llogBigWL.Rdata'))
load(paste0(dataPath,'llogBig.Rdata'))

<<<<<<< HEAD
llogBigAC <- getNHat(resultList=llogBigResult,wFun=weightFun,datList=llogListBig,plotType=c('FULL','RP'))
=======
llogBigAC <- getMHat(resultList=llogBigResult,wFun=weightFun,datList=llogListBig,plotType=c('FULL','RP'))
>>>>>>> 21cf483cf82d22d43cd8e7a2d05fa330daae451a

write.csv(llogBigAC,paste0(outPath,'areaCorResult/llogBigWL.csv'),row.names=FALSE)



