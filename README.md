#README.md
This readme file explains the overall strucure of the repo.

The gihub repo contains the following files besides the README:

###run_analysis.R
The R script which reads, merges and annotates the raw data files and prepares the tidy dataset.
The script assumes that the raw data have been downloaded and unzipped in the same directory as the script. Data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  
The steps in creating the tidy data set are as follows.

* Read the test and training data set and add activity and subject names 
* Merge the two datasets and include only columns which contain mean or sd 
* Creates a tidy dataset which contains the mean values for each subject activity pair  

###CodeBook.md
Describes the variables of tidy_dataset.txt

###tidy_datset.txt
The tidy datset created by run_analysis.R

