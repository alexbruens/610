# Alex Bruens
# POL 610
# Probelm Set/Lab 1 Script
# August 2020

library("readxl")
load("./hRU_v2019_04_17.RData")

politicalnetworks <- read_excel("politicalnetworkmatrix.xlsx")

ideology <- matrix()