##########################################################
## Jared Studyvin
## 9 June 2016
## Test the weighted distribution
##########################################################
rm(list=ls())

library(plyr)

userPath <- '~/GoogleDrive/wind/fatality/areaCorrection/likelihoodAC/'
userPath <- '~/project/likelihoodAC/'
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
## llog
#############################################################################
## small

load(paste0(dataPath,'llogSmall.Rdata'))
ls()

cl <- makeCluster(6)
registerDoSNOW(cl)
Sys.time()
system.time(
    llogSmallResult <- llply(llogListSmall,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

## mid
load(paste0(dataPath,'llogMid.Rdata'))


cl <- makeCluster(6)
registerDoSNOW(cl)
Sys.time()
system.time(
    llogMidResult <- llply(llogListMid,estWD,weightFun=weightFun,subdivisions=10000,.paropts=list(.export=c('getStartValue','weightedDistribution')),.parallel=TRUE)
)
stopCluster(cl)

