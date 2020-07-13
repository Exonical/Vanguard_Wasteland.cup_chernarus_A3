_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_unit action ["Eject", vehicle _unit];

player action ["Eject", vehicle player];
titleText["You were pulled out of the Weapon System!","PLAIN"];
titleFadeOut 4;