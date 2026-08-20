###trying to scrape data of a pdf into R:###

#BIG NOTE: you will have to change the location of the pdf file in your own dictinary

######what I tried first: ######
#First good to check if we can read table 1:

#had to install pdftools to help read pdf's:
install.packages("pdftools")
library(pdftools)

#Heres how to load it you will have to write a path to where you keep the pdf on your computer:
ingots <- pdf_text("C:/Users/smith/Desktop/STAT394/A multivariate approach to the study of orichalcum ingots from the underwater Gela's archaeological site.pdf")

#check you have all the pages
length(ingots) #should out put 8

#prints page 3 which has the table on:
cat(ingots[[3]])

#this works if we want to view the pdf! not extract the data

######Extracting the table:######

#install this to extract the table :)
install.packages("tabulapdf")
library(tabulapdf)

ingots2 <- extract_tables("C:/Users/smith/Desktop/STAT394/A multivariate approach to the study of orichalcum ingots from the underwater Gela's archaeological site.pdf", pages=3)

head(ingots2)

print(ingots2)

#lets store it in a table:

table1 <- ingots2[[1]]

#when I fist this this you couldn't view Ni, Ag and Sb seperatly they all went under concentraction
View(table1)

#what I used to seprate it:
library(dplyr)
library(tidyr)

table1 <- table1 %>%
  separate(
    `Concentration in PPM`,
    into = c("Ni", "Ag", "Sb"),
    sep = " "
  )

#how to check:
table1[1:3, ] |> 
  print(width = Inf)

#this should now have all the columns seprate :)
View(table1)











