library(nlme)
library(lsmeans)
library(car)
library(performance)

#model -- repeated measures with autoregressive structure
summary(heightModel <- lme(height ~ diversity*warming*year,
                           data=growthData, 
                           random=~1|block,
                           correlation=corAR1(form=~year|block/plant), #autoregressive structure
                           control=lmeControl(returnObject=T)))
check_model(heightModel)
Anova(heightModel, type=3) #this may not work, use shuffling function to calculate type 3 effects instead
lsmeans(heightModel, pairwise~as.factor(diversity), adjust='tukey') #paired contrasts



#model -- repeated measures with compound symmetry structure
summary(heightModel <- lme(height ~ diversity*warming*year,
                           data=growthData, 
                           random=~1|block,
                           correlation=corCompSymm(form=~1|block/plant), #autoregressive structure
                           control=lmeControl(returnObject=T)))
check_model(heightModel)
Anova(heightModel, type=3) #this may not work, use shuffling function to calculate type 3 effects instead
lsmeans(heightModel, pairwise~as.factor(diversity), adjust='tukey') #paired contrasts