##########################################################
## Jared Studyvin
## 9 June 2016
## Test the weighted distribution
##########################################################
rm(list=ls())

library(plyr)

##userPath <- '~/GoogleDrive/wind/fatality/areaCorrection/likelihoodAC/'
userPath <- 'D:/studyvin/likelihoodAC/'
dataPath <- paste0(userPath,'data/')
outPath <- paste0(userPath,'output/')
codePath <- paste0(userPath,'code/')



source(paste0(codePath,'weightFun.R'))
source(paste0(codePath,'weightedDistribution.R'))
source(paste0(codePath,'getStartValue.R'))
source(paste0(codePath,'summaryFun.R'))



##listEl <- llogListSmall[[1]]
##dat <- subset(listEl,plotType=='RP'&piHat==.7)

estWD <- function(listEl,...){

    outList <- dlply(listEl,~plotType+piHat,function(subDat,...){
                       ##allDist <- c('rayleigh','gamma','weibull','llog','norm','gompertz')
                       allDist <- c('gamma','weibull','llog','norm')
                       plotType <- as.character(subDat$plotType[1])
                       piHat <- subDat$piHat[1]
                       message('The plot type is ',plotType,' and piHat is ',piHat)
                       fatDist <- subDat$distance
                       out <- ldply(allDist,weightedDistribution,fatDist=fatDist,...,type=plotType)
                       out$n <- length(fatDist)
                       out$plotType <- plotType
                       out$piHat <- piHat
                       return(out)
                   },...)

    return(outList)
}






library(parallel)
library('doSNOW')
detectCores(all.tests = TRUE, logical = TRUE)



#############################################################################
## norm
#############################################################################
## small

load(paste0(dataPath,'normSmall.Rdata'))
ls()

cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    normSmallResult <- llply(normListSmall,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(normSmallResult,normParam,file=paste0(outPath,'normSmallWD.Rdata'))


## mid
load(paste0(dataPath,'normMid.Rdata'))


cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    normMidResult <- llply(normListMid,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(normMidResult,normParam,file=paste0(outPath,'normMidWD.Rdata'))

## big
load(paste0(dataPath,'normBig.Rdata'))

cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    normBigResult <- llply(normListBig,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(normBigResult,normParam,file=paste0(outPath,'normBigWD.Rdata'))


#############################################################################
## gamma
#############################################################################
## small

load(paste0(dataPath,'gammaSmall.Rdata'))
ls()

cl <- makeCluster(10)
registerDoSNOW(cl)
Sys.time()
system.time(
    gammaSmallResult <- llply(gammaListSmall,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(gammaSmallResult,gammaParam,file=paste0(outPath,'gammaSmallWD.Rdata'))


## mid
load(paste0(dataPath,'gammaMid.Rdata'))


cl <- makeCluster(10)
registerDoSNOW(cl)
Sys.time()
system.time(
    gammaMidResult <- llply(gammaListMid,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(gammaMidResult,gammaParam,file=paste0(outPath,'gammaMidWD.Rdata'))

## big
load(paste0(dataPath,'gammaBig.Rdata'))

cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    gammaBigResult <- llply(gammaListBig,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(gammaBigResult,gammaParam,file=paste0(outPath,'gammaBigWD.Rdata'))



#############################################################################
## llog
#############################################################################
## small

load(paste0(dataPath,'llogSmall.Rdata'))
ls()

cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    llogSmallResult <- llply(llogListSmall,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(llogSmallResult,llogParam,file=paste0(outPath,'llogSmallWD.Rdata'))


## mid
load(paste0(dataPath,'llogMid.Rdata'))


cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    llogMidResult <- llply(llogListMid,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(llogMidResult,llogParam,file=paste0(outPath,'llogMidWD.Rdata'))

## big
load(paste0(dataPath,'llogBig.Rdata'))

cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    llogBigResult <- llply(llogListBig,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(llogBigResult,llogParam,file=paste0(outPath,'llogBigWD.Rdata'))


#############################################################################
## weibull
#############################################################################
## small

load(paste0(dataPath,'weibullSmall.Rdata'))
ls()

cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    weibullSmallResult <- llply(weibullListSmall,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(weibullSmallResult,weibullParam,file=paste0(outPath,'weibullSmallWD.Rdata'))


## mid
load(paste0(dataPath,'weibullMid.Rdata'))


cl <- makeCluster(5)
registerDoSNOW(cl)
Sys.time()
system.time(
    weibullMidResult <- llply(weibullListMid,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(weibullMidResult,weibullParam,file=paste0(outPath,'weibullMidWD.Rdata'))

## big
load(paste0(dataPath,'weibullBig.Rdata'))

cl <- makeCluster(7)
registerDoSNOW(cl)
Sys.time()
system.time(
    weibullBigResult <- llply(weibullListBig,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

save(weibullBigResult,weibullParam,file=paste0(outPath,'weibullBigWD.Rdata'))
