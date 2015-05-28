% Section 69 Group 5 Jason Gallagher Laura Worley Allan Michel
function varargout = Galaga(varargin)
% GALAGA MATLAB code for Galaga.fig
%      GALAGA, by itself, creates a new GALAGA or raises the existing
%      singleton*.
%
%      H = GALAGA returns the handle to a new GALAGA or the handle to
%      the existing singleton*.
%
%      GALAGA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GALAGA.M with the given input arguments.
%
%      GALAGA('Property','Value',...) creates a new GALAGA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Galaga_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Galaga_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Galaga

% Last Modified by GUIDE v2.5 26-Aug-2014 16:37:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Galaga_OpeningFcn, ...
    'gui_OutputFcn',  @Galaga_OutputFcn, ...
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


% --- Executes just before Galaga is made visible.
function Galaga_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Galaga (see VARARGIN)

% Choose default command line output for Galaga
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Set Thresholds
handles.thresholdz = .50;
handles.thresholdy = .50;
% Set above/below threshold value
handles.above = 0;
handles.below =0;
handles.shootBelow = 0;
handles.shootBelow1 = 0;
handles.shootBelow2 = 0;
% Set Alpha value
handles.alpha = .50;
% Score
handles.ScoreValue = 0;
% Restart Flag(if 1 reset ships)
handles.Restart = 0;
%Round count value
handles.Round = 1;
% Ship Coordinates----------------------------------------------------
handles.ship =[[0,10,10,0],[40,40,50,50];...
    [20,30,30,20],[70,70,80,80];...
    [30,50,50,30],[10,10,20,20];...
    [60,80,80,60],[10,10,20,20];...
    [40,50,50,40],[30,30,50,50];...
    [60,70,70,60],[30,30,50,50];...
    [50,60,60,50],[40,40,60,60];...
    [80,90,90,80],[70,70,80,80];...
    [100,110,110,100],[40,40,50,50];...  %end red
    [20,30,30,20],[40,40,50,50];...
    [30,40,40,30],[50,50,60,60];...
    [80,90,90,80],[40,40,50,50];...
    [70,80,80,70],[50,50,60,60];...  %end blue
    [0,10,10,0],[0,0,40,40];...
    [10,20,20,10],[10,10,30,30];...
    [20,30,30,20],[20,20,40,40];...
    [20,30,30,20],[50,50,70,70];...
    [30,40,40,30],[20,20,50,50];...
    [70,80,80,70],[20,20,50,50];...
    [40,50,50,40],[20,20,30,30];...
    [60,70,70,60],[20,20,30,30];...
    [40,50,50,40],[50,50,80,80];...
    [80,90,90,80],[20,20,40,40];...
    [80,90,90,80],[50,50,70,70];...
    [60,70,70,60],[50,50,80,80];...
    [100,110,110,100],[0,0,40,40];...
    [90,100,100,90],[10,10,30,30];...
    [50,60,60,50],[0,0,40,40];...
    [50,60,60,50],[60,60,110,110]]; % End white
%------------------------ Enemy Ship------------
handles.EnemyShip = [[0,20,20,0],[0,0,40,40];...
    [10,30,30,10],[40,40,60,60];...
    [10,20,20,10],[70,70,80,80];...
    [0,10,10,0],[80,80,100,100];...
    [70,90,90,70],[0,0,40,40];...
    [60,80,80,60],[40,40,60,60];...
    [70,80,80,70],[70,70,80,80];...
    [80,90,90,80],[80,80,100,100];...   % End blue
    [40,50,50,40],[0,0,10,10];...
    [30,60,60,30],[10,10,20,20];...
    [30,60,60,30],[30,30,50,50];...
    [20,40,40,20],[70,70,80,80];...
    [50,70,70,50],[70,70,80,80];...
    [30,40,40,30],[80,80,90,90];...
    [50,60,60,50],[80,80,90,90];... % End Red
    [30,60,60,30],[20,20,30,30];...
    [30,60,60,30],[50,50,60,60];...
    [20,70,70,20],[60,60,70,70];...
    [40,50,50,40],[70,70,100,100];...
    [20,30,30,20],[80,80,90,90];...
    [60,70,70,60],[80,80,90,90]];

%----Position ships--------------------------------------------------------
% Setup enemy ship matrix
handles.EnemyShips = zeros(21,8,15);    % Create enemy matrix
handles.coordinates = zeros(21,8);  % Create Coordinates matrix
%------------------------ship movement coordinates-----
handles.coordinatesX = zeros(21,8); % x coordinates
for i = 1:21
    handles.coordinatesX(i,1:8) = handles.coordinatesX(i,1:8)+[10,10,10,10,0,0,0,0];
