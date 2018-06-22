# шаг-1. вчитываем таблицу. делаем датафрейм.
MDF <- read.csv("Morphology.csv", header=TRUE, sep = ",")
MDF <- na.omit(MDF) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(MDF)
# шаг-1. сшиваем столбцы по категориям (тектоника: 4 плиты)
MDTt = melt(setDT(MDF), measure = patterns("^plate"), value.name = c("tectonics"))
head(MDTt)
levels(MDTt$variable) = c("Philippine Plate" , "Pacific Plate", "Mariana Plate", "Caroline Plate")
head(MDTt)

# шаг-3. делаем график "Мозаика" по 4 тект. плитам
mosaicplot(MDF, color = NULL, main = "Title") 

count <- table(MDTt$variable, MDTt$tectonics) 
count

# вариант-1 обычный график
MosaicTect<- mosaicplot(count, main = "Mariana Trench: \nMosaic Plot",
           sub = "1:518 observation points in each profile",
           xlab = "Tectonic Plates",
           ylab = "Profiles",
           las = 1,
          color =c("steelblue1", "royalblue1", "dodgerblue", "steelblue3", "cornflowerblue", "royalblue4"),
           border = "tomato")
MosaicTect
# вариант-2 - с остаточными значениями // with residuals
MosaicTectRes<- mosaicplot(count, main = "Mariana Trench: \nMosaic Plot",
           sub = "1:518 observation points in each profile",
           xlab = "Tectonic Plates",
           ylab = "Profiles",
           las = 1,
           border = "chocolate",
           shade = TRUE)
MosaicTectRes

# через library(vcd)

MDF <- read.csv("Morphology.csv", header=TRUE, sep = ",")
MDF <- na.omit(MDF) 
row.has.na <- apply(MDF, 1, function(x){any(is.na(x))}) 
sum(row.has.na) 
head(MDF)
# шаг-1. сшиваем столбцы по категориям (тектоника: 4 плиты)
MDTt = melt(setDT(MDF), measure = patterns("^plate"), value.name = c("tectonics"))
head(MDTt)

count <- table(MDF$geom_sedim_thick, MDF$geom_slope_angle) 

library(vcd)
mosaic(count, shade=TRUE, legend=TRUE)

# Association Plot Example
library(vcd)
assoc(count, shade=TRUE)

