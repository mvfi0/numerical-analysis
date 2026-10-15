function [U,b1] = elimination (A,b)
n=length(b);
C=[A b];
for j = 1:n-1
    for i = j+1:n 
        r= C(i,j) / C(j,j);
        C(i,j:n+1)= C(i,j:n+1) - r * C(j,j:n+1);
    end 
end 
U=C(:,1:n);
b1=C(:,n+1);