end
handles.coordinatesY = zeros(21,8); % y coordinates
for i = 1:21
    handles.coordinatesY(i,1:8) = handles.coordinatesY(i,1:8)+[0,0,0,0,20,20,20,20];
end
handles.movementValue = 0;  % Value to measure left and right movement
handles.movementDelayValue = 0; % delay movement value(if = to MovementDelayThreshold move)
handles.MovementDelayThreshold = 1; % Set initial movement delay threshold value
%----------------------End ship movement coordinates
% Coordinates for row 1 start coordinates
for i=1:21
    handles.coordinates(i,1:8)= handles.coordinates(i,1:8)+[900,900,900,900,750,750,750,750];
end
% Set Row 1 ship coordinates
for i=1:5
    for j=1:21
        handles.coordinates(j,1:4)= handles.coordinates(j,1:4)-[300,300,300,300];   % shift ships
    end
    handles.EnemyShips(:,:,i)=handles.EnemyShip+ handles.coordinates;   % Set coordinates
end
% Reset coorinates to zeros
handles.coordinates = zeros(21,8);
% Set row 2 start coordinates
for i=1:21
    handles.coordinates(i,1:8)= handles.coordinates(i,1:8)+[700,700,700,700,600,600,600,600];
end
% Set ship coordinates for row 2
for i = 6:10
    for j=1:21
        handles.coordinates(j,1:4)= handles.coordinates(j,1:4)-[300,300,300,300];   % Shift Ships
    end
    handles.EnemyShips(:,:,i)=handles.EnemyShip + handles.coordinates;  % Set ship coorinates
end
% Reset coorinates to zeros
handles.coordinates = zeros(21,8);
% Set row 3 start coordinates
for i=1:21
    handles.coordinates(i,1:8)= handles.coordinates(i,1:8)+[800,800,800,800,450,450,450,450];
end
% Set ship coordinates for row 2
for i = 11:15
    for j=1:21
        handles.coordinates(j,1:4)= handles.coordinates(j,1:4)-[300,300,300,300];   % Shift Ships
    end
    handles.EnemyShips(:,:,i)=handles.EnemyShip + handles.coordinates;  % Set ship coorinates
end

%------------------End Enemy Ship Setup------------------------------------

%----Player ship----------
% Position Ship above bottom axis by 10
for i=1:29
    handles.ship(i,1:8)=handles.ship(i,1:8)+[0,0,0,0,10,10,10,10];
