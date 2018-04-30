% A script for exercise 3 on numerical integration

desired_result = 3*atan(sqrt(2))-sqrt(2);
tol = 10^-10;
f = @(x)(atan(sqrt(x)));
a = 0; b = 2;
%hMin = 10^-6;
hMin = 1;
for i = 1:4
     tol = 10^-i;
     [value_simp,flag_simp,simp_stats(i)] = simpComp(f,a,b,tol,hMin);
     [value_trap,flag_trap,trap_stats(i)] = trapComp(f,a,b,tol,hMin); 
     simp_stats(i).totalNrIntervals(end)
     simp_stats(i).totalErEst
     trap_stats(i).totalNrIntervals
     trap_stats(i).totalErEst
end  
