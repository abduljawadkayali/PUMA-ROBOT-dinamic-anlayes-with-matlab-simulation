clear all;
clc ;

% seymbolik tanitimlar
syms alfa0 alfa1 alfa2 a0 a1 a2 d1 d2 d3 theta1 theta2 theta3 hiz1 hiz2 hiz3 ivme1 ivme2 ivme3 ;
syms l1 l2 l3 Ixx1 Iyy1 Izz1 Ixx2 Iyy2 Izz2 Ixx3 Iyy3 Izz3 m1 m2 m3 g;

% D-H tablosu tanitim = donusum VE donme matrislerin cikartilmasi

alfa0 = 90 ; a0 =0 ; d1 = l1;   
alfa1 = 0 ; a1 = l2;  d2 =0; 
alfa2 =0;  a2 =l3; d3=0;
                         
T10 = [cos(theta1) -sin(theta1) 0 a0;
    (sin(theta1))*(0) (cos(theta1))*(0) -1 -(1)*d1; 
    (sin(theta1))*(1) (cos(theta1))*(1) 0 0*d1; 
    0 0 0 1];
R10 = [T10(1,1:end-1);T10(2,1:end-1);T10(3,1:end-1)];
R10T = R10.' ;

T21 = [cos(theta2) -sin(theta2) 0 a1;
    (sin(theta2))*(cos(alfa1)) (cos(theta2))*(cos(alfa1)) -sin(alfa1) -(sin(alfa1))*d2; 
    (sin(theta2))*(sin(alfa1)) (cos(theta2))*(sin(alfa1)) cos(alfa1) (cos(alfa1))*d2; 
    0 0 0 1];
R21 = [T21(1,1:end-1);T21(2,1:end-1);T21(3,1:end-1)];
R21T = R21.' ;

T32 = [cos(theta3) -sin(theta3) 0 a2;
    (sin(theta3))*(cos(alfa2)) (cos(theta3))*(cos(alfa2)) -sin(alfa2) -(sin(alfa2))*d3; 
    (sin(theta3))*(sin(alfa2)) (cos(theta3))*(sin(alfa2)) cos(alfa2) (cos(alfa2))*d3; 
    0 0 0 1];
R32 = [T32(1,1:end-1);T32(2,1:end-1);T32(3,1:end-1)];
R32T =R32.' ;

T20 = T10 * T21;
T30 = T20 * T32;
R20 = R10 * R21;
R20T = R20.' ;
R30 = R20 * R32;
R30T = R30.' ;




% atalet tensorunun matrisleri olusturma islemi :
Im1 =[Ixx1 0 0;0 Iyy1 0;0 0 Izz1];
Im2 =[Ixx2 0 0;0 Iyy2 0;0 0 Izz2];
Im3 =[Ixx3 0 0;0 Iyy3 0;0 0 Izz3];


% Kutle merkezinin konumu 
deltah1 = [0; 0; (l1)/2; 1];
deltah2 = [(l2)/2; 0; 0; 1];
deltah3 = [(l3)/2; 0; 0; 1];

% Ana koordinat sisteme gore atalet sensoru
I1 = (R10)*(Im1)*(R10T);
I2 = (R20)*(Im2)*(R20T);
I3 = (R30)*(Im3)*(R30T);

% Ana koordinat sisteme gore atalet bagin kutle merkezi

h1 = (T10) * (deltah1);
h2 = (T20) * (deltah2) ;
h3 = (T30) * (deltah3);

% Z'lerin hesaplanmasi 
i = [0; 0; 1];
z1 = (R10) * i;
z2 = (R20) * i;
z3 = (R30) * i;

% RRR Icin robot epsilon deðer hep 1 kalacak
E =1;
% b'lerin degerleri
b1 = (E) * z1 ;
b2 = (E) * z2 ;
b3 = (E) * z3 ;

% jakobian matrisleri

A1 = jacobian([h1(1); h1(2); h1(3)], [theta1 theta2 theta3]);
B1 = [b1(1) 0 0;b1(2) 0 0 ; b1(3) 0 0];
A1T = A1.' ;


B1T = B1.' ;

A2 = jacobian([h2(1); h2(2); h2(3)], [theta1 theta2 theta3]);
B2 = [b1(1) b2(1) 0;b1(2) b2(2) 0; b1(3) b2(3) 0];
A2T = A2.' ;
B2T = B2.' ;

A3 = jacobian([h3(1), h3(2), h3(3)], [theta1,theta2,theta3]);
B3 = [b1(1) b2(1) b3(1);b1(2) b2(2) b3(2); b1(3) b2(3) b3(3)];
A3T = A3.' ;
B3T = B3.' ;

%eklemler icin kutle matrisleri 
D1 = ((m1)*(A1T)*(A1)) + ((B1T)*(I1)*(B1));
D2 = ((m2)*(A2T)*(A2)) + ((B2T)*(I2)*(B2));
D3 = ((m3)*(A3T)*(A3)) + ((B3T)*(I3)*(B3));

