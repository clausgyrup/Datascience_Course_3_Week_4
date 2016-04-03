library(reshape2)

#Read activitynames and columnnames
actnames<-read.table("activity_labels.txt",header=F,stringsAsFactors = F)
cnames<-read.table("features.txt",header=F,stringsAsFactors = F)

#columnnames containing mean() or std()
ms_col<-grep("([Mm]ean\\(\\)|[Ss]td\\(\\))",cnames[,2])#columnindeces

#Read test dataset
test<-read.table("./test/X_test.txt",header=F,stringsAsFactors = F)
test_act<-read.table("./test/y_test.txt",header=F,stringsAsFactors = F)
test_subject<-read.table("./test/subject_test.txt",header=F,stringsAsFactors = F)
test<-cbind(activity=test_act[,1],subject=test_subject[,1],test)

#Read train dataset
train<-read.table("./train/X_train.txt",header=F,stringsAsFactors = F)
train_act<-read.table("./train/y_train.txt",header=F,stringsAsFactors = F)
train_subject<-read.table("./train/subject_train.txt",header=F,stringsAsFactors = F)
train<-cbind(activity=train_act[,1],subject=train_subject[,1],train)

#Merge test and train datasets
merged<-rbind(test,train)
names(merged)<-c("activity","subject",cnames[,2])
merged<-merged[,c(1,2,ms_col+2)]
merged$activity <- factor(merged$activity, levels = actnames[,1], labels = actnames[,2])

#Cleanup variables
rm(list=c("test","train","actnames","cnames","ms_col","test_act" ,"test_subject","train_act","train_subject"))


#Create a new tidy dataset using the library "reshape2"
res<-melt(merged,id.vars = c("activity","subject"))
tidyset<-dcast(res,subject + activity ~ variable, mean)
write.table(tidyset, "tidy_dataset.txt")
