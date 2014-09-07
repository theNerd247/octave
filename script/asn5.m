# config
# arm lengths
l = [3,3,3];

# number of points inbetween target points for animation. This includes the
# starting point and excludes the ending point
n = 5;

tpnts = 0;

# how fast to runtime of the animation (in seconds)
runt = 1;

# elbow config 0: aconfig, 1: bconfig
elbow = 0;

#axis size
xl = -10;
xh = 10;
yl = -10;
yh = 10;

fps = runt/(2*n);

#create axis 
clf();
axis([xl,xh,yl,yh],'equal');

# joints as red dots (one per arm)
jnts = [];
m = min(l)/10; # make joint sizes 1/10 the smallest arm size
mo = m/2;
for j = l
	jnts = [jnts, rectangle('Position',[-mo,-mo,m,m],'Curvature',1,'facecolor','red')];
endfor

# robotic arm as blue line
lnp = line('xdata',0,'ydata',0,'color','green');

# endeffector movement path as green line
ln = line('xdata',0,'ydata',0,'color','blue');
xmoved = [];
ymoved = []; 
errnum = 0;

POS = [0;0;0];
PS=[];
while (1)
	# get userinput
	[x,y,btn] = ginput(1);
	if(btn == 1)
		gamma = getGamma([POS,[x,y]);
		P=[x;y;gamma];
		PS = getPS([POS,P],n);
		POS=P;
	else 
		close();
		return;
	endif
	for p = PS
		#generate arm joint points based on path point
		A = rkin3(p,l);
	
		#check for bad position if so print a node and it's ref number
		if(any(isnan(A)))
			errnum++;
			printf("Impossible arm position...skipping: %i: (%.4f,%.4f,%.4f)\n",errnum,p(1),p(2),p(3));
			text(p(1),p(2),num2str(errnum,"%i"));
			rectangle('Position',[p(1)-mo,p(2)-mo,m,m],'Curvature',1,'facecolor','yellow');
			continue;
		endif
	
		# swap rows 2and3 of A to use b elbow config
		if (elbow)
			A = [A(1,:); A(3,:); A(2,:)];
		endif
	
		A = ptoc(A);
	
		#plot the arms
		set(ln,'xdata',[0, A(1,:)],'ydata',[0, A(2,:)]);
	
		#plot the joints (the first joint never moves)
		for j = 2:columns(jnts)
			set(jnts(j),'Position',[A(1,j-1)-mo,A(2,j-1)-mo,m,m]);
		endfor
		
		#plot the path moved
		xmoved = [xmoved, p(1)];
		ymoved = [ymoved, p(2)];
		set(lnp,'xdata',xmoved,'ydata',ymoved);
		if (tpnts == 1)
			rectangle('Position',[p(1)-mo,p(2)-mo,m,m],'Curvature',.5,'facecolor','green');
		endif
	
		sleep(fps);
	endfor
endwhile
