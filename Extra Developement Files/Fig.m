%white
%ship = [0,110,110,0;0,0,110,110];
%fill([0,110,110,0],[0,0,110,110],'k');
hold on
% Red
fill([0,10,10,0],[40,40,50,50],'r');
fill([20,30,30,20],[70,70,80,80],'r');
fill([30,50,50,30],[10,10,20,20],'r');
fill([60,80,80,60],[10,10,20,20],'r');
fill([40,50,50,40],[30,30,50,50],'r');
fill([60,70,70,60],[30,30,50,50],'r');
fill([50,60,60,50],[40,40,60,60],'r');
fill([80,90,90,80],[70,70,80,80],'r');
fill([100,110,110,100],[40,40,50,50],'r');

% Blue
fill([20,30,30,20],[40,40,50,50],'b');
fill([30,40,40,30],[50,50,60,60],'b');
fill([80,90,90,80],[40,40,50,50],'b');
fill([70,80,80,70],[50,50,60,60],'b');
%fill([2,4,4,2],[0,0,2,2],'b',[3,3.25,3.5],[1,2,1],'g');

%white
fill([0,10,10,0],[0,0,40,40],'w');
fill([10,20,20,10],[10,10,30,30],'w');
fill([20,30,30,20],[20,20,40,40],'w');
fill([20,30,30,20],[50,50,70,70],'w');
fill([30,40,40,30],[20,20,50,50],'w');
fill([70,80,80,70],[20,20,50,50],'w');
fill([40,50,50,40],[20,20,30,30],'w');
fill([60,70,70,60],[20,20,30,30],'w');
fill([40,50,50,40],[50,50,80,80],'w');
fill([80,90,90,80],[20,20,40,40],'w');
fill([80,90,90,80],[50,50,70,70],'w');
fill([60,70,70,60],[50,50,80,80],'w');
fill([100,110,110,100],[0,0,40,40],'w');
fill([90,100,100,90],[10,10,30,30],'w');
fill([50,60,60,50],[0,0,40,40],'w');
fill([50,60,60,50],[60,60,110,110],'w');
%%
ship =[[0,10,10,0],[40,40,50,50];...
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
    [50,60,60,50],[60,60,110,110]];

%% Create Fill with parameters and print to ship.txt file
fid = fopen('ship.txt','a');
fprintf(fid,'fill(handles.ship(1,1:4),handles.ship(1,5:8),''r''');

for i =2:29
    if i<=9
        color = '''r''';
    elseif i > 9 && i<=13
        color = '''b''';
    else
        color = '''w''';
    end
    fprintf(fid,',handles.ship(%d,1:4),handles.ship(%d,5:8),%s',i,i,color);
end
fprintf(fid,');\n');
fclose(fid);

%% output file
%(['ship('+num2str(i)+',1:4),ship('+num2str(i)+',5:8),'+color+','])
fill(ship(1,1:4),ship(1,5:8),'r',ship(2,1:4),ship(2,5:8),'r',ship(3,1:4),ship(3,5:8),'r',ship(4,1:4),ship(4,5:8),'r',ship(5,1:4),ship(5,5:8),'r',ship(6,1:4),ship(6,5:8),'r',ship(7,1:4),ship(7,5:8),'r',ship(8,1:4),ship(8,5:8),'r',ship(9,1:4),ship(9,5:8),'r',ship(10,1:4),ship(10,5:8),'b',ship(11,1:4),ship(11,5:8),'b',ship(12,1:4),ship(12,5:8),'b',ship(13,1:4),ship(13,5:8),'b',ship(14,1:4),ship(14,5:8),'w',ship(15,1:4),ship(15,5:8),'w',ship(16,1:4),ship(16,5:8),'w',ship(17,1:4),ship(17,5:8),'w',ship(18,1:4),ship(18,5:8),'w',ship(19,1:4),ship(19,5:8),'w',ship(20,1:4),ship(20,5:8),'w',ship(21,1:4),ship(21,5:8),'w',ship(22,1:4),ship(22,5:8),'w',ship(23,1:4),ship(23,5:8),'w',ship(24,1:4),ship(24,5:8),'w',ship(25,1:4),ship(25,5:8),'w',ship(26,1:4),ship(26,5:8),'w',ship(27,1:4),ship(27,5:8),'w',ship(28,1:4),ship(28,5:8),'w',ship(29,1:4),ship(29,5:8),'w');
%fill(handles.ship(1,1:4),handles.ship(1,5:8),'r',handles.ship(2,1:4),handles.ship(2,5:8),'r',handles.ship(3,1:4),handles.ship(3,5:8),'r',handles.ship(4,1:4),handles.ship(4,5:8),'r',handles.ship(5,1:4),handles.ship(5,5:8),'r',handles.ship(6,1:4),handles.ship(6,5:8),'r',handles.ship(7,1:4),handles.ship(7,5:8),'r',handles.ship(8,1:4),handles.ship(8,5:8),'r',handles.ship(9,1:4),handles.ship(9,5:8),'r',handles.ship(10,1:4),handles.ship(10,5:8),'b',handles.ship(11,1:4),handles.ship(11,5:8),'b',handles.ship(12,1:4),handles.ship(12,5:8),'b',handles.ship(13,1:4),handles.ship(13,5:8),'b',handles.ship(14,1:4),handles.ship(14,5:8),'w',handles.ship(15,1:4),handles.ship(15,5:8),'w',handles.ship(16,1:4),handles.ship(16,5:8),'w',handles.ship(17,1:4),handles.ship(17,5:8),'w',handles.ship(18,1:4),handles.ship(18,5:8),'w',handles.ship(19,1:4),handles.ship(19,5:8),'w',handles.ship(20,1:4),handles.ship(20,5:8),'w',handles.ship(21,1:4),handles.ship(21,5:8),'w',handles.ship(22,1:4),handles.ship(22,5:8),'w',handles.ship(23,1:4),handles.ship(23,5:8),'w',handles.ship(24,1:4),handles.ship(24,5:8),'w',handles.ship(25,1:4),handles.ship(25,5:8),'w',handles.ship(26,1:4),handles.ship(26,5:8),'w',handles.ship(27,1:4),handles.ship(27,5:8),'w',handles.ship(28,1:4),handles.ship(28,5:8),'w',handles.ship(29,1:4),handles.ship(29,5:8),'w');

