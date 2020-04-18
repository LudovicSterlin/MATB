function [bs,r,ButtonGroup,ValueGroup]=Button_COMM
global MATB_DATA
f=MATB_DATA.MainFigure;
% FigPos=get(f,'position');
% LargeurFig=FigPos(3);
% HauteurFig=FigPos(4);
LargeurFig=1100;
HauteurFig=1450;

ColorBar=[0 0.4470 0.7410];

%-------------------- BUTTON PLUS & MINUS !!!! ---------------------
%------ !Ne pas d�placer/Laisser avant bs!!!!! -- AL
plus_n1_b = uicontrol(f,'Style','pushbutton','String','+','visible','on','Tag','11',...
    'Position',[LargeurFig*.17 HauteurFig*.255 20 20],'Fontsize',16,'Callback', @plus);
moins_n1_b = uicontrol(f,'Style','pushbutton','String','-','visible','on','Tag','11',...
    'Position',[LargeurFig*.17 HauteurFig*.24 20 20],'Fontsize',16,'Callback', @moins);
plus_n1d_b = uicontrol(f,'Style','pushbutton','String','+','visible','on','Tag','12',...
    'Position',[LargeurFig*.29 HauteurFig*.255 20 20],'Fontsize',16,'Callback', @plus);
moins_n1d_b = uicontrol(f,'Style','pushbutton','String','-','visible','on','Tag','12',...
    'Position',[LargeurFig*.29 HauteurFig*.24 20 20],'Fontsize',16,'Callback', @moins);

ButtonGroup{1}=[plus_n1_b,moins_n1_b,plus_n1d_b,moins_n1d_b];

plus_n2_b = uicontrol(f,'Style','pushbutton','String','+','visible','off','Tag','21',...
    'Position',[LargeurFig*.17 HauteurFig*.205 20 20],'Fontsize',16,'Callback', @plus);
moins_n2_b = uicontrol(f,'Style','pushbutton','String','-','visible','off','Tag','21',...
    'Position',[LargeurFig*.17 HauteurFig*.19 20 20],'Fontsize',16,'Callback', @moins);
plus_n2d_b = uicontrol(f,'Style','pushbutton','String','+','visible','off','Tag','22',...
    'Position',[LargeurFig*.29 HauteurFig*.205 20 20],'Fontsize',16,'Callback', @plus);
moins_n2d_b = uicontrol(f,'Style','pushbutton','String','-','visible','off','Tag','22',...
    'Position',[LargeurFig*.29 HauteurFig*.19 20 20],'Fontsize',16,'Callback', @moins);

ButtonGroup{2}=[plus_n2_b,moins_n2_b,plus_n2d_b,moins_n2d_b];

plus_c1_b = uicontrol(f,'Style','pushbutton','String','+','visible','off','Tag','31',...
    'Position',[LargeurFig*.17 HauteurFig*.155 20 20],'Fontsize',16,'Callback', @plus);
moins_c1_b = uicontrol(f,'Style','pushbutton','String','-','visible','off','Tag','31',...
    'Position',[LargeurFig*.17 HauteurFig*.14 20 20],'Fontsize',16,'Callback', @moins);
plus_c1d_b = uicontrol(f,'Style','pushbutton','String','+','visible','off','Tag','32',...
    'Position',[LargeurFig*.29 HauteurFig*.155 20 20],'Fontsize',16,'Callback', @plus);
moins_c1d_b = uicontrol(f,'Style','pushbutton','String','-','visible','off','Tag','32',...
    'Position',[LargeurFig*.29 HauteurFig*.14 20 20],'Fontsize',16,'Callback', @moins);

ButtonGroup{3}=[plus_c1_b,moins_c1_b,plus_c1d_b,moins_c1d_b];

plus_c2_b = uicontrol(f,'Style','pushbutton','String','+','visible','off','Tag','41',...
    'Position',[LargeurFig*.17 HauteurFig*.105 20 20],'Fontsize',16,'Callback', @plus);
moins_c2_b = uicontrol(f,'Style','pushbutton','String','-','visible','off','Tag','41',...
    'Position',[LargeurFig*.17 HauteurFig*.09 20 20],'Fontsize',16,'Callback', @moins);
plus_c2d_b = uicontrol(f,'Style','pushbutton','String','+','visible','off','Tag','42',...
    'Position',[LargeurFig*.29 HauteurFig*.105 20 20],'Fontsize',16,'Callback', @plus);
moins_c2d_b = uicontrol(f,'Style','pushbutton','String','-','visible','off','Tag','42',...
    'Position',[LargeurFig*.29 HauteurFig*.09 20 20],'Fontsize',16,'Callback', @moins);

ButtonGroup{4}=[plus_c2_b,moins_c2_b,plus_c2d_b,moins_c2d_b];

%-------------------- RADIO BUTTONS ---------------------
bs = uibuttongroup('Visible','off',...
    'Position',[.05 .1 .11 .3],...
    'SelectionChangedFcn',@bselection);

r(1) = uicontrol(bs,'Style',...
    'radiobutton',...
    'String','NAV1',...
    'Position',[10 260 100 30],...
    'ForegroundColor',ColorBar,...
    'HandleVisibility','on',...
    'Value',0,...
    'Fontsize',19,...
    'UserData',ButtonGroup{1});

r(2) = uicontrol(bs,'Style','radiobutton',...
    'String','NAV2',...
    'Position',[10 185 100 30],...
    'ForegroundColor',ColorBar,...
    'HandleVisibility','on',...
    'Value',0,...
    'Fontsize',19,...
    'UserData',ButtonGroup{2});

r(3) = uicontrol(bs,'Style','radiobutton',...
    'String','COM1',...
    'Position',[10 110 100 30],...
    'ForegroundColor',ColorBar,...
    'HandleVisibility','on',...
    'Value',0,...
    'Fontsize',19,...
    'UserData',ButtonGroup{3});

