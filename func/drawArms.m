function drawArms(PS) 
	global l;
	global errnum;
	global elbow;
	global ln;
	global lnp;
	global jnts;
	global m;
	global mo;
	global xmoved;
	global ymoved;
	global fps;
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
	rectangle('Position',[p(1)-mo,p(2)-mo,m,m],'Curvature',.5,'facecolor','green');

	sleep(fps);
endfor
endfunction

