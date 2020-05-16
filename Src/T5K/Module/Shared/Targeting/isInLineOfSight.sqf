/*
	author: Monte
	description: check if the first given object is in line of sight of the second given object
	returns: boolean
*/

private _referenceObject = _this select 0;
private _unitOfWork = _this select 1;
private _inSightThreshold = _this select 2;
private _literal = _this select 3;

if (isNil "_literal") then
{
    _literal = "VIEW";
};

[objNull, _literal] checkVisibility [eyePos _unitOfWork, eyePos _referenceObject ] > _inSightThreshold;