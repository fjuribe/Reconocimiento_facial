function []=addimage
while (1==1)
    choice=menu('agregar una foto',...
                  'eliga de carpeta',...
                  'capture una foto',...
		  'salir');
    if (choice ==1)
      ChooseFile=imgetfile
      capcha=imread(ChooseFile);
      capcha=imcrop(capcha,[180,40,280,380]);
      imshow(capcha);
      saveimage(capcha);
    end
    if (choice == 2)
        capturenow;
    end
    if (choice == 3)
        clc;
        close all;
        return;
    end    
end
end