function T = TrainDatabase(TrainDatabasePath)

 no_folder=size(dir([TrainDatabasePath,'\*']),1)-size(dir([TrainDatabasePath,'\*m']),1)-2;

T = [];
disp('cargando caras');
for i = 1 : no_folder
    stk = int2str(i);
    disp(stk);
    stk = strcat('\s',stk,'\*jpg');
    folder_content = dir ([TrainDatabasePath,stk]);
    nface = size (folder_content,1);
    disp(nface);
for j = 1 :  nface
    
    str = int2str(j);
    str = strcat('\',str,'.jpg');
    str = strcat('\s',int2str(i),str);
    str = strcat(TrainDatabasePath,str);
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   
    T = [T temp];                
end

end

end
