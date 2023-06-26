function L=flocalbprueba(T,v)

    x=zeros(2,1);
    y=zeros(2,1);
    
    for j=1:2
        x(j)=v(T(j),1);
        y(j)=v(T(j),2);
    end

    dis=sqrt((x(1)-x(2))^2+ (y(1)-y(2))^2 );

    dx=x(2)-x(1); dy=y(2)-y(1);


    omegaa=[5/9,8/9,5/9];
    paux=[-sqrt(15)/5,0,sqrt(15)/5];
    L=zeros(2,1);

    omega=1/2*dis*omegaa;
    tqx=x(1)+0.5*(1+paux)*dx;
    tqy=y(1)+0.5*(1+paux)*dy;

    f1=f(tqx,tqy);

    for i=1:3
        b1(i)=sqrt((x(2)-tqx(i))^2+(y(2)-tqy(i))^2)/dis;
        b2(i)=sqrt((x(1)-tqx(i))^2+(y(1)-tqy(i))^2)/dis;
    end

    b=[b1;b2];

    for i=1:2
        L(i)=sum( omega.*f1.*(b(i,:)));
    end
   
end