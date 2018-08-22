function [ ] = DeleteDatabase(  )
disp('por favor no eliminar de en medio');
cd TrainDatabase
 while (1==1)
    choice=menu('Barrar DB',...
                'Borrar Imagen',...
                'Borrar Carpeta',...               
                'Salir');
    if (choice ==1)
        ChooseFile=imgetfile;
        delete(ChooseFile);
    end
    if (choice == 2)
        delfolder=uigetdir('E:\ufd\TrainDatabase','eliminar carpeta');
        rmdir(delfolder,'s');
    end    
    if (choice == 3)
        cd ..
        clc;
        close all;
        return;
    end    
end


