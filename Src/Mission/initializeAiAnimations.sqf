private _unitToTargetEntity = [];

private _indexUnitOfWork = 0;
private _indexTargetObject = 1;
private _indexAnimation = 2;

private _fncAnimationScript = compileFinal preprocessFileLineNumbers "Src\T5K\Module\Shared\Animation\animateAndAttachTo.sqf";

{
	null = [(_x select _indexUnitOfWork), (_x select _indexTargetObject), (_x select _indexAnimation)] spawn _fncAnimationScript;
} forEach _unitToTargetEntity;

