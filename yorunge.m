
function yor = yorunge(t);
global q1i q1f q2i q2f q3i q3f tf;

% % % %  Birinci eklem 
a10 =q1i;
a11=0;
a12=(3/(tf^2))*(q1f - q1i);
a13=(-2/tf^3)*(q1f-q1i);
konum1 = a10 + (a11 *t)+(a12 *(t^2))+(a13 *(t^3));
hiz1 = a11 + (2*(a12)*t) +(3*(a13)*(t^2));
ivme1 = (2*a12)+(6*(a13)*t);

% % % %  ikinci eklem 

a20=q2i;
a21=0;
a22=(3/tf^2)*(q2f-q2i);
a23=(-2/tf^3)*(q2f-q2i);
konum2 = (a20) +((a21)*t) + ((a22)*(t^2)) + ((a23)*(t^3));
hiz2 = (a21) + (2*(a22)*t) + (3*(a23)*(t^2));
ivme2= (2*(a22))+(6*(a23)*(t));

% % % %  ucuncu eklem 

a30=q3i;
a31=0;
a32=(3/tf^2)*(q3f-q3i);
a33=(-2/tf^3)*(q3f-q3i);
konum3= a30 +((a31)*t)+((a32)*(t^2))+((a33)*(t^3));
hiz3 =a31 +(2*(a32)*(t))+(3*(a33)*(t^2));
ivme3 =(2*(a32))+(6*(a33)*t);

yor=[konum1;hiz1;ivme1;konum2;hiz2;ivme2;konum3;hiz3;ivme3];

end

















