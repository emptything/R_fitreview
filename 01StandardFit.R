setwd("E:/00연구/2021핏리뷰라이브러리/06CLO기본패턴/기본핏평가") #워킹디렉토리설정 
#load("./R_git/R_fitreview/01StandardFit.RData") #자료불러오기
#save.image("./R_git//R_fitreview/01StandardFit.RData") #자료저장하기

#사용 라이브러리 (최초실행 전 설치필요)
library(dplyr)
library(ggplot2)
library(magrittr)
library(psych)
library(readxl)
library(data.table)



############################################
############################################
#데이터 불러오기

#기본상의

top.raw<-read_excel("Coding_221222_forR.xlsx",
                       sheet="Fit_상의", #시트별로 불러오기.
                       na=".")
str(top.raw)

#기본하의

btm.raw<-read_excel("Coding_221222_forR.xlsx",
                    sheet="Fit_하의", #시트별로 불러오기.
                    na=".")
str(btm.raw)


##########################
top.b<-
  top.raw %>% 
  filter(체형=="B체형")

btm.a<-
  top.raw %>% 
  filter(체형=="A체형")
  
#Kruskal-Wallis test
#top 여유량12 맞음새09
#btm 여유량07 맞음새07
kruskal.test(
    여유량07~제도법, data=btm.b)

#사후분석
#library(dunn.test)
top.a %$% 
  dunn.test(여유량12, 제도법, method='bonferroni')
