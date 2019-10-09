### Biol 595 Lab 4

setwd("C:/Users/abbyp/Documents/Louisiana/Bio 595 Intro to R/Bio-595")
load("fish_data_1.Rdata")
library(tidyverse)

# tapply & merge ----------------------------------------------------------

pd_mean = tapply(X = fish$parcel.density.m3, INDEX = list(fish$transect.id), FUN = mean)
pd_mean
pd_mean_df = as.data.frame(pd_mean)
pd_mean_df$Transect = row.names(pd_mean_df)

pd_mean_df = rename(.data = pd_mean_df, "Mean Parcel Density" = pd_mean)
pd_mean_df



pd_sd = tapply(X = fish$parcel.density.m3, INDEX = list(fish$transect.id), FUN = sd)
pd_sd
pd_sd_df = as.data.frame(pd_sd)
pd_sd_df$Transect = row.names(pd_sd_df)

pd_sd_df = rename(.data = pd_sd_df, "SD Parcel Density" = pd_sd)
pd_sd_df

pd_mean_df$seq = seq(1,nrow(pd_mean_df),1)
pd_sd_df$seq = seq(1,nrow(pd_sd_df),1)
pd_msd = merge(pd_mean_df, pd_sd_df, all.x = T,)

pd_c = tapply(X = fish$parcel.density.m3, INDEX = list(fish$transect.id), FUN = length)
pd_c_df = as.data.frame(pd_c)
pd_c_df$Transect = row.names(pd_c_df)
pd_c_df = rename(.data = pd_c_df, "Number of Samples" = pd_c)

pd_c_df$seq = seq(1,nrow(pd_c_df),1)

pd_msdc = merge(pd_msd, pd_c_df, all.x = T,)

### fix ###
pd_c$seq = seq(1,nrow(pd_c_df),1)
pd_msdc = merge(pd_msd, pd_c, all.x = T,)

# Group_by & Summarize ----------------------------------------------------

PD_mean = fish %>% group_by(transect.id) %>% 
  summarise(pdmean= mean(fish$parcel.density.m3))
PD_mean = as.data.frame(PD_mean)
PD_mean = rename(.data = PD_mean, "Mean Parcel Density"= pdmean)

PD_SD = fish %>% group_by(transect.id) %>% 
  summarise(pdsd= sd(fish$parcel.density.m3))
PD_SD = as.data.frame(PD_SD)
PD_SD = rename(.data = PD_SD, "SD Parcel Density"= pdsd)

PDJ = right_join(PD_mean, PD_SD, by = c('transect.id'))

PD_c = fish %>% group_by(transect.id) %>% 
  summarise(PDcount=n())

PDJ = PDJ = right_join(PD_c, PDJ, by = c('transect.id'))


# Free Style --------------------------------------------------------------

PD_num = tapply(X = fish$parcel.length.m, INDEX = list(fish$transect.id, fish$depth_fac), summary)

PD_ag = aggregate(fish$parcel.density.m3, list(fish$transect.id, fish$depth_fac), fivenum)
                