end
%end player ship
% End Ship Coordinates -----------------------------------------------
% Move Vectors
handles.playerMoveRight =[20,20,20,20,0,0,0,0];
handles.playerMoveLeft = [-20,-20,-20,-20,0,0,0,0];
% Plot background
imshow(imread('Starfield.jpg'),'Parent',handles.Board,'XData',[-1000,1000],'YData',[0,1000]);
set(gca,'ydir','normal')
hold on
% Plot ships
fill(handles.ship(1,1:4),handles.ship(1,5:8),'r',handles.ship(2,1:4),handles.ship(2,5:8),'r',handles.ship(3,1:4),handles.ship(3,5:8),'r',handles.ship(4,1:4),handles.ship(4,5:8),'r',handles.ship(5,1:4),handles.ship(5,5:8),'r',handles.ship(6,1:4),handles.ship(6,5:8),'r',handles.ship(7,1:4),handles.ship(7,5:8),'r',handles.ship(8,1:4),handles.ship(8,5:8),'r',handles.ship(9,1:4),handles.ship(9,5:8),'r',handles.ship(10,1:4),handles.ship(10,5:8),'b',handles.ship(11,1:4),handles.ship(11,5:8),'b',handles.ship(12,1:4),handles.ship(12,5:8),'b',handles.ship(13,1:4),handles.ship(13,5:8),'b',handles.ship(14,1:4),handles.ship(14,5:8),'w',handles.ship(15,1:4),handles.ship(15,5:8),'w',handles.ship(16,1:4),handles.ship(16,5:8),'w',handles.ship(17,1:4),handles.ship(17,5:8),'w',handles.ship(18,1:4),handles.ship(18,5:8),'w',handles.ship(19,1:4),handles.ship(19,5:8),'w',handles.ship(20,1:4),handles.ship(20,5:8),'w',handles.ship(21,1:4),handles.ship(21,5:8),'w',handles.ship(22,1:4),handles.ship(22,5:8),'w',handles.ship(23,1:4),handles.ship(23,5:8),'w',handles.ship(24,1:4),handles.ship(24,5:8),'w',handles.ship(25,1:4),handles.ship(25,5:8),'w',handles.ship(26,1:4),handles.ship(26,5:8),'w',handles.ship(27,1:4),handles.ship(27,5:8),'w',handles.ship(28,1:4),handles.ship(28,5:8),'w',handles.ship(29,1:4),handles.ship(29,5:8),'w');
% Plot enemy ships
for i=1:15
    fill(handles.EnemyShips(1,1:4,i),handles.EnemyShips(1,5:8,i),'b',handles.EnemyShips(2,1:4,i),handles.EnemyShips(2,5:8,i),'b',handles.EnemyShips(3,1:4,i),handles.EnemyShips(3,5:8,i),'b',handles.EnemyShips(4,1:4,i),handles.EnemyShips(4,5:8,i),'b',handles.EnemyShips(5,1:4,i),handles.EnemyShips(5,5:8,i),'b',handles.EnemyShips(6,1:4,i),handles.EnemyShips(6,5:8,i),'b',handles.EnemyShips(7,1:4,i),handles.EnemyShips(7,5:8,i),'b',handles.EnemyShips(8,1:4,i),handles.EnemyShips(8,5:8,i),'b',handles.EnemyShips(9,1:4,i),handles.EnemyShips(9,5:8,i),'r',handles.EnemyShips(10,1:4,i),handles.EnemyShips(10,5:8,i),'r',handles.EnemyShips(11,1:4,i),handles.EnemyShips(11,5:8,i),'r',handles.EnemyShips(12,1:4,i),handles.EnemyShips(12,5:8,i),'r',handles.EnemyShips(13,1:4,i),handles.EnemyShips(13,5:8,i),'r',handles.EnemyShips(14,1:4,i),handles.EnemyShips(14,5:8,i),'r',handles.EnemyShips(15,1:4,i),handles.EnemyShips(15,5:8,i),'r',handles.EnemyShips(16,1:4,i),handles.EnemyShips(16,5:8,i),'y',handles.EnemyShips(17,1:4,i),handles.EnemyShips(17,5:8,i),'y',handles.EnemyShips(18,1:4,i),handles.EnemyShips(18,5:8,i),'y',handles.EnemyShips(19,1:4,i),handles.EnemyShips(19,5:8,i),'y',handles.EnemyShips(20,1:4,i),handles.EnemyShips(20,5:8,i),'y',handles.EnemyShips(21,1:4,i),handles.EnemyShips(21,5:8,i),'y');
end
% Hit Detection
handles.PlotEnemy = ones(1,15); % Used for determining which ships are alive and should be plotted
% Replot flag
handles.replot = 0; % flag set when game is reset or round is over
% bullet Coordinates
handles.yBullet = [0,0,0,0];
handles.xBullet = [0,0,0,0];
handles.yBullet1 = [0,0,0,0];
handles.xBullet1 = [0,0,0,0];
handles.yBullet2 = [0,0,0,0];
handles.xBullet2 = [0,0,0,0];

guidata(hObject, handles);
% UIWAIT makes Galaga wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Galaga_OutputFcn(hObject, eventdata, handles)
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

set(handles.roundCounterText,'String',num2str(handles.Round));   % set label to round value
set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
handles.buff_len = 200; % initializes the length of the graph
handles.filtX = zeros(handles.buff_len,1);  % initialize filtered gx data collection
handles.filtY = zeros(handles.buff_len,1);  % initialize filtered gy data collection
handles.filtZ = zeros(handles.buff_len,1);  % initialize filtered gz data collection
set(handles.WinLoseText,'Visible','Off'); % Set win lose text to invisible
%------------------------------



