# Grating Optimization
Designing a diffraction grating cell (phase mask) using simulated annealing and other techniques


## Introduction
This project deals with the design and optimization of diffraction gratings given a desired target output. We use the process of simulated annealing to converge toward an optimal design.

For diffraction grating design, we treat the unit cell of the grating (i.e. the period of the grating) as 
the region to be encoded. 

This encoding is done in the phase domain. There are traditionally two ways to do this: alternating the phase between two levels
based on transitions point within the cell or creating a rectilinear array of pixels with discrete phase values within the cell. In this project, we will be focusing on the latter technique by optimizing this rectilinear phase mask to output our desired target pattern. This phase mask can then be mapped to a physical grating cell by assigning the phase pixels to a physical parameter (usually etch depth).


## Simulated Annealing
Simulated annealing is a well-characterized stochastic optimization algorithm roughly inspired by the crystallization of cooling metal. Slow cooling of molten metal enforces a highly ordered crystal structure, which leads to a stronger (i.e. optimal) material. On the other hand, rapid cooling results in an irregular, brittle material. This concept is quanitified in the algorithm by a probability variable t, which is referred to analogously as the cooling rate . This variable, along with the merit function (a metric that defines how 'good' the design is, i.e. matches the target), drives the algorithm. t is a measure of the probability of accepting changes that increase the merit function. Changes that lower the merit function (meaning a more optimal design) are accepted. As the number of iterations increase, some changes that increase the merit function are also accepted but, as the algorithm goes on, this probability decreases as t decreases (just as the temperature in the cooling metal reduces the likielihood of crystalline changes). The algorithm continues until a maximum number of iteration is satisfied or an optimal merit function value is reached. 

In this implementation, an initial random phase mask is assigned with a unit amplitude. The Fourier Transform of the mask is taken to obtain the output wavefront. The intensity of the wavefront is found and the mean squared error (MSE) is calculated between the output intensity and the desired target pattern. The MSE serves as the merit function for the system. For each interation, the initial phase mask is randomly perturbed. If the MSE is lower than the previous value, the change is accepted. If not, a random value is chosen (uniformly) and if that value is smaller than t, the change is accepted. If not, a new perturbation is selected. This process is repeated ideally until a convergence of the MSE value is reached, therefore reaching the optimal design. 



<p align="center">
  <img width="402" alt="SimAnnFlow" src="https://user-images.githubusercontent.com/47396320/82946425-2fb95b00-9f53-11ea-87a0-242de7b5f820.png">
  <em>Simulated Annealing Workflow</em>
</p>

