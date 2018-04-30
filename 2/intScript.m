% A script for exercise 3 on numerical integration

% What we know so far. Undisputable facts
desired_result = 3*atan(sqrt(2))-sqrt(2);
tol = 10^-10;
f = @(x)(atan(sqrt(x)));
a = 0; b = 2;

hMin = 10^-7;

% Testing trapComp
[value_trap,flag_trap,trap_stats] = trapComp(f,a,b,tol,hMin); 
[value_simp,flag_simp,simp_stats] = simpComp2(f,a,b,tol,hMin);
fprintf('Desired accuracy attained: %d\n', flag_trap) 
fprintf('Integral approximation: %d\n', abs(desired_result - value_trap));
fprintf('Desired accuracy attained: %d\n', flag_simp) 
fprintf('Integral approximation: %d\n', abs(desired_result - value_simp));

% Testing for i=1:10
%for i = 1:10
 %    tol = 10^-i;
 %    [value_simp,flag_simp,simp_stats(i)] = simpComp(f,a,b,tol,hMin);
 %    [value_trap,flag_trap,trap_stats(i)] = trapComp(f,a,b,tol,hMin); 
     %fprintf('Desired accuracy attained: %d\n', flag_simp) 
     %fprintf('Integral approximation: %d\n', desired_result - value_simp)
%      simp_stats(i).totalNrIntervals(end)
%      simp_stats(i).totalErEst
%      fprintf('total error %d', simp_stats(i).totalErEst)
%      trap_stats(i).totalNrIntervals(end)
%      trap_stats(i).totalErEst
%end  


% Plotting the subintervals against the error estimate for tol=10^-10

