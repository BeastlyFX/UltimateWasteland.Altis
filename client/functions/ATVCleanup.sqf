//Coded by Blackbeard

sleep 300;
hint "ATV is being removed! You have 12 seconds to get off!";
_this setFuel 0;
sleep 10;
_this setVelocity [0,0,0];
sleep 2;
deleteVehicle _this;
