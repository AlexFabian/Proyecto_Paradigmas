% Proyecto Programado
% CI-1441 Paradigmas Computacionales
% Mario Cabrera Vega    B11209
% Alex Ram�rez Alp�zar  B15239

main:-  new(D,dialog('FARMVISOR')),
        send(D,size,size(600,600)),
        send(D,colour,colour(red)),
        send(D, append, new(Menu, menu_bar)),
        send(Menu, append, new(Inicio, popup(inicio))),
        send(Menu, append, new(Ayuda, popup(ayuda))),
	send(Menu, append, new(Acerca_de, popup(acerca_de))),
        send_list(Inicio, append,
                         [ menu_item(inicio, message(@prolog,pProposito))
                         ]),
        send_list(Ayuda, append,
                         [ menu_item(instrucciones_generales, message(@display, inform, '\t\t    �Bienvenido a FARMVISOR!\n\n   Este sistema experto le ayudar� a elegir la raza de gallina que mejor se adapte a sus necesidades.\n\n   Para ello usted deber� responder una serie de preguntas con base en las cuales se deducir� cu�l es su mejor opci�n.\n\n   Para empezar dir�jase a la secci�n Inicio. \n\n\t\t�Esperamos que nuestra recomendaci�n le sea �til!')),
			   menu_item(instrucciones_detalladas, message(@display, inform, 'Instrucciones\n\n1)Esta aplicaci�n est� desarrollada para productores aficionados o empresarios que desean iniciar su propia granja av�cola. Al finalizar el cuestionario, se le dar� una sugerencia de raza de gallina de acuerdo con las especificaciones que usted mismo d�.\n\n2)Para iniciar, dir�jase a inicio.\n\n3)Las preguntas que se le har�n son de selecci�n. Por cada una usted debe elegir una opci�n.\n\n3)Usted tiene la oportunidad de cambiar sus respuestas. Para ello, cada formulario de preguntas tiene un bot�n que le permite volver al formulario anterior.\n\n4)La respuesta del sistema es completamente dependiente de sus respuestas, por lo que el cambio en alguna de ellas, puede alterar el resultado. Por ello se le sugiere ser objetivo al responder para que la respuesta del sistema sea adecuada.\n\n5)El sistema le sugerir� una raza, la m�s apta para sus requerimientos; sin embargo esto no indica, de ninguna manera, que alguna otra raza no vaya a cumplir con su objetivo. Puede variar un poco las respuestas para ver otros resultados.'))
                         ]),
	send_list(Acerca_de, append,
		         [ menu_item(datos_generales, message(@display, inform, '\tFARMVISOR (2014)\n\nVersion 1.0\n\nDesarrollado por: \n\tMario Cabrera Vega \n\tAlex Ram�rez Alp�zar\n\nCI-1441 Paradigmas Computacionales\n\n\tProyecto Pr�ctico'))]),
        mostrar('./Images/variadas.jpg',D,40,100),
        send(D,open,point(200,200)).

pProposito:-
       new(D,dialog('PROP�SITO')),
       new(Pre1,menu('�Para qu� prop�sito desea las aves?')),
       send_list(Pre1,append,[huevos , carne, doble, ornamental]),
       send(D,append(Pre1)),

       new(B,button(siguiente,and(message(@prolog,principal,Pre1?selection),message(D,destroy)))),
      send(D,append,B),
      send(D,default_button,siguiente),
      send(D,open,point(350,350)).

