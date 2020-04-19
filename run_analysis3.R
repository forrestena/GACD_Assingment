##
unzip("getdata_projectfiles_UCI HAR Dataset.zip")
##test section:
testx<- read.table("UCI HAR Dataset/test/X_test.txt")
testy<- read.table("UCI HAR Dataset/test/Y_test.txt")
testsubject <-read.table("UCI HAR Dataset/test/subject_test.txt")

## train section :
trainx<- read.table("UCI HAR Dataset/train/X_train.txt")
trainy<- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubject <-read.table("UCI HAR Dataset/train/subject_train.txt")

## features and activity
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")

##merges train and test data in one dataset
mergedx<-rbind(testx, trainx)
mergedy<-rbind(testy, trainy)
mergedsubject<-rbind(testsubject, trainSubject)

##output for the dim of new datasets (for copy)

dim(mergedx)

dim(mergedy)

dim(mergedsubject)

##2_Extracts only the measurements on the mean and standard deviation for each measurement.

##for getting features indeces

idx<-grep("mean\\(\\)|std\\(\\)", features[,2]) 

##geting the features count and variables with mean

length(idx)

extractsmergedx<-mergedx[, idx]

##output for part 2

dim(extractsmergedx)

##3_Uses descriptive activity names to name the activities in the data set.

##for replacing numeric values with lookup value from 'activity'
mergedy[,1]<-activity[mergedy[,1],2]

##output head 5 for test in part3
head(mergedy) 

##4_Appropriately labels the data set with descriptive variable names.

names<-features[idx,2]

##rename the colums
names(mergedx)<-names 
names(mergedsubject)<-"subjectnumber"
names(mergedy)<-"activities"

labeleddata<-cbind(mergedsubject, mergedy, mergedx)

a<-labeleddata

##this could output the head 5 colums and ending 5 colums
head(labeleddata[,c(1:4)])
tail(labeleddata[,c(1:4)])

##5_From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
require(data.table)
outputdata<- data.table(a)

finaloutput <- outputdata[, lapply(.SD, mean), by = 'subjectnumber,activities']
##output the dim
dim(finaloutput)

##cleaning data

finaloutput <- na.omit(finaloutput) 
finaloutput <- finaloutput[,-c(69:563)]

##for output

write.table(finaloutput, file = "finaloutput.txt", row.names = FALSE)

##this could output the head 5
head(finaloutput[order(subjectnumber)][,c(1:4), with = FALSE],5) 