while (strcmp(get(handles.startStopButton,'String'),'Stop'))
    
    % ---------------------Beginning of Restart sequence-----------------
    if handles.Restart == 1 || handles.replot == -1,
        % If restart flag set
        if handles.Restart == 1
            handles.ScoreValue =0;   % Reset score
            handles.Round = 1;  % Reset round
            % Reset vertical drop
            handles.coordinatesY = zeros(21,8);
            for i = 1:21
                handles.coordinatesY(i,1:8) = handles.coordinatesY(i,1:8)+[0,0,0,0,20,20,20,20];
            end
            set(handles.WinLoseText,'String','You Lose','Visible','On'); % Display that user loses
        end
        % if replot flag is set (round is over)
        if handles.replot ==-1,
            handles.Round = handles.Round + 1;   % Increment round
            set(handles.roundCounterText,'String',num2str(handles.Round));   % set label to round value
            % Increase vertical drop for increased difficulty
            for i = 1:21
                handles.coordinatesY(i,1:8) = handles.coordinatesY(i,1:8)+[0,0,0,0,10,10,10,10];
            end
            set(handles.WinLoseText,'String',['You Win, Round ' num2str(handles.Round)],'Visible','On');   % Display user wins and round
        end
        % Ship Coordinates----------------------------------------------------
        handles.ship =[[0,10,10,0],[40,40,50,50];...
            [20,30,30,20],[70,70,80,80];...
            [30,50,50,30],[10,10,20,20];...
            [60,80,80,60],[10,10,20,20];...
            [40,50,50,40],[30,30,50,50];...
            [60,70,70,60],[30,30,50,50];...
            [50,60,60,50],[40,40,60,60];...
            [80,90,90,80],[70,70,80,80];...
            [100,110,110,100],[40,40,50,50];...  %end red
            [20,30,30,20],[40,40,50,50];...
            [30,40,40,30],[50,50,60,60];...
            [80,90,90,80],[40,40,50,50];...
            [70,80,80,70],[50,50,60,60];...  %end blue
            [0,10,10,0],[0,0,40,40];...
            [10,20,20,10],[10,10,30,30];...
            [20,30,30,20],[20,20,40,40];...
            [20,30,30,20],[50,50,70,70];...
            [30,40,40,30],[20,20,50,50];...
            [70,80,80,70],[20,20,50,50];...
            [40,50,50,40],[20,20,30,30];...
            [60,70,70,60],[20,20,30,30];...
            [40,50,50,40],[50,50,80,80];...
            [80,90,90,80],[20,20,40,40];...
            [80,90,90,80],[50,50,70,70];...
            [60,70,70,60],[50,50,80,80];...
            [100,110,110,100],[0,0,40,40];...
            [90,100,100,90],[10,10,30,30];...
            [50,60,60,50],[0,0,40,40];...
            [50,60,60,50],[60,60,110,110]]; % End white
        %------------------------ Enemy Ship------------
        handles.EnemyShip = [[0,20,20,0],[0,0,40,40];...
            [10,30,30,10],[40,40,60,60];...
            [10,20,20,10],[70,70,80,80];...
            [0,10,10,0],[80,80,100,100];...
            [70,90,90,70],[0,0,40,40];...
            [60,80,80,60],[40,40,60,60];...
            [70,80,80,70],[70,70,80,80];...
            [80,90,90,80],[80,80,100,100];...   % End blue
            [40,50,50,40],[0,0,10,10];...
            [30,60,60,30],[10,10,20,20];...
            [30,60,60,30],[30,30,50,50];...
            [20,40,40,20],[70,70,80,80];...
            [50,70,70,50],[70,70,80,80];...
            [30,40,40,30],[80,80,90,90];...
            [50,60,60,50],[80,80,90,90];... % End Red
            [30,60,60,30],[20,20,30,30];...
            [30,60,60,30],[50,50,60,60];...
            [20,70,70,20],[60,60,70,70];...
            [40,50,50,40],[70,70,100,100];...
            [20,30,30,20],[80,80,90,90];...
            [60,70,70,60],[80,80,90,90]];
        
        %----Position ships--------------------------------------------------------
        % Setup enemy ship matrix
        handles.EnemyShips = zeros(21,8,15);    % Create enemy matrix
        handles.coordinates = zeros(21,8);  % Create Coordinates matrix
        % Coordinates for row 1 start coordinates
        for i=1:21
            handles.coordinates(i,1:8)= handles.coordinates(i,1:8)+[900,900,900,900,750,750,750,750];
        end
        % Set Row 1 ship coordinates
        for i=1:5
            for j=1:21
                handles.coordinates(j,1:4)= handles.coordinates(j,1:4)-[300,300,300,300];   % shift ships
            end
            handles.EnemyShips(:,:,i)=handles.EnemyShip+ handles.coordinates;   % Set coordinates
        end
        % Reset coorinates to zeros
        handles.coordinates = zeros(21,8);
        % Set row 2 start coordinates
        for i=1:21
            handles.coordinates(i,1:8)= handles.coordinates(i,1:8)+[700,700,700,700,600,600,600,600];
        end
        % Set ship coordinates for row 2
        for i = 6:10
            for j=1:21
                handles.coordinates(j,1:4)= handles.coordinates(j,1:4)-[300,300,300,300];   % Shift Ships
            end
            handles.EnemyShips(:,:,i)=handles.EnemyShip + handles.coordinates;  % Set ship coorinates
        end
        % Reset coorinates to zeros
        handles.coordinates = zeros(21,8);
        % Set row 3 start coordinates
        for i=1:21
            handles.coordinates(i,1:8)= handles.coordinates(i,1:8)+[800,800,800,800,450,450,450,450];
        end
        % Set ship coordinates for row 2
        for i = 11:15
            for j=1:21
                handles.coordinates(j,1:4)= handles.coordinates(j,1:4)-[300,300,300,300];   % Shift Ships
            end
            handles.EnemyShips(:,:,i)=handles.EnemyShip + handles.coordinates;  % Set ship coorinates
        end
        
        %------------------End Enemy Ship Setup------------------------------------
        
        %----Player ship
        for i=1:29
            handles.ship(i,1:8)=handles.ship(i,1:8)+[0,0,0,0,10,10,10,10];
        end
        %end player ship
        % End Ship Coordinates -----------------------------------------------
        
        handles.Restart =0;
        % Hit Detection
        handles.PlotEnemy = ones(1,15); % Reset plot enemies flag
        handles.replot =0;  % Reset Replot flag
        handles.shootBelow = 51; % stop bullet
        handles.shootBelow1 = 51; % stop bullet 1
        handles.shootBelow2 = 51; % stop bullet 2
        set(handles.startStopButton,'String','Start');  % Stop loop
        
    end
    % ----------------------------------------End Restart Sequence-------------
    %--------------------------Start Enemy Ship movement
    % Move ships until movement Value=15(move ship 15 spots to the left)
    if handles.movementDelayValue == handles.MovementDelayThreshold && handles.movementValue >=0 && handles.movementValue<15
        % Move top row left
        for i = 1:5
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) - handles.coordinatesX;  % Set ship coorinates
            end
        end
        % Move middle row right
        for i = 6:10
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) + handles.coordinatesX;  % Set ship coorinates
            end
        end
        % Move bottom row left
        for i = 11:15
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) - handles.coordinatesX;  % Set ship coorinates
            end
        end
        handles.movementValue = handles.movementValue +1;   % Increment movement value
        handles.movementDelayValue = 0; % Reset Movement Delay Value
        % if movement delay value = 15 then move ships down vertically
    elseif handles.movementDelayValue == handles.MovementDelayThreshold && handles.movementValue ==15
        for i = 1:15
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) - handles.coordinatesY;  % Set ship coorinates
            end
        end
        handles.movementValue = -15;    % Set movement value for opposite movement
        handles.movementDelayValue =0;  % Reset Delay value
        % If movement value is less then zero move ships the opposite way
        % back to origin
    elseif handles.movementDelayValue == handles.MovementDelayThreshold && handles.movementValue <0
        for i = 1:5
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) + handles.coordinatesX;  % Set ship coorinates
            end
        end
        for i = 6:10
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) - handles.coordinatesX;  % Set ship coorinates
            end
        end
        for i = 11:15
            if handles.PlotEnemy(i) ==1
                handles.EnemyShips(:,:,i)=handles.EnemyShips(:,:,i) + handles.coordinatesX;  % Set ship coorinates
            end
        end
        handles.movementValue = handles.movementValue + 1;  % Increment movement value
        handles.movementDelayValue = 0;     % reset movement delay value
    end
    handles.movementDelayValue = handles.movementDelayValue+1;  % Increment movement delay value
    
    % End Game if ships hit player ship
    for i=1:15
        if handles.EnemyShips(1,5,i) <=110
            handles.Restart = 1; % Set restart flag
        end
    end
    %End enemy ship movement-------------------------------------------
    
    % Alpha Smoothing
    % Read accelerometer values
    [handles.gx, handles.gy, handles.gz] = readAcc(handles.accelerometer, handles.calCo);
    
    
    axes(handles.Board);    % Set axis
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
    % Plot background
    imshow(imread('Starfield.jpg'),'Parent',handles.Board,'XData',[-1000,1000],'YData',[0,1000]);
    set(gca,'ydir','normal')
    hold on
    %--------------------- Shoot functionallity
    if handles.filtZ(handles.buff_len,1) >= handles.thresholdz && handles.shootBelow == 0
        % Set Coordinates
        % X bullet coordinates
        handles.xp1 = handles.ship(28,1);
        handles.xp2 = handles.ship(28,2);
        handles.xp3 = handles.ship(28,3);
        handles.xp4=handles.ship(28,4);
        handles.xBullet = [handles.xp1,handles.xp2,handles.xp3,handles.xp4];
        % Y bullet coordinates
        handles.yp1 = handles.ship(28,7);
        handles.yp2 = handles.ship(28,8);
        handles.yp3 = handles.ship(28,7)+10;
        handles.yp4 = handles.ship(28,8)+10;
        handles.yBullet = [handles.yp1,handles.yp2,handles.yp3,handles.yp4];
        
        handles.shootBelow = 1; % Set shootbelow flag to initiate shooting
        
        % Initiate shooting
    elseif handles.shootBelow>0 && handles.shootBelow<=50
        handles.shootBelow= handles.shootBelow+1;   % Increment shoot below value
        handles.yBullet = handles.yBullet + [20,20,20,20];  % Increment position
        fill(handles.xBullet,handles.yBullet,'y');  % Draw bullet
        hold on
        % hit detection----------------------------------------------------
        for i = 1:15,
            if handles.PlotEnemy(i) == 0
                handles.PlotEnemy(i) = 0;  % leave setting the same
            elseif handles.xBullet(1) >= handles.EnemyShips(1,1,i) && handles.xBullet(1) <= handles.EnemyShips(1,1,i)+90 && handles.yBullet(3) >= handles.EnemyShips(1,5,i) && handles.yBullet(3)<= handles.EnemyShips(1,5,i)+100
                handles.PlotEnemy(i) = 0;   % set Enemy to invisible
                handles.replot = handles.replot+1;  % Increment replot value
                handles.shootBelow = 51; % stop bullet
                handles.ScoreValue = handles.ScoreValue + 200;  % Increment score
                set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
                
            elseif handles.xBullet(3) >= handles.EnemyShips(1,1,i) && handles.xBullet(3) <= handles.EnemyShips(1,1,i)+90 && handles.yBullet(3) >= handles.EnemyShips(1,5,i) && handles.yBullet(3)<= handles.EnemyShips(1,5,i)+100
                handles.PlotEnemy(i) = 0;   % set enemy to invisible
                handles.replot = handles.replot+1;  % Increment replot value
                handles.shootBelow = 51; % stop bullet
                handles.ScoreValue = handles.ScoreValue + 200;  % Increment score
                set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
            end
        end
        %End hit detection----------------------------------
        guidata(hObject, handles);
    
    % Bullet end animation
    elseif handles.shootBelow >50
        handles.shootBelow = 0;
    end
    %--------------------------Bullet1
    if (handles.filtZ(handles.buff_len,1) >= handles.thresholdz && handles.shootBelow >=15 && handles.shootBelow <=30 && handles.shootBelow1==0)
        % Set Coordinates
        % X bullet coordinates
        handles.xp1 = handles.ship(28,1);
        handles.xp2 = handles.ship(28,2);
        handles.xp3 = handles.ship(28,3);
        handles.xp4=handles.ship(28,4);
        handles.xBullet1 = [handles.xp1,handles.xp2,handles.xp3,handles.xp4];
        % Y bullet coorinates
        handles.yp1 = handles.ship(28,7);
        handles.yp2 = handles.ship(28,8);
        handles.yp3 = handles.ship(28,7)+10;
        handles.yp4 = handles.ship(28,8)+10;
        handles.yBullet1 = [handles.yp1,handles.yp2,handles.yp3,handles.yp4];
        
        handles.shootBelow1 = 1;    % Set shootbelow flag to initiate shooting
    elseif handles.shootBelow1>0 && handles.shootBelow1<=50
        handles.shootBelow1= handles.shootBelow1+1; % Increment shootbelow value
        handles.yBullet1 = handles.yBullet1 + [20,20,20,20];    % increment bullet position
        fill(handles.xBullet1,handles.yBullet1,'y');    % Draw bullet
        hold on
        % hit detection-----------------------
        for i = 1:15,
            if handles.PlotEnemy(i) == 0
                handles.PlotEnemy(i) = 0;  % leave setting the same
            elseif handles.xBullet1(1) >= handles.EnemyShips(1,1,i) && handles.xBullet1(1) <= handles.EnemyShips(1,1,i)+90 && handles.yBullet1(3) >= handles.EnemyShips(1,5,i) && handles.yBullet1(3)<= handles.EnemyShips(1,5,i)+100
                handles.PlotEnemy(i) = 0;   % set Enemy to invisible
                handles.replot = handles.replot+1;  % Increment replot value
                handles.shootBelow1 = 51; % stop bullet
                handles.ScoreValue = handles.ScoreValue + 200;  % Increment score
                set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
                
            elseif handles.xBullet1(3) >= handles.EnemyShips(1,1,i) && handles.xBullet1(3) <= handles.EnemyShips(1,1,i)+90 && handles.yBullet1(3) >= handles.EnemyShips(1,5,i) && handles.yBullet1(3)<= handles.EnemyShips(1,5,i)+100
                handles.PlotEnemy(i) = 0;   % set enemy to invisible
                handles.replot = handles.replot+1;  % Increment replot value
                handles.shootBelow1 = 51; % stop bullet
                handles.ScoreValue = handles.ScoreValue + 200;  % Increment score
                set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
            end
        end
        %End hit detection----------------------------------
        guidata(hObject, handles);
    elseif handles.shootBelow1 >50
        handles.shootBelow1 = 0;
    end
    %------------------end Bullet1
    
    %------------------Bullet2
    if (handles.filtZ(handles.buff_len,1) >= handles.thresholdz && handles.shootBelow1 >=15 && handles.shootBelow1 <=30 && handles.shootBelow2==0)||(handles.filtZ(handles.buff_len,1) >= handles.thresholdz && handles.shootBelow >=45 && handles.shootBelow <=51 && handles.shootBelow2==0)
        % Set Coordinates
        % X bullet coordinates
        handles.xp1 = handles.ship(28,1);
        handles.xp2 = handles.ship(28,2);
        handles.xp3 = handles.ship(28,3);
        handles.xp4=handles.ship(28,4);
        handles.xBullet2 = [handles.xp1,handles.xp2,handles.xp3,handles.xp4];
        % Y bullet coordinates
        handles.yp1 = handles.ship(28,7);
        handles.yp2 = handles.ship(28,8);
        handles.yp3 = handles.ship(28,7)+10;
        handles.yp4 = handles.ship(28,8)+10;
        handles.yBullet2 = [handles.yp1,handles.yp2,handles.yp3,handles.yp4];
        
        handles.shootBelow2 = 1;    % Set shootbelow flag to initiate shooting
    elseif handles.shootBelow2>0 && handles.shootBelow2<=50
        handles.shootBelow2= handles.shootBelow2+1; % Increment Shootbelow value
        handles.yBullet2 = handles.yBullet2 + [20,20,20,20];    % Increment position
        fill(handles.xBullet2,handles.yBullet2,'y');    % Draw bullet
        hold on
        % hit detection-----------------------
        for i = 1:15,
            if handles.PlotEnemy(i) == 0
                handles.PlotEnemy(i) = 0;  % leave setting the same
            elseif handles.xBullet2(1) >= handles.EnemyShips(1,1,i) && handles.xBullet2(1) <= handles.EnemyShips(1,1,i)+90 && handles.yBullet2(3) >= handles.EnemyShips(1,5,i) && handles.yBullet2(3)<= handles.EnemyShips(1,5,i)+100
                handles.PlotEnemy(i) = 0;   % set Enemy to invisible
                handles.replot = handles.replot+1;  % Increment replot value
                handles.shootBelow2 = 51; % stop bullet
                handles.ScoreValue = handles.ScoreValue + 200;  % Increment score
                set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
                
            elseif handles.xBullet2(3) >= handles.EnemyShips(1,1,i) && handles.xBullet2(3) <= handles.EnemyShips(1,1,i)+90 && handles.yBullet2(3) >= handles.EnemyShips(1,5,i) && handles.yBullet2(3)<= handles.EnemyShips(1,5,i)+100
                handles.PlotEnemy(i) = 0;   % set enemy to invisible
                handles.replot = handles.replot+1;  % Increment replot value
                handles.shootBelow2 = 51; % stop bullet
                handles.ScoreValue = handles.ScoreValue + 200;  % Increment score
                set(handles.scoreCounterText,'String',num2str(handles.ScoreValue)); % Update Score text
            end
        end
        %End hit detection----------------------------------
        guidata(hObject, handles);
    elseif handles.shootBelow1 >50
        handles.shootBelow2 = 0;
    end
    
    %------------------end Bullet2
    
    %------------------------------- End shoot functionality
    
    if handles.below == 1 && handles.ship(26,2) < 1000  % if threshold is below min and on board
        % move right
        for j=1:29
            handles.ship(j,1:8)=handles.ship(j,1:8)+ handles.playerMoveRight;
        end
    elseif handles.above == 1 && handles.ship(1,1) > -1000   % if threshold is above max and on board
        % Move left
        for j=1:29
            handles.ship(j,1:8)=handles.ship(j,1:8)+ handles.playerMoveLeft;
        end
    end
    
    % Draw Ships
    % Player Ship
    fill(handles.ship(1,1:4),handles.ship(1,5:8),'r',handles.ship(2,1:4),handles.ship(2,5:8),'r',handles.ship(3,1:4),handles.ship(3,5:8),'r',handles.ship(4,1:4),handles.ship(4,5:8),'r',handles.ship(5,1:4),handles.ship(5,5:8),'r',handles.ship(6,1:4),handles.ship(6,5:8),'r',handles.ship(7,1:4),handles.ship(7,5:8),'r',handles.ship(8,1:4),handles.ship(8,5:8),'r',handles.ship(9,1:4),handles.ship(9,5:8),'r',handles.ship(10,1:4),handles.ship(10,5:8),'b',handles.ship(11,1:4),handles.ship(11,5:8),'b',handles.ship(12,1:4),handles.ship(12,5:8),'b',handles.ship(13,1:4),handles.ship(13,5:8),'b',handles.ship(14,1:4),handles.ship(14,5:8),'w',handles.ship(15,1:4),handles.ship(15,5:8),'w',handles.ship(16,1:4),handles.ship(16,5:8),'w',handles.ship(17,1:4),handles.ship(17,5:8),'w',handles.ship(18,1:4),handles.ship(18,5:8),'w',handles.ship(19,1:4),handles.ship(19,5:8),'w',handles.ship(20,1:4),handles.ship(20,5:8),'w',handles.ship(21,1:4),handles.ship(21,5:8),'w',handles.ship(22,1:4),handles.ship(22,5:8),'w',handles.ship(23,1:4),handles.ship(23,5:8),'w',handles.ship(24,1:4),handles.ship(24,5:8),'w',handles.ship(25,1:4),handles.ship(25,5:8),'w',handles.ship(26,1:4),handles.ship(26,5:8),'w',handles.ship(27,1:4),handles.ship(27,5:8),'w',handles.ship(28,1:4),handles.ship(28,5:8),'w',handles.ship(29,1:4),handles.ship(29,5:8),'w');
    % Plot enemy ships
    for i=1:15
        if handles.PlotEnemy(i) == 1
            fill(handles.EnemyShips(1,1:4,i),handles.EnemyShips(1,5:8,i),'b',handles.EnemyShips(2,1:4,i),handles.EnemyShips(2,5:8,i),'b',handles.EnemyShips(3,1:4,i),handles.EnemyShips(3,5:8,i),'b',handles.EnemyShips(4,1:4,i),handles.EnemyShips(4,5:8,i),'b',handles.EnemyShips(5,1:4,i),handles.EnemyShips(5,5:8,i),'b',handles.EnemyShips(6,1:4,i),handles.EnemyShips(6,5:8,i),'b',handles.EnemyShips(7,1:4,i),handles.EnemyShips(7,5:8,i),'b',handles.EnemyShips(8,1:4,i),handles.EnemyShips(8,5:8,i),'b',handles.EnemyShips(9,1:4,i),handles.EnemyShips(9,5:8,i),'r',handles.EnemyShips(10,1:4,i),handles.EnemyShips(10,5:8,i),'r',handles.EnemyShips(11,1:4,i),handles.EnemyShips(11,5:8,i),'r',handles.EnemyShips(12,1:4,i),handles.EnemyShips(12,5:8,i),'r',handles.EnemyShips(13,1:4,i),handles.EnemyShips(13,5:8,i),'r',handles.EnemyShips(14,1:4,i),handles.EnemyShips(14,5:8,i),'r',handles.EnemyShips(15,1:4,i),handles.EnemyShips(15,5:8,i),'r',handles.EnemyShips(16,1:4,i),handles.EnemyShips(16,5:8,i),'y',handles.EnemyShips(17,1:4,i),handles.EnemyShips(17,5:8,i),'y',handles.EnemyShips(18,1:4,i),handles.EnemyShips(18,5:8,i),'y',handles.EnemyShips(19,1:4,i),handles.EnemyShips(19,5:8,i),'y',handles.EnemyShips(20,1:4,i),handles.EnemyShips(20,5:8,i),'y',handles.EnemyShips(21,1:4,i),handles.EnemyShips(21,5:8,i),'y');
        end
    end
    if handles.replot == 15 % if all ships are hit
        handles.replot =-1; % Set replot flag to -1 to replot ships and increment round
    end
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


% --- Executes on button press in RestartButton.
function RestartButton_Callback(hObject, eventdata, handles)
% hObject    handle to RestartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Restart = 1;
guidata(hObject, handles);
