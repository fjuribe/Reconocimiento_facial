function []=CreateDatabase
cd TrainDatabase;
while (1==1)
    choice=menu('Crear BD',...
                ' Agregar Imagen',...
                ' Agregar Carpeta',...
                ' Salir');
    if (choice ==1)
        addimage;
    end
    if (choice == 2)
        addfolder;
    end
    if (choice == 3)
        cd ..;
        clc;
        close all;
        return;
    end    
end
end