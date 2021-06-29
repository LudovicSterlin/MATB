function [bs,r,ButtonGroup,ValueGroup]=Button_COMM(f)
global MATB_DATA
% f=MATB_DATA.MainFigure;
FigPos=get(f,'position');
LargeurFig=FigPos(3);
HauteurFig=FigPos(4);
% LargeurFig=1100;
% HauteurFig=1450;

ColorBar=[0 0.4470 0.7410];

%-------------------- BUTTON PLUS & MINUS !!!! ---------------------
%------ !Ne pas déplacer/Laisser avant bs!!!!! -- AL

pushbutton_style = {f,'Style','pushbutton','visible','off','Fontsize',16};
plus_style = {'String','+','Callback', @plus};
moins_style = {'String','-','Callback', @moins};

xpm_right = .4;
xpm_left = .65;

yn1 = .65;
yn2 = .50;
yc1 = .35;
yc2 = .20;

pmb_height = 20;

plus_n1_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','11','Position',[LargeurFig*xpm_right HauteurFig*yn1+pmb_height 20 20],'visible','on');
moins_n1_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','11','Position',[LargeurFig*xpm_right HauteurFig*yn1 20 20],'visible','on');
plus_n1d_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','12','Position',[LargeurFig*xpm_left HauteurFig*yn1+pmb_height 20 20],'visible','on');
moins_n1d_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','12','Position',[LargeurFig*xpm_left HauteurFig*yn1 20 20],'visible','on');

ButtonGroup{1}=[plus_n1_b,moins_n1_b,plus_n1d_b,moins_n1d_b];

plus_n2_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','21','Position',[LargeurFig*xpm_right HauteurFig*yn2+pmb_height 20 20]);
moins_n2_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','21','Position',[LargeurFig*xpm_right HauteurFig*yn2 20 20]);
plus_n2d_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','22','Position',[LargeurFig*xpm_left HauteurFig*yn2+pmb_height 20 20]);
moins_n2d_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','22','Position',[LargeurFig*xpm_left HauteurFig*yn2 20 20]);

ButtonGroup{2}=[plus_n2_b,moins_n2_b,plus_n2d_b,moins_n2d_b];

plus_c1_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','31','Position',[LargeurFig*xpm_right HauteurFig*yc1+pmb_height 20 20]);
moins_c1_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','31','Position',[LargeurFig*xpm_right HauteurFig*yc1 20 20]);
plus_c1d_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','32','Position',[LargeurFig*xpm_left HauteurFig*yc1+pmb_height 20 20]);
moins_c1d_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','32','Position',[LargeurFig*xpm_left HauteurFig*yc1 20 20]);

ButtonGroup{3}=[plus_c1_b,moins_c1_b,plus_c1d_b,moins_c1d_b];

plus_c2_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','41','Position',[LargeurFig*xpm_right HauteurFig*yc2+pmb_height 20 20]);
moins_c2_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','41','Position',[LargeurFig*xpm_right HauteurFig*yc2 20 20]);
plus_c2d_b = uicontrol(pushbutton_style{:},plus_style{:},'Tag','42','Position',[LargeurFig*xpm_left HauteurFig*yc2+pmb_height 20 20]);
moins_c2d_b = uicontrol(pushbutton_style{:},moins_style{:},'Tag','42','Position',[LargeurFig*xpm_left HauteurFig*yc2 20 20]);

ButtonGroup{4}=[plus_c2_b,moins_c2_b,plus_c2d_b,moins_c2d_b];

%-------------------- RADIO BUTTONS ---------------------
% bs = uibuttongroup('Position',[LargeurFig*0.10 HauteurFig*.18 LargeurFig*.17 HauteurFig*.60],...
%     'SelectionChangedFcn',@bselection);
    % 'Visible','off',...
bs = uibuttongroup('Position',[0.15 0.2 .2 .57],...
    'SelectionChangedFcn',@bselection,...
    'Visible','off');

bs_pos = get(bs,'position');
bs_height = bs_pos(4)*HauteurFig;

r_buttons_style = {bs,'Style','radiobutton','ForegroundColor',ColorBar,'HandleVisibility','on','Value',0,'Fontsize',19};
r_labels = ["NAV1" "NAV2" "COM1" "COM2"];
r_positions = [
    [10 bs_height*.80 100 30]
    [10 bs_height*.55 100 30]
    [10 bs_height*.30 100 30]
    [10 bs_height*.05 100 30]
];

% r_positions = [
%     [10 HauteurFig*yn1 100 30]
%     [10 HauteurFig*yn2 100 30]
%     [10 HauteurFig*yc1 100 30]
%     [10 HauteurFig*yc2 100 30]
% ];

for index = 1:4
    r(index) = uicontrol(r_buttons_style{:},'String',r_labels(index),...
    'Position',r_positions(index,:),...
    'UserData',ButtonGroup{index});
end

bs.Visible = 'on';
bs.HandleVisibility = 'on';

titleCom = uicontrol('Style','text',...
    'String','CALL SIGN : NASA 504',...
    'Fontsize',19,...
    'HorizontalAlignment','Center',...
    'Foregroundcolor',ColorBar,...
    'Position',[LargeurFig*.1 HauteurFig*.80 LargeurFig*0.8 40]);

%-------------------- % TEXT for NAV & COM ---------------------

text_style = {'Style','text','Fontsize',19,'Foregroundcolor',ColorBar};
xtext_r = 0.46;
xtext_l = 0.54;

n1 = uicontrol(text_style{:},'Position',[LargeurFig*xtext_r HauteurFig*yn1 50 40],'String','112');
n1d = uicontrol(text_style{:},'Position',[LargeurFig*xtext_l HauteurFig*yn1 50 40],'String','500');
n2 = uicontrol(text_style{:},'Position',[LargeurFig*xtext_r HauteurFig*yn2 50 40],'String','112');
n2d = uicontrol(text_style{:},'Position',[LargeurFig*xtext_l HauteurFig*yn2 50 40],'String','500');

c1 = uicontrol(text_style{:},'Position',[LargeurFig*xtext_r HauteurFig*yc1 50 40],'String','126');
c1d = uicontrol(text_style{:},'Position',[LargeurFig*xtext_l HauteurFig*yc1 50 40],'String','500');
c2 = uicontrol(text_style{:},'Position',[LargeurFig*xtext_r HauteurFig*yc2 50 40],'String','126');
c2d = uicontrol(text_style{:},'Position',[LargeurFig*xtext_l HauteurFig*yc2 50 40],'String','500');

ValueGroup=[n1 n1d
    n2 n2d
    c1 c1d
    c2 c2d];

apply_b = uicontrol(f,'Style','pushbutton','String','APPLY','Fontsize',19,...
    'Foregroundcolor',ColorBar,...
    'Position',[LargeurFig*xtext_r HauteurFig*.05 100 40],'Callback', @apply);

if MATB_DATA.Param.Retro
    set(r,'FontName','ArcadeClassic','Fontsize',24)
    set(titleCom,'String','CALL SIGN : NASA 504','FontName','ArcadeClassic','Fontsize',28) 
set(titleCom,...
    'Position',[30 420 350 40],...
    'String','CALL SIGN : NASA 504',...
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
        %         [MATB_DATA.COMM.HandleRadioButton.Value] % C'est la value : Qui est selectionné
        
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
        
        switch Collone % On recupere la 1ere valeurs
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
        
        switch Collone % On recupere la 1ere valeurs
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
