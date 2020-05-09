clc;
close all
clear all

global dx dy N M
N = 20; %20 by 20 lasers
Phase = zeros(N, N);
dx = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dy = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

%% 1
dx = [1,1,1,0,1,1,1,0,1,1,1,1,1,1,0,1,0,1,1,0;0,0,-1,0,0,0,-1,0,0,0,-1,-1,-1,-1,0,0,1,0,0,-1;0,0,0,0,0,0,0,1,0,1,1,1,0,0,0,0,-1,-1,1,0;0,0,0,0,0,-1,0,-1,0,-1,-1,-1,0,0,0,1,0,0,0,-1;0,0,0,1,1,1,1,0,1,0,1,0,0,0,0,0,0,0,1,0;0,0,0,0,-1,-1,-1,0,-1,0,0,-1,0,0,0,0,0,0,0,0;0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,-1,0;0,0,0,0,0,0,0,0,0,0,0,-1,-1,0,0,0,1,1,0,0;0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,-1,0,-1;0,0,0,0,0,0,0,-1,0,-1,0,-1,0,0,0,0,0,0,1,0;0,0,0,0,0,1,0,1,0,0,-1,0,-1,0,0,0,0,0,0,-1;0,0,0,0,0,-1,0,0,1,1,1,0,1,0,0,0,-1,0,1,0;0,0,0,0,1,0,0,0,0,-1,-1,0,0,-1,1,1,1,0,0,-1;0,0,0,0,0,0,-1,0,1,0,0,0,1,0,0,-1,0,-1,1,0;0,0,0,0,0,1,0,0,0,-1,0,0,0,-1,-1,0,-1,0,-1,0;0,0,0,0,0,-1,0,0,1,0,0,0,1,1,1,1,1,0,0,0;0,0,0,1,1,0,0,0,0,-1,0,0,0,-1,-1,-1,-1,0,0,0;0,0,0,0,-1,-1,-1,0,1,0,0,1,1,1,1,1,0,0,0,0;0,0,0,1,1,1,0,0,0,-1,0,-1,-1,-1,-1,-1,-1,-1,0,0;0,0,0,-1,0,-1,0,0,1,1,1,1,1,1,1,1,1,1,0,0;0,-1,0,0,-1,0,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dy = [0,0,0,-1,0,0,0,-1,0,0,0,0,0,0,-1,0,-1,0,0,-1;1,-1,0,-1,1,-1,0,-1,1,-1,0,0,0,0,-1,1,0,1,-1,0;1,-1,1,-1,1,-1,1,0,1,0,0,0,-1,1,-1,1,0,0,0,-1;1,-1,1,-1,1,0,1,0,-1,0,0,0,-1,1,-1,0,-1,1,-1,0;1,-1,1,0,0,0,0,1,0,-1,0,1,-1,1,-1,1,-1,1,0,-1;1,-1,1,-1,0,0,0,-1,0,-1,1,0,-1,1,-1,1,-1,1,0,-1;1,-1,1,-1,0,-1,1,-1,1,-1,0,1,-1,1,-1,1,-1,1,0,-1;1,-1,1,-1,1,-1,1,-1,1,-1,1,0,0,1,-1,1,0,0,1,-1;1,-1,1,-1,1,-1,1,-1,1,0,0,0,-1,1,-1,1,-1,0,-1,0;1,-1,1,-1,1,-1,1,0,1,0,-1,0,-1,1,-1,1,-1,1,0,-1;1,-1,1,-1,1,0,-1,0,-1,1,0,1,0,1,-1,1,-1,1,-1,0;1,-1,1,-1,1,0,-1,1,0,0,0,-1,0,1,-1,1,0,1,0,-1;1,-1,1,-1,0,1,-1,1,-1,0,0,-1,1,0,0,0,0,1,-1,0;1,-1,1,-1,1,-1,0,1,0,-1,1,-1,0,1,-1,0,-1,0,0,-1;1,-1,1,-1,1,0,-1,1,-1,0,1,-1,1,0,0,1,0,1,0,-1;1,-1,1,-1,1,0,-1,1,0,-1,1,-1,0,0,0,0,0,-1,1,-1;1,-1,1,0,0,1,-1,1,-1,0,1,-1,1,0,0,0,0,-1,1,-1;1,-1,1,-1,0,0,0,1,0,-1,1,0,0,0,0,0,1,-1,1,-1;1,-1,1,0,0,0,-1,1,-1,0,1,0,0,0,0,0,0,0,1,-1;1,-1,1,0,-1,0,-1,1,0,0,0,0,0,0,0,0,0,0,1,-1;1,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 2
dx = [1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0;0,0,-1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0;0,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;0,0,-1,1,0,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;0,1,0,0,-1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0;0,0,-1,1,0,0,-1,0,1,0,1,0,1,0,1,0,1,0,1,0;0,1,0,0,-1,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;0,0,-1,1,0,0,-1,1,0,0,0,-1,0,-1,0,-1,0,-1,0,-1;0,1,0,0,-1,1,0,0,-1,0,1,0,1,0,1,0,1,0,1,0;0,0,-1,1,0,0,-1,1,0,1,0,1,0,1,0,1,0,1,0,0;0,1,0,0,-1,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;0,0,-1,1,0,0,-1,1,0,0,0,-1,0,-1,0,-1,0,-1,0,-1;0,1,0,0,-1,1,0,0,-1,0,1,0,1,0,1,0,1,0,1,0;0,0,-1,1,0,0,-1,1,0,1,0,1,0,1,0,1,0,1,0,0;0,1,0,0,-1,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;0,0,-1,1,0,0,-1,1,0,0,0,-1,0,-1,0,-1,0,-1,0,-1;0,1,0,0,-1,1,0,0,-1,0,1,0,1,0,1,0,1,0,1,0;0,0,-1,1,0,0,-1,1,0,1,0,1,0,1,0,1,0,1,0,0;0,1,0,0,-1,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;0,-1,1,1,0,0,1,1,0,0,0,-1,0,-1,0,-1,0,-1,0,-1;0,0,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0];
dy = [0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;1,-1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,-1;1,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,1,0,1,0,1,0,1,0,1,0,1,0,1,0;1,0,-1,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;1,-1,0,0,1,-1,0,1,0,1,0,1,0,1,0,1,0,1,0,-1;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,0,0,1,-1,1,0,1,0,1,0,1,0,1,0;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,0,0,1,0,1,0,1,0,1,0,1,0,1,-1;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,0,0,1,-1,1,0,1,0,1,0,1,0,1,0;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,0,0,1,0,1,0,1,0,1,0,1,0,1,-1;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,0,0,1,-1,1,0,1,0,1,0,1,0,1,0;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,-1,0,0,1,-1,0,0,1,0,1,0,1,0,1,0,1,0,1,-1;1,0,-1,1,0,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;1,0,0,0,1,0,0,0,1,-1,1,0,1,0,1,0,1,0,1,0;0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 3 (40by40)

dx = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dy = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 4 (40by40)

dx = [1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,0,-1,0,0,-1,0,-1,-1,-1,0,-1,0,-1,-1,-1,0,-1,0,-1,-1,-1,0,-1,0,-1,-1,-1,0,-1,0,-1,-1,-1,0,-1,0;0,1,0,0,0,0,0,1,0,1,1,0,0,-1,0,1,1,0,0,-1,0,1,1,0,0,-1,0,1,1,0,0,-1,0,1,1,0,0,-1,0,0;0,0,-1,0,-1,0,0,0,0,-1,-1,-1,1,1,0,0,-1,-1,1,0,0,-1,-1,-1,1,1,0,0,-1,-1,1,0,0,-1,-1,-1,1,1,0,0;0,1,1,1,0,0,0,0,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,0;0,0,-1,-1,-1,0,-1,0,0,0,-1,-1,-1,-1,0,0,-1,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0,-1,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0;0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,0,1,1,1,0,1,0,0;0,0,-1,-1,0,-1,0,0,0,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,-1,-1,0,-1,0;0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,1,1,0,0;0,0,-1,0,-1,0,0,0,0,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,-1,-1,0;0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,0,0,0;0,0,-1,-1,-1,0,-1,0,0,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0;0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,0,1,1,1,0,1,0,0;0,0,-1,-1,0,-1,0,0,0,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,-1,-1,0,-1,0;0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,1,1,0,0;0,0,-1,0,-1,0,0,0,0,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,-1,-1,0;0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,0,0,0;0,0,-1,-1,-1,0,-1,0,0,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0;0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,0,1,1,1,0,1,0,0;0,0,-1,-1,0,-1,0,0,0,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,-1,-1,0,-1,0;0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,1,1,0,0;0,0,-1,0,-1,0,0,0,0,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,-1,-1,0;0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,0,0,0;0,0,-1,-1,-1,0,-1,0,0,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0;0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,0,1,1,1,0,1,0,0;0,0,-1,-1,0,-1,0,0,0,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,-1,-1,0,-1,0;0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,1,1,0,0;0,0,-1,0,-1,0,0,0,0,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,-1,-1,0;0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,0,0,0;0,0,-1,-1,-1,0,-1,0,0,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,0,0,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0;0,1,1,1,1,1,0,0,0,1,0,1,1,0,0,0,1,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,0,1,1,1,0,1,0,0;0,0,-1,-1,0,-1,0,0,0,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,0,0,-1,0,0,0,-1,-1,0,-1,0,0,-1,-1,0,-1,0;0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,0,0,1,0,0,1,1,0,1,0,0,1,1,1,1,0,0;0,0,-1,0,-1,0,0,0,0,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,0,-1,1,0,0,-1,-1,-1,0,-1,0,-1,-1,-1,0;0,1,1,1,0,0,0,0,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,1,0,0,-1,1,1,1,0,1,0,1,1,0,0,0;0,0,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,-1,-1,-1,0,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,-1,0,-1,-1,-1,-1,0,-1,-1,-1,-1,0,0;0,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,0,0;0,0,0,0,0,-1,-1,0,0,0,0,-1,-1,0,0,0,0,-1,-1,0,0,0,0,-1,-1,0,0,0,0,-1,-1,0,0,0,0,-1,-1,0,0,0;0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1,0,0;0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dy = [0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,-1,0,-1,1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1;1,0,-1,1,-1,1,-1,0,1,0,0,-1,1,0,1,0,0,-1,1,0,1,0,0,-1,1,0,1,0,0,-1,1,0,1,0,0,-1,1,0,1,-1;1,-1,0,1,0,1,-1,1,-1,0,0,0,0,0,1,-1,0,0,0,-1,1,0,0,0,0,0,1,-1,0,0,0,-1,1,0,0,0,0,0,1,-1;1,0,0,0,-1,1,-1,1,-1,0,0,0,1,-1,0,0,0,0,1,0,-1,0,0,0,1,-1,0,0,0,0,1,0,-1,0,0,0,1,-1,0,-1;1,-1,0,0,0,1,0,1,-1,1,0,0,0,0,1,-1,0,0,0,0,0,1,0,0,0,0,1,-1,0,0,0,0,0,1,0,0,0,0,1,-1;1,0,0,0,0,0,-1,1,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,0,0,-1,0,1,-1;1,-1,0,0,-1,0,-1,1,-1,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,0,0,1,0,-1;1,0,-1,1,-1,1,-1,1,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,0,0,0,1,-1;1,-1,0,1,0,1,-1,1,-1,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,0,0,-1;1,0,0,0,-1,1,-1,1,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,-1,1,-1;1,-1,0,0,0,1,0,1,-1,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,1,-1;1,0,0,0,0,0,-1,1,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,0,0,-1,0,1,-1;1,-1,0,0,-1,0,-1,1,-1,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,0,0,1,0,-1;1,0,-1,1,-1,1,-1,1,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,0,0,0,1,-1;1,-1,0,1,0,1,-1,1,-1,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,0,0,-1;1,0,0,0,-1,1,-1,1,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,-1,1,-1;1,-1,0,0,0,1,0,1,-1,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,1,-1;1,0,0,0,0,0,-1,1,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,0,0,-1,0,1,-1;1,-1,0,0,-1,0,-1,1,-1,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,0,0,1,0,-1;1,0,-1,1,-1,1,-1,1,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,0,0,0,1,-1;1,-1,0,1,0,1,-1,1,-1,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,0,0,-1;1,0,0,0,-1,1,-1,1,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,-1,1,-1;1,-1,0,0,0,1,0,1,-1,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,1,-1;1,0,0,0,0,0,-1,1,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,0,0,-1,0,1,-1;1,-1,0,0,-1,0,-1,1,-1,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,0,0,1,0,-1;1,0,-1,1,-1,1,-1,1,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,0,0,0,1,-1;1,-1,0,1,0,1,-1,1,-1,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,0,0,-1;1,0,0,0,-1,1,-1,1,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,-1,1,-1;1,-1,0,0,0,1,0,1,-1,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,0,-1,1,0,0,0,0,1,0,0,0,0,1,-1;1,0,0,0,0,0,-1,1,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,-1,0,0,-1,1,-1,0,0,0,0,-1,0,0,0,-1,0,1,-1;1,-1,0,0,-1,0,-1,1,-1,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,1,-1,0,1,-1,1,0,0,-1,0,1,-1,0,0,1,0,-1;1,0,-1,1,-1,1,-1,1,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,1,-1,0,1,-1,0,0,1,0,-1,1,0,0,0,0,1,-1;1,-1,0,1,0,1,-1,1,-1,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,1,0,0,1,-1,0,0,0,1,0,-1,0,0,0,-1;1,0,0,0,-1,1,-1,1,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,0,1,-1,0,0,0,0,-1,0,1,0,0,-1,1,-1;1,-1,0,0,0,1,0,1,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,-1;1,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,0,-1,0,0,0,-1,1,-1;1,-1,1,-1,1,0,0,-1,1,-1,1,0,0,-1,1,-1,1,0,0,-1,1,-1,1,0,0,-1,1,-1,1,0,0,-1,1,-1,1,0,0,-1,1,-1;1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,1,0,1,-1;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 5 (20by20)

dx = [0,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;1,0,1,1,1,0,0,0,-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1;0,-1,0,-1,0,-1,0,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0;1,0,1,0,1,0,0,0,-1,1,1,1,1,1,1,1,1,0,1,0;0,-1,0,-1,0,-1,0,1,0,0,-1,-1,0,-1,-1,-1,0,-1,0,-1;1,0,1,0,1,0,0,0,-1,1,1,0,1,0,1,0,1,0,1,0;0,-1,0,-1,0,-1,0,1,0,0,-1,-1,0,-1,0,-1,0,-1,0,-1;1,0,1,0,1,0,0,0,-1,1,1,0,1,0,1,0,1,0,1,0;0,-1,0,-1,0,-1,0,1,0,0,-1,-1,0,-1,0,-1,0,-1,0,-1;1,0,1,0,1,0,0,0,-1,1,1,0,1,0,1,0,1,0,1,0;0,-1,0,-1,0,-1,0,1,0,0,-1,-1,-1,-1,0,-1,0,-1,0,-1;1,0,1,0,1,0,0,0,-1,1,0,1,0,1,0,0,1,0,1,0;0,-1,0,-1,0,-1,0,1,1,0,1,0,1,0,1,0,0,-1,0,-1;1,0,1,0,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,1,0,1,0;0,-1,0,-1,0,-1,0,0,-1,0,-1,0,-1,0,-1,0,-1,-1,0,-1;1,0,1,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0;0,-1,0,-1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0;1,0,1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1;0,-1,0,-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0;1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0];
dy = [-1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,-1,0,0,0,-1,1,-1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0;-1,0,1,0,-1,0,1,0,-1,1,0,1,0,1,0,1,0,1,0,1;0,-1,0,1,0,-1,1,-1,0,0,0,0,0,0,0,0,0,-1,0,1;-1,0,1,0,-1,0,1,0,-1,1,0,0,-1,0,0,0,-1,0,1,0;0,-1,0,1,0,-1,1,-1,0,0,0,1,0,-1,0,1,0,-1,0,1;-1,0,1,0,-1,0,1,0,-1,1,0,0,-1,0,1,0,-1,0,1,0;0,-1,0,1,0,-1,1,-1,0,0,0,1,0,-1,0,1,0,-1,0,1;-1,0,1,0,-1,0,1,0,-1,1,0,0,-1,0,1,0,-1,0,1,0;0,-1,0,1,0,-1,1,-1,0,0,0,1,0,-1,0,1,0,-1,0,1;-1,0,1,0,-1,0,1,0,-1,1,0,0,0,0,1,0,-1,0,1,0;0,-1,0,1,0,-1,1,-1,0,0,-1,0,-1,0,-1,1,0,-1,0,1;-1,0,1,0,-1,0,1,0,0,1,0,1,0,1,0,1,-1,0,1,0;0,-1,0,1,0,-1,1,0,-1,0,-1,0,-1,0,-1,0,0,-1,0,1;-1,0,1,0,-1,0,0,1,0,1,0,1,0,1,0,1,0,0,1,0;0,-1,0,1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,1;-1,0,1,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1;0,-1,0,1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0;-1,0,1,0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1;-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,1;0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 6 (20by20)

dx = [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1,0;0,0,-1,-1,0,-1,-1,-1,0,1,1,1,1,1,1,1,0,0,-1,0;0,1,0,0,1,0,0,0,0,0,0,-1,-1,-1,-1,-1,0,1,0,0;0,0,-1,0,0,-1,1,0,0,0,0,1,1,1,1,0,0,0,-1,0;0,1,0,0,1,0,0,-1,0,0,0,0,-1,-1,-1,-1,-1,1,0,0;0,0,-1,0,-1,-1,1,0,0,0,0,1,0,1,0,1,0,0,-1,0;0,1,1,1,1,0,0,-1,0,0,0,0,1,0,1,0,1,1,0,0;0,0,-1,-1,0,-1,1,0,0,0,0,0,-1,-1,-1,-1,-1,-1,-1,0;0,1,0,0,1,0,0,-1,-1,0,1,1,1,1,1,1,1,1,0,0;0,0,-1,0,0,-1,1,1,0,0,-1,0,-1,0,-1,-1,-1,-1,-1,0;0,1,0,0,1,0,0,0,-1,0,0,0,0,1,1,1,1,0,0,0;0,0,-1,0,-1,-1,0,0,1,0,0,-1,0,0,-1,-1,-1,0,0,0;0,1,1,1,1,0,0,1,0,1,1,1,0,1,1,0,0,0,0,0;0,0,-1,-1,0,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,-1,0,0;0,1,0,0,1,0,1,1,1,0,1,1,1,1,0,1,1,0,0,0;0,0,-1,0,0,-1,0,0,-1,-1,0,0,0,-1,-1,0,0,-1,0,0;0,1,0,0,1,0,0,1,1,0,0,0,1,1,0,0,0,1,0,0;0,0,-1,0,-1,-1,0,0,-1,-1,0,0,0,-1,-1,0,0,0,0,-1;0,1,1,1,1,1,0,1,1,1,0,0,1,1,1,0,1,0,1,0;0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
dy = [0,0,0,0,0,0,0,0,-1,0,0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,-1,0,0,0,-1,0,0,0,0,0,0,0,-1,1,0,-1;1,0,-1,1,0,-1,0,1,-1,1,-1,0,0,0,0,0,-1,0,1,-1;1,-1,0,1,-1,0,0,1,-1,1,-1,0,0,0,0,1,-1,1,0,-1;1,0,-1,1,0,-1,1,0,-1,1,-1,1,0,0,0,0,0,0,1,-1;1,-1,0,1,0,0,0,1,-1,1,-1,0,-1,0,-1,0,-1,1,0,-1;1,0,0,0,0,-1,1,0,-1,1,-1,1,0,1,0,1,0,0,1,-1;1,-1,0,0,-1,0,0,1,-1,1,-1,1,0,0,0,0,0,0,0,-1;1,0,-1,1,0,-1,1,0,0,1,0,0,0,0,0,0,0,0,1,-1;1,-1,0,1,-1,0,0,0,-1,1,0,-1,0,-1,0,0,0,0,0,-1;1,0,-1,1,0,-1,1,-1,0,0,1,-1,1,0,0,0,0,-1,1,-1;1,-1,0,1,0,0,1,-1,0,-1,1,0,1,-1,0,0,0,-1,1,-1;1,0,0,0,0,-1,1,0,1,0,0,0,1,0,0,-1,1,-1,1,-1;1,-1,0,0,-1,0,1,0,0,0,0,0,0,0,0,0,1,0,1,-1;1,0,-1,1,0,-1,0,0,0,-1,0,0,0,0,-1,0,0,-1,1,-1;1,-1,0,1,-1,0,1,-1,0,0,1,1,-1,0,0,1,-1,0,1,-1;1,0,-1,1,0,-1,1,0,0,-1,1,1,0,0,-1,1,-1,0,1,-1;1,-1,0,1,0,0,1,-1,0,0,1,1,-1,0,0,1,-1,1,-1,0;1,0,0,0,0,0,1,0,0,0,1,1,0,0,0,1,0,1,0,-1;1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 7 (10by10)

dx = [1,1,1,0,1,1,1,0,1,0;0,0,-1,0,0,0,-1,0,0,0;0,0,0,0,0,0,0,1,0,0;0,0,0,0,0,-1,0,-1,0,-1;0,0,0,1,1,1,1,0,1,0;0,0,0,0,-1,-1,-1,0,-1,0;0,0,0,1,1,0,0,0,0,0;0,0,0,0,-1,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0;0,-1,0,-1,0,-1,0,-1,0,-1];
dy = [0,0,0,-1,0,0,0,-1,0,-1;1,-1,0,-1,1,-1,0,-1,1,-1;1,-1,1,-1,1,-1,1,0,1,-1;1,-1,1,-1,1,0,1,0,-1,0;1,-1,1,0,0,0,0,1,0,-1;1,-1,1,-1,0,0,0,-1,0,-1;1,-1,1,0,0,-1,1,-1,1,-1;1,-1,1,-1,0,-1,1,-1,1,-1;1,-1,1,-1,1,-1,1,-1,1,-1;1,0,1,0,1,0,1,0,1,0];
[M, N] = size(dx);
Phase = zeros(M, N);

%% 8 (8by8)

dx = [1,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,0;0,0,-1,-1,-1,-1,-1,-1,-1,-1;0,1,1,1,1,1,1,1,1,0;0,-1,-1,-1,-1,-1,-1,-1,-1,-1;0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0];
dy = [0,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,-1;1,-1,0,0,0,0,0,0,0,0;1,0,0,0,0,0,0,0,0,-1;1,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0];
[M, N] = size(dx);
Phase = zeros(M, N);


%% 
[coordX, coordY] = meshgrid(1:N, 1:M);


function [indX, indY] = getInd(ii)
    global dx dy N

    if (ii <= N)
        indX = mod(ii, N);

    end

end