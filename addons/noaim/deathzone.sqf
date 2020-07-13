for "_i" from 0 to 1 step 0 do {
	//while {((player distance (getMarkerPos "Death_Zone2") < 7158) || (player distance (getMarkerPos "Death_Zone1") < 6266) || (player distance (getMarkerPos "Death_Zone3") < 3373))} do {
	while {((player inArea "DEATH_ZONE1") || (player inArea "DEATH_ZONE2"))} do {
	
		titleText[localize "STR_Zone_Death", "PLAIN", -1, true, true];
		
		private _damage = damage player;
		_damage = _damage + 0.05;
		player setDamage (_damage);
		sleep 5;
	};
};