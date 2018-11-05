function [diff]=tangente(n,matrice)
    msg = {'Choix de M0'};
    bouton1 = questdlg(msg, 'Choix de M0', 'Default', 'Choices', 'Default');
    if (bouton1=='Choices')
      [moX_1,moY_1] = ginput(1);
      plot(moX_1,moY_1,'o') % affichage du premier point de la tangente mo
      [moX_2,moY_2] = ginput(1);
      plot(moX_2,moY_2,'o') % affichage du deuxieme point de la tangente mo  
      diff(1,1) = moX_2-moX_1;
      diff(2,1) = moY_2-moY_1;
    else
      diff(1,1) = matrice(1,2)-matrice(1,1);
      diff(2,1) = matrice(2,2)-matrice(2,1);
    end
    quiver(matrice(1,1),matrice(2,1),diff(1,1),diff(2,1),'g');
    msg = {'Choix de MN'};
    bouton2 = questdlg(msg, 'Choix de MN', 'Default', 'Choices', 'Default');
    if (bouton2=='Choices')
      [mnX_1,mnY_1] = ginput(1);
      plot(mnX_1,mnY_1,'o') % affichage du premier point de la tangente mn
      [mnX_2,mnY_2] = ginput(1);
      plot(mnX_2,mnY_2,'o') % affichage du deuxieme point de la tangente mn
      diff(1,2) = mnX_2-mnX_1;
      diff(2,2) = mnY_2-mnY_1;
    else
      diff(1,2) = matrice(1,n+1)-matrice(1,n);
      diff(2,2) = matrice(2,n+1)-matrice(2,n);
    end
    quiver(matrice(1,n+1),matrice(2,n+1),diff(1,2),diff(2,2),'g'); % affichage de la tangente
end