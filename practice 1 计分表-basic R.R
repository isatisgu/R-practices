# import score form from txt.file
data <- read.table(file.choose(),header = TRUE)
head(data)

# set vectors to store temporary score
nr <- nrow(data)
time <- data$time
uw_score <- c()
msu_score <- c()

# set a loop to calculate the cumulative score
for(i in c(1:nr)){
  score_tmp <- data[1:i,] #dissect temporary score
  uw_score_tmp <- sum(score_tmp[which(score_tmp$team == "UW"),"score"])
  uw_score <- c(uw_score, uw_score_tmp)
  msu_score_tmp <- sum(score_tmp[which(score_tmp$team == "MSU"),"score"])
  msu_score <- c(msu_score,msu_score_tmp)

}

# use plot to visulize the data
plot(time,uw_score,type = "l",main = "UW VS MSU",xlab = "time(min)", ylab = "score",col="red")
  lines(time,msu_score, col ="blue")
  legend("topleft", legend = c('UW Score', 'MSU Score'),
         col = c('red', 'blue'), lty = 1, cex = 0.8)
  
