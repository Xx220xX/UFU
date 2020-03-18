addpath('../1/');addpath('../3/');
clc;clear;close all;
figure
dt = 1e-7;
t = -0.5:dt:6;
default = rect((t-2.5)/5);
func = ["rect((t-2.5)/5)","rect((t-2.5)/5)/2","-rect((t-2.5)/5)","exp(-t/5).*rect((t-2.5)/5)","exp(-t).*rect((t-2.5)/5)","sin(2*pi*t).*rect((t-2.5)/5)"];
func(1)
for i=1:6
   exe4(default,t,func(i),dt,i);
end