% Kutle matrisi
D = D1 + D2 + D3 ;


% Eklemler'e ait  hiz baglasim matrisleri 

% birinci eklem icin 
c111 = (1/2)*(diff((D(1,1)),theta1));
c112 = (1/2)*(diff((D(1,2)),theta1));
c113 = (1/2)*(diff((D(1,3)),theta1));
c121 = (diff((D(1,1)),theta2))-((1/2)*(diff((D(2,1)),theta1)));
c122 = (diff((D(1,2)),theta2))-((1/2)*(diff((D(2,2)),theta1)));
c123 = (diff((D(1,3)),theta2))-((1/2)*(diff((D(2,3)),theta1)));
c131 = (diff((D(1,1)),theta3))-((1/2)*(diff((D(3,1)),theta1)));
c132 = (diff((D(1,2)),theta3))-((1/2)*(diff((D(3,2)),theta1)));
c133 = (diff((D(1,3)),theta3))-((1/2)*(diff((D(3,3)),theta1)));
c1 = [c111 c112 c113;c121 c122 c123;c131 c132 c133];

% ikinci eklem icin 
c211 = (diff((D(2,1)),theta1))-((1/2)*(diff((D(1,1)),theta2)));
c212 = (diff((D(2,2)),theta1))-((1/2)*(diff((D(1,2)),theta2)));
c213 = (diff((D(2,3)),theta1))-((1/2)*(diff((D(1,3)),theta2)));
c221 = ((1/2)*(diff((D(2,1)),theta2)));
c222 = ((1/2)*(diff((D(2,2)),theta2)));
c223 = ((1/2)*(diff((D(2,3)),theta2)));
c231 = (diff((D(2,1)),theta3))-((1/2)*(diff((D(3,1)),theta2)));
c232 = (diff((D(2,2)),theta3))-((1/2)*(diff((D(3,2)),theta2)));
c233 = (diff((D(2,3)),theta3))-((1/2)*(diff((D(3,3)),theta2)));
c2 = [c211 c212 c213;c221 c222 c223;c231 c232 c233];

%  ucuncu eklem icin 
c311 = (diff((D(3,1)),theta1))-((1/2)*(diff((D(1,1)),theta3)));
c312 = (diff((D(3,2)),theta1))-((1/2)*(diff((D(1,2)),theta3)));
c313 = (diff((D(3,3)),theta1))-((1/2)*(diff((D(1,3)),theta3)));
c321 = (diff((D(3,1)),theta2))-((1/2)*(diff((D(2,1)),theta3)));
c322 = (diff((D(3,2)),theta2))-((1/2)*(diff((D(2,2)),theta3)));
c323 = (diff((D(3,3)),theta2))-((1/2)*(diff((D(2,3.)),theta3)));
c331 = ((1/2)*(diff((D(3,1)),theta3)));
c332 = ((1/2)*(diff((D(3,2)),theta3)));
c333 = ((1/2)*(diff((D(3,3)),theta3)));
c3 = [c311 c312 c313;c321 c322 c323;c331 c332 c333];

% Coriolos ve merkezkac kuvvet vektorleri
% hkm : Hiz Karsilastirma Matrisi 

hkm =[((hiz1)*(hiz1)) ((hiz1)*(hiz2)) ((hiz1)*(hiz3)) ;
    ((hiz2)*(hiz1)) ((hiz2)*(hiz2)) ((hiz2)*(hiz3)) ;
    ((hiz3)*(hiz1)) ((hiz3)*(hiz2)) ((hiz3)*(hiz3))];
CM1 =[((hkm(1,1))*c111)+((hkm(1,2))*c112)+((hkm(1,3))*c113)+((hkm(2,1))*c121)+((hkm(2,2))*c122)+((hkm(2,3))*c123)+((hkm(3,1))*c131)+((hkm(3,2))*c132)+((hkm(3,3))*c133)];

CM2 =[((hkm(1,1))*c211)+((hkm(1,2))*c212)+((hkm(1,3))*c213)+((hkm(2,1))*c221)+((hkm(2,2))*c222)+((hkm(2,3))*c223)+((hkm(3,1))*c231)+((hkm(3,2))*c232)+((hkm(3,3))*c233)];

CM3 =[((hkm(1,1))*c311)+((hkm(1,2))*c312)+((hkm(1,3))*c313)+((hkm(2,1))*c321)+((hkm(2,2))*c322)+((hkm(2,3))*c323)+((hkm(3,1))*c331)+((hkm(3,2))*c332)+((hkm(3,3))*c333)];

% % Coriolos ve merkezkac kuvvet vektoru
Cq = [CM1; CM2; CM3];


% 
% % yercekim vektoru
Z1 = (g)*( ((m1)*(A1(3,1)) ) + ( (m2)*(A2(3,1)) ) + ((m3)*(A3(3,1))) );
Z2 = g*( ((m2)*(A2(3,2)) ) + ( (m3)*(A3(3,2)) )  );
Z3 = g*( (m3)*(A3(3,3)));
Z = [Z1; Z2; Z3];






