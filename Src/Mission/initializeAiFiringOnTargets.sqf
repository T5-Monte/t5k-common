private _aiUnitsWithTargets = [];

private _unitIndex = 0;
private _targetsIndex = 1;
private _roundsPerBurst = 2;
private _timeBetweenBursts = 3;

private _fnc_doTarget = compileFinal preprocessFileLineNumbers "Src\T5K\Module\DoTargetObjects\module.sqf";

{
	null = [(_x select _unitIndex), (_x select _roundsPerBurst), (_x select _timeBetweenBursts), (_x select _targetsIndex), gl] spawn _fnc_doTarget;
}
forEach _aiUnitsWithTargets;
