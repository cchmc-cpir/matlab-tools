function [tot_sig_ang,last_sig_ang] = Optimum_Angle(N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function calculates the optimum flip angle to apply depending on whether
% you want to optimize total signal intensity or final excitation signal
% intensity. 
% Ignores T1 relaxation
% All it takes is the number of excitations (N) and it returns an ordered pair
% of the two optimized angles
% Written 02/02/2018, Peter Niedbalski
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tot_sig_ang = zeros(size(N));
last_sig_ang = zeros(size(N));


for i = 1:length(N)
    N1 = N(i);
    %For small numbers of excitations, small angles cause problems, need to
    %change the starting angle as I go - want to avoid a bunch of if loops
    %so just use log of num scans - 1. What I have works for N>100. Under
    %that, it will break
    %Look through a bunch of angles
    a = (.5/(log10(100*floor(N1/100))-1)):.0001:30;
    %The variable used in the first derivative polynomial is x = cosd(a)
    x = cosd(a);
    % The following is the first derivative of the total signal with respect to
    % alpha
    y = N1*x.^(N1+2) - (N1+1)*x.^(N1+1) - (N1-1)*x.^N1 + N1*x.^(N1-1) + x - 1;

    % Invert value so that there is a big spike at point where y = 0
    yinv = 1./y;
    %Find the point where function crosses 0
    [m1,i1] = max(yinv);
    [m2,i2] = min(yinv);

    tot_sig_ang(i) = (a(i1)+a(i2))/2;

    %There is an easy analytical solution for optimizing the final excitation
    %signal intensity
    last_sig_ang(i) = acotd(sqrt(N1-1));
end

