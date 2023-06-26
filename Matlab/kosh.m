function [vnew,Mnew]=kosh(v,M)

vnew=zeros(length(v)+2*size(M,1),2);
Mnew=zeros(3*size(M,1),2);

s=length(v);
vnew(1:length(v),:)=v;
t=0;


for i=1:size(M,1)
   a=v(M(i,1),:);
   b=v(M(i,2),:);
   c=(2*a+b)/3;
   d=(b-a)/3;
   e=(a+2*b)/3;
   dn=d/norm(d);
   vnew(s+1,:)=c;
   vnew(s+2,:)=e;
   vnew(s+3,:)=(a+b)/2+sqrt(3)/2*norm(d)*dn*[cos(-pi/2),-sin(-pi/2);sin(-pi/2),cos(-pi/2)];
   
    Mnew(t+1,:)=[M(i,1),s+1];
    Mnew(t+2,:)=[s+1,s+3];
    Mnew(t+3,:)=[s+3,s+2];
    Mnew(t+4,:)=[s+2,M(i,2)];
  
   s=s+3;
   t=t+4;
end