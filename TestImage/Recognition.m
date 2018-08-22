function OutputName = Recognition(m, A, Eigenfaces)
% descripcion de pasos....
%
% descripcion: Esta función compara dos caras al proyectar las imágenes en el espacio frontal y 
% midiendo la distancia euclidiana entre ellos.
%
% argumento: m            - (M * Nx1) Media del entrenamiento
%                           de la base de datos, que es el resultado de la función 'EigenfaceCore'.
%
%            Eigenfaces   -(M * Nx (P-1)) Vectores propios de la
%                           matriz de% de covarianza de entrenamiento
%                          de la base de datos, que es el resultado de la función 'EigenfaceCore'.
%
%            A            - (M * NxP) Matriz de imagen centrada
%                           vectores, que es salida de la función 'EigenfaceCore'.
% 
% Returns:   OutputName   - Nombre de la imagen reconocida en la base de datos de entrenamiento.            

%%%%%%%%%%%%%%%%%%%%%%%%  Proyectando vectores de imágenes centradas en los espacios de la cara
% Todas las imágenes centradas se proyectan en el espacio frontal multiplicando en
% De la base en Eigenface. El vector proyectado de cada cara será su correspondiente
% de vectores de características..

ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Proyección de imágenes centradas en el espacio de la cara
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%%Extrayendo las características de PCA de la imagen de prueba
InputImage = imread('InputImage.jpg');
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; % Imagen de prueba centrada
ProjectedTestImage = Eigenfaces'*Difference; %Vector de características de la imagen de prueba

%%%%%%%%%%%%%%%%%%%%%%%%Cálculo de distancias euclidianas 
% Distancias euclidianas entre la imagen de prueba proyectada y la proyección
% de todas las imágenes de entrenamiento centradas se calculan. La imagen de prueba es
% se supone que tiene una distancia mínima con su imagen correspondiente en el
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

