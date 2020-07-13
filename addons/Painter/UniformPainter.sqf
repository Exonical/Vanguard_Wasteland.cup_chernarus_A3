// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: UniformPainter.sqf
//	@file Author: LouD
//	@file Created: 14-02-2015

_texDir = "client\images\vehicleTextures\";
_paint = _this select 0;

_price = 1500;
_playerMoney = player getVariable "cmoney";

if (_price > _playerMoney) exitWith
	{
		_text = format ["Not enough money! You need $%1 to paint your clothes.",_price];
		[_text, 10] call mf_notify_client;
		playSound "FD_CP_Not_Clear_F";
	};

if (_price < _playerMoney) then	
	{
		player setVariable["cmoney",(player getVariable "cmoney")-_price,true];
		_text = format ["You paid $%1 to paint your clothes.",_price];
		[_text, 10] call mf_notify_client;		
		[] spawn fn_savePlayerData;
	};

if (_paint isEqualTo 0) then {
player setObjectTextureGlobal  [0, _texDir + "axredcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axredcamo.paa"]; //ok
};

if (_paint isEqualTo 1) then {
player setObjectTextureGlobal  [0, _texDir + "axgreencamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axgreencamo.paa"]; //ok
};

if (_paint isEqualTo 2) then {
player setObjectTextureGlobal  [0, _texDir + "axwhitered.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axwhitered.paa"]; //ok
};

if (_paint isEqualTo 3) then {
player setObjectTextureGlobal  [0, _texDir + "axrusty.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axrusty.paa"]; //ok
};

if (_paint isEqualTo 4) then {
player setObjectTextureGlobal  [0, _texDir + "axdesertcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axdesertcamo.paa"]; //ok
};

if (_paint isEqualTo 5) then {
player setObjectTextureGlobal  [0, _texDir + "axgrascamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axgrascamo.paa"]; //ok
};

if (_paint isEqualTo 6) then {
player setObjectTextureGlobal  [0, _texDir + "axflowerpower.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axflowerpower.paa"]; //ok
};

if (_paint isEqualTo 7) then {
player setObjectTextureGlobal  [0, _texDir + "camo_red.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "camo_red.paa"]; //ok
};

if (_paint isEqualTo 8) then {
player setObjectTextureGlobal  [0, _texDir + "axbluecamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "axbluecamo.paa"]; //ok
};

if (_paint isEqualTo 9) then {
player setObjectTextureGlobal  [0, _texDir + "hex.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "hex.paa"]; //ok
};

if (_paint isEqualTo 10) then {
player setObjectTextureGlobal  [0, _texDir + "woodland.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "woodland.paa"]; //ok
};

if (_paint isEqualTo 11) then {
player setObjectTextureGlobal  [0, _texDir + "zero_dustbw.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_dustbw.paa"]; //ok
};

if (_paint isEqualTo 12) then {
player setObjectTextureGlobal  [0, _texDir + "zero_tropicbw.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_tropicbw.paa"]; //ok
};

if (_paint isEqualTo 13) then {
player setObjectTextureGlobal  [0, _texDir + "swamp.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "swamp.paa"]; //ok
};

if (_paint isEqualTo 14) then {
	player setObjectTextureGlobal  [0, _texDir + "zero_bwcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_bwcamo.paa"]; //ok
};

if (_paint isEqualTo 15) then {
	player setObjectTextureGlobal  [0, _texDir + "zero_newcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_newcamo.paa"]; //nein
};

if (_paint isEqualTo 16) then {
	player setObjectTextureGlobal  [0, _texDir + "zero_mixcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_mixcamo.paa"]; //nein
};

if (_paint isEqualTo 17) then {
	player setObjectTextureGlobal  [0, _texDir + "zero_blackcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_blackcamo.paa"]; //ok
};

if (_paint isEqualTo 18) then {
	player setObjectTextureGlobal  [0, _texDir + "zero_blackcamo.paa"]; backpackContainer player setObjectTextureGlobal  [0, _texDir + "zero_blackcamo.paa"]; //ok
};