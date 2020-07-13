/*
	Author: AryX (noaim)
	Description: Flashbang
	Version: 0.1
	Updated: 02.11.2019
*/

private _angle = param [0,0,[0]];
private _blurEffect = ppEffectCreate ["DynamicBlur",500];
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;

if(_angle < 90) then {
	//Create white-screen
	private _ppEffect = ppEffectCreate ["ColorCorrections",2500];
	_ppEffect ppEffectAdjust [1, 1, -0.01, [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]];
	_ppEffect ppEffectCommit 0.1;
	_ppEffect ppEffectEnable true;
	_ppEffect ppEffectForceInNVG true;
	_blurEffect ppEffectAdjust [3];
	_blurEffect ppEffectCommit 0.2;
	23 fadeSound 0.1;
	sleep 5;
	_ppEffect ppEffectAdjust [1, 1, -0.02, [4.5, 3.5, 1.6, -0.02],[1.8, 1.6, 1.6, 1],[-1.5,0,-0.2,1]];
	_ppEffect ppEffectCommit 10;
	sleep 3;
	15 fadeSound 1;
	sleep 3;
	_ppEffect ppEffectEnable false;
	ppEffectDestroy _ppEffect;
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 3;
	sleep 1;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
} else {
	_blurEffect ppEffectAdjust [2.1];
	_blurEffect ppEffectCommit 0.1;
	15 fadeSound 0.25;
	sleep 5;
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 10;
	sleep 3;
	15 fadeSound 1;
	sleep 1;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
};