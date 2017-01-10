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
%P11

%P12
espregunta('¿Termina las actividades en el tiempo establecido?', X):-esrespuesta(X).
%P13
espregunta('¿Mira al profesor mientras éste habla?', X):-esrespuesta(X).
%P14
espregunta('¿Se demora en iniciar las actividades dadas?', X):-esrespuesta(X).
%P19
espregunta('¿Se fatiga?', X):-esrespuesta(X).
%P21
espregunta('Iniciar un trabajo', X):-esrespuesta(X).
espregunta('Concluir un trabajo', X):-esrespuesta(X).


%-------------------------------------------
%Fin de los hechos
%-------------------------------------------


%-------------------------------------------
%Inicio de programa
%-------------------------------------------
iaInicio:- new(Dialog, dialog('Proyecto final')),
   send(Dialog, size, size(400, 400)),
   send(Dialog, append, new(Menu, menu_bar)),
   send(Menu, append, new(Iniciar, popup(iniciar))),
   send(Menu, append, new(Ayuda, popup(ayuda))),
   send_list(Iniciar, append, [menu_item(iniciar, message(@prolog, data_user)),
                               menu_item(salir, message(Dialog, destroy))]),
   send_list(Ayuda, append, [menu_item(ayuda, message(@prolog, ayud))]),
   
   send(Dialog, open).



%Cargar datos del usuario
% data_user:- new(Dialog, dialog('Datos del usuario')),
%    %Etiqueta
%     new(Etiqueta, label(nombre, 'Ingrese sus datos: ')),
% 
%     %Cajas de texto
%     new(Text1, text_item('Nombre: ')),
%     new(Text2, text_item('Edad: ')),
%     new(Text3, text_item('Sexo')),
% 
%     %Botones
%     new(Siguiente, button('Siguiente', and(message(@prolog, remember_user,Text1?selection,Text2?selection,Text3?selection),
%                                            message(@prolog, p1),
%                                            message(Dialog, destroy)))),
%     new(Salir, button('Salir', message(Dialog, destroy))),
% 
%     send(Dialog, append, Etiqueta),
%     send(Dialog, append, Text1),
%     send(Dialog, append, Text2),
%     send(Dialog, append, Text3),
%     send(Dialog, append, Siguiente),
%     send(Dialog, append, Salir),
% 
%     send(Dialog, open).


