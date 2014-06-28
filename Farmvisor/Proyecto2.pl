% Proyecto Programado
% CI-1441 Paradigmas Computacionales
% Mario Cabrera Vega    B11209
% Alex Ramírez Alpízar  B15239

main:-  new(D,dialog('FARMVISOR')),
        send(D,size,size(300,300)),
        send(D,colour,colour(red)),
        send(D, append, new(Menu, menu_bar)),
        send(Menu, append, new(Iniciar, popup(iniciar))),
        send(Menu, append, new(Ayuda, popup(ayuda))),
        send_list(Iniciar, append,
                         [ menu_item(iniciar, message(@prolog,pProposito))
                         ]),
        send_list(Ayuda, append,
                         [ menu_item(autor, message(@display, inform, 'qwe'))
                         ]),
       % mostrar('C:/Programa/talla.bmp',D,Menu),
        send(D,open,point(200,200)).

pProposito:-
       new(D,dialog('PROPÓSITO')),
       new(Pre1,menu('¿Para qué propósito desea las aves?')),
       send_list(Pre1,append,[huevos , carne, doble, ornamental]),
       send(D,append(Pre1)),

       new(B,button(siguiente,and(message(@prolog,principal,Pre1?selection),message(D,destroy)))),
      send(D,append,B),
      send(D,default_button,siguiente),
      send(D,open,point(350,350)).

%PROPÓSITO HUEVOS
principal(huevos):-
       new(D,dialog('Especificaciones de gallinas para huevos')),
       new(Pre1,menu('¿De qué color desea los huevos?')),
       send_list(Pre1,append,[blanco , marron]),
       send(D,append(Pre1)),

       new(Pre2,menu('¿En qué ambiente vivirán?')),
       send_list(Pre2,append,[pastoreo , encierro]),
       send(D,append(Pre2)),

       new(Pre3,menu('¿Qué tipo de alimentación usará?')),
       send_list(Pre3,append,[concentrado , organico]),
       send(D,append(Pre3)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraHuevos,Pre1?selection,Pre2?selection,Pre3?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

%PROPÓSITO CARNE
principal(carne):-
       new(D,dialog('Especificaciones de gallinas para carne')),
       new(Pre1,menu('¿Qué tamaño espera que alcancen?')),
       send_list(Pre1,append,[mediano , grande]),
       send(D,append(Pre1)),

       new(Pre2,menu('¿En qué ambiente vivirán?')),
       send_list(Pre2,append,[pastoreo , encierro]),
       send(D,append(Pre2)),

       new(Pre3,menu('¿Qué tipo de alimentación usará?')),
       send_list(Pre3,append,[concentrado , organico]),
       send(D,append(Pre3)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraCarne,Pre1?selection,Pre2?selection,Pre3?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

%PROPÓSITO DOBLE
principal(doble):-
       new(D,dialog('Especificaciones de gallinas para doble propósito')),
       new(Pre1,menu('¿Qué tamaño espera que alcancen?')),
       send_list(Pre1,append,[mediano , grande]),
       send(D,append(Pre1)),

       new(Pre2,menu('¿En qué ambiente vivirán?')),
       send_list(Pre2,append,[pastoreo , encierro]),
       send(D,append(Pre2)),

       new(Pre3,menu('¿Qué tipo de alimentación usará?')),
       send_list(Pre3,append,[concentrado , organico]),
       send(D,append(Pre3)),

       new(Pre4,menu('¿De qué color desea los huevos?')),
       send_list(Pre4,append,[blanco , marron]),
       send(D,append(Pre4)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraDoble,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

%PROPÓSITO ORNAMENTAL
principal(ornamental):-
       new(D,dialog('Especificaciones de gallinas ornamentales')),
       new(Pre1,menu('¿Qué tamaño espera que alcancen?')),
       send_list(Pre1,append,[mediano , grande]),
       send(D,append(Pre1)),

       new(Pre2,menu('¿Qué tipo de comederos usará?')),
       send_list(Pre2,append,[amplio , estrecho]),
       send(D,append(Pre2)),

       new(Pre3,menu('¿Qué precio pagaría por pareja?')),
       send_list(Pre3,append,[siete_mil , catorce_mil, veinte_mil]),
       send(D,append(Pre3)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraOrnamental,Pre1?selection,Pre2?selection,Pre3?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

paraHuevos(blanco,pastoreo,concentrado). %no hay, menorca o andaluza .
paraHuevos(blanco,pastoreo,organico). %menorca o andaluza.
paraHuevos(blanco,encierro,organico). %combatiente
paraHuevos(blanco,encierro,concentrado). %leghorn
paraHuevos(marron,pastoreo,concetrado). %no hay
paraHuevos(marron,pastoreo,organico). %no hay
paraHuevos(marron,encierro,concentrado):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Rhode Island')),
	send(D,append,L),
	mostrar('./Images/rhode_island.JPG',D,20,40),
	send(D,open). %rhode island
paraHuevos(marron,encierro,organico). %no hay

paraCarne(mediano,pastoreo,concentrado). %
paraCarne(mediano,pastoreo,organico). %
paraCarne(mediano,encierro,organico). %
paraCarne(mediano,encierro,concentrado). %Cornish
paraCarne(grande,pastoreo,concetrado). %Orpington
paraCarne(grande,pastoreo,organico). %Brahma
paraCarne(grande,encierro,concentrado). %Broiler
paraCarne(grande,encierro,organico). %

paraDoble(mediano,pastoreo,concentrado,blanco). %
paraDoble(mediano,pastoreo,organico,blanco). %
paraDoble(mediano,encierro,organico,blanco). %
paraDoble(mediano,encierro,concentrado,blanco). %
paraDoble(grande,pastoreo,concetrado,blanco). %
paraDoble(grande,pastoreo,organico,blanco). %
paraDoble(grande,encierro,concentrado,blanco). %
paraDoble(grande,encierro,organico,blanco). %
paraDoble(mediano,pastoreo,concentrado,marron). %
paraDoble(mediano,pastoreo,organico,marron). %Sussex
paraDoble(mediano,encierro,organico,marron). %Sussex
paraDoble(mediano,encierro,concentrado,marron). %Sussex
paraDoble(grande,pastoreo,concetrado,marron). %Wyandotte
paraDoble(grande,pastoreo,organico,marron). %Plymouth Rock
paraDoble(grande,encierro,concentrado,marron). %Wyandotte
paraDoble(grande,encierro,organico,marron). %Wyandotte

paraOrnamental(mediano,amplio,siete_mil). %enana
paraOrnamental(mediano,amplio,catorce_mil). %holandesa
paraOrnamental(mediano,amplio,veinte_mil). %paduana
paraOrnamental(mediano,estrecho,siete_mil). %enana
paraOrnamental(mediano,estrecho,catorce_mil). %
paraOrnamental(mediano,estrecho,veinte_mil). %español cara blanca
paraOrnamental(grande,amplio,siete_mil). %
paraOrnamental(grande,amplio,catorce_mil). %conchinchina
paraOrnamental(grande,amplio,veinte_mil). %español cara blanca
paraOrnamental(grande,estrecho,siete_mil). %
paraOrnamental(grande,estrecho,catorce_mil). %
paraOrnamental(grande,estrecho,veinte_mil). %


mostrar(V,D,X,Y):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D,display,D1,point(X,Y)).

