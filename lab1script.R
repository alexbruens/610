# Alex Bruens
# POL 610
# Probelm Set/Lab 1
# August 2020

library("readxl")
install.packages("sna")
library("sna")
load("./hRU_v2019_04_17.RData")

#

# Load adjacency matrix
politicalnetworks <- read.csv("politicalnetworkmatrix.csv")
politicalnetworks<- as.matrix(politicalnetworks)
rownames(politicalnetworks) <- colnames(politicalnetworks)
is.matrix(politicalnetworks)

# Generate ajacency matrix from edge list
pol_net <- as.matrix( Get_Adjacency_From_File( "edgelist_pol.csv", EdgeListQ=TRUE, CSVQ=TRUE, MakeUndirectedQ=TRUE, VisualizeQ=FALSE ) )

Visualize_Network(pol_net, FALSE)

# Load attributes
pol_net_attributes <- read.csv("attributes_pol.csv", header=FALSE)
colnames(pol_net_attributes) <- c("node","ideology")
Visualize_Network(pol_net, FALSE, vertex_colors=pol_net_attributes$ideology)
