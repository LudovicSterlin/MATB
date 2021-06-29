function [pmp]=Button_RESMAN(f)
global MATB_DATA

FigPos=get(f,"position");
LargeurFig=FigPos(3);
HauteurFig=FigPos(4);
% LargeurFig=1100;
% HauteurFig=1450;

if MATB_DATA.Param.Retro 
    FtSiz = 18;
else
    FtSiz = 13;
end

pmp_style_props = {f,"Style","pushbutton","Fontsize",FtSiz,"BackgroundColor",[0.94 0.94 0.94],"Callback",{@changeState}};

pmp_labels = ["^ 1" "^ 2" "^ 3" "^ 4" "< 5" "< 6" "> 7" "< 8"];

% Good for rectangle
x1 = 0.18;
x2 = 0.415;
x3 = 0.57;
x4 = 0.80;
% Good for square
% x1 = 0.15;
% x2 = 0.39;
% x3 = 0.55;
% x4 = 0.78;
x5 = 0.26;
x6 = 0.65;
x78 = 0.485;

y1234 = 0.47;
y56 = 0.21;
y7 = 0.66;
y8 = 0.823;

pmp_positions = [
    [LargeurFig*x1 HauteurFig*y1234 70 30]
    [LargeurFig*x2 HauteurFig*y1234 70 30]
    [LargeurFig*x3 HauteurFig*y1234 70 30]
    [LargeurFig*x4 HauteurFig*y1234 70 30]
    [LargeurFig*x5 HauteurFig*y56 70 30]
    [LargeurFig*x6 HauteurFig*y56 70 30]
    [LargeurFig*x78 HauteurFig*y7 70 30]
    [LargeurFig*x78 HauteurFig*y8 70 30]
];

for pmp_index = 1:8
    pmp(pmp_index) = uicontrol(pmp_style_props{:},"String",pmp_labels(pmp_index),"Position",pmp_positions(pmp_index,:));
end


function changeState(source,~)
% StatePMP(NumPmp) 
%     set(source,"backgroundColor",[0 1 0]); StatePMP(NumPmp)=1
% if StatePMP(NumPmp)==0
%     set(source,"backgroundColor",[0 1 0]); evalin("base","StatePMP(NumPmp) = 1")
% else if StatePMP(NumPmp)==1
%         set(source,"backgroundColor",[0.94 0.94 0.94]); StatePMP(NumPmp)=0;
%     else if StatePMP(NumPmp)==2
%             set(source,"backgroundColor",[1 0 0]);
%         end
%     end
% end

%% Fonctionel
C=get(source,"backgroundcolor");
if all(C==[0.94 0.94 0.94])
    set(source,"backgroundColor",[0 1 0])
else 
    if all(C==[0 1 0])
        set(source,"backgroundColor",[0.94 0.94 0.94])
    end
end
S=get(source,"String");
send_log("MS PMP",S(3))

