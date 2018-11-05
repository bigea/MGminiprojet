function [HermiteSplines_points]= eval_hermite(matrice, resolution,k,n,diff,c)

temps=k : (1/resolution) :k+1;
cp = 0;
for t_prime=temps
   t = t_prime-k;
   for i=0:3
      % Evaluation du polynome de Bernstein B_i^n(t)
      vect_bernstein(i+1)= (factorial(3)/(factorial(i)*factorial(3-i))) * (1-t)^(3-i)*(t)^i;
      %vect_bernstein(i+1)= (factorial(3)/((factorial(i)*factorial(3-i)))*((1-t)^(3-i)*(t)^i));
   end
   if k==0
     mk(1) = diff(1,1);
     mk(2) = diff(2,1);
   else
     mk(1) = (1-c)*(matrice(1,k+2)-matrice(1,k+1));
     mk(2) = (1-c)*(matrice(2,k+2)-matrice(2,k+1));
   end
   if k==n-1
     mk1(1) = diff(1,2);
     mk1(2) = diff(2,2);
   else
     mk1(1) = (1-c)*(matrice(1,k+3)-matrice(1,k+2));
     mk1(2) = (1-c)*(matrice(2,k+3)-matrice(2,k+2));
     
   end
   % calcul des b_i
   coeff(1,1) = matrice(1,k+1);
   coeff(2,1) = matrice(2,k+1);
   coeff(1,2) = matrice(1,k+1)+(1/3)*mk(1);
   coeff(2,2) = matrice(2,k+1)+(1/3)*mk(2);
   coeff(1,3) = matrice(1,k+2)-(1/3)*mk1(1);
   coeff(2,3) = matrice(2,k+2)-(1/3)*mk1(2);
   coeff(1,4) = matrice(1,k+2);
   coeff(2,4) = matrice(2,k+2);
   plot(coeff(1,:),coeff(2,:),'b');
   % Calcul du point de la courbe x(t) = Sum b_i * B_i^n(t)
   cp = cp+1;
   HermiteSplines_points(1,cp)=sum(coeff(1,:).*vect_bernstein);
   HermiteSplines_points(2,cp)=sum(coeff(2,:).*vect_bernstein);
end 
end          
