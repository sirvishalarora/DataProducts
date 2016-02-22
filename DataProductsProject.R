# Data Products Project

# Data file downloaded from:
# http://www.ers.usda.gov/datafiles/Commodity_Consumption_by_Population_Characteristics/Food_Intakes_Converted_to_Retail_Commodities_Database/ficrcd_fruit.xls

library(ggplot2)
library(RColorBrewer)

# Load data
fruit_file <- "ficrcd_fruit.csv"
fruit <- read.csv(fruit_file)
fruit[,1] <- tolower(fruit[,1])

plotFruits <- function(income, gender, age, weight,
                       education, race_eth) {
        # adult = "child" or "adult"
        # income = "low","mid", or "high"
        # gender = "male" or "female"
        # age = "2-11", "12-19", "20-39", 
        # "40-59", or "60"
        # weight = "under", "healthy", "over" or "obese"
        # education = "less",
        #             "high school",
        #             "college"
        # race_eth = "black", "white", "hispanic" or "other"
        
        
        if (age=="2-11" | age=="12-19") {
                adult <- "child"
        } else {adult <- "adult"}
        
        # Create search string and extract data from data frame
        expr <- list(income, paste(gender, age), 
                      paste(adult, weight), 
                      education, race_eth)
        expr <- paste("^",expr,sep="")
        expr <- paste(expr,collapse="|")
        dat <- fruit[grep(expr, fruit[,1]),3:11]
        
        # Average the sub-groups
        avgdat <- data.frame(colMeans(dat))
        fruitnames <- row.names(avgdat)
        avgdat <- cbind(fruitnames,avgdat)
        colnames(avgdat) <- c("Fruit","Mean")
        
        # Set the colors and title
        title <- "Mean Fruit Consumption for Your Parameters\n in Grams per Day"
        set.seed(22)
        mycolors <- brewer.pal(9,"Set1")
        names(mycolors) <- avgdat$Fruit
        colorscale <- scale_colour_manual(values=mycolors)
        # Plot the results
        g <- ggplot(avgdat, (aes(x=Fruit,y=Mean, fill=Fruit))) +
                geom_bar(stat="identity") +
                ggtitle(title) +
                colorscale
        return(g)
}