%% Manipulation
moveRight=[1,1,1,1,0,0,0,0];
%moveRight = moveRight*5;
test
for i=0:20
    for j=1:29
       ship(j,1:8)=ship(j,1:8)+ moveRight*i;
    end
    cla;
    fill([0,1000,1000,0],[0,0,1000,1000],'k');
    hold on
    fill(ship(1,1:4),ship(1,5:8),'r',ship(2,1:4),ship(2,5:8),'r',ship(3,1:4),ship(3,5:8),'r',ship(4,1:4),ship(4,5:8),'r',ship(5,1:4),ship(5,5:8),'r',ship(6,1:4),ship(6,5:8),'r',ship(7,1:4),ship(7,5:8),'r',ship(8,1:4),ship(8,5:8),'r',ship(9,1:4),ship(9,5:8),'r',ship(10,1:4),ship(10,5:8),'b',ship(11,1:4),ship(11,5:8),'b',ship(12,1:4),ship(12,5:8),'b',ship(13,1:4),ship(13,5:8),'b',ship(14,1:4),ship(14,5:8),'w',ship(15,1:4),ship(15,5:8),'w',ship(16,1:4),ship(16,5:8),'w',ship(17,1:4),ship(17,5:8),'w',ship(18,1:4),ship(18,5:8),'w',ship(19,1:4),ship(19,5:8),'w',ship(20,1:4),ship(20,5:8),'w',ship(21,1:4),ship(21,5:8),'w',ship(22,1:4),ship(22,5:8),'w',ship(23,1:4),ship(23,5:8),'w',ship(24,1:4),ship(24,5:8),'w',ship(25,1:4),ship(25,5:8),'w',ship(26,1:4),ship(26,5:8),'w',ship(27,1:4),ship(27,5:8),'w',ship(28,1:4),ship(28,5:8),'w',ship(29,1:4),ship(29,5:8),'w');
    
    axis([0,1000,0,1000]);
    pause(.001);
end


%% Enemy Ship
% Blue
fill([0,20,20,0],[0,0,40,40],'b');
hold on
fill([10,30,30,10],[40,40,60,60],'b');
fill([10,20,20,10],[70,70,80,80],'b');
fill([0,10,10,0],[80,80,100,100],'b');
fill([70,90,90,70],[0,0,40,40],'b');
fill([60,80,80,60],[40,40,60,60],'b');
fill([70,80,80,70],[70,70,80,80],'b');
fill([80,90,90,80],[80,80,100,100],'b');
% Red
fill([40,50,50,40],[0,0,10,10],'r');
fill([30,60,60,30],[10,10,20,20],'r');
fill([30,60,60,30],[30,30,50,50],'r');
fill([20,40,40,20],[70,70,80,80],'r');
fill([50,70,70,50],[70,70,80,80],'r');
fill([30,40,40,30],[80,80,90,90],'r');
fill([50,60,60,50],[80,80,90,90],'r');
%Yellow
fill([30,60,60,30],[20,20,30,30],'y');
fill([30,60,60,30],[50,50,60,60],'y');
fill([20,70,70,20],[60,60,70,70],'y');
fill([40,50,50,40],[70,70,100,100],'y');
fill([20,30,30,20],[80,80,90,90],'y');
fill([60,70,70,60],[80,80,90,90],'y');

