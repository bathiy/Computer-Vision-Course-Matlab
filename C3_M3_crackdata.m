load CrackData.mat;
histogram(crackData.Area, 30);
cutoffregion = 4000;
crackData.Risk = discretize(crackData.Area, [0, cutoffregion, inf], "categorical", ["Mild", "Severe"]);
crackinfo = imageDatastore(crackData.fileName(crackData.Risk == "Severe"));

selectedrows = crackData.Risk == "Severe";
severcrack = crackData(selectedrows, :);