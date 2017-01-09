% Autor: Erick Clair
% Fecha: 06/01/2017

%-------------------------------------------
%Inicio de los hechos
%-------------------------------------------

esrespuesta('siempre').
esrespuesta('generalmente').
esrespuesta('nunca').

%P1
espregunta('�Permance en su puesto?', X):-esrespuesta(X).
espregunta('�Se levanta y distrae a las personas?', X):-esrespuesta(X).
%P2
espregunta('�Golpea con el l�piz?', X):-esrespuesta(X).
espregunta('�Mueve la cabeza y/o piernas?', X):-esrespuesta(X).
espregunta('�Realiza otros movimientos?', X):-esrespuesta(X).
%P3
espregunta('�Le cuesta reiniciarlo?', X):-esrespuesta(X).
%P4
espregunta('�Se demora en comenzar la actividad?', X):-esrespuesta(X).
%P5
espregunta('�Se levanta de su puesto en forma constante?', X):-esrespuesta(X).
%P6
espregunta('�Castellano?', X):-esrespuesta(X).
espregunta('�Matem�ticas?', X):-esrespuesta(X).
espregunta('�Ciencias?', X):-esrespuesta(X).
espregunta('�Arte/m�sica?', X):-esrespuesta(X).
espregunta('�Educaci�n f�sica?', X):-esrespuesta(X).
%P7
espregunta('�Castellano?', X):-esrespuesta(X).
espregunta('�Matem�ticas?', X):-esrespuesta(X).
espregunta('�Ciencias?', X):-esrespuesta(X).
espregunta('�Arte/m�sica?', X):-esrespuesta(X).
espregunta('�Arte/m�sica?', X):-esrespuesta(X).
%P8
espregunta('�Son siempre relacionada con lo tratado?', X):-esrespuesta(X).
%P9
espregunta('�Solicita que le repitan las instrucciones?', X):-esrespuesta(X).
%P10
espregunta('�Parece no comprender las instrucciones dadas?', X):-esrespuesta(X).

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
       new(P1,menu('�Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('�Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,aR1,P1?selection), message(@prolog,aR2,P2?selection), message(@prolog, p2),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      

%-------------------------------------------
%An�lisis Pregunta1
%-------------------------------------------
aR1(R1):- espregunta('�Permance en su puesto?', R1),R1 = 'nunca', cont_R3.
aR1(R1):- espregunta('�Permance en su puesto?', R1),R1 = 'generalmente', cont_R2.
aR1(R1):- espregunta('�Permance en su puesto?', R1),R1 = 'siempre', cont_R1.

aR2(R1):- espregunta('�Se levanta y distrae a las personas?', R1),R1 = 'nunca', cont_R3.
aR2(R1):- espregunta('�Se levanta y distrae a las personas?', R1),R1 = 'generalmente', cont_R2.
aR2(R1):- espregunta('�Se levanta y distrae a las personas?', R1),R1 = 'siempre', cont_R1.
%-------------------------------------------
      
%Pregunta 2
p2:-new(Dialog, dialog('Durante la realizaci�n de la tarea.')),
       new(P1,menu('�Golpea con el l�piz?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
       new(P2,menu('�Mueve la cabeza y/o piernas?')),
       send_list(P2,append,[siempre , generalmente, nunca]),
       new(P3,menu('�Realiza otros movimientos?')),
       send_list(P3,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),
       send(Dialog,append,P3),

      new(B,button(siguiente,and(message(@prolog,bR1,P1?selection), message(@prolog,bR2,P2?selection), message(@prolog,bR3,P3?selection), message(@prolog, p3),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).

%------------------------------------------
%An�lisis Pregunta2
%-------------------------------------------
bR1(R1):- espregunta('�Golpea con el l�piz?', R1),R1 = 'siempre', cont_R1.
bR1(R1):- espregunta('�Golpea con el l�piz?', R1),R1 = 'generalmente', cont_R2.
bR1(R1):- espregunta('�Golpea con el l�piz?', R1),R1 = 'nunca', cont_R3.

bR2(R1):- espregunta('�Mueve la cabeza y/o piernas?', R1),R1 = 'siempre', cont_R1.
bR2(R1):- espregunta('�Mueve la cabeza y/o piernas?', R1),R1 = 'generalmente', cont_R2.
bR2(R1):- espregunta('�Mueve la cabeza y/o piernas?', R1),R1 = 'nunca', cont_R3.

bR3(R1):- espregunta('�Realiza otros movimientos?', R1),R1 = 'siempre', cont_R1.
bR3(R1):- espregunta('�Realiza otros movimientos?', R1),R1 = 'generalmente', cont_R2.
bR3(R1):- espregunta('�Realiza otros movimientos?', R1),R1 = 'nunca', cont_R3.
%-------------------------------------------

      
%Pregunta 3
p3:-new(Dialog, dialog('Si es interrumpido en su trabajo.')),
       new(P1,menu('�Le cuesta reiniciarlo?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,cR1,P1?selection), message(@prolog, p4),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
%------------------------------------------
%An�lisis Pregunta3
%-------------------------------------------
cR1(R1):- espregunta('�Le cuesta reiniciarlo?', R1),R1 = 'siempre', cont_R1.
cR1(R1):- espregunta('�Le cuesta reiniciarlo?', R1),R1 = 'generalmente', cont_R2.
cR1(R1):- espregunta('�Le cuesta reiniciarlo?', R1),R1 = 'nunca', cont_R3.
%-------------------------------------------
      
%Pregunta 4
p4:-new(Dialog, dialog('Al regreso del recreo')),
       new(P1,menu('�Se demora en comenzar la actividad?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection), message(@prolog,p5),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%An�lisis Pregunta2
%-------------------------------------------
dR1(R1):- espregunta('', R1),R1 = 'siempre', cont_R1.
dR1(R1):- espregunta('', R1),R1 = 'generalmente', cont_R2.
dR1(R1):- espregunta('', R1),R1 = 'nunca', cont_R3.
%-------------------------------------------
      
%Pregunta 5
p5:-new(Dialog, dialog('Al terminar una tarea o actividad.')),
       new(P1,menu('�Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('�Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection,P2?selection),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%An�lisis Pregunta2
%-------------------------------------------
eR1(R1):- espregunta('', R1),R1 = 'siempre', cont_R1.
eR1(R1):- espregunta('', R1),R1 = 'generalmente', cont_R2.
eR1(R1):- espregunta('', R1),R1 = 'nunca', cont_R3.

eR2(R1):- espregunta('', R1),R1 = 'siempre', cont_R1.
eR2(R1):- espregunta('', R1),R1 = 'generalmente', cont_R2.
eR2(R1):- espregunta('', R1),R1 = 'nunca', cont_R3.
%-------------------------------------------
      
ayud:- new().

% p2(Pre1, Pre2):- espregunta('�Permance en su puesto?', Pre1), Pre1='siempre', espregunta('�Se levanta y distrae a las personas?', Pre2), Pre2='nunca',p2_1.
% p2(Pre1, Pre2):- espregunta('�Permance en su puesto?', Pre1), Pre1='generalmente', espregunta('�Se levanta y distrae a las personas?', Pre2), Pre2='generalmente',p2_2.
% p2(Pre1, Pre2):- espregunta('�Permance en su puesto?', Pre1), Pre1='nunca', espregunta('�Se levanta y distrae a las personas?', Pre2), Pre2='si',p2_3.
% 
% 
% p2_1:- new(D, dialog('Respuesta p1')), send(D, open, point(300, 300)).
% p2_2:- new(D, dialog('Respuesta p2')), send(D, open, point(300, 300)).
% p2_3:- new(D, dialog('Respuesta p3')), send(D, open, point(300, 300)).









%------------------------------
%Inicio de proceso logico
%------------------------------

ini_contadores:- sumR1('0', '0'),sumR2('0', '0'),sumR3('0', '0').


%------------------------------
%Respuesta 1
%------------------------------
cont_R1:- recorded(x, head(SumaR1)),
          number_chars(SumaR1, Lis),
          send(SumaR1, free),
          atom_codes(Sc, Lis),
          sumR1(Sc, '1').

sumR1(X, X2):-atom_number(X, Xc), atom_number(X2, X2c), SumaR1 is Xc + X2c, recorda(x, head(SumaR1)), write('Cont R1: '), writeln(SumaR1).


%------------------------------
%Respuesta 2
%------------------------------
cont_R2:- recorded(y, head(SumaR2)),
          number_chars(SumaR2, Lis2),
          send(SumaR2, free),
          atom_codes(Sc2, Lis2),
          sumR2(Sc2, '1').

sumR2(Xr2, X2r2):-atom_number(Xr2, Xc), atom_number(X2r2, X2c), SumaR2 is Xc + X2c, recorda(y, head(SumaR2)), write('Cont R2: '), writeln(SumaR2).


%------------------------------
%Respuesta 3
%------------------------------
cont_R3:- recorded(z, head(SumaR3)),
          number_chars(SumaR3, Lis3),
          send(SumaR3, free),
          atom_codes(Sc3, Lis3),
          sumR3(Sc3, '1').

sumR3(Xr3, X2r3):-atom_number(Xr3, Xc), atom_number(X2r3, X2c), SumaR3 is Xc + X2c, recorda(z, head(SumaR3)), write('Cont R3: '), writeln(SumaR3).
%------------------------------
%Fin de proceso logico
%------------------------------