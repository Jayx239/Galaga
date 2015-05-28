function varargout = Animation(varargin)
% ANIMATION MATLAB code for Animation.fig
%      ANIMATION, by itself, creates a new ANIMATION or raises the existing
%      singleton*.
%
%      H = ANIMATION returns the handle to a new ANIMATION or the handle to
%      the existing singleton*.
%
%      ANIMATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANIMATION.M with the given input arguments.
%
%      ANIMATION('Property','Value',...) creates a new ANIMATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Animation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Animation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Animation

% Last Modified by GUIDE v2.5 02-Aug-2014 16:14:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Animation_OpeningFcn, ...
                   'gui_OutputFcn',  @Animation_OutputFcn, ...
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


% --- Executes just before Animation is made visible.
function Animation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Animation (see VARARGIN)

% Choose default command line output for Animation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow('Ship.jpg','parent',handles.Ship);
handles.trianglex = [50, 75, 100];
handles.triangley = [50,75,50];
% Set Thresholds
handles.thresholdz = .50;
handles.thresholdy = .50;
% Set above/below threshold value
handles.above = 0;
handles.below =0;
handles.shootBelow = 0;
% Set Alpha value
handles.alpha = .50;

guidata(hObject, handles);
% UIWAIT makes Animation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Animation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startStopButton.
function startStopButton_Callback(hObject, eventdata, handles)
% hObject    handle to startStopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%read the startstopButton string
handles.startstop = get(handles.startStopButton,'String');

% Switches name of startButton between 'Start' and 'Stop' depending on the
% previous setting
if strcmp(handles.startstop,'Start')
    set(handles.startStopButton,'String','Stop')
    % Update handles structure
    guidata(hObject,handles);
else
    set(handles.startStopButton,'String','Start')
    % Update handles structure
    guidata(hObject, handles);
end


handles.buff_len = 200; % initializes the length of the graph
handles.filtX = zeros(handles.buff_len,1);  % initialize filtered gx data collection
handles.filtY = zeros(handles.buff_len,1);  % initialize filtered gy data collection
handles.filtZ = zeros(handles.buff_len,1);  % initialize filtered gz data collection
    %------------------------------
% Setup xcoordinates for bullet
handles.xlen = handles.trianglex(3)-handles.trianglex(1);
handles.xp1 = (handles.xlen*.25)+ handles.trianglex(1);
handles.xp3 = (handles.xlen*.75)+ handles.trianglex(1);
handles.xp2 = (handles.xlen*.5)+ handles.trianglex(1);
% Setup y coordinates for bullet
handles.ylen = handles.triangley(2)-handles.triangley(1);
handles.yp1 = handles.triangley(2);
handles.yp3 = handles.triangley(2);
handles.yp2 = handles.ylen*.25+handles.triangley(2);
handles.xBullet = [handles.xp1,handles.xp2,handles.xp3];
handles.yBullet = [handles.yp1,handles.yp2,handles.yp3];
%------------------------------


while (strcmp(get(handles.startStopButton,'String'),'Stop'))


    % Alpha Smoothing
    % Read accelerometer values
    [handles.gx, handles.gy, handles.gz] = readAcc(handles.accelerometer, handles.calCo);
    
    
    axes(handles.Board);
    handles.filtX = [handles.filtX(2:end); (1-handles.alpha)*handles.filtX(end) + handles.alpha*handles.gx]; % calculate the x axis alpha smoothing
    handles.filtY = [handles.filtY(2:end); (1-handles.alpha)*handles.filtY(end) + handles.alpha*handles.gy]; % calculate the y axis alpha smoothing
    handles.filtZ = [handles.filtZ(2:end); (1-handles.alpha)*handles.filtZ(end) + handles.alpha*handles.gz]; % calculate the z axis alpha smoothing
    
    % Check if the magnitude is above the threshold
    if handles.filtY(handles.buff_len,1) >= handles.thresholdy && handles.above == 0
        handles.above = 1;             % set variable to 1 until data goes below the threshold
        handles.below = 0;
    elseif handles.filtY(handles.buff_len,1) < handles.thresholdy && handles.above == 1 % if the magnitude falls below threshold, reset variable
        handles.above = 0;       % set variable to 0 if under threshold
    elseif handles.filtY(handles.buff_len,1) < -1*handles.thresholdy && handles.below == 0  % if threshold is under negative threshold y
        handles.above = 0;  % Set above threshold to 0
        handles.below = 1;  % Set under threshold to 1
    elseif handles.filtY(handles.buff_len,1) > -1*handles.thresholdy && handles.below == 1  % if threshold is above minimum
        handles.below = 0;  % Set underthreshold to 0
    end
    %Clear screen
    cla;
    %--------------------- Shoot functionallity
    if handles.filtZ(handles.buff_len,1) >= handles.thresholdz && handles.shootBelow == 0
        % Set Coordinates
        % X
        handles.xp1 = (handles.xlen*.25)+ handles.trianglex(1);
handles.xp3 = (handles.xlen*.75)+ handles.trianglex(1);
handles.xp2 = (handles.xlen*.5)+ handles.trianglex(1);
handles.xBullet = [handles.xp1,handles.xp2,handles.xp3];
        % Y
        handles.yp1 = handles.triangley(2);
handles.yp3 = handles.triangley(2);
handles.yp2 = handles.ylen*.25+handles.triangley(2);
handles.yBullet = [handles.yp1,handles.yp2,handles.yp3];

        handles.shootBelow = 1;
        
    elseif handles.shootBelow>0 && handles.shootBelow<=50
        handles.shootBelow= handles.shootBelow+1;
        handles.yBullet = handles.yBullet + [20,20,20];
        fill(handles.xBullet,handles.yBullet,'r');
        hold on
       guidata(hObject, handles);
    elseif handles.shootBelow >50
        handles.shootBelow = 0;
    end
        
    %------------------------------- End shoot functionality
    
    if handles.below == 1   % if threshold is below min 
        handles.trianglex = handles.trianglex+[2,2,2];  % move right 
    elseif handles.above == 1   % if threshold is above max
        handles.trianglex = handles.trianglex+[-2,-2,-2];   % Move left
    end
    
    fill(handles.trianglex,handles.triangley,'g');
    axis([0,1000,0,1000]);
    guidata(hObject, handles);
end
guidata(hObject, handles);

% --- Executes on button press in calibrateButton.
function calibrateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calibrateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 1. Specifies the COM port that the Arduino board is connected to
handles.comPort = 'COM3';%This can be found out using the device manager (Windows)

%comPort = '/dev/tty.usbmodemfd121';

% 2. Initialize the Serial Port - setupSerial() (not to be altered)

%connect MATLAB to the accelerometer
if (~exist('handles.serialFlag','var'))
    [handles.accelerometer.s,handles.serialFlag] = setupSerial(handles.comPort);
end

% 3. Run a calibration routine if needed - calibrate() (not to be altered)

%if the accelerometer is not calibrated, calibrate now
if(~exist('handles.calCo', 'var'))
    handles.calCo = calibrate(handles.accelerometer.s);
end

guidata(hObject, handles);


% --- Executes on button press in closeSerialButton.
function closeSerialButton_Callback(hObject, eventdata, handles)
% hObject    handle to closeSerialButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close figures and clear variables
clc
clear all

% Close serial Port
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end
close all
clc
disp('Serial Port Closed')
