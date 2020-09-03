# Alex Bruens
# Probelm Set/Lab 1
# August 31, 2020

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

Visualize_Network(pol_net, FALSE)

# Load attributes
pol_net_attributes <- read.csv("attributes_pol.csv", header=FALSE)
colnames(pol_net_attributes) <- c("node","ideology")
Visualize_Network(pol_net, FALSE, vertex_colors=pol_net_attributes$ideology)

# ideology attributes <1 are unable to be displayed
pol_net_attributes[pol_net_attributes==1] <- 2 #rep
pol_net_attributes[pol_net_attributes==0] <- 1 # mod
pol_net_attributes[pol_net_attributes==-1] <- 0 #lib

Visualize_Network(pol_net, FALSE, vertex_colors=pol_net_attributes$ideology)

jpeg(file="pol_net.jpeg")
Visualize_Network(pol_net, FALSE, vertex_colors=pol_net_attributes$ideology)
dev.off()

Get_Density(pol_net)
polnet_degree <- Extract_Indegree_Egos(pol_net)
hist(polnet_degree)

###

# Generate subnetworks
lib_net <- as.matrix(Create_Subgraph_By_Attribute(pol_net, pol_net_attributes$ideology, 0, 0, TRUE))
mod_net <- as.matrix(Create_Subgraph_By_Attribute(pol_net, pol_net_attributes$ideology, 1, 1, TRUE))
rep_net <- as.matrix(Create_Subgraph_By_Attribute(pol_net, pol_net_attributes$ideology, 2, 2, TRUE))

Visualize_Network((Create_Subgraph_By_Attribute(pol_net, pol_net_attributes$ideology, 0, 0, TRUE)), FALSE)

# Vis
jpeg(file="lib_net.jpeg")
Visualize_Network(lib_net, FALSE)
dev.off()
jpeg(file="mod_net.jpeg")
Visualize_Network(mod_net, FALSE)
dev.off()
jpeg(file="rep_net.jpeg")
Visualize_Network(rep_net, FALSE)
dev.off()

# Density & Degree
Get_Density(lib_net)
libnet_degree <- Extract_Indegree_Egos(lib_net)
hist(libnet_degree)
Get_Density(mod_net)
modnet_degree <- Extract_Indegree_Egos(mod_net)
hist(modnet_degree)
Get_Density(rep_net)
repnet_degree <- Extract_Indegree_Egos(rep_net)
hist(repnet_degree)

jpeg(file="libnet_degree.jpeg")
hist(libnet_degree, main="Liberal Network Indegree")
dev.off()
jpeg(file="modnet_degree.jpeg")
hist(modnet_degree, main="Moderate Network Indegree")
dev.off()
jpeg(file="repnet_degree.jpeg")
hist(repnet_degree, main="Republican Network Indegree")
dev.off()


