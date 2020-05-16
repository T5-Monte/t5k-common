/*
	author: Monte
	description: select a reference from the input array based on the input arrays element count
	returns: Anything - the selected target from the given array
*/

private _targetArray = _this select 0;

private _index = [0, ((count _targetArray) -1)] call BIS_fnc_randomInt;

_targetArray select _index;