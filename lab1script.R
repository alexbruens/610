# Alex Bruens
# POL 610
# Probelm Set/Lab 1
# August 2020

library("readxl")
install.packages("sna")
library("sna")
load("./hRU_v2019_04_17.RData")

# Load adjacency matrix
pol_net <- read.csv("politicalnetworkmatrix.csv")
pol_net <- as.matrix(pol_net)
rownames(pol_net) <- colnames(pol_net)
is.matrix(pol_net)
# OR generate ajacency matrix from edge list
pol_net <- as.matrix( Get_Adjacency_From_File( "edgelist_pol.csv", EdgeListQ=TRUE, CSVQ=TRUE, MakeUndirectedQ=TRUE, VisualizeQ=FALSE ) )

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

# ideology attributes <1 are unable to be displayed
pol_net_attributes[pol_net_attributes==1] <- 2
pol_net_attributes[pol_net_attributes==0] <- 1
pol_net_attributes[pol_net_attributes==-1] <- 0

Visualize_Network(pol_net, FALSE, vertex_colors=pol_net_attributes$ideology)

jpeg(file="pol_net.jpeg")
Visualize_Network(pol_net, FALSE, vertex_colors=pol_net_attributes$ideology)
dev.off()
