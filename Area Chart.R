#Syed Qavi
library(ggplot2)
library(tidyverse)
library(scales)
setwd("C:\\Users\\SAQ-PC\\Documents\\CSC DSC\\DSC 465\\")

#i joined datasets COVID-19, H1N1, and SARS and manipulated data in excel  
sick <- read.csv(file="main3.csv", header=TRUE, sep=",")

sick

sum(is.na(sick))
library(psych) 
describe(sick)

#area chart code
a<-ggplot(data = sick,
          aes(x = ï..Day,
              y = Total.Confirmed.and.Deaths.Values, fill = size_f)) +
  geom_area() + facet_grid(cols = vars(size_f))+
  facet_wrap(~size_f) +
  #scale_fill_viridis(discrete = TRUE) +
  scale_fill_manual(values = rev(c("#B71C1C","#B71C1C","#B71C1C","#1c36b7","#1c36b7","#1c36b7"))) +
  theme(legend.position="none") +
  ggtitle("Area Chart of Confirmed and Death Cases for COVID-19, H1N1, SARS in a Month") +
  theme_bw()+
  theme(
    legend.position="none",
    panel.spacing = unit(0, "lines"),
    strip.text.x = element_text(size = 10),
    plot.title = element_text(size=16),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank()
  )+
  labs(x="Day",y="Population")
a

#put the graphs in the order you want
sick$size_f = factor(sick$Total.Confirmed.and.Deaths, levels=c('Total Confirmed (COVID-19)',
                                                               'Total Confimed (H1N1)',
                                                               'Total Confirmed (SARS)',
                                                               'Total Deaths (COVID-19)',
                                                               'Total Deaths (H1N1)',
                                                               'Total Deaths (SARS)'))



###################################################################################################

#These are the other graphs I tried not included in report


#sick%>% filter(Country== "China" & Country == "Mainland China") %>%
#  ggplot(aes(x = Country, y = Province.State, fill = Confirmed)) + geom_tile()

new_date<- as.Date(sick$Observation.Date, "%m/%d/%Y")
day<- strftime(new_date, "%m/%d")

day

#Pivot data in Tableau, seperate hour from date in excel to create bar chart
#ggplot(sick, aes(fill=cdr, y=cdr_val, x=day)) + 
#  geom_bar( stat="identity")


#ggplot(sick, aes(fill=cdr, y=cdr_val, x=day)) + 
#  geom_bar( stat="identity")+
#  labs(title = "Propotional Bar Graph of Confirmed, Deaths, Recovered for each Day CoronaVirus",x="Day",y="Value")

#sick <- sick %>%
 # group_by(Observation.Date,cdr_val ) %>%
  #count() %>%
  #ungroup() %>%
  #mutate(prop = n/sum(n))


#sick %>% 
  #count(Observation.Date) %>% 
  #mutate(perc = n / nrow(sick)) -> tips2



#ggplot() + geom_bar(aes(y = cdr_val/sum(cdr_val)*100, x = day, fill = cdr), data = sick, stat="identity")

#This was an interactive scatter plot I made showing recovered and confirmed by time
library(lattice)

#sick$log <- log10(sick$Recovered)
#sick$log1 <- log10(sick$Confirmed)
# 
# p <- plot_ly(sick,
#              x = ~log1,
#              y = ~log)
# 
# p <- add_markers(p,
#                  size = ~Confirmed,
#                  color = ~Province.State,
#                  text = ~Province.State, hoverinfo = "text",
#                  ids = ~Province.State,
#                  frame = ~day,
#                  showlegend = FALSE)
# 
# p <- animation_opts(p,
#                     frame = 1000,
#                     transition = 800,
#                     redraw = FALSE)
# 
# p <- animation_slider(p,
#                       currentvalue = list(prefix = "Day "))
# 
# p

#a + scale_y_continuous(sec.axis = sec_axis(~ . / 88514 * 100,name = "Percentage"))
#setwd("C:\\Users\\SAQ-PC\\AppData\\Local\\Programs\\orca")
library(plotly)

#orca(a, "plot.svg")
#ggplotly(a)