%PROP�SITO HUEVOS
principal(huevos):-
       new(D,dialog('Especificaciones de gallinas para huevos')),
       new(Pre1,menu('�De qu� color desea los huevos?')),
       send_list(Pre1,append,[blanco , marron]),
       send(D,append(Pre1)),

       new(Pre2,menu('�En qu� ambiente vivir�n?')),
       send_list(Pre2,append,[pastoreo , encierro]),
       send(D,append(Pre2)),

       new(Pre3,menu('�Qu� tipo de alimentaci�n usar�?')),
       send_list(Pre3,append,[concentrado , organico]),
       send(D,append(Pre3)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraHuevos,Pre1?selection,Pre2?selection,Pre3?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

%PROP�SITO CARNE
principal(carne):-
       new(D,dialog('Especificaciones de gallinas para carne')),
       new(Pre1,menu('�Qu� tama�o espera que alcancen?')),
       send_list(Pre1,append,[mediano , grande]),
       send(D,append(Pre1)),

       new(Pre2,menu('�En qu� ambiente vivir�n?')),
       send_list(Pre2,append,[pastoreo , encierro]),
       send(D,append(Pre2)),

       new(Pre3,menu('�Qu� tipo de alimentaci�n usar�?')),
       send_list(Pre3,append,[concentrado , organico]),
       send(D,append(Pre3)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraCarne,Pre1?selection,Pre2?selection,Pre3?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

%PROP�SITO DOBLE
principal(doble):-
       new(D,dialog('Especificaciones de gallinas para doble prop�sito')),
       new(Pre1,menu('�Qu� tama�o espera que alcancen?')),
       send_list(Pre1,append,[mediano , grande]),
       send(D,append(Pre1)),

       new(Pre2,menu('�En qu� ambiente vivir�n?')),
       send_list(Pre2,append,[pastoreo , encierro]),
       send(D,append(Pre2)),

       new(Pre3,menu('�Qu� tipo de alimentaci�n usar�?')),
       send_list(Pre3,append,[concentrado , organico]),
       send(D,append(Pre3)),

       new(Pre4,menu('�De qu� color desea los huevos?')),
       send_list(Pre4,append,[blanco , marron]),
       send(D,append(Pre4)),

       new(B1,button(atras,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraDoble,Pre1?selection,Pre2?selection,Pre3?selection,Pre4?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

%PROP�SITO ORNAMENTAL
principal(ornamental):-
       new(D,dialog('Especificaciones de gallinas ornamentales')),
       new(Pre1,menu('�Qu� tama�o espera que alcancen?')),
       send_list(Pre1,append,[mediano , grande]),
       send(D,append(Pre1)),

       new(Pre2,menu('�Qu� tipo de comederos usar�?')),
       send_list(Pre2,append,[amplio , estrecho]),
       send(D,append(Pre2)),

       new(Pre3,menu('�Qu� precio pagar�a por pareja?')),
       send_list(Pre3,append,[siete_mil , catorce_mil, veinte_mil]),
       send(D,append(Pre3)),

       new(B1,button(atr�s,and(message(@prolog,pProposito),message(D,destroy)))),
       new(B,button(siguiente,message(@prolog,paraOrnamental,Pre1?selection,Pre2?selection,Pre3?selection))),

       send(D,append,B1),
       send(D,append,B),
       send(D,open,point(300,300)).

paraHuevos(blanco,pastoreo,concentrado):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina Menorca')),
	send(D,append,L),
	mostrar('./Images/infoMenorca.jpg',D,20,40),
	mostrar('./Images/menorca.jpg',D,400,40),
	send(D,open).%menorca.
paraHuevos(blanco,pastoreo,organico):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina Andaluza')),
	send(D,append,L),
	mostrar('./Images/infoAndaluza.jpg',D,20,40),
	mostrar('./Images/andaluza_azul.jpg',D,400,40),
	send(D,open).%andaluza.
paraHuevos(blanco,encierro,organico):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Combatiente Espa�ol')),
	send(D,append,L),
	mostrar('./Images/infoCombatiente.jpg',D,20,40),
	mostrar('./Images/combatiente_espa�ol.jpg',D,400,40),
	send(D,open).%combatiente
paraHuevos(blanco,encierro,concentrado):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Leghorn')),
	send(D,append,L),
	mostrar('./Images/infoLeghorn.jpg',D,20,40),
	mostrar('./Images/leghorn.jpg',D,400,40),
	send(D,open). %leghorn
paraHuevos(marron,pastoreo,concentrado):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Sex link')),
	send(D,append,L),
	mostrar('./Images/infoSex_link.jpg',D,20,40),
	mostrar('./Images/sex_link2.jpg',D,400,40),
	send(D,open).%Sex_link
paraHuevos(marron,pastoreo,organico):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Sex link')),
	send(D,append,L),
	mostrar('./Images/infoSex_link.jpg',D,20,40),
	mostrar('./Images/sex_link.jpg',D,400,40),
	send(D,open).%Sex_link
paraHuevos(marron,encierro,concentrado):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Rhode Island')),
	send(D,append,L),
	mostrar('./Images/infoRhode_island.JPG',D,20,40),
	mostrar('./Images/rhode_island.JPG',D,400,40),
	send(D,open). %rhode island
paraHuevos(marron,encierro,organico):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Plymouth Rock')),
	send(D,append,L),
	mostrar('./Images/InfoPlymouth_rock.jpg',D,20,40),
	mostrar('./Images/plymouth_rock-barrado2.jpg',D,400,40),
	send(D,open).%Plymouth Rock
paraCarne(mediano,pastoreo,concentrado):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Broiler')),
	send(D,append,L),
	mostrar('./Images/infoBroiler.jpg',D,20,40),
	mostrar('./Images/broiler.jpg',D,400,40),
	send(D,open).%Broiler
paraCarne(mediano,pastoreo,organico):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Jersey')),
	send(D,append,L),
	mostrar('./Images/infoJersey.jpg',D,20,40),
	mostrar('./Images/jersey.jpg',D,400,40),
	send(D,open).%Jersey
paraCarne(mediano,encierro,organico):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Gallina Casera Grande')),
	send(D,append,L),
	mostrar('./Images/infoCasera_grande.jpg',D,20,40),
	mostrar('./Images/casera_grande.jpg',D,400,40),
	send(D,open).%Casera grande
paraCarne(mediano,encierro,concentrado):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Cornish')),
	send(D,append,L),
	mostrar('./Images/infoCornish.jpg',D,20,40),
	mostrar('./Images/cornish.jpg',D,400,40),
	send(D,open).%Cornish
paraCarne(grande,pastoreo,concentrado):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Orpington')),
	send(D,append,L),
	mostrar('./Images/infoOrpington.jpg',D,20,40),
	mostrar('./Images/orpington.jpg',D,400,40),
	send(D,open).%Orpington
paraCarne(grande,pastoreo,organico):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Brahma')),
	send(D,append,L),
	mostrar('./Images/infoBrahma.jpg',D,20,40),
	mostrar('./Images/brahma_blanca.jpg',D,400,40),
	send(D,open).%Brahma
paraCarne(grande,encierro,concentrado):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Broiler')),
	send(D,append,L),
	mostrar('./Images/infoBroiler.jpg',D,20,40),
	mostrar('./Images/broiler.jpg',D,400,40),
	send(D,open).%Broiler
paraCarne(grande,encierro,organico):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Broiler')),
	send(D,append,L),
	mostrar('./Images/infoBroiler.jpg',D,20,40),
	mostrar('./Images/broiler.jpg',D,400,40),
	send(D,open).%Broiler
paraDoble(mediano,pastoreo,concentrado,blanco):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Pita Pinta')),
	send(D,append,L),
	mostrar('./Images/infoPitaPinta.jpg',D,20,40),
	mostrar('./Images/pita_pinta.jpg',D,400,40),
	send(D,open).%pita_pinta
paraDoble(mediano,pastoreo,organico,blanco):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Pita Pinta')),
	send(D,append,L),
	mostrar('./Images/infoPitaPinta.jpg',D,20,40),
	mostrar('./Images/pita_pinta.jpg',D,400,40),
	send(D,open).%pita_pinta
paraDoble(mediano,encierro,organico,blanco):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Rubia Piamontesa')),
	send(D,append,L),
	mostrar('./Images/infoRubia.jpg',D,20,40),
	mostrar('./Images/rubia_piamontesa.jpg',D,400,40),
	send(D,open).%Rubia_piamontesa
paraDoble(mediano,encierro,concentrado,blanco):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Rubia Piamontesa')),
	send(D,append,L),
	mostrar('./Images/infoRubia.jpg',D,20,40),
	mostrar('./Images/rubia_piamontesa.jpg',D,400,40),
	send(D,open).%Rubia_piamontesa
paraDoble(grande,pastoreo,concentrado,blanco):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Valdarno')),
	send(D,append,L),
	mostrar('./Images/infoValdarno.jpg',D,20,40),
	mostrar('./Images/valdarno.jpg',D,400,40),
	send(D,open).%Valdarno
paraDoble(grande,pastoreo,organico,blanco):-
	new(D,dialog('Gallina')),
        new(L,label(n,'La Fleche')),
	send(D,append,L),
	mostrar('./Images/infoFleche.jpg',D,20,40),
	mostrar('./Images/la_fleche.jpg',D,400,40),
	send(D,open).%La_Fleche
paraDoble(grande,encierro,concentrado,blanco):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Catalana de Prat')),
	send(D,append,L),
	mostrar('./Images/infoCatalana.jpg',D,20,40),
	mostrar('./Images/catalana_de_prat.jpg',D,400,40),
	send(D,open).%Catalana de Prat
paraDoble(grande,encierro,organico,blanco):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Catalana de Prat')),
	send(D,append,L),
	mostrar('./Images/infoCatalana.jpg',D,20,40),
	mostrar('./Images/catalana_de_prat.jpg',D,400,40),
	send(D,open).%Catalana de Prat
paraDoble(mediano,pastoreo,concentrado,marron):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Sussex')),
	send(D,append,L),
	mostrar('./Images/infoSussex.jpg',D,20,40),
	mostrar('./Images/sussex.jpg',D,400,40),
	send(D,open).%Sussex
paraDoble(mediano,pastoreo,organico,marron):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Sex link')),
	send(D,append,L),
	mostrar('./Images/infoSex_link.jpg',D,20,40),
	mostrar('./Images/sex_link.jpg',D,400,40),
	send(D,open).%Sex_link
paraDoble(mediano,encierro,organico,marron):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Sex link')),
	send(D,append,L),
	mostrar('./Images/infoSex_link.jpg',D,20,40),
	mostrar('./Images/sex_link2.jpg',D,400,40),
	send(D,open).%%Sex_link
paraDoble(mediano,encierro,concentrado,marron):-
	new(D,dialog('Gallina')),
        new(L,label(n,'New Hampshire')),
	send(D,append,L),
	mostrar('./Images/infoNew.JPG',D,20,40),
	mostrar('./Images/new_hampshire.JPG',D,400,40),
	send(D,open).%Wyandotte

paraDoble(grande,pastoreo,concetrado,marron):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Wyandotte')),
	send(D,append,L),
	mostrar('./Images/infoWyandotte.jpg',D,20,40),
	mostrar('./Images/wyandotte.jpg',D,400,40),
	send(D,open).%Wyandotte
paraDoble(grande,pastoreo,organico,marron):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Plymouth Rock')),
	send(D,append,L),
	mostrar('./Images/infoPlymouth_rock.jpg',D,20,40),
	mostrar('./Images/plymouth_rock_barrado.jpg',D,400,40),
	send(D,open).%Plymouth Rock
paraDoble(grande,encierro,concentrado,marron):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Wyandotte')),
	send(D,append,L),
	mostrar('./Images/infoWyandotte.jpg',D,20,40),
	mostrar('./Images/wyandotte.jpg',D,400,40),
	send(D,open).%Wyandotte
paraDoble(grande,encierro,organico,marron):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Wyandotte')),
	send(D,append,L),
	mostrar('./Images/infoWyandotte.jpg',D,20,40),
	mostrar('./Images/wyandotte.jpg',D,400,40),
	send(D,open).%Wyandotte
paraOrnamental(mediano,amplio,siete_mil):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Enana')),
	send(D,append,L),
	mostrar('./Images/infoEnanas.jpg',D,20,40),
	mostrar('./Images/nagasaki.jpg',D,400,40),
	send(D,open). %enana
paraOrnamental(mediano,amplio,catorce_mil):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Mo�uda holandesa')),
	send(D,append,L),
	mostrar('./Images/infoPolaca.jpg',D,20,40),
	mostrar('./Images/polaca_negra.jpg',D,400,40),
	send(D,open).%holandesa
paraOrnamental(mediano,amplio,veinte_mil):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Paduana')),
	send(D,append,L),
	mostrar('./Images/infoPaduana.jpg',D,20,40),
	mostrar('./Images/paduana.jpg',D,400,40),
	send(D,open).%paduana
paraOrnamental(mediano,estrecho,siete_mil):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Enana')),
	send(D,append,L),
	mostrar('./Images/infoEnanas.jpg',D,20,40),
	mostrar('./Images/nagasaki2.jpg',D,400,40),
	send(D,open).%enana
paraOrnamental(mediano,estrecho,catorce_mil):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina Sedosa Japonesa')),
	send(D,append,L),
	mostrar('./Images/infoJaponesa.jpg',D,20,40),
	mostrar('./Images/japonesa.jpg',D,400,40),
	send(D,open).%
paraOrnamental(mediano,estrecho,veinte_mil):-
	new(D,dialog('Gallina')),
        new(L,label(n, 'Espa�ola de cara blanca')),
	send(D,append,L),
	mostrar('./Images/infoCaraBlanca.jpg',D,20,40),
	mostrar('./Images/cara_blanca.jpg',D,400,40),
	send(D,open).%espa�ol cara blancan
paraOrnamental(grande,amplio,siete_mil):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina casera')),
	send(D,append,L),
	mostrar('./Images/infoCasera.jpg',D,20,40),
	mostrar('./Images/casera2.jpg',D,400,40),
	send(D,open).%casera mediana
paraOrnamental(grande,amplio,catorce_mil):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Cornish')),
	send(D,append,L),
	mostrar('./Images/infoCornish.jpg',D,20,40),
	mostrar('./Images/cornish.jpg',D,400,40),
	send(D,open).%conchinchina
paraOrnamental(grande,amplio,veinte_mil):-
        new(D,dialog('Gallina')),
        new(L,label(n,'Espa�ola de cara blanca')),
	send(D,append,L),
	mostrar('./Images/infoCaraBlanca.jpg',D,20,40),
	mostrar('./Images/cara_blanca.jpg',D,400,40),
	send(D,open).%espa�ol cara blanca
paraOrnamental(grande,estrecho,siete_mil):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina chiricana')),
	send(D,append,L),
	mostrar('./Images/infoChiricana.jpg',D,20,40),
	mostrar('./Images/chiricana.jpg',D,400,40),
	send(D,open).%chiricana
paraOrnamental(grande,estrecho,catorce_mil):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina Casera')),
	send(D,append,L),
	mostrar('./Images/infoCasera_grande.jpg',D,20,40),
	mostrar('./Images/casera_grande.jpg',D,400,40),
	send(D,open).%casera grande
paraOrnamental(grande,estrecho,veinte_mil):-
	new(D,dialog('Gallina')),
        new(L,label(n,'Gallina Sultana')),
	send(D,append,L),
	mostrar('./Images/infoSultana.jpg',D,20,40),
	mostrar('./Images/sultana.jpg',D,400,40),
	send(D,open).%sultana

mostrar(V,D,X,Y):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D,display,D1,point(X,Y)).

