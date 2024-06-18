# Exact Markov Chain Dynamics on Networks

This repository contains matlab code that automates the generation of the infinitesimal generator for the exact Markov chain formulation of a broad range of binary dynamical processes on networks. This code will work for small networks up to around 20 nodes (depending on available computer memory). The network can be specified through its adjacency matrix and the dynamics can be specified in terms of a vectorised function that returns the transition rate given the vertex state (0 or 1), the number of infected vertices and a structure of parameters.

The Examples directory contains `CoatHangerNetwork.m` which runs the SIS (susceptible infected susceptible) epidemic model on a small network.