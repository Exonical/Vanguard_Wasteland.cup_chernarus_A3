// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: isAdmin.sqf
//	@file Author: AgentRev
//	@file Created: 13/06/2013 18:02

private ["_result", "_findUIDinArray"];
_result = false;

_findUIDinArray =
{
	private ["_uid", "_resType", "_redList", "_found"];

	_uid = _this select 0;
	_resType = _this select 1;
	_redList = [];
	_found = false;

	switch (typeName _resType) do
	{
		case (typeName {}):	{ _redList = call _resType };
		case (typeName []):	{ _redList = _resType };
		case (typeName 0):
		{
			switch (_resType) do
			{
				case 1:
				{
					if (serverCommandAvailable "#kick") then { _found = true }
					else {_redList = call lowAdmins };
				};
				case 2:
				{
					_redList = call highAdmins;
				};
				case 3:
				{
					if (isServer || serverCommandAvailable "#exec ban") then { _found = true }
					else { _redList = call serverOwners };
				};
			};
		};
	};

	_found || _uid in _redList
};

if (typeName _this == "ARRAY") then
{
	_result = _this call _findUIDinArray;
}
else
{
	for "_i" from 1 to 3 do
	{
		_result = (_result || [_this, _i] call _findUIDinArray);
	};
};

_result
