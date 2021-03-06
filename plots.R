#Box plots for the experiments
rm(list=ls())
setwd("~/Documents/GITProjects/SMDD-group-anomaly-detection")
library(dplyr,warn.conflicts = FALSE)
library(ggplot2)
library(lazyeval)
library(geometry)
library(openxlsx)
library(ggvis)
library(caret)
library(randomForest)
library(mlbench)
library(caretEnsemble)
library(rpart)
library(parallel)
library(doParallel)
library(glmnet)
require(gridExtra)
library(hydroGOF)
library(reshape2)

#DATASET SLOAN
#-------------
path_1<-"output/workspaceSloanRandomFirstTypeAnomalies1.mat.csv"
path_2<-"output/workspaceSloanSecondTypeAnomalies2.mat.csv"
path_3<-"output/workspaceSloanThirdTypeAnomalies3.mat.csv"

#DATASET GMM
#-------------
path_4<-"output/workspacePointBasedGroupAnomalies1.mat.csv"
path_5<-"output/workspacePointBasedGroupAnomalies2.mat.csv"
path_6<-"output/workspacePointBasedGroupAnomalies3.mat.csv"
path_7<-"output/workspacePointBasedGroupAnomalies4.mat.csv"
path_8<-"output/workspaceDistributionBasedGroupAnomalies5.mat.csv"


data_set_1<-tbl_df(read.csv(path_1,head=FALSE,sep=","))
data_set_2<-tbl_df(read.csv(path_2,head=FALSE,sep=","))
data_set_3<-tbl_df(read.csv(path_3,head=FALSE,sep=","))
data_set_4<-tbl_df(read.csv(path_4,head=FALSE,sep=","))
data_set_5<-tbl_df(read.csv(path_5,head=FALSE,sep=","))
data_set_6<-tbl_df(read.csv(path_6,head=FALSE,sep=","))
data_set_7<-tbl_df(read.csv(path_7,head=FALSE,sep=","))
data_set_8<-tbl_df(read.csv(path_8,head=FALSE,sep=","))

names(data_set_1)<-c("SMDD.C.k.1", "SMDD", "SMDD.N", "OCSMM", "SVDD", 
                     "SMDD.C.k.9","SMDD.C.k.92","SMDD.C.k.94","SMDD.C.k.96","SMDD.C.k.98",
                     "SMDD.C.k.1.N","SMDD.C.k.9.N","SMDD.C.k.92.N","SMDD.C.k.94.N","SMDD.C.k.96.N","SMDD.C.k.98.N"
                     )

names(data_set_2)<-names(data_set_1)
names(data_set_3)<-names(data_set_1)
names(data_set_4)<-names(data_set_1)
names(data_set_5)<-names(data_set_1)
names(data_set_6)<-names(data_set_1)
names(data_set_7)<-names(data_set_1)
names(data_set_8)<-names(data_set_1)


#data_set_1
#data_set_2
#data_set_3
#etc
df<-data_set_1 %>%
  dplyr::select(SVDD,OCSMM,SMDD,SMDD.C.k.1,SMDD.N,SMDD.C.k.1.N)

data<-melt(as.data.frame(df))

data<-data %>%
  mutate(G=ifelse(variable%in% list("SVDD","OCSMM","SMDD","SMDD.C.k.1"),"blue","black"))

data %>% ggvis(~factor(variable), ~value,stroke:=~factor(G)) %>% layer_boxplots() %>%
scale_numeric("y", domain = c(0,1)) %>%
add_axis("y", 
         title = "AUC",
         title_offset = 50,
         subdivide = 1,
         properties = axis_props(labels = list(fontSize = 15),title = list(fontSize = 15)))  %>%
  add_axis("x",
           title = "Models",
           subdivide = 0,
           title_offset = 90,
           properties = axis_props(labels = list(fontSize = 15,angle = 45,align = "left", baseline = "middle"),
                                   title = list(fontSize = 15)))

