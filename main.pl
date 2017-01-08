% Autor: Erick Clair
% Fecha: 06/01/2017

%Inicio de los hechos
esrespuesta('siempre').
esrespuesta('generalmente').
esrespuesta('nunca').

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
%P7
espregunta('¿Castellano?', X):-esrespuesta(X).
espregunta('¿Matemáticas?', X):-esrespuesta(X).
espregunta('¿Ciencias?', X):-esrespuesta(X).
espregunta('¿Arte/música?', X):-esrespuesta(X).
espregunta('¿Arte/música?', X):-esrespuesta(X).
%P8
espregunta('¿Son siempre relacionada con lo tratado?', X):-esrespuesta(X).
%P9
espregunta('¿Solicita que le repitan las instrucciones?', X):-esrespuesta(X).
%P10
espregunta('¿Parece no comprender las instrucciones dadas?', X):-esrespuesta(X).


%Fin de los hechos

:- new(Dialog, dialog('Proyecto final')),
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

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection,P2?selection),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
%Pregunta 2
p2:-new(Dialog, dialog('Al terminar una tarea o actividad.')),
       new(P1,menu('¿Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('¿Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection,P2?selection),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
%Pregunta 3
p3:-new(Dialog, dialog('Al terminar una tarea o actividad.')),
       new(P1,menu('¿Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('¿Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection,P2?selection),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
%Pregunta 4
p4:-new(Dialog, dialog('Al terminar una tarea o actividad.')),
       new(P1,menu('¿Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('¿Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection,P2?selection),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
%Pregunta 5
p5:-new(Dialog, dialog('Al terminar una tarea o actividad.')),
       new(P1,menu('¿Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('¿Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,p2,P1?selection,P2?selection),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
ayud:- new().

p2(Pre1, Pre2):- espregunta('¿Permance en su puesto?', Pre1), Pre1='siempre', espregunta('¿Se levanta y distrae a las personas?', Pre2), Pre2='nunca',p2_1.
p2(Pre1, Pre2):- espregunta('¿Permance en su puesto?', Pre1), Pre1='generalmente', espregunta('¿Se levanta y distrae a las personas?', Pre2), Pre2='generalmente',p2_2.
p2(Pre1, Pre2):- espregunta('¿Permance en su puesto?', Pre1), Pre1='nunca', espregunta('¿Se levanta y distrae a las personas?', Pre2), Pre2='si',p2_3.


p2_1:- new(D, dialog('Respuesta p1')), send(D, open, point(300, 300)).
p2_2:- new(D, dialog('Respuesta p2')), send(D, open, point(300, 300)).
p2_3:- new(D, dialog('Respuesta p3')), send(D, open, point(300, 300)).





