# Christa Caggiano 
# Fall 2017 
# Some sample R graphs made for interactive 
# programming in RStudio 

# load packages 
library(ggplot2)

# change directories and remove any variables in the memory 
rm(list = ls())
setwd("/Users/Christa.Caggiano/Documents/other/R-tutorial/R-tutorial"). 

# downloaded from https://github.com/MuseumofModernArt/collection
artists = read.csv("Artists.csv", header = TRUE)
art = read.csv("Artworks.csv", header = TRUE)


############# barplot ################

# a good way to start with freq graphs is to see the span of data 
# in table format 
table(artists$Nationality)

# since the number of artists nationalities appear at a huge range of values in our sample 
# we can subset it based on our table, so that we only have frequencies greater than 10 showing up
artists = subset(artists, table(artists$Nationality)[artists$Nationality] >= 10)

# built in R-library for plotting 
barplot(table(artists$Nationality), col="Pink", cex.names=0.2, las=3, 
        xlab="Nationality", ylab="Count", main="MoMA Artists by Nationality")

# ggplot package for bar plot 
theme_set(theme_minimal())
g = ggplot(artists, aes(artists$Nationality))
g + geom_bar(width = 0.5, fill="Pink") + 
  labs(title="MoMA Artists by Nationality", caption="Source: MoMA", x = "Nationality") +
  theme(axis.text.x = element_text(angle=90, vjust=0.6, size=4), 
        plot.title = element_text(hjust=0.5))

library(wesanderson)

pal <- wes_palette("Moonrise3", 127, type = "continuous")
g + geom_bar(aes(fill=artists$Nationality)) + theme(legend.position = "none")+ 
  scale_fill_manual(values = pal) + 
  labs(title="MoMA Artists by Nationality", caption="Source: MoMA", x = "Nationality") +
  theme(axis.text.x = element_text(angle=90, vjust=0.6, size=4), 
        plot.title = element_text(hjust=0.5))

top_10_nationalities = artists[order(nationality),]
g = ggplot(top_10_nationalities, aes(top_10_nationalities$Nationality))
g + geom_bar(width = 0.5, fill="pink") + 
labs(title="MoMA Artists by Nationality", caption="Source: MoMA", x = "Nationality") +
  theme(axis.text.x = element_text(angle=45, vjust=0.6, size=8), 
        plot.title = element_text(hjust=0.5))
