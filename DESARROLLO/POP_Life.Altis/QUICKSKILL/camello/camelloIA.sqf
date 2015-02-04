//hc client
if !(hasInterface or isServer) then {
 

    
    while {true} do {

      sleep 2;
       
       //si tiene gente cerca parate macho, keres un asesino
         
         { //start for de cada jugador

            if (isPlayer _x) then {

              //camello1
                _dist1 = _x distance camello;
                    if(_dist1<40)then{

                         camello setfuel 0;


                         if(true)exitWith{};

                     }else{

                        camello setfuel 1;

                     };





              //camello 2
               _dist2 = _x distance camello2;
                    if(_dist2<40)then{

                         camello2 setfuel 0;


                         if(true)exitWith{};

                     }else{

                        camello2 setfuel 1;

                     };


            };  

      } forEach playableUnits;

       };



};
