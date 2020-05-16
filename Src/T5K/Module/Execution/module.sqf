_unitOfWork = _this select 0;
_maxShootsFired = _this select 1;
_timeBetweenShoots = _this select 2;
_executingGameLogic = _this select 4;

while {alive _unitOfWork} do
{
    _target = _this select 3;

    if (isNil "_target") then
    {
        // Silence errors due to missing initilization
    } else {
        _unitOfWork doTarget _target;
        sleep 0.5;

        while {alive _target and alive _unitOfWork} do
        {
            sleep _timeBetweenShoots;

            for [{_shootsFired = 0}, {_shootsFired < _maxShootsFired}, {_shootsFired = _shootsFired + 1}] do
            {
                _executingGameLogic action ["useweapon", vehicle _unitOfWork, _unitOfWork, 0];
                sleep 0.1;
            };
        };
    };
};