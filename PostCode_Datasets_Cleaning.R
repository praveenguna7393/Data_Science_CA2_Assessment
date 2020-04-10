# Initial step the dataset was downloaded from blackboard and move to the project working directory later it was added
# inside the github directory 

#read the csv file and store it in the dataframe.

Postcode_dataframe <- read.csv("NIPostcodes.csv",header = F)
Postcode_dataframe

# Point 1: Total of Rows, Struture of the dataframe, first 10 rows of dataframe.

nrow(Postcode_dataframe)
ncol(Postcode_dataframe)

#Struture of the dataframe.
str(Postcode_dataframe)

#First and Last 10 rows of dataframe.
head(Postcode_dataframe, n=10)
tail(Postcode_dataframe, n=10)

#Change the appropraite column name in dataframe.
colnames(Postcode_dataframe) <- c("Organisation_Name","Sub-building_Name","Building_Name","Number","Primary_Thorfare",
                                    "Alt_Thorfare","Secondary_Thorfare","Locality","Townland","Town","County","PostCode",
                                    "X-Cordinates","Y-Cordinates","Primary_Key")

#Replace and recode all missing values.
Postcode_dataframe[Postcode_dataframe==""] <- NA
sum(is.na(Postcode_dataframe))
sum(!complete.cases(Postcode_dataframe))

#Missing Data Columnwise.
Missing_Count <- sapply(Postcode_dataframe, function(y) sum(length(which(is.na(y)))))
Missing_Count <- data.frame(Missing_Count)
Missing_Count

#Move the Primary Key Identifier to the start of the database.
Postcode_dataframe <- subset(Postcode_dataframe, select = c(15,1:14))

#Create Limavady_data dataframe.
Limavady_data <- Postcode_dataframe[which(Postcode_dataframe$Locality == "LIMAVADY" | Postcode_dataframe$Townland == "LIMAVADY" & Postcode_dataframe$Town == "LIMAVADY"),]
Limavady_data
nrow(Limavady_data)

write.csv(Limavady_data,"Limavady.csv")
write.csv(Postcode_dataframe,"CleanNIPostcodeData.csv")

#Section 2.




