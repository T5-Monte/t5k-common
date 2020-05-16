private _registeredScripts = [
	"Src\Mission\initializeAiFiringOnTargets.sqf",
	"Src\Mission\initializeAiAnimations.sqf"
];

{
	private _compiledFile = compileFinal preprocessFileLineNumbers _x;
	
	[] spawn _compiledFile;
} forEach _registeredScripts;

