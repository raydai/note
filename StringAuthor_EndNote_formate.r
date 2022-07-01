# Some authors refercne are not following EndNote format.
# Here is a simple code to re-organize the author format.

mystring <- "Hadley Wickham and Mara Averick and Jennifer Bryan and
Winston Chang and Lucy D'Agostino McGowan and Romain François and
Garrett Grolemund and Alex Hayes and Lionel Henry and Jim Hester
and Max Kuhn and Thomas Lin Pedersen and Evan Miller and Stephan
Milton Bache and Kirill Müller and Jeroen Ooms and David Robinson
and Dana Paige Seidel and Vitalie Spinu and Kohske Takahashi and
Davis Vaughan and Claus Wilke and Kara Woo and Hiroaki Yutani"

library(tidyverse)
mystring <- gsub(pattern = "\n",replacement = " ",x = mystring)
mystring <- str_split(string = mystring,pattern = " and ") %>% unlist
myname <- data.frame("Fname"=word(string = mystring,start = 1,end = 1,sep = " "),
           "Mname"=word(string = mystring,start = 2,end = 2,sep = " "),
           "Lname"=word(string = mystring,start = 3,end = 3,sep = " "),stringsAsFactors = F)
myname <- myname %>% transform(Mname = ifelse(is.na(Lname),
                                    Mname,
                                    paste(substr(x = Mname,1,1),".",sep = ""))) %>% 
  transform("whoelname" = ifelse(is.na(Lname),paste(Mname,Fname,sep=", "),
                                 paste(Lname, ", ", Fname, " ", Mname,sep = "")))

cat(myname$whoelname,sep = "\n")




