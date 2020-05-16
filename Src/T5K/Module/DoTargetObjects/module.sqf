// Compile module functions
private _fnc_fireAtTarget = compileFinal preprocessFileLineNumbers "Src\T5K\Module\DoTargetObjects\Functions\fireAtTarget.sqf";
private _fnc_selectTarget = compileFinal preprocessFileLineNumbers "Src\T5K\Module\DoTargetObjects\Functions\selectTarget.sqf";
private _fnc_isInLineOfSight = compileFinal preprocessFileLineNumbers "Src\T5K\Module\Shared\Targeting\isInLineOfSight.sqf";

// Fetching input from call
private _unitOfWork = _this select 0;
private _shotsFiredInABurst = _this select 1;
private _timeBetweenBursts = _this select 2;
private _targetArray = _this select 3;
private _executingGameLogic = _this select 4;
private _infiniteAmmunition = false;
private _respectLineOfSight = false;
private _lineOfSightLiteral = 'VIEW';
private _lineOfSightThreshold= 0.3;

private _argumentCount = count _this;

if (_argumentCount >= 5) then
{
    _infiniteAmmunition = _this select 5;
};

if (_argumentCount >= 6) then
{
    _respectLineOfSight = _this select 6;
};

if (_argumentCount >= 8) then
{
    _lineOfSightThreshold = _this select 8;
};

while {alive _unitOfWork} do
{
	private _iteration = 0;
	private _target = nil;
    private _unitCanSeeTarget = true;

    _target = ([_targetArray] call _fnc_selectTarget);

    _unitOfWork doTarget _target;

    sleep 0.5;

    if (_respectLineOfSight) then
    {
        _unitCanSeeTarget = ([_unitOfWork, _target, _lineOfSightThreshold, _lineOfSightLiteral] call _fnc_isInLineOfSight);
    };

    while {alive _target and alive _unitOfWork and _unitCanSeeTarget and _iteration < 2} do
    {
        sleep _timeBetweenBursts;

        [_executingGameLogic, _unitOfWork, _shotsFiredInABurst] call _fnc_fireAtTarget;

        //if (_infiniteAmmunition and ((someAmmo _unitOfWork) == 0)) then
        //{
        _unitOfWork setVehicleAmmo 1;
        //};

        _iteration = _iteration + 1;
    };
};