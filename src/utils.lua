--
-- Copyright (C) 2019  Andreas Lüthi
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>

function canId2Text(canId)
    if canId2TextTable[canId] == nil then
        return ""
    else
        return "(" .. canId2TextTable[canId] .. ")"
    end
end

function getValue(buffer, dataType, canId)
    if dataType == 2 then
        return buffer:float()
    elseif dataType == 3 then
        return buffer:int()
    elseif dataType == 12 then
        return buffer(0, 4):uint()
    elseif dataType == 15 then
        if canId == 1200 then
            -- utc
            return buffer(0, 1):uint() * 3600 + (buffer(1, 1):uint() * 60) + buffer(2, 1):uint()
        end
        return buffer(0, 4):uint()
    elseif dataType == 16 then
        return buffer:uint()
    elseif dataType == 30 then
        return buffer:uint() % 1E7 -- todo correct ??
    elseif dataType == 31 then
        return buffer:uint() / 1E7 -- todo correct ??
    else
        return buffer
    end
end

canId2TextTable = {
    [300] = "Body Longitudinal Acceleration",
    [301] = "Body Lateral Acceleration",
    [302] = "Body Normal Acceleration",
    [303] = "Body Pitch Rate",
    [304] = "Body Roll Rate",
    [305] = "Body Yaw Rate",
    [306] = "Rudder Position",
    [307] = "Stabilizer Position",
    [308] = "Elevator Position",
    [309] = "Left Aileron Position",
    [310] = "Right Aileron Position",
    [311] = "Body Pitch Angle",
    [312] = "Body Roll Angle",
    [313] = "Body Sideslip",
    [314] = "Altitude Rate",
    [315] = "Indicated Airspeed",
    [316] = "True Airspeed",
    [317] = "Calibrated Airspeed",
    [318] = "Mach Number",
    [319] = "Baro Correction",
    [320] = "Baro Corrected Altitude",
    [321] = "Heading Angle",
    [322] = "Standard Altitude",
    [323] = "Total Air Temperature",
    [324] = "Static Air Temperature",
    [325] = "Differential Pressure",
    [326] = "Static Pressure",
    [327] = "Heading Rate",
    [328] = "Port Side Angle Of Attack",
    [329] = "Starbord Side Angle Of Attack",
    [330] = "Density Altitude",
    [331] = "Turn Coordination Rate",
    [332] = "True Altitude",
    [333] = "Wind Speed",
    [334] = "Wind Direction",
    [335] = "Outside Air Temperature",
    [336] = "Body Normal Velocity",
    [337] = "Body Longitudinal Velocity",
    [338] = "Body Lateral Velocity",
    [339] = "Total Pressure",

    [400] = "Pitch Control Position",
    [401] = "Roll Control Position",
    [402] = "Lateral Stick Trim Position Command",
    [403] = "Yaw Control Position",
    [404] = "Collective Control Position",
    [405] = "Longitudinal Stick Trim Position Command",
    [406] = "Directional Pedals Trim Position Command",
    [407] = "Collective Lever Trim Position Command",
    [408] = "Cyclic Control Stick Switches",
    [409] = "Lateral Trim Speed",
    [410] = "Longitudinal Trim Speed",
    [411] = "Pedal Trim Speed",
    [412] = "Collective Trim Speed",
    [413] = "Nose Wheel Steering Handle Position",
    [414] = "Engine 1 Throttle Lever Position Ecs Channel A",
    [415] = "Engine 2 Throttle Lever Position Ecs Channel A",
    [416] = "Engine 3 Throttle Lever Position Ecs Channel A",
    [417] = "Engine 4 Throttle Lever Position Ecs Channel A",
    [418] = "Engine 1 Condition Lever Position Ecs Channel A",
    [419] = "Engine 2 Condition Lever Position Ecs Channel A",
    [420] = "Engine 3 Condition Lever Position Ecs Channel A",
    [421] = "Engine 4 Condition Lever Position Ecs Channel A",
    [422] = "Engine 1 Throttle Lever Position Ecs Channel B",
    [423] = "Engine 2 Throttle Lever Position Ecs Channel B",
    [424] = "Engine 3 Throttle Lever Position Ecs Channel B",
    [425] = "Engine 4 Throttle Lever Position Ecs Channel B",
    [426] = "Engine 1 Condition Lever Position Ecs Channel B",
    [427] = "Engine 2 Condition Lever Position Ecs Channel B",
    [428] = "Engine 3 Condition Lever Position Ecs Channel B",
    [429] = "Engine 4 Condition Lever Position Ecs Channel B",
    [430] = "Flaps Lever Position",
    [431] = "Slats Lever Position",
    [432] = "Park Brake Lever Position",
    [433] = "Speedbrake Lever Position",
    [434] = "Throttle Max Lever Position",
    [435] = "Pilot Left Brake Pedal Position",
    [436] = "Pilot Right Brake Pedal Position",
    [437] = "Copilot Left Brake Pedal Position",
    [438] = "Copilot Right Brake Pedal Position",
    [439] = "Trim System Switches",
    [440] = "Trim System Lights",
    [441] = "Collective Control Stick Switches",
    [442] = "Stick Shaker Stall Warning Device",
    [500] = "Engine 1 N1 Ecs Channel A",
    [501] = "Engine 2 N1 Ecs Channel A",
    [502] = "Engine 3 N1 Ecs Channel A",
    [503] = "Engine 4 N1 Ecs Channel A",
    [504] = "Engine 1 N2 Ecs Channel A",
    [505] = "Engine 2 N2 Ecs Channel A",
    [506] = "Engine 3 N2 Ecs Channel A",
    [507] = "Engine 4 N2 Ecs Channel A",
    [508] = "Engine 1 Torque Ecs Channel A",
    [509] = "Engine 2 Torque Ecs Channel A",
    [510] = "Engine 3 Torque Ecs Channel A",
    [511] = "Engine 4 Torque Ecs Channel A",
    [512] = "Engine 1 Turbine Inlet Temperature Ecs Channel A",
    [513] = "Engine 2 Turbine Inlet Temperature Ecs Channel A",
    [514] = "Engine 3 Turbine Inlet Temperature Ecs Channel A",
    [515] = "Engine 4 Turbine Inlet Temperature Ecs Channel A",
    [516] = "Engine 1 Inter Turbine Temperature Ecs Channel A",
    [517] = "Engine 2 Inter Turbine Temperature Ecs Channel A",
    [518] = "Engine 3 Inter Turbine Temperature Ecs Channel A",
    [519] = "Engine 4 Inter Turbine Temperature Ecs Channel A",
    [520] = "Engine 1 Turbine Outlet Temperature Ecs Channel A",
    [521] = "Engine 2 Turbine Outlet Temperature Ecs Channel A",
    [522] = "Engine 3 Turbine Outlet Temperature Ecs Channel A",
    [523] = "Engine 4 Turbine Outlet Temperature Ecs Channel A",
    [524] = "Engine 1 Fuel Flow Rate Ecs Channel A",
    [525] = "Engine 2 Fuel Flow Rate Ecs Channel A",
    [526] = "Engine 3 Fuel Flow Rate Ecs Channel A",
    [527] = "Engine 4 Fuel Flow Rate Ecs Channel A",
    [528] = "Engine 1 Manifold Pressure Ecs Channel A",
    [529] = "Engine 2 Manifold Pressure Ecs Channel A",
    [530] = "Engine 3 Manifold Pressure Ecs Channel A",
    [531] = "Engine 4 Manifold Pressure Ecs Channel A",
    [532] = "Engine 1 Oil Pressure Ecs Channel A",
    [533] = "Engine 2 Oil Pressure Ecs Channel A",
    [534] = "Engine 3 Oil Pressure Ecs Channel A",
    [535] = "Engine 4 Oil Pressure Ecs Channel A",
    [536] = "Engine 1 Oil Temperature Ecs Channel A",
    [537] = "Engine 2 Oil Temperature Ecs Channel A",
    [538] = "Engine 3 Oil Temperature Ecs Channel A",
    [539] = "Engine 4 Oil Temperature Ecs Channel A",
    [540] = "Engine 1 Cylinder Head Temperature Ecs Channel A",
    [541] = "Engine 2 Cylinder Head Temperature Ecs Channel A",
    [542] = "Engine 3 Cylinder Head Temperature Ecs Channel A",
    [543] = "Engine 4 Cylinder Head Temperature Ecs Channel A",
    [544] = "Engine 1 Oil Quantity Ecs Channel A",
    [545] = "Engine 2 Oil Quantity Ecs Channel A",
    [546] = "Engine 3 Oil Quantity Ecs Channel A",
    [547] = "Engine 4 Oil Quantity Ecs Channel A",
    [548] = "Engine 1 Cooland Temperature Ecs Channel A",
    [549] = "Engine 2 Cooland Temperature Ecs Channel A",
    [550] = "Engine 3 Cooland Temperature Ecs Channel A",
    [551] = "Engine 4 Cooland Temperature Ecs Channel A",
    [552] = "Engine 1 Power Rating Ecs Channel A",
    [553] = "Engine 2 Power Rating Ecs Channel A",
    [554] = "Engine 3 Power Rating Ecs Channel A",
    [555] = "Engine 4 Power Rating Ecs Channel A",
    [556] = "Engine 1 Status 1 Ecs Channel A",
    [557] = "Engine 2 Status 1 Ecs Channel A",
    [558] = "Engine 3 Status 1 Ecs Channel A",
    [559] = "Engine 4 Status 1 Ecs Channel A",
    [560] = "Engine 1 Status 2 Ecs Channel A",
    [561] = "Engine 2 Status 2 Ecs Channel A",
    [562] = "Engine 3 Status 2 Ecs Channel A",
    [563] = "Engine 4 Status 2 Ecs Channel A",
    [564] = "Engine 1 N1 Ecs Channel B",
    [565] = "Engine 2 N1 Ecs Channel B",
    [566] = "Engine 3 N1 Ecs Channel B",
    [567] = "Engine 4 N1 Ecs Channel B",
    [568] = "Engine 1 N2 Ecs Channel B",
    [569] = "Engine 2 N2 Ecs Channel B",
    [570] = "Engine 3 N2 Ecs Channel B",
    [571] = "Engine 4 N2 Ecs Channel B",
    [572] = "Engine 1 Torque Ecs Channel B",
    [573] = "Engine 2 Torque Ecs Channel B",
    [574] = "Engine 3 Torque Ecs Channel B",
    [575] = "Engine 4 Torque Ecs Channel B",
    [576] = "Engine 1 Turbine Inlet Temperature Ecs Channel B",
    [577] = "Engine 2 Turbine Inlet Temperature Ecs Channel B",
    [578] = "Engine 3 Turbine Inlet Temperature Ecs Channel B",
    [579] = "Engine 4 Turbine Inlet Temperature Ecs Channel B",
    [580] = "Engine 1 Inter Turbine Temperature Ecs Channel B",
    [581] = "Engine 2 Inter Turbine Temperature Ecs Channel B",
    [582] = "Engine 3 Inter Turbine Temperature Ecs Channel B",
    [583] = "Engine 4 Inter Turbine Temperature Ecs Channel B",
    [584] = "Engine 1 Turbine Outlet Temperature Ecs Channel B",
    [585] = "Engine 2 Turbine Outlet Temperature Ecs Channel B",
    [586] = "Engine 3 Turbine Outlet Temperature Ecs Channel B",
    [587] = "Engine 4 Turbine Outlet Temperature Ecs Channel B",
    [588] = "Engine 1 Fuel Flow Rate Ecs Channel B",
    [589] = "Engine 2 Fuel Flow Rate Ecs Channel B",
    [590] = "Engine 3 Fuel Flow Rate Ecs Channel B",
    [591] = "Engine 4 Fuel Flow Rate Ecs Channel B",
    [592] = "Engine 1 Manifold Pressure Ecs Channel B",
    [593] = "Engine 2 Manifold Pressure Ecs Channel B",
    [594] = "Engine 3 Manifold Pressure Ecs Channel B",
    [595] = "Engine 4 Manifold Pressure Ecs Channel B",
    [596] = "Engine 1 Oil Pressure Ecs Channel B",
    [597] = "Engine 2 Oil Pressure Ecs Channel B",
    [598] = "Engine 3 Oil Pressure Ecs Channel B",
    [599] = "Engine 4 Oil Pressure Ecs Channel B",
    [600] = "Engine 1 Oil Temperature Ecs Channel B",
    [601] = "Engine 2 Oil Temperature Ecs Channel B",
    [602] = "Engine 3 Oil Temperature Ecs Channel B",
    [603] = "Engine 4 Oil Temperature Ecs Channel B",
    [604] = "Engine 1 Cylinder Head Temperature Ecs Channel B",
    [605] = "Engine 2 Cylinder Head Temperature Ecs Channel B",
    [606] = "Engine 3 Cylinder Head Temperature Ecs Channel B",
    [607] = "Engine 4 Cylinder Head Temperature Ecs Channel B",
    [608] = "Engine 1 Oil Quantity Ecs Channel B",
    [609] = "Engine 2 Oil Quantity Ecs Channel B",
    [610] = "Engine 3 Oil Quantity Ecs Channel B",
    [611] = "Engine 4 Oil Quantity Ecs Channel B",
    [612] = "Engine 1 Coolant Temperature Ecs Channel B",
    [613] = "Engine 2 Coolant Temperature Ecs Channel B",
    [614] = "Engine 3 Coolant Temperature Ecs Channel B",
    [615] = "Engine 4 Coolant Temperature Ecs Channel B",
    [616] = "Engine 1 Power Rating Ecs Channel B",
    [617] = "Engine 2 Power Rating Ecs Channel B",
    [618] = "Engine 3 Power Rating Ecs Channel B",
    [619] = "Engine 4 Power Rating Ecs Channel B",
    [620] = "Engine 1 Status 1 Ecs Channel B",
    [621] = "Engine 2 Status 1 Ecs Channel B",
    [622] = "Engine 3 Status 1 Ecs Channel B",
    [623] = "Engine 4 Status 1 Ecs Channel B",
    [624] = "Engine 1 Status 2 Ecs Channel B",
    [625] = "Engine 2 Status 2 Ecs Channel B",
    [626] = "Engine 3 Status 2 Ecs Channel B",
    [627] = "Engine 4 Status 2 Ecs Channel B",
    [660] = "Fuel Pump 1 Flow Rate",
    [661] = "Fuel Pump 2 Flow Rate",
    [662] = "Fuel Pump 3 Flow Rate",
    [663] = "Fuel Pump 4 Flow Rate",
    [664] = "Fuel Pump 5 Flow Rate",
    [665] = "Fuel Pump 6 Flow Rate",
    [666] = "Fuel Pump 7 Flow Rate",
    [667] = "Fuel Pump 8 Flow Rate",
    [668] = "Fuel Tank 1 Quantity",
    [669] = "Fuel Tank 2 Quantity",
    [670] = "Fuel Tank 3 Quantity",
    [671] = "Fuel Tank 4 Quantity",
    [672] = "Fuel Tank 5 Quantity",
    [673] = "Fuel Tank 6 Quantity",
    [674] = "Fuel Tank 7 Quantity",
    [675] = "Fuel Tank 8 Quantity",
    [676] = "Fuel Tank 1 Temperature",
    [677] = "Fuel Tank 2 Temperature",
    [678] = "Fuel Tank 3 Temperature",
    [679] = "Fuel Tank 4 Temperature",
    [680] = "Fuel Tank 5 Temperature",
    [681] = "Fuel Tank 6 Temperature",
    [682] = "Fuel Tank 7 Temperature",
    [683] = "Fuel Tank 8 Temperature",
    [684] = "Fuel System 1 Pressure",
    [685] = "Fuel System 2 Pressure",
    [686] = "Fuel System 3 Pressure",
    [687] = "Fuel System 4 Pressure",
    [688] = "Fuel System 5 Pressure",
    [689] = "Fuel System 6 Pressure",
    [690] = "Fuel System 7 Pressure",
    [691] = "Fuel System 8 Pressure",
    [700] = "Rotor 1 Rpm",
    [701] = "Rotor 2 Rpm",
    [702] = "Rotor 3 Rpm",
    [703] = "Rotor 4 Rpm",
    [704] = "Gearbox 1 Speed",
    [705] = "Gearbox 2 Speed",
    [706] = "Gearbox 3 Speed",
    [707] = "Gearbox 4 Speed",
    [708] = "Gearbox 5 Speed",
    [709] = "Gearbox 6 Speed",
    [710] = "Gearbox 7 Speed",
    [711] = "Gearbox 8 Speed",
    [712] = "Gearbox 1 Oil Pressure",
    [713] = "Gearbox 2 Oil Pressure",
    [714] = "Gearbox 3 Oil Pressure",
    [715] = "Gearbox 4 Oil Pressure",
    [716] = "Gearbox 5 Oil Pressure",
    [717] = "Gearbox 6 Oil Pressure",
    [718] = "Gearbox 7 Oil Pressure",
    [719] = "Gearbox 8 Oil Pressure",
    [720] = "Gearbox 1 Oil Temperature",
    [721] = "Gearbox 2 Oil Temperature",
    [722] = "Gearbox 3 Oil Temperature",
    [723] = "Gearbox 4 Oil Temperature",
    [724] = "Gearbox 5 Oil Temperature",
    [725] = "Gearbox 6 Oil Temperature",
    [726] = "Gearbox 7 Oil Temperature",
    [727] = "Gearbox 8 Oil Temperature",
    [728] = "Gearbox 1 Oil Quantity",
    [729] = "Gearbox 2 Oil Quantity",
    [730] = "Gearbox 3 Oil Quantity",
    [731] = "Gearbox 4 Oil Quantity",
    [732] = "Gearbox 5 Oil Quantity",
    [733] = "Gearbox 6 Oil Quantity",
    [734] = "Gearbox 7 Oil Quantity",
    [735] = "Gearbox 8 Oil Quantity",
    [800] = "Hydraulic System 1 Pressure",
    [801] = "Hydraulic System 2 Pressure",
    [802] = "Hydraulic System 3 Pressure",
    [803] = "Hydraulic System 4 Pressure",
    [804] = "Hydraulic System 5 Pressure",
    [805] = "Hydraulic System 6 Pressure",
    [806] = "Hydraulic System 7 Pressure",
    [807] = "Hydraulic System 8 Pressure",
    [808] = "Hydraulic System 1 Fluid Temperature",
    [809] = "Hydraulic System 2 Fluid Temperature",
    [810] = "Hydraulic System 3 Fluid Temperature",
    [811] = "Hydraulic System 4 Fluid Temperature",
    [812] = "Hydraulic System 5 Fluid Temperature",
    [813] = "Hydraulic System 6 Fluid Temperature",
    [814] = "Hydraulic System 7 Fluid Temperature",
    [815] = "Hydraulic System 8 Fluid Temperature",
    [816] = "Hydraulic System 1 Fluid Quantity",
    [817] = "Hydraulic System 2 Fluid Quantity",
    [818] = "Hydraulic System 3 Fluid Quantity",
    [819] = "Hydraulic System 4 Fluid Quantity",
    [820] = "Hydraulic System 5 Fluid Quantity",
    [821] = "Hydraulic System 6 Fluid Quantity",
    [822] = "Hydraulic System 7 Fluid Quantity",
    [823] = "Hydraulic System 8 Fluid Quantity",
    [900] = "Ac System 1 Voltage",
    [901] = "Ac System 2 Voltage",
    [902] = "Ac System 3 Voltage",
    [903] = "Ac System 4 Voltage",
    [904] = "Ac System 5 Voltage",
    [905] = "Ac System 6 Voltage",
    [906] = "Ac System 7 Voltage",
    [907] = "Ac System 8 Voltage",
    [908] = "Ac System 9 Voltage",
    [909] = "Ac System 10 Voltage",
    [910] = "Ac System 1 Current",
    [911] = "Ac System 2 Current",
    [912] = "Ac System 3 Current",
    [913] = "Ac System 4 Current",
    [914] = "Ac System 5 Current",
    [915] = "Ac System 6 Current",
    [916] = "Ac System 7 Current",
    [917] = "Ac System 8 Current",
    [918] = "Ac System 9 Current",
    [919] = "Ac System 10 Current",
    [920] = "Dc System 1 Voltage",
    [921] = "Dc System 2 Voltage",
    [922] = "Dc System 3 Voltage",
    [923] = "Dc System 4 Voltage",
    [924] = "Dc System 5 Voltage",
    [925] = "Dc System 6 Voltage",
    [926] = "Dc System 7 Voltage",
    [927] = "Dc System 8 Voltage",
    [928] = "Dc System 9 Voltage",
    [929] = "Dc System 10 Voltage",
    [930] = "Dc System 1 Current",
    [931] = "Dc System 2 Current",
    [932] = "Dc System 3 Current",
    [933] = "Dc System 4 Current",
    [934] = "Dc System 5 Current",
    [935] = "Dc System 6 Current",
    [936] = "Dc System 7 Current",
    [937] = "Dc System 8 Current",
    [938] = "Dc System 9 Current",
    [939] = "Dc System 10 Current",
    [940] = "Prop 1 Iceguard Dc Current",
    [941] = "Prop 2 Iceguard Dc Current",
    [942] = "Prop 3 Iceguard Dc Current",
    [943] = "Prop 4 Iceguard Dc Current",
    [944] = "Prop 5 Iceguard Dc Current",
    [945] = "Prop 6 Iceguard Dc Current",
    [946] = "Prop 7 Iceguard Dc Current",
    [947] = "Prop 8 Iceguard Dc Current",
    [948] = "Prop 9 Iceguard Dc Current",
    [949] = "Prop 10 Iceguard Dc Current",
    [1000] = "Active Nav System Waypoint Latitude",
    [1001] = "Active Nav System Waypoint Longitude",
    [1002] = "Active Nav System Waypoint Height Above Ellipsoid",
    [1003] = "Active Nav System Waypoint Altitude",
    [1004] = "Active Nav System Ground Speed",
    [1005] = "Active Nav System True Track",
    [1006] = "Active Nav System Magnetic Track",
    [1007] = "Active Nav System Cross Track Error",
    [1008] = "Active Nav System Track Error Angle",
    [1009] = "Active Nav System Time To Go",
    [1010] = "Active Nav System Estimated Time Of Arrival",
    [1011] = "Active Nav System Estimated Enroute Time",
    [1012] = "Nav Waypoint Identifier 0 3",
    [1013] = "Nav Waypoint Identifier 4 7",
    [1014] = "Nav Waypoint Identifier 8 11",
    [1015] = "Nav Waypoint Identifier 12 15",
    [1016] = "Nav Waypoint Type Identifier",
    [1017] = "Nav Waypoint Latitude",
    [1018] = "Nav Waypoint Longitude",
    [1019] = "Nav Waypoint Minimum Altitude",
    [1020] = "Nav Waypoint Minimum Flight Level",
    [1021] = "Nav Waypoint Minimum Radar Height",
    [1022] = "Nav Waypoint Minimum Height Above Ellipsoid",
    [1023] = "Nav Waypoint Maximum Altitude",
    [1024] = "Nav Waypoint Maximum Flight Level",
    [1025] = "Nav Waypoint Maximum Radar Height",
    [1026] = "Nav Waypoint Maximum Height Above Ellipsoid",
    [1027] = "Nav Waypoint Planned Altitude",
    [1028] = "Nav Waypoint Planned Flight Level",
    [1029] = "Nav Waypoint Planned Radar Height",
    [1030] = "Nav Waypoint Planned Height Above Ellipsoid",
    [1031] = "Distance To Nav Waypoint",
    [1032] = "Time To Go To Nav Waypoint",
    [1033] = "Nav Waypoint Estimated Time Of Arrival",
    [1034] = "Nav Waypoint Estimated Enroute Time",
    [1035] = "Nav Waypoint Status Information",
    [1036] = "Gps Aircraft Latitude",
    [1037] = "Gps Aircraft Longitude",
    [1038] = "Gps Aircraft Height Above Ellipsoid",
    [1039] = "Gps Ground Speed",
    [1040] = "Gps True Track",
    [1041] = "Gps Magnetic Track",
    [1042] = "Gps Cross Track Error",
    [1043] = "Gps Track Error Angle",
    [1044] = "Gps Glideslope Deviation",
    [1045] = "Gps Predicted Raim",
    [1046] = "Gps Vertical Figure Of Merit",
    [1047] = "Gps Horizontal Figure Of Merit",
    [1048] = "Gps Mode Of Operation",
    [1049] = "Ins Aircraft Latitude",
    [1050] = "Ins Aircraft Longitude",
    [1051] = "Ins Aircraft Height Above Ellipsoid",
    [1052] = "Ins Aircraft Ground Speed",
    [1053] = "Ins Aircraft True Track",
    [1054] = "Ins Aircraft Magnetic Track",
    [1055] = "Ins Aircraft Cross Track Error",
    [1056] = "Ins Aircraft Track Error Angle",
    [1057] = "Ins Vertical Figure Of Merit",
    [1058] = "Ins Horizontal Figure Of Merit",
    [1059] = "Auxiliary Nav System Aircraft Latitude",
    [1060] = "Auxiliary Nav System Aircraft Longitude",
    [1061] = "Auxiliary Nav System Aircraft Height Above Ellipsoid",
    [1062] = "Auxiliary Nav System Aircraft Ground Speed",
    [1063] = "Auxiliary Nav System Aircraft True Track",
    [1064] = "Auxiliary Nav System Aircraft Magnetic Track",
    [1065] = "Auxiliary Nav System Aircraft Cross Track Error",
    [1066] = "Auxiliary Nav System Aircraft Track Error Angle",
    [1067] = "Auxiliary Nav System Vertical Figure Of Merit",
    [1068] = "Auxiliary Nav System Horizontal Figure Of Merit",
    [1069] = "Magnetic Heading",
    [1070] = "Radio Height",
    [1071] = "Dme 1 Distance",
    [1072] = "Dme 2 Distance",
    [1073] = "Dme 3 Distance",
    [1074] = "Dme 4 Distance",
    [1075] = "Dme 1 Time To Go",
    [1076] = "Dme 2 Time To Go",
    [1077] = "Dme 3 Time To Go",
    [1078] = "Dme 4 Time To Go",
    [1079] = "Dme 1 Ground Speed",
    [1080] = "Dme 2 Ground Speed",
    [1081] = "Dme 3 Ground Speed",
    [1082] = "Dme 4 Ground Speed",
    [1083] = "Adf 1 Bearing",
    [1084] = "Adf 2 Bearing",
    [1085] = "Adf 3 Bearing",
    [1086] = "Adf 4 Bearing",
    [1087] = "Ils 1 Localize Deviation",
    [1088] = "Ils 2 Localize Deviation",
    [1089] = "Ils 3 Localize Deviation",
    [1090] = "Ils 4 Localize Deviation",
    [1091] = "Ils 1 Glideslope Deviation",
    [1092] = "Ils 2 Glideslope Deviation",
    [1093] = "Ils 3 Glideslope Deviation",
    [1094] = "Ils 4 Glideslope Deviation",
    [1095] = "Flight Director 1 Pitch Deviation",
    [1096] = "Flight Director 2 Pitch Deviation",
    [1097] = "Flight Director 1 Roll Deviation",
    [1098] = "Flight Director 2 Roll Deviation",
    [1099] = "Decision Height",
    [1100] = "Vhf 1 Com Frequency",
    [1101] = "Vhf 2 Com Frequency",
    [1102] = "Vhf 3 Com Frequency",
    [1103] = "Vhf 4 Com Frequency",
    [1104] = "Vor Ils 1 Frequency",
    [1105] = "Vor Ils 2 Frequency",
    [1106] = "Vor Ils 3 Frequency",
    [1107] = "Vor Ils 4 Frequency",
    [1108] = "Adf 1 Frequency",
    [1109] = "Adf 2 Frequency",
    [1110] = "Adf 3 Frequency",
    [1111] = "Adf 4 Frequency",
    [1112] = "Dme 1 Channel",
    [1113] = "Dme 2 Channel",
    [1114] = "Dme 3 Channel",
    [1115] = "Dme 4 Channel",
    [1116] = "Transponder 1 Code",
    [1117] = "Transponder 2 Code",
    [1118] = "Transponder 3 Code",
    [1119] = "Transponder 4 Code",
    [1120] = "Desired Track Angle",
    [1121] = "Magnetic Variation",
    [1122] = "Selected Glidepath Angle",
    [1123] = "Selected Runway Heading",
    [1124] = "Computed Vertical Velocity",
    [1125] = "Selected Course",
    [1126] = "Vor 1 Radial",
    [1127] = "Vor 2 Radial",
    [1128] = "Vor 3 Radial",
    [1129] = "Vor 4 Radial",
    [1130] = "True East Velocity",
    [1131] = "True North Velocity",
    [1132] = "True Up Velocity",
    [1133] = "True Heading",
    [1175] = "Gear Lever Switches",
    [1176] = "Gear Lever Lights Wow Solenoid",
    [1177] = "Landing Gear 1 Tire Pressure",
    [1178] = "Landing Gear 2 Tire Pressure",
    [1179] = "Landing Gear 3 Tire Pressure",
    [1180] = "Landing Gear 4 Tire Pressure",
    [1181] = "Landing Gear 1 Brake Pad Thickness",
    [1182] = "Landing Gear 2 Brake Pad Thickness",
    [1183] = "Landing Gear 3 Brake Pad Thickness",
    [1184] = "Landing Gear 4 Brake Pad Thickness",
    [1200] = "Utc",
    [1201] = "Cabin Pressure",
    [1202] = "Cabin Altitude",
    [1203] = "Cabin Temperature",
    [1204] = "Longitudinal Center Of Gravity",
    [1205] = "Lateral Center Of Gravity",
    [1206] = "Date"
}