/*
	author: Monte
	description: animates given unit and attach the unit to the given object
	returns: nothing
*/

private _unitToBeAnimated = _this select 0;
private _targetedObject = _this select 1;
private _animation = "InBaseMoves_SittingRifle2";

private _argumentCount = count _this;

if (_argumentCount >= 3) then
{
    _animation = _this select 2;
};

_unitToBeAnimated setBehaviour "SAFE";
_unitToBeAnimated switchMove _animation;
_unitToBeAnimated disableAI "anim";
[_unitToBeAnimated, _targetedObject] call BIS_fnc_attachToRelative;