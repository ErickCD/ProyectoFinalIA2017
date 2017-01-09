% Autor: Erick Clair
% Fecha: 06/01/2017

%-------------------------------------------
%Inicio de los hechos
%-------------------------------------------

esrespuesta('siempre').
esrespuesta('generalmente').
esrespuesta('nunca').
esrespuesta('si').
esrespuesta('no').

%P1
espregunta('¿Permance en su puesto?', X):-esrespuesta(X).
espregunta('¿Se levanta y distrae a las personas?', X):-esrespuesta(X).
%P2
espregunta('¿Golpea con el lápiz?', X):-esrespuesta(X).
espregunta('¿Mueve la cabeza y/o piernas?', X):-esrespuesta(X).
espregunta('¿Realiza otros movimientos?', X):-esrespuesta(X).
%P3
espregunta('¿Le cuesta reiniciarlo?', X):-esrespuesta(X).
%P4
espregunta('¿Se demora en comenzar la actividad?', X):-esrespuesta(X).
%P5
espregunta('¿Se levanta de su puesto en forma constante?', X):-esrespuesta(X).
%P6
espregunta('¿Castellano?', X):-esrespuesta(X).
espregunta('¿Matemáticas?', X):-esrespuesta(X).
espregunta('¿Ciencias?', X):-esrespuesta(X).
espregunta('¿Arte/música?', X):-esrespuesta(X).
espregunta('¿Educación física?', X):-esrespuesta(X).
%P8
espregunta('¿Son siempre relacionada con lo tratado?', X):-esrespuesta(X).
%P9
espregunta('¿Solicita que le repitan las instrucciones?', X):-esrespuesta(X).
%P10
espregunta('¿Parece no comprender las instrucciones dadas?', X):-esrespuesta(X).

%-------------------------------------------
%Fin de los hechos
%-------------------------------------------


%-------------------------------------------
%Inicio de programa
%-------------------------------------------
iaInicio:- ini_contadores, new(Dialog, dialog('Proyecto final')),
   send(Dialog, size, size(400, 400)),
   send(Dialog, append, new(Menu, menu_bar)),
   send(Menu, append, new(Iniciar, popup(iniciar))),
   send(Menu, append, new(Ayuda, popup(ayuda))),
   send_list(Iniciar, append, [menu_item(iniciar, message(@prolog, p1)), menu_item(file, message(@prolog, fil))]),
   send_list(Ayuda, append, [menu_item(ayuda, message(@prolog, ayud))]),
   
   send(Dialog, open).



