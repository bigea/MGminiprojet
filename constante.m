function c=constante()
    labels  = {'Choix de la valeur de c'};
    li_cols = [1, 15];
    val_def = {'0.5'};
    vec_cel = inputdlg(labels, 'Choix du parametre c', li_cols, val_def);
    c = str2num(vec_cel{1});
end