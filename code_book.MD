Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

The Description of run_analysis.R

Part1:Merges the training and the test sets to create one data set.

1.1 unzip the raw data
1.2 used the read.table to make the action of merge availble
1.3 merged the train and test dada in one dataset

merged names: mergedx, mergedy, mergedsubject

##output for the dim of new datasets (for check)

dim(mergedx)

dim(mergedy)

dim(mergedsubject)


Part2:Extracts only the measurements on the mean and standard deviation for each measurement.

2.1 get to features indeces
2.2 get the features count and variables with mean

##output for part 2

dim(extractsmergedx)


Part3:Uses descriptive activity names to name the activities in the data set.

3.1 replace numeric values with lookup value from 'activity'

##output head 5 for test in part3

head(mergedy) 

Part4:Appropriately labels the data set with descriptive variable names.

4.1 renamed colums to: "subjectnumber""activities" 
4.2 create the labeled data set "labeleddata"

##this could output the head 5 colums and ending 5 colums
head(labeleddata[,c(1:4)])
tail(labeleddata[,c(1:4)])


Part5:From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
5.1 output the tidy data (file"finaloutput.txt").

##this could output the head 5

head(finaloutput[order(subjectnumber)][,c(1:4), with = FALSE],5) 


List of References(raw data source)
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
