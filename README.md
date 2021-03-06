# 610 Class Materials
Course materials for POL 610 - Political Network Analysis

## Lab #1 -- Hypothetical Political Discussion Assignment

First, I created an [edge list](../master/edgelist_pol.csv), only after I created an adjacency matrix ([CSV](../master/politicalnetworkmatrix.csv), [XLSX](../master/politicalnetworkmatrix.xlsx)).
I easily loaded the ajacency matrix into R, but used `hRU` to convert the edge list into a matrix; [R script file](../master/lab1script.R).

### Dataset Exercises
1. Write an R script to load the network and attribute data into two objects: adjacency matrix, and vector. ([script](../master/lab1script.R))
   - [x] Adjacency matrix with network data  
   - [x] Vector with attribute data  

2. Create a visualization of this network, with node colors.  
   ![Pol Net Visualization](/pol_net.jpeg)  
   `Node colors: White denotes liberals, black denotes moderates, and red denotes conservatives.`

### Additional Questions
3. Is the graph connected or disconnected?

4. What is the maximum degree? Plot distribution

5. Density of network

6. Density of subgraph of conservatives?

7. Density of liberals?

8. Density of moderates?

9. Are there any fundamental differences between political discussion and ideology?

### Testing Causal Hypotheses
10. What extent is shared ideology correlated with discussion?

11. Estimate degree to which shared ideology, and other factors, determine the structure of the network.

## Lab #2 -- Risk Professionals
TBA
