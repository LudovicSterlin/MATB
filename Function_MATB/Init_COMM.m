% function [ListFichierAudio,IdxCOMM]=Init_COMM(f)
function Init_COMM
global MATB_DATA

r=Button_COMM;
ColorBar=[0 0.4470 0.7410];
set(r,'value',0);
r(1).Value = 1;
title('COMMUNICATIONS','fontsize',21,'color',ColorBar)
% text(0,1,'CALL SIGN : NASA-504','fontsize',18,'color',ColorBar)
axis off
MATB_DATA.COMM.NomFichierAudio={
    'OTHER_NAV1_108-350.wav'
    'OTHER_NAV1_109-250.wav'
    'OTHER_NAV1_110-400.wav'
    'OTHER_NAV1_111-950.wav'
    'OTHER_NAV1_112-150.wav'
    'OTHER_NAV1_113-000.wav'
    'OTHER_NAV1_114-500.wav'
    'OTHER_NAV1_115-750.wav'
    'OTHER_NAV1_116-450.wav'
    'OTHER_NAV1_117-650.wav'
    'OTHER_NAV2_108-750.wav'
    'OTHER_NAV2_109-650.wav'
    'OTHER_NAV2_110-800.wav'
    'OTHER_NAV2_111-350.wav'
    'OTHER_NAV2_112-550.wav'
    'OTHER_NAV2_113-400.wav'
    'OTHER_NAV2_114-900.wav'
    'OTHER_NAV2_115-050.wav'
    'OTHER_NAV2_116-850.wav'
    'OTHER_NAV2_117-950.wav'
    'OWN_NAV1_110-650.wav'
    'OWN_NAV1_111-500.wav'
    'OWN_NAV1_111-600.wav'
    'OWN_NAV1_112-450.wav'
    'OWN_NAV1_112-550.wav'
    'OWN_NAV1_113-500.wav'
    'OWN_NAV1_113-600.wav'
    'OWN_NAV1_114-450.wav'
    'OWN_NAV1_114-650.wav'
    'OWN_NAV1_115-400.wav'
    'OWN_NAV2_110-500.wav'
    'OWN_NAV2_111-400.wav'
    'OWN_NAV2_111-650.wav'
    'OWN_NAV2_112-450.wav'
    'OWN_NAV2_112-600.wav'
    'OWN_NAV2_113-500.wav'
    'OWN_NAV2_113-550.wav'
    'OWN_NAV2_114-450.wav'
    'OWN_NAV2_114-600.wav'
    'OWN_NAV2_115-650.wav'
    'OTHER_COM1_118-325.wav'
    'OTHER_COM1_120-825.wav'
    'OTHER_COM1_124-350.wav'
    'OTHER_COM1_126-175.wav'
    'OTHER_COM1_127-725.wav'
    'OTHER_COM1_128-525.wav'
    'OTHER_COM1_130-875.wav'
    'OTHER_COM1_132-950.wav'
    'OTHER_COM1_134-175.wav'
    'OTHER_COM1_135-225.wav'
    'OTHER_COM2_118-275.wav'
    'OTHER_COM2_120-775.wav'
    'OTHER_COM2_124-500.wav'
    'OTHER_COM2_126-025.wav'
    'OTHER_COM2_127-675.wav'
    'OTHER_COM2_128-475.wav'
    'OTHER_COM2_130-725.wav'
    'OTHER_COM2_132-800.wav'
    'OTHER_COM2_134-025.wav'
    'OTHER_COM2_135-175.wav'
    'OWN_COM1_124-575.wav'
    'OWN_COM1_125-500.wav'
    'OWN_COM1_125-550.wav'
    'OWN_COM1_126-450.wav'
    'OWN_COM1_126-525.wav'
    'OWN_COM1_127-500.wav'
    'OWN_COM1_127-550.wav'
    'OWN_COM1_128-475.wav'
    'OWN_COM1_128-575.wav'
    'OWN_COM1_129-450.wav'
    'OWN_COM2_124-450.wav'
    'OWN_COM2_125-500.wav'
    'OWN_COM2_125-575.wav'
    'OWN_COM2_126-475.wav'
    'OWN_COM2_126-550.wav'
    'OWN_COM2_127-500.wav'
    'OWN_COM2_127-525.wav'
    'OWN_COM2_128-525.wav'
    'OWN_COM2_128-550.wav'
    'OWN_COM2_129-575.wav'};
% a='Loading ';
for i=1:80 % Load all the audio directly into memory
%     a=cat(2,a,'.'); disp(a)
    [y,Fs] = audioread(['Audio/' MATB_DATA.COMM.NomFichierAudio{i}]);
    MATB_DATA.COMM.ListFichierAudio{i}=resample(y,44100,Fs);
end
MATB_DATA.COMM.IdxCOMM=cat(2,[-ones(20,1) ; ones(20,1) ; -ones(20,1) ; ones(20,1)],[ones(10,1)*1 ; ones(10,1)*2 ; ones(10,1)*1 ; ones(10,1)*2 ; ones(10,1)*3 ; ones(10,1)*4 ; ones(10,1)*3 ; ones(10,1)*4]);
