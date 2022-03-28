SET resgen="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\ResGen.exe"
SET al="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\x64\al.exe"
%resgen% Properties\Resources.resx
%resgen% Properties\Errors.resx
%resgen% Properties\Resources.fr-FR.resx
%resgen% Properties\Errors.fr-FR.resx
%resgen% Properties\Resources.de-DE.resx
%resgen% Properties\Errors.de-DE.resx

%al% -target:lib -embed:Properties\Resources.resources,SatelliteLocDemo.Properties.Resources.en-US.resources -embed:Properties\Errors.resources,SatelliteLocDemo.Properties.Errors.en-US.resources -template:bin\x64\Debug\SatelliteLocDemo.dll -culture:en-US -out:bin\x64\Debug\en-US\SatelliteLocDemo.resources.dll 

%al% -target:lib -embed:Properties\Resources.fr-FR.resources,SatelliteLocDemo.Properties.Resources.fr-FR.resources -embed:Properties\Errors.fr-FR.resources,SatelliteLocDemo.Properties.Errors.fr-FR.resources -template:bin\x64\Debug\SatelliteLocDemo.dll -culture:fr-FR -out:bin\x64\Debug\fr-FR\SatelliteLocDemo.resources.dll 

%al% -target:lib -embed:Properties\Resources.de-DE.resources,SatelliteLocDemo.Properties.Resources.de-DE.resources -embed:Properties\Errors.de-DE.resources,SatelliteLocDemo.Properties.Errors.de-DE.resources -template:bin\x64\Debug\SatelliteLocDemo.dll -culture:de-DE -out:bin\x64\Debug\de-DE\SatelliteLocDemo.resources.dll 
