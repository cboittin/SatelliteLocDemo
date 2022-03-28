set resgen="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\ResGen.exe"
set al="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64\al.exe"

echo "Compile resx"
SET resourcesPath="obj\x64\Debug\Properties"
if not exist %resourcesPath% mkdir %resourcesPath%
%resgen% Properties\Resources.resx Properties\Resources.resources
%resgen% Properties\Resources.fr-FR.resx %resourcesPath%\Resources.fr-FR.resources
%resgen% Properties\Resources.de-DE.resx %resourcesPath%\Resources.de-DE.resources
%resgen% Properties\Errors.resx Properties\Errors.resources
%resgen% Properties\Errors.fr-FR.resx %resourcesPath%\Errors.fr-FR.resources
%resgen% Properties\Errors.de-DE.resx %resourcesPath%\Errors.de-DE.resources

echo "en-US"
SET enusPath="bin\x64\Debug\Languages\en-US"
if not exist %enusPath% mkdir %enusPath%
%al% -embed:Properties\Resources.resources,SatelliteLocDemo.Properties.Resources.en-US.resources -embed:Properties\Errors.resources,SatelliteLocDemo.Properties.Errors.en-US.resources -template:bin\x64\Debug\SatelliteLocDemo.dll -culture:en-US -platform:x64 -out:%enusPath%\SatelliteLocDemo.resources.dll

echo "fr-FR"
SET frfrPath="bin\x64\Debug\Languages\fr-FR"
if not exist %frfrPath% mkdir %frfrPath%
%al% -embed:%resourcesPath%\Resources.fr-FR.resources,SatelliteLocDemo.Properties.Resources.fr-FR.resources -embed:%resourcesPath%\Errors.fr-FR.resources,SatelliteLocDemo.Properties.Errors.fr-FR.resources -template:bin\x64\Debug\SatelliteLocDemo.dll -culture:fr-FR -platform:x64 -out:%frfrPath%\SatelliteLocDemo.resources.dll

echo "de-DE"
SET dedePath="bin\x64\Debug\Languages\de-DE"
if not exist %dedePath% mkdir %dedePath%
%al% -embed:%resourcesPath%\Resources.de-DE.resources,SatelliteLocDemo.Properties.Resources.de-DE.resources -embed:%resourcesPath%\Errors.de-DE.resources,SatelliteLocDemo.Properties.Errors.de-DE.resources -template:bin\x64\Debug\SatelliteLocDemo.dll -culture:de-DE -platform:x64 -out:%dedePath%\SatelliteLocDemo.resources.dll