shop=list("product"=list("milk","rice","sugar"),"price"=list(24,46,36))
bag=list("product"=list(),"price"=list())
choice=0
while(choice<4){
  choice=as.integer(readline("Enter no. of choices:"))
  if(choice==1){
    item=readline("Enter Product:")
    if(item %in% shop[["product"]]){
      bag[["product"]][length(bag[["product"]])+1]=item
      index=which(item ==shop[["product"]])
      bag[["price"]][length(bag[["price"]])+1]=shop[["price"]][index]
    }else{
      print("Product not available!!!")
    }
  }else if(choice==2){
    item=readline("Enter Product to remove:")
    index=which(item ==bag[["product"]])
    bag[["product"]]=bag[["product"]][-index]
    bag[["price"]]=shop[["price"]][-index]
  }else if(choice==3){
    print(bag)
  }else if(choice==4){
    print(bag[["product"]])
    total=0
    for(i in bag["price"]){
      total=total+i
    }
    cat("Your bill is ",total)
  }
}



