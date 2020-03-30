#t1 = timestamp()

setwd("E:/final_comparison/kmeans_final_results")
lte = read.csv("ltemaster_raw_kmeans_static.csv")
lte = na.omit(lte)
set.seed(123)



######### K means clustering ###########

lte_feature = lte[,-1]


#fix(lte_feature)
kmresult = kmeans(lte_feature,5,nstart = 25)
#kmresult

# d = table(lte$sigl,kmresult$cluster)
# plot(lte[c("signal","speed")],col=lte$sigl)

#kmresult$tot.withinss


#plot(x, col =(kmresult$cluster +1) , main="K-Means Clustering
#Results with K=4", xlab ="", ylab="", pch =20, cex =2)

# correct = sum(diag(d)) #N cases correctly classified
# incorrect = sum(d)-sum(diag(d)) #N cases incorrectly classified
# (correct/(correct+incorrect))*100


####### cluster separation performance ########

library(factoextra)

# fviz_cluster(kmresult, data = lte)

library(cluster)

sil = silhouette(kmresult$cluster, dist(lte_feature))
fviz_silhouette(sil)

# #t2 = timestamp()