function [m, A, Eigenfaces]=Trainit()

clear all
clc
close all

TrainDatabasePath = uigetdir('E:\facerec\TrainDatabase\', 'elegir una ruta de TrainDatabase ' );
T = TrainDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
end
