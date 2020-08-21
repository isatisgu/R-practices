
#initial conditions 
rN <- 0.1
rM <- 0.1
K <- 1000000
Nt <- 1
Mt <- 1
rMD <- 0.05
rND <- -0.1

#set loop to simulate the cell proliferation
#NO1 DRUG ABSENT 
 #set time length 
 timesteps <- 500
 #set empty numeric vectors to store the number of mutant & normal tumor cells
 N <- numeric(length = timesteps)
 M <- numeric(length = timesteps)
 N[1] <- 1
 M[1] <- 0
 
 #calculation of the tumor cell proliferation
 for (t in c(1:timesteps-1)){
   if(Nt < 100){
      Nt <- Nt + rN*Nt*(1-((Nt+Mt)/K))
      N[t+1] <- Nt
      M[t+1] <- 0
   }else{
      Nt <- Nt + rN*Nt*(1-((Nt+Mt)/K))
      Mt <- Mt + rM*Mt*(1-((Nt+Mt)/K))
      N[t+1] <- Nt
      M[t+1] <- Mt
    }
   }
 #plot of drug absent condition
 time <- c(1:timesteps)
 plot(N ~ time,col ="blue", type = "l")# 2 different style: "y~x" or "x,y"
 lines(time,M,col = "red")
 legend("topleft",legend = c("normal","mutant"),col = c("blue","red"),lty = 1, cex = 1.2)

 
#NO2 DRUG APPLIED 
 #set tumor period and treatment time
  timesteps <- 1000
  treattime <- 300
  #set empty numeric vectors to store the number of mutant & normal tumor cells
  N <- numeric(length = timesteps)
  M <- numeric(length = timesteps)
  N[1] <- 1
  M[1] <- 0
  
 #calculation of the tumor cell proliferation
  for (t in c(1:timesteps-1)){
      if(t<treattime){
         if(Nt < 100){
            Nt <- Nt + rN*Nt*(1-((Nt+Mt)/K))
            N[t+1] <- Nt
            M[t+1] <- 0
         }else{
            Nt <- Nt + rN*Nt*(1-((Nt+Mt)/K))
            Mt <- Mt + rM*Mt*(1-((Nt+Mt)/K))
            N[t+1] <- Nt
            M[t+1] <- Mt
         }}else{
            Nt <- Nt + rND*Nt*(1-((Nt+Mt)/K))
            Mt <- Mt + rMD*Mt*(1-((Nt+Mt)/K))
            N[t+1] <- Nt
            M[t+1] <- Mt
         }
      }

  #plot of drug applied condition
  time <- c(1:timesteps)
  plot(N ~ time,col ="blue", type = "l",ylab ="Cell Number",xlab ="time(day)")# 2 different writing style: "y~x" or "x,y"
  lines(time,M,col = "red")
  legend("topleft",legend = c("normal","mutant"),col = c("blue","red"),lty = 1, cex = 0.9)
  abline(v =300, col = "grey")
  text(300,-500, labels = "treatment point")

  
  
  
