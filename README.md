# Grating-Optimization
Designing a diffraction grating cell (phase mask) using simulated annealing and other techniques


## Introduction
This project deals with the design and optimization of diffraction gratings given a desired target output. We use the process of simulated annealing to converge toward an optimal design.

For diffraction grating design, we treat the unit cell of the grating (i.e. the period of the grating) as 
the region to be encoded. 

This encoding is done in the phase domain. There are traditionally two ways to do this: alternating the phase between two levels
based on transitions point within the cell or creating a rectilinear array of pixels with discrete phase values within the cell. In this project, we will be focusing on the latter technique by optimizing this rectilinear phase mask to output our desired target pattern. This phase mask can then be mapped to a physical grating cell by assigning the phase pixels to a physical parameter (usually etch depth).
