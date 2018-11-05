function []= HermiteSplines()

resolution=21;       % nombre de points evalues sur la courbe d'Hermite
K=0;                 % variable d'etat
matrice=0;           % ensemble des points de controle

while K~=4
   K=menu('Que voulez-vous faire ?','NEW   (bouton souris, puis <ENTER> pour choisir m0 et mN', 'AJOUTER UN POINT','SUPPRIMER UN POINT','ARRETER');
   if K==1 % NEW
      clf                  % affichage d'une fenetre vide
      hold on              % tous les plot seront ex�cut�s sur cette m�me fenetre
      axis([0 10 0 10])    % les axes sont definitivement fixes
      %axis off
      matrice=0;
      for i=1:1000         % on limite le nombre de points de controle a 1000
         [X,Y]=ginput(1);  % prise en compte d'un clic de souris
         if isempty(X)     % si on appuie sur <ENTER>
            n=size(matrice,2)-1; % degre de courbe avec n+1 points de controle
            diff = tangente(n, matrice); % on récupère les tangentes mo et mn
            c = constante();
            break
         end
         matrice(1,i)=X;   % coordonnees x des points de controle
         matrice(2,i)=Y;   % coordonnees y des points de controle
         plot(matrice(1,i),matrice(2,i),'o') % affichage du point de controle i
      end
      % repr�sentation des courbes xk(t)
      for k=0:1:(n-1)
        HermiteSpline_points = eval_hermite(matrice, resolution,k,n,diff,c);
        plot(HermiteSpline_points(1,:),HermiteSpline_points(2,:),'r');  % plot des points de la courbe
      end
   elseif K==2 % ajouter un point
      [X,Y]=ginput(1);
      while ~isempty(X)
         n=size(matrice,2);
         matrice(1,n+1)=X;
         matrice(2,n+1)=Y;  
         clf                  % affichage d'une fenetre vide
         hold on              % tous les plot seront executes sur cette meme fenetre
         axis([0 10 0 10])    % les axes sont definitivement fixes
         %axis off
	 for k=1:n+1 % affichage du polygone de controle
	   plot(matrice(1,k), matrice(2,k),'o') % affichage du point de controle k
	 end
         plot(matrice(1,:),matrice(2,:),'b') % affichage du polygone de controle
         HermiteSpline_points = eval_hermite(matrice,a,b,resolution);
         plot(HermiteSpline_points(1,:),HermiteSpline_points(2,:),'r');
         plot(HermiteSpline_points(1,:),HermiteSpline_points(2,:),'r');
         [X,Y]=ginput(1);
      end
   elseif K==3 % supprimer un point
      
      [X,Y]=ginput(1);
      while ~isempty(X)
         if size(matrice,2)==1
            break
         end
         matrice=supprimer_point(matrice,X,Y);
         n=size(matrice,2);
         clf                  % affichage d'une fenetre vide
         hold on              % tous les plot seront executes sur cette meme fenetre
         axis([0 10 0 10])    % les axes sont definitivement fixes
         %axis off
	 for k=1:n 
	   plot(matrice(1,k), matrice(2,k),'o') % affichage du point de controle k
         end
         plot(matrice(1,:),matrice(2,:),'b') % affichage du polygone de controle
         HermiteSpline_points = eval_hermite(matrice,a,b,resolution);
         plot(HermiteSpline_points(1,:),HermiteSpline_points(2,:),'r');
         [X,Y]=ginput(1);
      end
   end
end
close