%Pregunta 1
p1:-new(Dialog, dialog('Al terminar una tarea o actividad.')),
       new(P1,menu('¿Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('¿Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,aR1,P1?selection), message(@prolog,aR2,P2?selection), message(@prolog, p2),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      

%-------------------------------------------
%Análisis Pregunta1
%-------------------------------------------
aR1(R1):- espregunta('¿Permance en su puesto?', R1),R1 = 'siempre', buena.
aR1(R1):- espregunta('¿Permance en su puesto?', R1),R1 = 'generalmente', oscilante.
aR1(R1):- espregunta('¿Permance en su puesto?', R1),R1 = 'nunca', baja.

aR2(R1):- espregunta('¿Se levanta y distrae a las personas?', R1),R1 = 'siempre', baja.
aR2(R1):- espregunta('¿Se levanta y distrae a las personas?', R1),R1 = 'generalmente', oscilante.
aR2(R1):- espregunta('¿Se levanta y distrae a las personas?', R1),R1 = 'nunca', buena.
%-------------------------------------------
      
      
      
%Pregunta 2
p2:-new(Dialog, dialog('Durante la realización de la tarea.')),
       new(P1,menu('¿Golpea con el lápiz?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
       new(P2,menu('¿Mueve la cabeza y/o piernas?')),
       send_list(P2,append,[siempre , generalmente, nunca]),
       new(P3,menu('¿Realiza otros movimientos?')),
       send_list(P3,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),
       send(Dialog,append,P3),

      new(B,button(siguiente,and(message(@prolog,bR1,P1?selection), message(@prolog,bR2,P2?selection), message(@prolog,bR3,P3?selection), message(@prolog, p3),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta2
%-------------------------------------------
bR1(R1):- espregunta('¿Golpea con el lápiz?', R1),R1 = 'siempre', baja.
bR1(R1):- espregunta('¿Golpea con el lápiz?', R1),R1 = 'generalmente', oscilante.
bR1(R1):- espregunta('¿Golpea con el lápiz?', R1),R1 = 'nunca', buena.

bR2(R1):- espregunta('¿Mueve la cabeza y/o piernas?', R1),R1 = 'siempre', baja.
bR2(R1):- espregunta('¿Mueve la cabeza y/o piernas?', R1),R1 = 'generalmente', oscilante.
bR2(R1):- espregunta('¿Mueve la cabeza y/o piernas?', R1),R1 = 'nunca', buena.

bR3(R1):- espregunta('¿Realiza otros movimientos?', R1),R1 = 'siempre', baja.
bR3(R1):- espregunta('¿Realiza otros movimientos?', R1),R1 = 'generalmente', oscilante.
bR3(R1):- espregunta('¿Realiza otros movimientos?', R1),R1 = 'nunca', buena.
%-------------------------------------------


      
%Pregunta 3
p3:-new(Dialog, dialog('Si es interrumpido en su trabajo.')),
       new(P1,menu('¿Le cuesta reiniciarlo?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,cR1,P1?selection), message(@prolog, p4),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
      
%------------------------------------------
%Análisis Pregunta3
%-------------------------------------------
cR1(R1):- espregunta('¿Le cuesta reiniciarlo?', R1),R1 = 'siempre', baja.
cR1(R1):- espregunta('¿Le cuesta reiniciarlo?', R1),R1 = 'generalmente', scilante.
cR1(R1):- espregunta('¿Le cuesta reiniciarlo?', R1),R1 = 'nunca', buena.
%-------------------------------------------
      
      
      
%Pregunta 4
p4:-new(Dialog, dialog('Al regreso del recreo')),
       new(P1,menu('¿Se demora en comenzar la actividad?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,dR1,P1?selection), message(@prolog,p5),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta4
%-------------------------------------------
dR1(R1):- espregunta('¿Se demora en comenzar la actividad?', R1),R1 = 'siempre', baja.
dR1(R1):- espregunta('¿Se demora en comenzar la actividad?', R1),R1 = 'generalmente', oscilante.
dR1(R1):- espregunta('¿Se demora en comenzar la actividad?', R1),R1 = 'nunca', buena.
%-------------------------------------------


      
%Pregunta 5
p5:-new(Dialog, dialog('Pregunta')),
       new(P1,menu('¿Se levanta de su puesto en forma constante?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,eR1,P1?selection), message(@prolog, p6),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta5
%-------------------------------------------
eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'siempre', baja.
eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'generalmente', oscilante.
eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'nunca', buena.

%-------------------------------------------



%Pregunta 6
p6:-new(Dialog, dialog('Participa activamente en las clases de:')),
       new(P1,menu('Castellano')),
       send_list(P1,append,[si , no]),
       new(P2,menu('Matemáticas')),
       send_list(P2,append,[si , no]),
       new(P3,menu('Ciencias')),
       send_list(P3,append,[si , no]),
       new(P4,menu('Arte/música')),
       send_list(P4,append,[si , no]),
       new(P5,menu('Educación física')),
       send_list(P5,append,[si , no]),

       send(Dialog,append(P1)),
       send(Dialog,append(P2)),
       send(Dialog,append(P3)),
       send(Dialog,append(P4)),
       send(Dialog,append(P5)),

      new(B,button(siguiente,and(message(@prolog,fR1,P1?selection),message(@prolog,fR2,P2?selection),message(@prolog,fR3,P3?selection),message(@prolog,fR4,P4?selection),message(@prolog,fR5,P5?selection), message(@prolog, p7),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta6
%-------------------------------------------
fR1(R1):- espregunta('¿Castellano?', R1),R1 = 'si', catellano.
fR2(R1):- espregunta('¿Matemáticas?', R1),R1 = 'si', matematicas.
fR3(R1):- espregunta('¿Ciencias?', R1),R1 = 'si', ciencias.
fR4(R1):- espregunta('¿Arte/música?', R1),R1 = 'si', arte.
fR5(R1):- espregunta('¿Educación física?', R1),R1 = 'si', fisica.
%-------------------------------------------



%Pregunta 8
p8:-new(Dialog, dialog('Sus preguntas o participaciones en clases')),
       new(P1,menu('¿Son siempre relacionada con lo tratado?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,gR1,P1?selection), message(@prolog, p9),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta5
%-------------------------------------------
gR1(R1):- espregunta('¿Son siempre relacionada con lo tratado?', R1),R1 = 'siempre', buena.
gR1(R1):- espregunta('¿Son siempre relacionada con lo tratado?', R1),R1 = 'generalmente', oscilante.
gR1(R1):- espregunta('¿Son siempre relacionada con lo tratado?', R1),R1 = 'nunca', baja.

%-------------------------------------------



%Pregunta 9
p9:-new(Dialog, dialog('Constantemente')),
       new(P1,menu('¿Solicita que le repitan las instrucciones?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,hR1,P1?selection), message(@prolog, p10),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta9
%-------------------------------------------
hR1(R1):- espregunta('¿Solicita que le repitan las instrucciones?', R1),R1 = 'siempre', baja.
hR1(R1):- espregunta('¿Solicita que le repitan las instrucciones?', R1),R1 = 'generalmente', oscilante.
hR1(R1):- espregunta('¿Solicita que le repitan las instrucciones?', R1),R1 = 'nunca', buena.

%-------------------------------------------



%Pregunta 10
p10:-new(Dialog, dialog('Pregunta')),
       new(P1,menu('¿Parece no comprender las instrucciones dadas?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,iR1,P1?selection), message(@prolog, p11),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%-------------------------------------------
%Análisis Pregunta10
%-------------------------------------------
iR1(R1):- espregunta('¿Parece no comprender las instrucciones dadas?', R1),R1 = 'siempre', baja.
iR1(R1):- espregunta('¿Parece no comprender las instrucciones dadas?', R1),R1 = 'generalmente', oscilante.
iR1(R1):- espregunta('¿Parece no comprender las instrucciones dadas?', R1),R1 = 'nunca', buena.

%-------------------------------------------



% %Pregunta 5
% p5:-new(Dialog, dialog('Pregunta')),
%        new(P1,menu('¿Se levanta de su puesto en forma constante?')),
%        send_list(P1,append,[siempre , generalmente, nunca]),
% 
%        send(Dialog,append(P1)),
% 
%       new(B,button(siguiente,and(message(@prolog,eR1,P1?selection), message(@prolog, p6),message(Dialog,destroy)))),
%       send(Dialog,append,B),
%       send(Dialog,default_button,siguiente),
%       send(Dialog,open).
% 
% 
% %------------------------------------------
% %Análisis Pregunta5
% %-------------------------------------------
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'siempre', baja.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'generalmente', oscilante.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'nunca', buena.
% 
% %-------------------------------------------
% 
% 
% 
% %Pregunta 5
% p5:-new(Dialog, dialog('Pregunta')),
%        new(P1,menu('¿Se levanta de su puesto en forma constante?')),
%        send_list(P1,append,[siempre , generalmente, nunca]),
% 
%        send(Dialog,append(P1)),
% 
%       new(B,button(siguiente,and(message(@prolog,eR1,P1?selection), message(@prolog, p6),message(Dialog,destroy)))),
%       send(Dialog,append,B),
%       send(Dialog,default_button,siguiente),
%       send(Dialog,open).
% 
% 
% %------------------------------------------
% %Análisis Pregunta5
% %-------------------------------------------
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'siempre', baja.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'generalmente', oscilante.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'nunca', buena.
% 
% %-------------------------------------------
% 
% 
% 
% %Pregunta 5
% p5:-new(Dialog, dialog('Pregunta')),
%        new(P1,menu('¿Se levanta de su puesto en forma constante?')),
%        send_list(P1,append,[siempre , generalmente, nunca]),
% 
%        send(Dialog,append(P1)),
% 
%       new(B,button(siguiente,and(message(@prolog,eR1,P1?selection), message(@prolog, p6),message(Dialog,destroy)))),
%       send(Dialog,append,B),
%       send(Dialog,default_button,siguiente),
%       send(Dialog,open).
% 
% 
% %------------------------------------------
% %Análisis Pregunta5
% %-------------------------------------------
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'siempre', baja.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'generalmente', oscilante.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'nunca', buena.
% 
% %-------------------------------------------
% 
% 
% 
% %Pregunta 5
% p5:-new(Dialog, dialog('Pregunta')),
%        new(P1,menu('¿Se levanta de su puesto en forma constante?')),
%        send_list(P1,append,[siempre , generalmente, nunca]),
% 
%        send(Dialog,append(P1)),
% 
%       new(B,button(siguiente,and(message(@prolog,eR1,P1?selection), message(@prolog, p6),message(Dialog,destroy)))),
%       send(Dialog,append,B),
%       send(Dialog,default_button,siguiente),
%       send(Dialog,open).
% 
% 
% %------------------------------------------
% %Análisis Pregunta5
% %-------------------------------------------
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'siempre', baja.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'generalmente', oscilante.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'nunca', buena.
% 
% %-------------------------------------------
% 
% 
% 
% %Pregunta 5
% p5:-new(Dialog, dialog('Pregunta')),
%        new(P1,menu('¿Se levanta de su puesto en forma constante?')),
%        send_list(P1,append,[siempre , generalmente, nunca]),
% 
%        send(Dialog,append(P1)),
% 
%       new(B,button(siguiente,and(message(@prolog,eR1,P1?selection), message(@prolog, p6),message(Dialog,destroy)))),
%       send(Dialog,append,B),
%       send(Dialog,default_button,siguiente),
%       send(Dialog,open).
% 
% 
% %------------------------------------------
% %Análisis Pregunta5
% %-------------------------------------------
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'siempre', baja.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'generalmente', oscilante.
% eR1(R1):- espregunta('¿Se levanta de su puesto en forma constante?', R1),R1 = 'nunca', buena.
% 
% %-------------------------------------------
% 


ayud:- new().










%------------------------------
%Inicio de proceso logico
%------------------------------

ini_contadores:- sumR1('0', '0'),sumR2('0', '0'),sumR3('0', '0'),sumCas('0', '0'),sumMat('0', '0'),sumCie('0', '0'),sumArt('0', '0'),sumfs('0', '0').


%------------------------------
%Contador de atencion buena
%------------------------------
buena:- recorded(x, head(SumaR1)),
          number_chars(SumaR1, Lis),
          send(SumaR1, free),
          atom_codes(Sc, Lis),
          sumR1(Sc, '1').

sumR1(X, X2):-atom_number(X, Xc), atom_number(X2, X2c), SumaR1 is Xc + X2c, recorda(x, head(SumaR1)), write('Cont R1: '), writeln(SumaR1).


%------------------------------
%Contador de atencion osilante
%------------------------------
oscilante:- recorded(y, head(SumaR2)),
          number_chars(SumaR2, Lis2),
          send(SumaR2, free),
          atom_codes(Sc2, Lis2),
          sumR2(Sc2, '1').

sumR2(Xr2, X2r2):-atom_number(Xr2, Xc), atom_number(X2r2, X2c), SumaR2 is Xc + X2c, recorda(y, head(SumaR2)), write('Cont R2: '), writeln(SumaR2).


%------------------------------
%Contador de atencion baja
%------------------------------
baja:- recorded(z, head(SumaR3)),
          number_chars(SumaR3, Lis3),
          send(SumaR3, free),
          atom_codes(Sc3, Lis3),
          sumR3(Sc3, '1').

sumR3(Xr3, X2r3):-atom_number(Xr3, Xc), atom_number(X2r3, X2c), SumaR3 is Xc + X2c, recorda(z, head(SumaR3)), write('Cont R3: '), writeln(SumaR3).


%------------------------------
%Contador de actividad castellano
%------------------------------
castellano:- recorded(z, head(SumaCas)),
          number_chars(SumaCas, LisCas),
          send(SumaCas, free),
          atom_codes(ScCas, LisCas),
          sumCas(ScCas, '1').

sumCas(XCas, X2Cas):-atom_number(XCas, Xc), atom_number(X2Cas, X2c), SumaCas is Xc + X2c, recorda(z, head(SumaCas)), write('Cont Cas: '), writeln(SumaCas).


%------------------------------
%Contador de actividad Matemáticas
%------------------------------
matematicas:- recorded(z, head(SumaMat)),
          number_chars(SumaMat, LisMat),
          send(SumaMat, free),
          atom_codes(ScMat, LisMat),
          sumMat(ScMat, '1').

sumMat(XMat, X2Mat):-atom_number(XMat, Xc), atom_number(X2Mat, X2c), SumaMat is Xc + X2c, recorda(z, head(SumaMat)), write('Cont Mat: '), writeln(SumaMat).


%------------------------------
%Contador de actividad ciencias
%------------------------------
ciencias:- recorded(z, head(SumaCie)),
          number_chars(SumaCie, LisCie),
          send(SumaCie, free),
          atom_codes(ScCie, LisCie),
          sumCie(ScCie, '1').

sumCie(XCie, X2Cie):-atom_number(XCie, Xc), atom_number(X2Cie, X2c), SumaCie is Xc + X2c, recorda(z, head(SumaCie)), write('Cont Cie: '), writeln(SumaCie).


%------------------------------
%Contador de actividad arte
%------------------------------
arte:- recorded(z, head(SumaArt)),
          number_chars(SumaArt, LisArt),
          send(SumaArt, free),
          atom_codes(ScArt, LisArt),
          sumArt(ScArt, '1').

sumArt(XArt, X2Art):-atom_number(XArt, Xc), atom_number(X2Art, X2c), SumaArt is Xc + X2c, recorda(z, head(SumaArt)), write('Cont Art: '), writeln(SumaArt).


%------------------------------
%Contador de actividad educación física
%------------------------------
fisica:- recorded(z, head(SumaEf)),
          number_chars(SumaEf, LisEf),
          send(SumaEf, free),
          atom_codes(ScEf, LisEf),
          sumfs(ScEf, '1').

sumfs(XEf, X2Ef):-atom_number(XEf, Xc), atom_number(X2Ef, X2c), SumaEf is Xc + X2c, recorda(z, head(SumaEf)), write('Cont Ef: '), writeln(SumaEf).
%------------------------------
%Fin de proceso logico
%------------------------------
