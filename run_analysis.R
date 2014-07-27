run_analysis<-function{
  Train<-read.table("X_train.txt")
  Train_Subject<-read.table("subject_train.txt")
  Train_Act<-read.table("y_train.txt")
  Test<-read.table("X_test.txt")
  Test_Subject<-read.table("subject_test.txt")
  Test_Act<-read.table("y_test.txt")
  Features<-read.table("features.txt")
  names(Train)<-as.character(Features[,2])
  names(Test)<-as.character(Features[,2])
  names(Train_Subject)<-"Subject"
  names(Test_Subject)<-"Subject"
  names(Train_Act)<-"Labels"
  names(Test_Act)<-"Labels"
  Train<-cbind(Train_Subject,Train_Act,Train)
  Test<-cbind(Test_Subject,Test_Act,Test)
  Data<-rbind(Train,Test)
  Data1<-Data[,c(1,2,grep("mean\\(\\)",names(Data)),grep("std()",names(Data)))]
  activity<-read.table("activity_labels.txt")
  names(activity) = c("Labels","Activity")
  Data2<-merge(Data1,activity,by = "Labels")
  attach(Data2)
  Dataresult<-aggregate(Data2[,c(-1,-2,-69)],list(Subject,Activity),FUN = mean)
  write.table(Dataresult,file = "Dataresult.txt")
}

  
  
