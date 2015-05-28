function varargout = Motion(varargin)
% MOTION MATLAB code for Motion.fig
%      MOTION, by itself, creates a new MOTION or raises the existing
%      singleton*.
%
%      H = MOTION returns the handle to a new MOTION or the handle to
%      the existing singleton*.
%
%      MOTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTION.M with the given input arguments.
%
%      MOTION('Property','Value',...) creates a new MOTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Motion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Motion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Motion

% Last Modified by GUIDE v2.5 14-Aug-2014 15:19:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Motion_OpeningFcn, ...
                   'gui_OutputFcn',  @Motion_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Motion is made visible.
function Motion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Motion (see VARARGIN)

% Choose default command line output for Motion
handles.output = hObject;

% Create fill parameters
handles.xCoord = [500,550,600];
handles.yCoord = [300,400,300];
handles.enemyX = [500,550,600];
handles.enemyY = [700,750,700];
% Enemy visible flag
handles.enemyVisible = 1;
% Set Fill
fill(handles.xCoord,handles.yCoord,'b');
hold on
fill(handles.enemyX,handles.enemyY,'g');
% Set Axis
axis([0,1000,0,1000]);


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Motion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Motion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in leftButton.
function leftButton_Callback(hObject, eventdata, handles)
% hObject    handle to leftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Change coordinates
cla;    % Clear all
handles.xCoord= handles.xCoord - [10,10,10];    % move position to left
%fill
fill(handles.xCoord,handles.yCoord,'b');    % draw figure
if handles.enemyVisible == 1    % check if enemy visible flag is set
fill(handles.enemyX,handles.enemyY,'g');    % draw enemy
end
% Set Axis
axis([0,1000,0,1000]);
guidata(hObject, handles);

% --- Executes on button press in rightButton.
function rightButton_Callback(hObject, eventdata, handles)
% hObject    handle to rightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Change coordinates
cla;
handles.xCoord = handles.xCoord + [10,10,10];   % move character right
%fill
fill(handles.xCoord,handles.yCoord,'b');    % draw figure
if handles.enemyVisible == 1    % check if enemy visible flag is set
fill(handles.enemyX,handles.enemyY,'g');    % draw enemy
end
% Set Axis
axis([0,1000,0,1000]);
guidata(hObject, handles);

% --- Executes on button press in shootButton.
function shootButton_Callback(hObject, eventdata, handles)
% hObject    handle to shootButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Setup xcoordinates for bullet
handles.xlen = handles.xCoord(3)-handles.xCoord(1); % get width of original character
handles.xp1 = (handles.xlen*.25)+ handles.xCoord(1);    % Set x1 coordinate
handles.xp3 = (handles.xlen*.75)+ handles.xCoord(1);    % Set x3 coordinate
handles.xp2 = (handles.xlen*.5)+ handles.xCoord(1);     % Set x2 coordinate
% Setup y coordinates for bullet
handles.ylen = handles.yCoord(2)-handles.yCoord(1); % get height of character
handles.yp1 = handles.yCoord(2);    % get yp1 coordinate
handles.yp3 = handles.yCoord(2);    % get yp3 coordinate
handles.yp2 = handles.ylen*.25+handles.yCoord(2);       % get yp2 coordinate
handles.xBullet = [handles.xp1,handles.xp2,handles.xp3];    % set xcoordinates for bullet
handles.yBullet = [handles.yp1,handles.yp2,handles.yp3];    % set y coordinates for bullet
hold on
fill(handles.xBullet,handles.yBullet,'g');      % draw bullet
axis([0,1000,0,1000]);                          % Set axis
% Start bullet animation
for i = 0:20:500
    cla;    % Clear all
    fill(handles.xBullet,handles.yBullet+[i,i,i],'g'); % Redraw Bullet shifted
    fill(handles.xCoord,handles.yCoord,'b');    % draw character
if handles.enemyVisible == 1    % check if enemy visible flag is set
fill(handles.enemyX,handles.enemyY,'g');    % draw enemy
end
axis([0,1000,0,1000]);  % set Axis
pause(.001);        % Pause
%  Start hit detection-----------------------------------------------------
if handles.xBullet(2) > handles.enemyX(1) && handles.xBullet(2) < handles.enemyX(3)  && handles.yBullet(2)+i > handles.enemyY(1) && handles.yBullet(2)+i < handles.enemyY(2) && handles.enemyVisible == 1 %
    handles.enemyVisible = 0;
    cla;
    fill(handles.xCoord,handles.yCoord,'b');
elseif handles.xBullet(3) > handles.enemyX(1) && handles.xBullet(3) < handles.enemyX(3)  && handles.yBullet(1)+i > handles.enemyY(3) && handles.yBullet(3)+i < handles.enemyY(2) && handles.enemyVisible == 1 %
handles.enemyVisible = 0;
    cla;
    fill(handles.xCoord,handles.yCoord,'b');
elseif handles.xBullet(1) > handles.enemyX(1) && handles.xBullet(1) < handles.enemyX(3)  && handles.yBullet(1)+i > handles.enemyY(3) && handles.yBullet(1)+i < handles.enemyY(2) && handles.enemyVisible == 1 %
    handles.enemyVisible = 0;
    cla;
    fill(handles.xCoord,handles.yCoord,'b');
end %End hit detection-----------------------------------------------------

cla;    % Clear all
if handles.enemyVisible == 1    % check if enemy visible flag is set
fill(handles.enemyX,handles.enemyY,'g');    % Redraw enemy if hit not detected
fill(handles.xCoord,handles.yCoord,'b');    % draw character
elseif handles.enemyVisible == 0
fill(handles.xCoord,handles.yCoord,'b');    % draw character
handles.enemyVisible =2;
break;  % Break
else
    fill(handles.xCoord,handles.yCoord,'b');    % Draw character
end
end
guidata(hObject, handles);


% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.enemyVisible =1;    % Set visible
fill(handles.enemyX,handles.enemyY,'g');    %    draw character
guidata(hObject,handles);   % update