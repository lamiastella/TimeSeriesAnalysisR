library(dtw)
set.seed(6218)
n <- 10
s <- sample(1:100, n)
idx <- c(s, 100+s, 200+s, 300+s, 400+s, 500+s)
sample2 <- sc[idx, ]
distance.matrix <- dist(sample2, method="DTW")
hc <- hclust(distance.matrix, method="average")
plot(hc, labels=observedLabels, main="")
rect.hclust(hc, k=6)
memb <- cutree(hc, k=6)
table(observedLabels, memb)