r(4) = uicontrol(bs,'Style','radiobutton',...
    'String','COM2',...
    'Position',[10 35 100 30],...
    'ForegroundColor',ColorBar,...
    'HandleVisibility','on',...
    'Value',0,...
    'Fontsize',19,...
    'UserData',ButtonGroup{4});

bs.Visible = 'on';
bs.HandleVisibility = 'on';

titleCom = uicontrol('Style','text',...
    'Position',[65 420 300 40],...
    'String','CALL SIGN : NASA 504',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);

%-------------------- % TEXT for NAV & COM ---------------------

n1 = uicontrol('Style','text',...
    'Position',[LargeurFig*.19 HauteurFig*.24 50 40],...
    'String','112',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);
n1d = uicontrol('Style','text',...
    'Position',[LargeurFig*.24 HauteurFig*.24 50 40],...
    'String','500',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);
n2 = uicontrol('Style','text',...
    'Position',[LargeurFig*.19 HauteurFig*.19 50 40],...
    'String','112',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);
n2d = uicontrol('Style','text',...
    'Position',[LargeurFig*.24 HauteurFig*.19 50 40],...
    'String','500',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);

c1 = uicontrol('Style','text',...
    'Position',[LargeurFig*.19 HauteurFig*.14 50 40],...
    'String','126',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);
c1d = uicontrol('Style','text',...
    'Position',[LargeurFig*.24 HauteurFig*.14 50 40],...
    'String','500',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);

c2 = uicontrol('Style','text',...
    'Position',[LargeurFig*.19 HauteurFig*.09 50 40],...
    'String','126',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);
c2d = uicontrol('Style','text',...
    'Position',[LargeurFig*.24 HauteurFig*.09 50 40],...
    'String','500',...
    'Fontsize',19,...
    'Foregroundcolor',ColorBar);

ValueGroup=[n1 n1d
    n2 n2d
    c1 c1d
    c2 c2d];

apply_b = uicontrol(f,'Style','pushbutton','String','APPLY','Fontsize',19,...
    'Foregroundcolor',ColorBar,...
    'Position',[LargeurFig*.19 HauteurFig*.04 100 40],'Callback', @apply);

if MATB_DATA.Param.Retro
    set(r,'FontName','ArcadeClassic','Fontsize',24)
    set(titleCom,'String','CALL SIGN  NASA 504','FontName','ArcadeClassic','Fontsize',28) 
set(titleCom,...
    'Position',[30 420 350 40],...
    'String','CALL SIGN NASA 504',...
    'Fontsize',28,...
    'FontName','ArcadeClassic');
end

%-------- FUNCTION CONTROL
    function apply(~,~)
%         set(r,'Value',0); set([r.UserData],'Visible','off') % No Selection      
        set(bs,'SelectedObject',r(1));  bselection();% Back to First - Modifie AL 
        
%         send_log('COMM APPLY',['  NAV1:' get(n1, 'String') '.' get(n1d, 'String') ,...
%             '  NAV2:' get(n2, 'String') '.' get(n2d, 'String') ,...
%             '  COM1:' get(c1, 'String') '.' get(c1d, 'String') ,...
%             '  COM2:' get(c2, 'String') '.' get(c2d, 'String')]);
%         
%         Value=cat(2, str2double(get(n1,'String')) + 0.001*str2double(get(n1d,'String')),...
%             str2double(get(n2,'String')) + 0.001*str2double(get(n2d,'String')),...
%             str2double(get(c1,'String')) + 0.001*str2double(get(c1d,'String')),...
%             str2double(get(c2,'String')) + 0.001*str2double(get(c2d,'String')) );
        
        %         reshape(str2double({ValueGroup.String}'),4,2)
%         send_comm(Value)

    end
    function bselection(~,~)
        %         set(bs.SelectedObject.UserData,'visible','on') Equivalent
        %         [MATB_DATA.COMM.HandleRadioButton.Value] % C'est la value : Qui est sleectionn�
        
        set(r(find([r.Value]==1)).UserData,'visible','on')
        
        DeselectedButton = find([r.Value]==0);
        set(r(DeselectedButton(1)).UserData,'visible','off')
        set(r(DeselectedButton(2)).UserData,'visible','off')
        set(r(DeselectedButton(3)).UserData,'visible','off')
    end

% PLUS - MINUS one Function
    function plus(source,~)
        Val = str2double(get(source,'Tag'));
        Ligne   = floor(Val/10);
        Collone = Val - Ligne*10;
        
        switch  Collone% On recupere la 1ere valeurs
            case 1
                value=str2double(get(ValueGroup(Ligne,Collone), 'String'));
                value = min(max(value+1,100),150);
                set(ValueGroup(Ligne,Collone), 'String', num2str(value));
            case 2
                value=str2double(get(ValueGroup(Ligne,Collone), 'String'));
                value = min(max(value+25,100),975);
                set(ValueGroup(Ligne,Collone), 'String', num2str(value));
        end
        
    end
    function moins(source,~)
        Val = str2double(get(source,'Tag'));
        Ligne   = floor(Val/10);
        Collone = Val - Ligne*10;
        
        switch  Collone% On recupere la 1ere valeurs
            case 1
                value=str2double(get(ValueGroup(Ligne,Collone), 'String'));
                value = min(max(value-1,100),150);
                set(ValueGroup(Ligne,Collone), 'String', num2str(value));
            case 2
                value=str2double(get(ValueGroup(Ligne,Collone), 'String'));
                value = min(max(value-25,100),975);
                set(ValueGroup(Ligne,Collone), 'String', num2str(value));
        end
    end

end
