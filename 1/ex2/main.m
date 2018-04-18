% Exericse 2.1
 
A = zeros(5);
for i = 1:5
   for j = 1:5
       A(i,j) = 1 + abs(i-j);
   end 
end
 
disp('matrix:');
disp(A);