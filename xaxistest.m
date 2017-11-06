% Tests if the Y-Axis of the joystick is functioning properly 
%Visualizes voltage change through real-time graph
%Connect VCC to 5V and xaxis to Analog In, pin A1
%press CTRL+c in the command window to terminate the program early

clear;
close all;

a=arduino();    %Initiate Arduino
time=1000;  %Set Running Time
x=[];  %Create array to store x values
y=[];  %Create array to store y values
count=0;    %Keep count of x

hold on;    %Update graph on same window
while time>0    %begin loop
    time=time-1;    %Decrease Timer
    count=count+1;  %Increase count as loop continues
    value=readVoltage(a,'A1')   %Read Voltage of up and down inputs
    x=[x,count];    %Update x values
    y=[y,value];    %Update y values
    
    plot(x,y)   %Plot the values
    xlim([count-5,count+5]);    %Move screen as time moves on
    ylim([0,5]);    %Set limit to voltage range [0,5]
    pause(0.1);     %Set some delay
    
end
