function [Bezier_curve_points]= eval_deCasteljau(matrice,a,b,resolution)

n=size(matrice,2)-1; % degre de courbe avec n+1 points de controle
%temps=1:resolution;
temps= a : ((b-a)/resolution) : b;
cp = 1;
for t=temps
   % Calcul du point de la courbe x(t) avec l'algorithme de DeCasteljau
   matrice_sec = matrice;
   n_bis = n;
   u = (t-a)/(b-a);
   while n_bis>0
        for i=1:1:n_bis
            matrice_sec(1,i) = (1-u)*matrice_sec(1,i)+u*matrice_sec(1,i+1);
            matrice_sec(2,i) = (1-u)*matrice_sec(2,i)+u*matrice_sec(2,i+1);
        end
        n_bis = n_bis-1;
   end
   Bezier_curve_points(1,cp)=matrice_sec(1,1);
   Bezier_curve_points(2,cp)=matrice_sec(2,1);
   cp = cp+1;
end                  
