#DTW distance for hierarchical clustering of time series data 
library(dtw)
set.seed(6218)
n <- 10
#sc <- read.table("/Users/mona/cs799/UCR_TS_Archive_2015/Gun_Point/Gun_Point_TRAIN")
#sc <- read.table("~/cs799/UCR_TS/Gun_Point/Gun_Point_TRAIN", sep=",", stringsAsFactors=FALSE)
sc <- read.table("data/synthetic_control.data", header=F, sep="")
s <- sample(1:100, n)
idx <- c(s, 100+s, 200+s, 300+s, 400+s, 500+s)
sample2 <- sc[idx, ]
distance.matrix <- dist(sample2, method="DTW")
hc <- hclust(distance.matrix, method="average")
observedLabels <- c(rep(1,n), rep(2,n), rep(3,n), rep(4,n), rep(5,n), rep(6,n))
plot(hc, labels=observedLabels, main="")
rect.hclust(hc, k=6)
memb <- cutree(hc, k=6)
clustering_table <- table(observedLabels, memb)