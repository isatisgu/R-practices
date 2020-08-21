#set a random key for guessing!
key <- sample(1:100,1)

#create a interactive guessing flow!
count <-1

while (count <=12) {
  count <- count+1
  guess <- as.integer(readline(prompt = "guess:"))
  if (guess < key){
    print("higher")}
  if (guess > key){
    print("lower")}
  if (guess == key){
    print("correct!")
    break}
  if (count ==11 ) {print("Times run out!")
    break}
 }






