v=[0,0;1,0];
M=[1,2];
%n0=max(max(M));
n=2;
for i=1:n
[v,M]=kosh(v,M);
end

[A,b]=fNmatrix(M,v);

A=3*(16/9)^n*A;
nv=length(v);
free=3:nv;
xd=0*b; % vector de zeros del mismo tamano de b
xd(1)=1;
xd(2)=0;


bnew=b-A*xd;

xaux=A(free,free)\bnew(free);
xsol=xd;
xsol(free)=xaux;


my_clim = [min(xsol), max(xsol)];
colormap(jet(1024)), caxis(my_clim);
Map=colormap;


subplot(1,2,1)
for e=1:length(M)
   icolor=floor(1024*(xsol(M(e,1))-min(xsol))/(max(xsol)-min(xsol)));
   plot3(v(M(e,:),1),v(M(e,:),2),xsol(M(e,:)), 'LineWidth',1,'Color', Map(icolor,:))
%    plot3(v(M(e,:),1),v(M(e,:),2),xsol(M(e,:)), "g")
   colorbar;
   hold on
end
 grid on
 view(34,31)