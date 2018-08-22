clc%Main
close all
clear all
clc
while (1==1)
    %menu del sistema
    choice=menu('Sietema de reconocimeinto',...
                'Crear BD de rostros',...
                'Borrar BD de rostros',...
                'Entrenar al sistema',...
                'Reconocimeinto facial',...
                'Salir');
    
     if (choice ==1)
        CreateDatabase;
    end
    
    if (choice == 2)
        DeleteDatabase;
    end
    
    if (choice ==3)
        [m, A, Eigenfaces]=Trainit;
    end
    if (choice == 4)
        if exist('train.mat');
            load train;
        end
        FaceRec(m, A, Eigenfaces);
    end
   
    if (choice == 5)
        clear all;
        clc;
        close all;
        return;
    end    
    
end
