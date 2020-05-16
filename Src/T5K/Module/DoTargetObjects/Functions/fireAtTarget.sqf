/*
	author: Monte
	description: fires a configurable amount of bullets via the useweapon action
	returns: nothing
*/

private _executingGameLogic = _this select 0;
private _unitOfWork = _this select 1;
private _maxShotsFired = _this select 2;

for [{private _shotsFired = 0}, {_shotsFired < _maxShotsFired}, {_shotsFired = _shotsFired + 1}] do
{
    _executingGameLogic action ["useweapon", vehicle _unitOfWork, _unitOfWork, 0];
    sleep 0.1;
};