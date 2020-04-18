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

##output the dim of new datasets

dim(mergedx)

dim(mergedy)

dim(mergedsubject)
