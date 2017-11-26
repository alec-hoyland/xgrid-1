% this function is used in the example (test.m)
% to show how custom functions can be written to
% run xolotl simulations using pyschopomp
% 
% functions that can be run by pyschopomp take in only
% argument, which is the xolotl object
% they are responsible for running the simulation, analyzing
% outputs, and returning data that matches the dimensions 
% specified in the data_sizes property 

function [burst_period, n_spikes_per_burst, spike_times] = test_func(x)

[V,Ca] = x.integrate; 

transient_cutoff = floor(length(V)/2);
Ca = Ca(transient_cutoff:end,1);
V = V(transient_cutoff:end);

burst_metrics = psychopomp.findBurstMetrics(V,Ca);

burst_period = burst_metrics(1);
n_spikes_per_burst = burst_metrics(2);

spike_times = psychopomp.findNSpikes(V,100);
