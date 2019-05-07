clear all;
clc;

out = sim('nsdynamic');

figure('Name','TORK 3','NumberTitle','off');
plot(TORK3);
title('Üçünçü Eklemin Torku');
xlabel('Zaman'); 
ylabel('tork');

figure('Name','TORK 2','NumberTitle','off');
plot(TORK2)
title('Ýkinci Eklemin Torku');
xlabel('Zaman'); 
ylabel('tork');

figure('Name','TORK 1','NumberTitle','off');
plot(TORK1)
title('Birinci Eklemin Torku');
xlabel('Zaman'); 
ylabel('tork');

figure('Name','G3','NumberTitle','off');
plot(G3)
title('Üçünçü Eklemin Yer çekim vektörü');
xlabel('Zaman'); 
ylabel('G3');

figure('Name','G2','NumberTitle','off');
plot(G2)
title('Ýkinci Eklemin Yer çekim vektörü');
xlabel('Zaman'); 
ylabel('G2');

figure('Name','G1','NumberTitle','off');
plot(G1)
title('Birinci Eklemin Yer çekim vektörü');
xlabel('Zaman'); 
ylabel('G1');

figure('Name','C3','NumberTitle','off');
plot(C3)
title('Üçünçü Eklemin Coriolis ve Merkezkaç kuvvet');
xlabel('Zaman'); 
ylabel('C3');

figure('Name','C2','NumberTitle','off');
plot(C2)
title('Ýkinci Eklemin Coriolis ve Merkezkaç kuvvet');
xlabel('Zaman'); 
ylabel('C2');

figure('Name','C1','NumberTitle','off');
plot(C1)
title('Birinci Eklemin Coriolis ve Merkezkaç kuvvet');
xlabel('Zaman'); 
ylabel('C1');

figure('Name','M33','NumberTitle','off');
plot(M33)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M33');

figure('Name','M32','NumberTitle','off');
plot(M32)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M32');

figure('Name','M31','NumberTitle','off');
plot(M31)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M31');

figure('Name','M23','NumberTitle','off');
plot(M23)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M23');

figure('Name','M22','NumberTitle','off');
plot(M22)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M22');

figure('Name','M21','NumberTitle','off');
plot(M21)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M21');

figure('Name','M13','NumberTitle','off');
plot(M13)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M13');

figure('Name','M12','NumberTitle','off');
plot(M12)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M12');

figure('Name','M11','NumberTitle','off');
plot(M11)
title('Kütle Matrisinin elemanlarý ');
xlabel('Zaman'); 
ylabel('M11');


figure('Name','ddq3','NumberTitle','off');
plot(ddq3);
title('Üçünçü Eklemin ivmesi');
xlabel('Zaman'); 
ylabel('ddq3');

figure('Name','ddq2','NumberTitle','off');
plot(ddq2)
title('Ýkinci Eklemin ivmesi');
xlabel('Zaman'); 
ylabel('ddq2');

figure('Name','ddq1','NumberTitle','off');
plot(ddq1)
title('Birinci Eklemin ivmesi');
xlabel('Zaman'); 
ylabel('ddq1');

figure('Name','dq3','NumberTitle','off');
plot(dq3)
title('Üçünçü Eklemin Hýzý');
xlabel('Zaman'); 
ylabel('dq3');

figure('Name','dq2','NumberTitle','off');
plot(dq2)
title('Ýkinci Eklemin Hýzý');
xlabel('Zaman'); 
ylabel('dq2');

figure('Name','dq1','NumberTitle','off');
plot(dq1)
title('Birinci Eklemin Hýzý');
xlabel('Zaman'); 
ylabel('dq1');

figure('Name','q3','NumberTitle','off');
plot(q3)
title('Üçünçü Eklemin Konumu');
xlabel('Zaman'); 
ylabel('q3');

figure('Name','q2','NumberTitle','off');
plot(q2)
title('Ýkinci Eklemin Konumu');
xlabel('Zaman'); 
ylabel('q2');

figure('Name','q1','NumberTitle','off');
plot(q1)
title('Birinci Eklemin Konumu');
xlabel('Zaman'); 
ylabel('q1');



















