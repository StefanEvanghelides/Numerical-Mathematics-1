%%%% A script for exercise 3 on numerical integration
%%%% Authors: StefanE & FrankTN

% What we know so far. Undisputable facts
integral = 3*atan(sqrt(2))-sqrt(2);
tol = 10^-10;
f = @(x)(atan(sqrt(x)));
a = 0; b = 2;

% Setting the lowest equidistant value
hMin = 10^-7;

% Show the actual integral result
fprintf('Actual integral result: %d\n\n', integral);

% Test the TrapComp approximation
[value_trap,flag_trap,trap_stats] = trapComp(f,a,b,tol,hMin); 
fprintf('Integral approximation using TrapComp: %d\n', value_trap);
fprintf('Error TrapComp: %d\n', abs(integral - value_trap));
fprintf('Flag: %d (for a tolerance of %d)\n\n', flag_trap, tol);

% Test the SimpComp approximation
simpCompVariant = @simpComp; % This is used to test variants of SimpComp function;
                              % Modify only the function handle to update
                              %     the rest automatically;
[value_simp,flag_simp,simp_stats] = simpCompVariant(f,a,b,tol,hMin);
fprintf('Integral approximation using %s: %d\n', func2str(simpCompVariant), value_simp);
fprintf('Error %s: %d\n',  func2str(simpCompVariant), abs(integral - value_simp));
fprintf('Flag: %d (for a tolerance of %d)\n\n', flag_simp, tol);

% Testing for i=1:10
%for i = 1:10
 %    tol = 10^-i;
%end  


% Plotting the subintervals against the error estimate for tol=10^-10

