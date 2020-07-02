setwd("~/Desktop/R/EuropeCoronaVirus/")
File_data <- read.csv("data.csv")
View(File_data)

CountryData<- subset(File_data, File_data$countriesAndTerritories == "United_States_of_America")
View(CountryData)

length<- length(CountryData$cases)
length

cycle<- 5  # number of days for R0 
data_mod<- length %% cycle   
if (data_mod == 0){
  line<- floor(length/cycle)
} else{
  line<- floor(length/cycle)   # may be +1
}

data_2D<- array(CountryData$cases, dim=c(cycle,line))
data_2D

data_line <- data.frame()
for(i in 1:line) {
  data_line[1,i]<- sum(data_2D[,i])
}
data_line

R0<- data.frame()
for(i in 1:11){
  R0[1,i]<- data_line[1,i] / data_line[1,i+1]
}
R0

#Saudi<- as.numeric(R0)
#Saudi<- rev(Saudi)
plot(weeks, Saudi, type = "b", frame = FALSE, pch = 19, col = "red", xlab = "Weeks", ylab = "R0")

USA<- as.numeric(R0)
USA<- rev(USA)
lines(weeks, USA, pch = 18, col = "blue", type = "b", lty = 2)
