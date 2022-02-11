library(RCurl)
library(rjson)
library(Rfacebook)
library(help=Rfacebook)

# link to get access token
#https://developers.facebook.com/tools/explorer
accessToken <-"XYZ"

# Suppose we want to extract data from a page called "ABXC" Page having address www.facebook.com/abc
abcPage <-getPage(page="abc", token=accessToken, n=15000)

# Check if topic is "TOPIC1"
posts.abc.index <- grepl("TOPIC1",abcPage$message)
table(posts.abc.index)

posts.abc <- abcPage[posts.abc.index,] 

# Now post information 
for (p in posts.abc$id){
  # Extract Comments
  post1 <-getPost(post=p,
                  token=accessToken,
                  n=15000,
                  comments=TRUE,
                  likes=T
  )
  post.sum <-post1$post
  post.likes<-post1$likes
  post.comments <-post1$comments
  # No imformation on who shared...
  # Initialize & assign
  if(p==posts.abc$id[1]){
    c.post.sum <-post.sum
    c.post.likes <- post.likes
    c.post.comments <- post.comments
    
  }
  # Append
  if(p !=posts.abc$id[1]){
    c.post.sum <- rbind(c.post.sum,post.sum)
    c.post.likes <- rbind(c.post.likes,post.likes)
    c.post.comments <- rbind(c.post.comments,post.comments)
  }
  
}



