# IO Curves Predict cTBS Paper
# LMEs for final paper
# 12/17/2024 update
# Shreya Parchure

###### Initializing ######
# NOTE: REMEMBER TO CLEAR ENVIRONMENT FIRST

#Load R packages
rm(list=ls())

library(plyr)
library(lme4)
library(lmerTest)
library(lmSupport)
library(regclass)
library(car)
library(ggplot2)
library(reshape2)
library(sjPlot)
library(jtools)
library(readxl)

##### Datasets and Preprocessing #####

#Load trial-level MEP data
MEP_Data <- read_excel("MEP Datalong for LMEs.xlsx")
dim(MEP_Data)
#Load Subject data
Subject_Data <- read_excel("IO subjects for LME.xlsx")
dim(Subject_Data)
#Merge data files
All_Data <- merge(MEP_Data,Subject_Data)
dim(All_Data)
str(All_Data)

######## Base Models ########

# Run in order!

Base1 <- lmer(lnMEP ~ RMT + AMT + (1 | Trial) + (1 | Subj_ID) , data = All_Data, REML=FALSE); summary(Base1)
# All vars signif

# Add Time and check (skipping RMT, AMT in all for simplicity)
Base <- lmer(lnMEP ~ Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE); summary(Base)
anova(Base1, Base)
# All vars significant - this is the final base model (checking improvements to time)


####### Testing Individual Biomarkers vs Base ########

# For Midpoint
S50_bin <- lmer(lnMEP ~ S50_bin*Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE); summary(S50_bin)
vif(S50_bin)
anova(Base, S50_bin)
# All vars significant 
# Signif better model than Base


# For MEPmax
MEPmax_bin <- lmer(lnMEP ~ MEPmax_bin*Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE); summary(MEPmax_bin)
vif(MEPmax_bin)
anova(Base, MEPmax_bin)
# MEPmax_bin on its own is significant + interaction is signif for Post0, Post20 (all are vs Base)
# Signif better model than Base


# For MEP130RMT
MEP130RMT_bin <- lmer(lnMEP ~ MEP130_bin*Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE); summary(MEP130RMT_bin)
vif(MEP130RMT_bin)
anova(Base, MEP130RMT_bin)
# MEP130RMT_bin on its own is significant + interaction is signif for Post10, Post20, Post30 (all are vs Base)
# Signif better model than Base


# For BDNF (alone and in comparison)
BDNF_model <- lmer(lnMEP ~ Val_Met*Time + RMT +AMT + (1 | Trial), data = All_Data, REML=FALSE); summary(BDNF_model)
# on its own Val_Met is significant (but mostly at baseline, not consistently as an interaction)

# Interaction
BDNF_model <- lmer(lnMEP ~ Val_Met*Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE); summary(BDNF_model)
vif(BDNF_model)
anova(Base, BDNF_model)
# Signif better model than Base


###### Comparing Biomarkers to each other ######

comparison_bin = lmer(lnMEP ~ (Val_Met + MEPmax_bin + MEP130_bin + S50_bin) * Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE)
summary(comparison_bin)
vif(comparison_bin) # well below cutoff of 3 (default cutoff is 5)
# all vars significant in interactions w time except BDNF

comparison_bin2 = lmer(lnMEP ~ Val_Met + MEPmax_bin + MEP130_bin + S50_bin + Time + (1 | Subj_ID) + (1 | Trial), data = All_Data, REML=FALSE)
summary(comparison_bin2)
vif(comparison_bin2) # well below cutoff of 3 (default cutoff is 5)
# no vars significant except time


####### Additive Try #######

# For MEPmax added to S50 model
MEPmax_bin_add <- lmer(lnMEP ~ S50_bin*Time + MEPmax_bin*Time + RMT + AMT + (1 | Trial), data = All_Data, REML=FALSE); summary(MEPmax_bin_add)
vif(MEPmax_bin_add)
anova(S50_bin, MEPmax_bin_add)
# all vars significant
# ANOVA significant


# Then adding 