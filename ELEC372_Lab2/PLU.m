
function [L, U, P] = PLU(A)

[R, C] = size(A);

U = A;

L = eye(R,C);
P = eye(R,C);

for j = 1:R-1
    
    
    %**************************************************
    %Partial pivoting for column j
    [~,cp] = max(abs(U(j:R,j)));
    %Interchange row j and cp
   
    tmp = U(j,:);
    U(j,:)= U(cp+j-1,:);
    U(cp+j-1,:) = tmp;
  
    tmp = P(j,:);
    P(j,:)= P(cp+j-1,:);
    P(cp+j-1,:) = tmp;   
    
    tmp = L(j,1:j-1);
    L(j,1:j-1)= L(cp+j-1,1:j-1);
    L(cp+j-1,1:j-1) = tmp;    
    
   %*************************************************
    
    
    for i = j+1:R
        
        factor = (U(i,j)/U(j,j));
        L(i,j) = factor;
        U(i,j:C) = U(i,j:C) - factor*U(j,j:C);
    end
end
end

