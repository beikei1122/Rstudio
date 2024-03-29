install.packages("tidyverse")
library(tidyverse)
install.packages("ngramr")
library(ngramr)
 #1-IV "China threats"# 
 #2-IV "China Challenges"# 
 #3-IV "China influences" #
 #1_DV China's military power, China's military, China's military , China's military modernization, China's military build-up, China's military potential #
#2_DV China's economic growth, China's economic power, China's economic strength, China's potential#
#3_DV China's political system, China's political structure, China's political power, China's political strength, China's political influence.#
#4_DV China's ideology, China's socialism, China's communism, China=>undemocratic, China=>authoritarian, China's human right#
ngram(phrase="", corpus="eng_2019", year_start= , year_end= )
mutate(df, name = colum)
cor.test(~a+b, data=)

A<-ngram(phrase="China threats", corpus="eng_2019", year_start=1949 , year_end=2020 )
B<-ngram(phrase="China challenges_VERB", corpus="eng_2019", year_start=1949 , year_end=2020)
C<-ngram(phrase="China influences_VERB", corpus="eng_2019", year_start=1949 , year_end=2020)
China_challenges <-B$Frequency
China_influences <-C$Frequency
AA <- mutate(A, China_challenges=China_challenges,China_influences=China_influences)
AAA<-AA %>% select(Year, Frequency, China_challenges,China_influences)
#rename3
IV<- rename (AAA, China_threats=Frequency)

E<-ngram(phrase="China's military power", corpus="eng_2019", year_start=1949 , year_end=2020 )
E1<-ngram(phrase="China's military modernization", corpus="eng_2019", year_start=1949 , year_end=2020 )
E2<-ngram(phrase="China's military potential", corpus="eng_2019", year_start=1949 , year_end=2020 )

F <-ngram(phrase="China's economic power", corpus="eng_2019", year_start=1949 , year_end=2020 )
F1<-ngram(phrase="China's economic growth", corpus="eng_2019", year_start=1949 , year_end=2020 )
F2<-ngram(phrase="China's economic potential", corpus="eng_2019", year_start=1949 , year_end=2020 )
F3<-ngram(phrase="China's economic strength", corpus="eng_2019", year_start=1949 , year_end=2020 )

G <-ngram(phrase="China's political power", corpus="eng_2019", year_start=1949 , year_end=2020 )
G1<-ngram(phrase="China's political system", corpus="eng_2019", year_start=1949 , year_end=2020 )
G2<-ngram(phrase="China's structure", corpus="eng_2019", year_start=1949 , year_end=2020 )
G3<-ngram(phrase="China's political strength", corpus="eng_2019", year_start=1949 , year_end=2020 )

China_military_power <-E$Frequency
China_military_modernization <-E1$Frequency
China_military_potential <-E2$Frequency

China_economic_power <-F$Frequency
China_economic_growth<-F1$Frequency
China_economic_potential<-F2$Frequency 
China_economic_strength <-F3$Frequency

China_political_power <-G$Frequency
China_political_system<-G1$Frequency
China_political_structure<-G2$Frequency
China_political_strength <-G3$Frequency

IDV<- mutate(IV, China_military_power=China_military_power, China_military_modernization=China_military_modernization,China_military_potential=China_military_potential,China_economic_power=China_economic_power,China_economic_growth=China_economic_growth,China_economic_potential=China_economic_potential,China_economic_strength=China_economic_strength,China_political_power=China_political_power,China_political_system=China_political_system,China_political_structure=China_political_structure,China_political_strength=China_political_strength)

H<-ngram(phrase="China=>undemocratic", corpus="eng_2019", year_start=1949 , year_end=2020 )
I<-ngram(phrase="China=>authoritarian", corpus="eng_2019", year_start=1949 , year_end=2020 )
J<-ngram(phrase="China's ideology", corpus="eng_2019", year_start=1949 , year_end=2020 )
J1<-ngram(phrase="China's socialism", corpus="eng_2019", year_start=1949 , year_end=2020 )
J2<-ngram(phrase="China's communism", corpus="eng_2019", year_start=1949 , year_end=2020 )

China_undemocrtic<-H$Frequency
China_authoritarian<-I$Frequency
China_ideology<-J$Frequency
China_socialism<-J1$Frequency
China_communism<-J2$Frequency

NewIDV<- mutate(IDV,China_undemocrtic=China_undemocrtic,China_authoritarian=China_authoritarian,China_ideology=China_ideology,China_socialism=China_socialism,China_communism=China_communism)

x<-NewIDV %>%filter(Year>= 1978)

#linear regression#
 nn<-lm(China_challenges~China_economic_power+China_economic_growth+China_economic_potential, data=IDV)
 summary(nn)
 library(ggplot2)
 
 ggplot(b_lm, aes(x=China_challenges,y=China_economic_power+China_economic_growth+China_economic_potential))+geom_point()+stat_smooth(method = "lm",col="blue",formula = y~x)
 