%Pregunta 1
p1:-new(Dialog, dialog('Pregunta 1')),
                ini_contadores,
                new(E, label(nombre, 'Al terminar una tarea o actividad.')),
       new(P1,menu('¿Permance en su puesto?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
        new(P2,menu('¿Se levanta y distrae a las personas?')),
        send_list(P2,append,[siempre , generalmente, nunca]),

        send(Dialog, append(E)),
       send(Dialog,append(P1)),
       send(Dialog,append,P2),

      new(B,button(siguiente,and(message(@prolog,aR1,P1?selection),
                                 message(@prolog,aR2,P2?selection),
                                 message(@prolog, p2),message(Dialog,destroy)))),
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
p2:-new(Dialog, dialog('Pregunta 2')),
                new(E, label(nombre, 'Durante la realización de la tarea.')),
       new(P1,menu('¿Golpea con el lápiz?')),
       send_list(P1,append,[siempre , generalmente, nunca]),
       new(P2,menu('¿Mueve la cabeza y/o piernas?')),
       send_list(P2,append,[siempre , generalmente, nunca]),
       new(P3,menu('¿Realiza otros movimientos?')),
       send_list(P3,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
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
p3:-new(Dialog, dialog('Pregunta 3')),
                new(E, label(nombre, 'Si es interrumpido en su trabajo.')),
                new(P1,menu('¿Le cuesta reiniciarlo?')),
                send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,cR1,P1?selection), message(@prolog, p4),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).
      
      
%------------------------------------------
%Análisis Pregunta3
%-------------------------------------------
cR1(R1):- espregunta('¿Le cuesta reiniciarlo?', R1),R1 = 'siempre', baja.
cR1(R1):- espregunta('¿Le cuesta reiniciarlo?', R1),R1 = 'generalmente', oscilante.
cR1(R1):- espregunta('¿Le cuesta reiniciarlo?', R1),R1 = 'nunca', buena.
%-------------------------------------------
      
      
      
%Pregunta 4
p4:-new(Dialog, dialog('Pregunta 4')),
                new(E, label(nombre, 'Al regreso del recreo')),
       new(P1,menu('¿Se demora en comenzar la actividad?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
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
p5:-new(Dialog, dialog('Pregunta 5')),
       new(E, label(nombre, 'Durante algúna actividad.')),
       new(P1,menu('¿Se levanta de su puesto en forma constante?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
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
p6:-new(Dialog, dialog('Pregunta 6')),
       new(E, label(nombre, 'Participa activamente en las clases de:')),
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

       send(Dialog, append(E)),
       send(Dialog,append(P1)),
       send(Dialog,append(P2)),
       send(Dialog,append(P3)),
       send(Dialog,append(P4)),
       send(Dialog,append(P5)),

      new(B,button(siguiente,and(message(@prolog,fR1,P1?selection),
                                  message(@prolog,fR2,P2?selection),
                                  message(@prolog,fR3,P3?selection),
                                  message(@prolog,fR4,P4?selection),
                                  message(@prolog,fR5,P5?selection),
                                  message(@prolog, p8),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta6
%-------------------------------------------
fR1(R1):- espregunta('¿Castellano?', R1),R1 = 'si', castellano.
fR1(R1):- espregunta('¿Castellano?', R1),R1 = 'no',ignora.

fR2(R1):- espregunta('¿Matemáticas?', R1),R1 = 'si', matematicas.
fR2(R1):- espregunta('¿Matemáticas?', R1),R1 = 'no',ignora.

fR3(R1):- espregunta('¿Ciencias?', R1),R1 = 'si', ciencias.
fR3(R1):- espregunta('¿Ciencias?', R1),R1 = 'no',ignora.

fR4(R1):- espregunta('¿Arte/música?', R1),R1 = 'si', arte.
fR4(R1):- espregunta('¿Arte/música?', R1),R1 = 'no',ignora.

fR5(R1):- espregunta('¿Educación física?', R1),R1 = 'si', fisica.
fR5(R1):- espregunta('¿Educación física?', R1),R1 = 'no',ignora.
%-------------------------------------------



%Pregunta 8
p8:-new(Dialog, dialog('Pregunta 7.')),
       new(E, label(nombre, 'Sus preguntas o participaciones en clases.')),
       new(P1,menu('¿Son siempre relacionada con lo tratado?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,gR1,P1?selection), message(@prolog, p9),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta8
%-------------------------------------------
gR1(R1):- espregunta('¿Son siempre relacionada con lo tratado?', R1),R1 = 'siempre', buena.
gR1(R1):- espregunta('¿Son siempre relacionada con lo tratado?', R1),R1 = 'generalmente', oscilante.
gR1(R1):- espregunta('¿Son siempre relacionada con lo tratado?', R1),R1 = 'nunca', baja.

%-------------------------------------------



%Pregunta 9
p9:-new(Dialog, dialog('Pregunta 8')),
       new(E, label(nombre, 'Constantemente.')),
       new(P1,menu('¿Solicita que le repitan las instrucciones?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
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
p10:-new(Dialog, dialog('Pregunta 9')),
       new(E, label(nombre, 'Durante algúna actividad.')),
       new(P1,menu('¿Parece no comprender las instrucciones dadas?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,iR1,P1?selection), message(@prolog, p11),message(Dialog,destroy)))),
      %new(B,button(siguiente,and(message(@prolog,iR1,P1?selection), message(@prolog, resultados),message(Dialog,destroy)))), ----------------> con resultados salgo
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



%Pregunta 11
p11:-new(Dialog, dialog('Pregunta 10')),
       new(E, label(nombre, 'Realiza sus actividades sistemáticamente sin distraerse en clases de:')),
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

       send(Dialog,append(E)),
       send(Dialog,append(P1)),
       send(Dialog,append(P2)),
       send(Dialog,append(P3)),
       send(Dialog,append(P4)),
       send(Dialog,append(P5)),

      new(B,button(siguiente,and(message(@prolog,jR1,P1?selection),
                                  message(@prolog,jR2,P2?selection),
                                  message(@prolog,jR3,P3?selection),
                                  message(@prolog,jR4,P4?selection),
                                  message(@prolog,jR5,P5?selection),
                                  message(@prolog, p12),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta11
%-------------------------------------------
jR1(R1):- espregunta('¿Castellano?', R1),R1 = 'si', castellano.
jR1(R1):- espregunta('¿Castellano?', R1),R1 = 'no',ignora.

jR2(R1):- espregunta('¿Matemáticas?', R1),R1 = 'si', matematicas.
jR2(R1):- espregunta('¿Matemáticas?', R1),R1 = 'no',ignora.

jR3(R1):- espregunta('¿Ciencias?', R1),R1 = 'si', ciencias.
jR3(R1):- espregunta('¿Ciencias?', R1),R1 = 'no',ignora.

jR4(R1):- espregunta('¿Arte/música?', R1),R1 = 'si', arte.
jR4(R1):- espregunta('¿Arte/música?', R1),R1 = 'no',ignora.

jR5(R1):- espregunta('¿Educación física?', R1),R1 = 'si', fisica.
jR5(R1):- espregunta('¿Educación física?', R1),R1 = 'no',ignora.

%-------------------------------------------



%Pregunta 12
p12:-new(Dialog, dialog('Pregunta 11')),
       new(E, label(nombre, 'Usted diría que:')),
       new(P1,menu('¿Termina las actividades en el tiempo establecido?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,kR1,P1?selection), message(@prolog, p13),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta12
%-------------------------------------------
kR1(R1):- espregunta('¿Termina las actividades en el tiempo establecido?', R1),R1 = 'siempre', buena.
kR1(R1):- espregunta('¿Termina las actividades en el tiempo establecido?', R1),R1 = 'generalmente', oscilante.
kR1(R1):- espregunta('¿Termina las actividades en el tiempo establecido?', R1),R1 = 'nunca', baja.

%-------------------------------------------



%Pregunta 13
p13:-new(Dialog, dialog('Pregunta 12')),
       new(E, label(nombre, 'Durante la clase:')),
       new(P1,menu('¿Mira al profesor mientras éste habla?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,lR1,P1?selection),
                                  message(@prolog, p14),
                                  message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta13
%-------------------------------------------
lR1(R1):- espregunta('¿Mira al profesor mientras éste habla?', R1),R1 = 'siempre', buena.
lR1(R1):- espregunta('¿Mira al profesor mientras éste habla?', R1),R1 = 'generalmente', oscilante.
lR1(R1):- espregunta('¿Mira al profesor mientras éste habla?', R1),R1 = 'nunca', baja.

%-------------------------------------------



%Pregunta 14
p14:-new(Dialog, dialog('Pregunta 13')),
       new(E, label(nombre, 'Usted diría que:')),
       new(P1,menu('¿Se demora en iniciar las actividades dadas?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,mR1,P1?selection), message(@prolog, p19),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta14
%-------------------------------------------
mR1(R1):- espregunta('¿Se demora en iniciar las actividades dadas?', R1),R1 = 'siempre', baja.
mR1(R1):- espregunta('¿Se demora en iniciar las actividades dadas?', R1),R1 = 'generalmente', oscilante.
mR1(R1):- espregunta('¿Se demora en iniciar las actividades dadas?', R1),R1 = 'nunca', buena.

%-------------------------------------------



%Pregunta 19
p19:-new(Dialog, dialog('Pregunta 14')),
       new(E, label(nombre, 'Durante la clase:')),
       new(P1,menu('¿Se fatiga?')),
       send_list(P1,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,nR1,P1?selection), message(@prolog, p21),message(Dialog,destroy)))),
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).

%------------------------------------------
%Análisis Pregunta19
%-------------------------------------------
nR1(R1):- espregunta('¿Se fatiga?', R1),R1 = 'siempre', baja.
nR1(R1):- espregunta('¿Se fatiga?', R1),R1 = 'generalmente', oscilante.
nR1(R1):- espregunta('¿Se fatiga?', R1),R1 = 'nunca', buena.

%-------------------------------------------



%Pregunta 21
p21:-new(Dialog, dialog('15')),
       new(E, label(nombre, 'Usted diría que requiere de constantes estímulos para:')),
       new(P1,menu('Iniciar un trabajo')),
       send_list(P1,append,[siempre , generalmente, nunca]),
       new(P2,menu('Concluir un trabajo')),
       send_list(P2,append,[siempre , generalmente, nunca]),

       send(Dialog, append(E)),
       send(Dialog,append(P1)),

      new(B,button(siguiente,and(message(@prolog,oR1,P1?selection),
                                 message(@prolog,oR2,P2?selection),
                                 message(@prolog, resultados),
                                 message(Dialog,destroy)))),
                                 
      send(Dialog,append,B),
      send(Dialog,default_button,siguiente),
      send(Dialog,open).


%------------------------------------------
%Análisis Pregunta21
%-------------------------------------------
oR1(R1):- espregunta('Iniciar un trabajo', R1),R1 = 'siempre', baja.
oR1(R1):- espregunta('Iniciar un trabajo', R1),R1 = 'generalmente', oscilante.
oR1(R1):- espregunta('Iniciar un trabajo', R1),R1 = 'nunca', buena.

oR2(R1):- espregunta('Concluir un trabajo', R1),R1 = 'siempre', baja.
oR2(R1):- espregunta('Concluir un trabajo', R1),R1 = 'generalmente', oscilante.
oR2(R1):- espregunta('Concluir un trabajo', R1),R1 = 'nunca', buena.
%-------------------------------------------

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

sumR1(X, X2):-atom_number(X, Xc), atom_number(X2, X2c), SumaR1 is Xc + X2c, recorda(x, head(SumaR1)).


%------------------------------
%Contador de atencion osilante
%------------------------------
oscilante:- recorded(y, head(SumaR2)),
          number_chars(SumaR2, Lis2),
          send(SumaR2, free),
          atom_codes(Sc2, Lis2),
          sumR2(Sc2, '1').

sumR2(Xr2, X2r2):-atom_number(Xr2, Xc), atom_number(X2r2, X2c), SumaR2 is Xc + X2c, recorda(y, head(SumaR2)).


%------------------------------
%Contador de atencion baja
%------------------------------
baja:- recorded(z, head(SumaR3)),
          number_chars(SumaR3, Lis3),
          send(SumaR3, free),
          atom_codes(Sc3, Lis3),
          sumR3(Sc3, '1').

sumR3(Xr3, X2r3):-atom_number(Xr3, Xc), atom_number(X2r3, X2c), SumaR3 is Xc + X2c, recorda(z, head(SumaR3)).


%------------------------------
%Contador de actividad castellano
%------------------------------
castellano:- recorded(cas, head(SumaCas)),
          number_chars(SumaCas, LisCas),
          send(SumaCas, free),
          atom_codes(ScCas, LisCas),
          sumCas(ScCas, '1').

sumCas(XCas, X2Cas):-atom_number(XCas, Xc), atom_number(X2Cas, X2c), SumaCas is Xc + X2c, recorda(cas, head(SumaCas)).


%------------------------------
%Contador de actividad Matemáticas
%------------------------------
matematicas:- recorded(mat, head(SumaMat)),
          number_chars(SumaMat, LisMat),
          send(SumaMat, free),
          atom_codes(ScMat, LisMat),
          sumMat(ScMat, '1').

sumMat(XMat, X2Mat):-atom_number(XMat, Xc), atom_number(X2Mat, X2c), SumaMat is Xc + X2c, recorda(mat, head(SumaMat)).


%------------------------------
%Contador de actividad ciencias
%------------------------------
ciencias:- recorded(cie, head(SumaCie)),
          number_chars(SumaCie, LisCie),
          send(SumaCie, free),
          atom_codes(ScCie, LisCie),
          sumCie(ScCie, '1').

sumCie(XCie, X2Cie):-atom_number(XCie, Xc), atom_number(X2Cie, X2c), SumaCie is Xc + X2c, recorda(cie, head(SumaCie)).


%------------------------------
%Contador de actividad arte
%------------------------------
arte:- recorded(art, head(SumaArt)),
          number_chars(SumaArt, LisArt),
          send(SumaArt, free),
          atom_codes(ScArt, LisArt),
          sumArt(ScArt, '1').

sumArt(XArt, X2Art):-atom_number(XArt, Xc), atom_number(X2Art, X2c), SumaArt is Xc + X2c, recorda(art, head(SumaArt)).


%------------------------------
%Contador de actividad educación física
%------------------------------
fisica:- recorded(fis, head(SumaEf)),
          number_chars(SumaEf, LisEf),
          send(SumaEf, free),
          atom_codes(ScEf, LisEf),
          sumfs(ScEf, '1').

sumfs(XEf, X2Ef):-atom_number(XEf, Xc), atom_number(X2Ef, X2c), SumaEf is Xc + X2c, recorda(fis, head(SumaEf)).
%------------------------------
%Fin de proceso logico
%------------------------------



%------------------------------
%Recuerda datos del usuario
%------------------------------
remember_user(N, A, S):-  recorda(name, head(N)), recorda(age, head(A)),recorda(sex, head(S)).
%------------------------------



%------------------------------
%Resultados de las preguntas
%------------------------------

%Cargar datos del usuario
data_user:- new(Dialog, dialog('Ingreso de datos')),
   %Etiqueta
    new(Etiqueta, label(nombre, 'Ingrese sus datos: ')),

    %Cajas de texto
    new(Text1, text_item('Nombre: ')),
    new(Text2, text_item('Edad: ')),
    new(Text3, text_item('Sexo')),

    %Botones
    new(Siguiente, button('Siguiente', and(message(@prolog, remember_user,Text1?selection,Text2?selection,Text3?selection),
                                           message(@prolog, p1),
                                           message(Dialog, destroy)))),
    new(Salir, button('Salir', message(Dialog, destroy))),

    send(Dialog, append, Etiqueta),
    send(Dialog, append, Text1),
    send(Dialog, append, Text2),
    send(Dialog, append, Text3),
    send(Dialog, append, Siguiente),
    send(Dialog, append, Salir),

    send(Dialog, open).


resultados:- new(Dialog, dialog('Resultados del "Test"')),

%Nombre del usuario---------------------------------------------
             recorded(name, head(N)),
             atom_concat('Resultados del usuario: ', N, Name),

%Edad del usuario-----------------------------------------------
             recorded(age, head(A)),
             atom_concat('Edad de: ', A, Age),
             
%Sexo del usuario---..------------------------------------------
             recorded(sex, head(S)),
             atom_concat('Sexo: ', S, Sex),

%Atencion alta--------------------------------------------------
             recorded(x, head(SumaR1)), T1 is SumaR1 * 6.6,
             atom_concat('Porsentaje de atención alta: ', T1, Ta1),
             atom_concat(Ta1, '%', Tp1),                            %<--------------------- atención alta

%Atencion oscilante---------------------------------------------
             recorded(y, head(SumaR2)),T2 is SumaR2 * 6.6,
             atom_concat('Porsentaje de atención oscilante: ', T2, Tb1),
             atom_concat(Tb1, '%', Tp2),                            %<--------------------- atención oscilante
             
%Atencion baja--------------------------------------------------
             recorded(z, head(SumaR3)), T3 is SumaR3 * 6.6,
             atom_concat('Porsentaje de atención baja: ', T3, Tc1),
             atom_concat(Tc1, '%', Tp3),                            %<--------------------- atención baja
             
%Atencion Castellano--------------------------------------------------
             recorded(cas, head(SumaCas)), T4 is SumaCas * 50,
             atom_concat('Porsentaje de atención en castellano: ', T4, Td1),
             atom_concat(Td1, '%', Tp4),                            %<--------------------- atención castellano

%Atencion matemáticas--------------------------------------------------
             recorded(mat, head(SumaMat)), T5 is SumaMat * 50,
             atom_concat('Porsentaje de atención en matemáticas: ', T5, Te1),
             atom_concat(Te1, '%', Tp5),                            %<--------------------- atención matemáticas
             
%Atencion Ciencias--------------------------------------------------
             recorded(cie, head(SumaCie)), T6 is SumaCie * 50,
             atom_concat('Porsentaje de atención en ciencias: ', T6, Tf1),
             atom_concat(Tf1, '%', Tp6),                            %<--------------------- atención ciencias
             
%Atencion artes--------------------------------------------------
             recorded(art, head(SumaArt)), T7 is SumaArt * 50,
             atom_concat('Porsentaje de atención en artes: ', T7, Tg1),
             atom_concat(Tg1, '%', Tp7),                            %<--------------------- atención artes
             
%Atencion fisica--------------------------------------------------
             recorded(fis, head(SumaEf)), T8 is SumaEf * 50,
             atom_concat('Porsentaje de atención en educación física: ', T8, Th1),
             atom_concat(Th1, '%', Tp8),                            %<--------------------- atención fisica
             
             %Etiquetas
             new(En, label(nombre, Name)),
             new(Ea, label(nombre, Age)),
             new(Es, label(nombre, Sex)),
             
             new(Eaa, label(nombre, Tp1)),
             new(Eao, label(nombre, Tp2)),
             new(Eab, label(nombre, Tp3)),
             
             new(ECas, label(nombre, Tp4)),
             new(EMat, label(nombre, Tp5)),
             new(ECie, label(nombre, Tp6)),
             new(EArt, label(nombre, Tp7)),
             new(EFis, label(nombre, Tp8)),
             
             %Botones
             new(Salir, button('Ok', message(Dialog, destroy))),
             
             send(Dialog, append, En),
             send(Dialog, append, Ea),
             send(Dialog, append, Es),
             
             send(Dialog, append, Eaa),
             send(Dialog, append, Eao),
             send(Dialog, append, Eab),
             
             send(Dialog, append, ECas),
             send(Dialog, append, EMat),
             send(Dialog, append, ECie),
             send(Dialog, append, EArt),
             send(Dialog, append, EFis),
             
             send(Dialog, append, Salir),

             send(Dialog, open).
             
             
             
%---------------------------------------------------------------------------------------
%Vista principal de los resultados, que lo imprime en pantalla
%---------------------------------------------------------------------------------------
%              writeln('Resultados del usuario: '),recorded(name, head(N)), write(N),

%              writeln('Edad de: '),recorded(age, head(A)), write(A),

%              writeln('Sexualidad: '),recorded(sex, head(S)), write(S),

%              recorded(x, head(SumaR1)), T1 is SumaR1 * 6.6,
%              writeln('Porsentaje de atención alta: '), writeln(T1), write('%'),

%              recorded(y, head(SumaR2)),T2 is SumaR2 * 6.6,
%              writeln('Porsentaje de atención oscilante: '), writeln(T2), write('%'),

%              recorded(z, head(SumaR3)), T3 is SumaR3 * 6.6,
%              writeln('Porsentaje de atención baja: '), writeln(T3), write('%'),

%              recorded(cas, head(SumaCas)),
%              write('Atención Cas: '), writeln(SumaCas),

%              recorded(mat, head(SumaMat)),
%              write('Atención Mat: '), writeln(SumaMat),

%              recorded(cie, head(SumaCie)),
%              write('Atención Cie: '), writeln(SumaCie),

%              recorded(art, head(SumaArt)),
%              write('Atención Art: '), writeln(SumaArt),

%              recorded(fis, head(SumaEf)),
%              write('Atención Ef: '), writeln(SumaEf).
%---------------------------------------------------------------------------------------


%------------------------------
%Función que ignora una consulta.
%------------------------------
ignora:- write('').
%------------------------------