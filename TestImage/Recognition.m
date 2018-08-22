function OutputName = Recognition(m, A, Eigenfaces)
% descripcion de pasos....
%
% descripcion: Esta funci�n compara dos caras al proyectar las im�genes en el espacio frontal y 
% midiendo la distancia euclidiana entre ellos.
%
% argumento: m            - (M * Nx1) Media del entrenamiento
%                           de la base de datos, que es el resultado de la funci�n 'EigenfaceCore'.
%
%            Eigenfaces   -(M * Nx (P-1)) Vectores propios de la
%                           matriz de% de covarianza de entrenamiento
%                          de la base de datos, que es el resultado de la funci�n 'EigenfaceCore'.
%
%            A            - (M * NxP) Matriz de imagen centrada
%                           vectores, que es salida de la funci�n 'EigenfaceCore'.
% 
% Returns:   OutputName   - Nombre de la imagen reconocida en la base de datos de entrenamiento.            

%%%%%%%%%%%%%%%%%%%%%%%%  Proyectando vectores de im�genes centradas en los espacios de la cara
% Todas las im�genes centradas se proyectan en el espacio frontal multiplicando en
% De la base en Eigenface. El vector proyectado de cada cara ser� su correspondiente
% de vectores de caracter�sticas..

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Proyecci�n de im�genes centradas en el espacio de la cara
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%%Extrayendo las caracter�sticas de PCA de la imagen de prueba
InputImage = imread('InputImage.jpg');
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; % Imagen de prueba centrada
ProjectedTestImage = Eigenfaces'*Difference; %Vector de caracter�sticas de la imagen de prueba

%%%%%%%%%%%%%%%%%%%%%%%%C�lculo de distancias euclidianas 
% Distancias euclidianas entre la imagen de prueba proyectada y la proyecci�n
% de todas las im�genes de entrenamiento centradas se calculan. La imagen de prueba es
% se supone que tiene una distancia m�nima con su imagen correspondiente en el
% preparacion de la base de datos.

Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);
OutputName = (Recognized_index);


end

