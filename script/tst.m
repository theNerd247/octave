axis([0,10,0,10]);

h = line('xdata',[0,2,2],'ydata',[0,2,3]);
sleep(2);
set(h,'xdata',[0,2,3],'ydata',[0,2,2]);

[x,y,b] = ginput(1)
