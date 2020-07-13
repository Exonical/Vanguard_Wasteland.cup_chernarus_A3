private _pos = param [0,[],[[]]];
if(_pos isEqualTo []) exitWith {};
if(player distance _pos > 15) exitWith {}; //Bad again.

_pos set[2,(_pos select 2)+0.2];
if(lineIntersects [eyePos player, ATLtoASL _pos,player]) exitWith {};

private _eyeDir = eyeDirection player;
private _pPos = getPosATL player;
private _impactPos = [(_pos select 0)-(_pPos select 0),(_pos select 1)-(_pPos select 1),(_pos select 2)-(_pPos select 2)];
private _norm = sqrt((_impactPos select 0)^2+(_impactPos select 1)^2+(_impactPos select 2)^2);
private _angle = aCos ((_eyeDir select 0)*((_impactPos select 0) / _norm)+((_impactPos select 1) / _norm)*(_eyeDir select 1)+((_impactPos select 2) / _norm)*(_eyeDir select 2));

playSound "flashbang";
diag_log format["Flashbang %1", _angle];
[_angle] execVM "addons\noaim\flashbang.sqf";
