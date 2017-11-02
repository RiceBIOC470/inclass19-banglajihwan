%In class 19

% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 
meanP = mean(placebo);
meanT1 = mean(treatment1);
meanT2 = mean(treatment2);
stdP = std(placebo);
stdT1 = std(treatment1);
stdT2 = std(treatment2); 
bars = [meanP meanT1 meanT2];
errorbars = [stdP stdT1 stdT2]; 
c = categorical({'placebo','treatment1','treatment2'});
bar(c, bars); 
hold on 
errorbar(c, bars, errorbars, '.'); 
hold off

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 
data = [placebo, treatment1, treatment2] 
array = {} 
for ii = 1:length(placebo)
    p = 'placebo'
    array(ii) = {p}
end 

for jj = 1:length (treatment1)
    p = 'treatment1'
    array(jj+length(placebo))={p}
end 

for kk = 1:length(treatment2)
    p = 'treatment2'
    array(kk+length(placebo)+length(treatment1))={p}
end 
[p,table,stats] = anova1(data, array);
%p is less than 0.05 therefore there is a sig. difference

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 
multcompare(stats);
%treatment2 is different


%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.
data1 = load('data.mat'); 
% 1 ydat1
xdat = data1.xdat;
ydat = data1.ydat;
ydat2 = data1.ydat2; 
[coeff, s] = polyfit(xdat, ydat,1);
scatter(xdat, ydat);
hold on;
plot(xdat, polyval(coeff, xdat), 'k-', 'LineWidth', 3);
hold off; 

% 2 ydat1
[coeff2, s2] = polyfit(xdat, ydat,2);
scatter(xdat, ydat);
hold on;
plot(xdat, polyval(coeff2, xdat), 'k-', 'LineWidth', 3);
hold off; 

% 3 ydat1
[coeff3, s3] = polyfit(xdat, ydat,3);
scatter(xdat, ydat);
hold on;
plot(xdat, polyval(coeff3, xdat), 'k-', 'LineWidth', 3);
hold off; 


%1 ydat2
figure(2);
[coeff4, s4] = polyfit(xdat, ydat2,1);
scatter(xdat, ydat2);
hold on;
plot(xdat, polyval(coeff4, xdat), 'k-', 'LineWidth', 3);
hold off; 

%2 ydat2
[coeff5, s5] = polyfit(xdat, ydat2,2);
scatter(xdat, ydat2);
hold on;
plot(xdat, polyval(coeff5, xdat), 'k-', 'LineWidth', 3);
hold off; 

%3 ydat2
[coeff6, s6] = polyfit(xdat, ydat2,3);
scatter(xdat, ydat2);
hold on;
plot(xdat, polyval(coeff6, xdat), 'k-', 'LineWidth', 3);
hold off; 

%for ydat linear fits best; for ydat2 3rd power fits best

fit_out = fit(xdat', ydat2', 'poly3'); 
scatter(xdat, ydat2);
hold on;
plot(fit_out);
hold off; 

%they both look good! 