axis([-10,120,-10,120]);
%% Enemy Ship matrix
EnemyShip = [[0,20,20,0],[0,0,40,40];...
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
        
%% Create Fill with parameters Print to file EnemyShip.txt
fid=fopen('EnemyShip.txt','a');
fprintf(fid,'fill(handles.EnemyShip(1,1:4),handles.EnemyShip(1,5:8),''b''');

for i =2:21
    if i<=8
        color = '''b''';
    elseif i > 8 && i<=15
        color = '''r''';
    else
        color = '''y''';
    end
    fprintf(fid,',handles.EnemyShip(%d,1:4),handles.EnemyShip(%d,5:8),%s',i,i,color);
end
fprintf(fid,');\n');
fclose(fid);
        
%% Output file
fill(handles.EnemyShip(1,1:4),handles.EnemyShip(1,5:8),'b',handles.EnemyShip(2,1:4),handles.EnemyShip(2,5:8),'b',handles.EnemyShip(3,1:4),handles.EnemyShip(3,5:8),'b',handles.EnemyShip(4,1:4),handles.EnemyShip(4,5:8),'b',handles.EnemyShip(5,1:4),handles.EnemyShip(5,5:8),'b',handles.EnemyShip(6,1:4),handles.EnemyShip(6,5:8),'b',handles.EnemyShip(7,1:4),handles.EnemyShip(7,5:8),'b',handles.EnemyShip(8,1:4),handles.EnemyShip(8,5:8),'b',handles.EnemyShip(9,1:4),handles.EnemyShip(9,5:8),'r',handles.EnemyShip(10,1:4),handles.EnemyShip(10,5:8),'r',handles.EnemyShip(11,1:4),handles.EnemyShip(11,5:8),'r',handles.EnemyShip(12,1:4),handles.EnemyShip(12,5:8),'r',handles.EnemyShip(13,1:4),handles.EnemyShip(13,5:8),'r',handles.EnemyShip(14,1:4),handles.EnemyShip(14,5:8),'r',handles.EnemyShip(15,1:4),handles.EnemyShip(15,5:8),'r',handles.EnemyShip(16,1:4),handles.EnemyShip(16,5:8),'y',handles.EnemyShip(17,1:4),handles.EnemyShip(17,5:8),'y',handles.EnemyShip(18,1:4),handles.EnemyShip(18,5:8),'y',handles.EnemyShip(19,1:4),handles.EnemyShip(19,5:8),'y',handles.EnemyShip(20,1:4),handles.EnemyShip(20,5:8),'y',handles.EnemyShip(21,1:4),handles.EnemyShip(21,5:8),'y');
axis([0,1000,0,1000]);

%%
fid = fopen('shipMultiLayer.txt','a');
for z=1:30
fprintf(fid,'fill(handles.EnemyShips(1,1:4,%d),handles.EnemyShips(1,5:8,%d),''b''',z,z);    
for i =2:21
    if i<=8
        color = '''b''';
    elseif i > 8 && i<=15
        color = '''r''';
    else
        color = '''y''';
    end
    fprintf(fid,',handles.EnemyShips(%d,1:4,%d),handles.EnemyShips(%d,5:8,%d),%s',i,z,i,z,color);
end
fprintf(fid,');\n');
end
fclose(fid);
        
%%
fill([0,100,100,0],[50,50,100,100],'b');
hold on;
fill([30,70,70,30],[0,0,50,50],'b');
fill([0,10,10,0],[30,30,50,50],'r');
fill([90,100,100,90],[30,30,50,50],'r');
axis([0,1000,0,1000]);
%% New EnemyShip matrix
EnemyShip=[[0,100,100,0],[50,50,100,100];...
    [30,70,70,30],[0,0,50,50];...   % End blue
    [0,10,10,0],[30,30,50,50];...
    [90,100,100,90],[30,30,50,50]]; % End red
%% create fill with parameters
fid=fopen('NewEnemyShip.txt','a');
fprintf(fid,'fill(handles.EnemyShip(1,1:4),handles.EnemyShip(1,5:8),''b''');

for i =2:4
    if i<=2
        color = '''b''';
    else
        color = '''r''';
    end
    fprintf(fid,',handles.EnemyShip(%d,1:4),handles.EnemyShip(%d,5:8),%s',i,i,color);
end
fprintf(fid,');\n');
fclose(fid);
%% Ouput file
fill(handles.EnemyShip(1,1:4),handles.EnemyShip(1,5:8),'b',handles.EnemyShip(2,1:4),handles.EnemyShip(2,5:8),'b',handles.EnemyShip(3,1:4),handles.EnemyShip(3,5:8),'r',handles.EnemyShip(4,1:4),handles.EnemyShip(4,5:8),'r');

%%
fid = fopen('NewshipMultiLayer.txt','a');
fprintf(fid,'fill(handles.EnemyShips(1,1:4,i),handles.EnemyShips(1,5:8,i),''b''');    
for i =2:4
    if i<=2
        color = '''b''';
    else
        color = '''r''';
    end
    fprintf(fid,',handles.EnemyShips(%d,1:4,i),handles.EnemyShips(%d,5:8,i),%s',i,i,color);
end
fprintf(fid,');\n');
fclose(fid);