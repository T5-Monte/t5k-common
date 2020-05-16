_unitOfWork = _this select 0;
_maxShootsFired = _this select 1;
_timeBetweenShoots = _this select 2;
_targetArray = _this select 3;
_executingGameLogic = _this select 4;
_target = nil;

while {alive _unitOfWork} do
{
    _index = [0, (count _targetArray)] call BIS_fnc_randomInt;
	_target = _targetArray select (_index);
	_iteration = 0;

    if (isNil "_target") then
    {
        // Silence errors due to missing initilization
    } else {
        _unitOfWork doTarget _target;
        sleep 0.5;

        while {alive _target and alive _unitOfWork and _iteration < 2} do
        {
            sleep _timeBetweenShoots;

            for [{_shootsFired = 0}, {_shootsFired < _maxShootsFired}, {_shootsFired = _shootsFired + 1}] do
            {
                _executingGameLogic action ["useweapon", vehicle _unitOfWork, _unitOfWork, 0];
                sleep 0.1;
            };

            //if (someAmmo _unitOfWork) then
            //{
            //    (_unitOfWork select 0) setVehicleAmmo 1;
            //};

            _iteration = _iteration + 1;
        };
    };
};