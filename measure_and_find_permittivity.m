
catalogue{1,1} = xlsread('honeycombEpsilon_wallPermittivity1_wallThickness1mm.xlsx');
catalogue{1,2} = xlsread('honeycombEpsilon_wallPermittivity1_wallThickness1.5mm.xlsx');
catalogue{1,3} = xlsread('honeycombEpsilon_wallPermittivity1_wallThickness2mm.xlsx');
catalogue{1,4} = xlsread('honeycombEpsilon_wallPermittivity1_wallThickness3mm.xlsx');
catalogue{2,1} = xlsread('honeycombEpsilon_wallPermittivity2_wallThickness1mm.xlsx');
catalogue{2,2} = xlsread('honeycombEpsilon_wallPermittivity2_wallThickness1.5mm.xlsx');
catalogue{2,3} = xlsread('honeycombEpsilon_wallPermittivity2_wallThickness2mm.xlsx');
catalogue{2,4} = xlsread('honeycombEpsilon_wallPermittivity2_wallThickness3mm.xlsx');
catalogue{3,1} = xlsread('honeycombEpsilon_wallPermittivity3_wallThickness1mm.xlsx');
catalogue{3,2} = xlsread('honeycombEpsilon_wallPermittivity3_wallThickness1.5mm.xlsx');
catalogue{3,3} = xlsread('honeycombEpsilon_wallPermittivity3_wallThickness2mm.xlsx');
catalogue{3,4} = xlsread('honeycombEpsilon_wallPermittivity3_wallThickness3mm.xlsx');
catalogue{4,1} = xlsread('honeycombEpsilon_wallPermittivity4_wallThickness1mm.xlsx');
catalogue{4,2} = xlsread('honeycombEpsilon_wallPermittivity4_wallThickness1.5mm.xlsx');
catalogue{4,3} = xlsread('honeycombEpsilon_wallPermittivity4_wallThickness2mm.xlsx');
catalogue{4,4} = xlsread('honeycombEpsilon_wallPermittivity4_wallThickness3mm.xlsx');
catalogue{5,1} = xlsread('honeycombEpsilon_wallPermittivity5_wallThickness1mm.xlsx');
catalogue{5,2} = xlsread('honeycombEpsilon_wallPermittivity5_wallThickness1.5mm.xlsx');
catalogue{5,3} = xlsread('honeycombEpsilon_wallPermittivity5_wallThickness2mm.xlsx');
catalogue{5,4} = xlsread('honeycombEpsilon_wallPermittivity5_wallThickness3mm.xlsx');
catalogue{6,1} = xlsread('honeycombEpsilon_wallPermittivity6_wallThickness1mm.xlsx');
catalogue{6,2} = xlsread('honeycombEpsilon_wallPermittivity6_wallThickness1.5mm.xlsx');
catalogue{6,3} = xlsread('honeycombEpsilon_wallPermittivity6_wallThickness2mm.xlsx');
catalogue{6,4} = xlsread('honeycombEpsilon_wallPermittivity6_wallThickness3mm.xlsx');
catalogue{7,1} = xlsread('honeycombEpsilon_wallPermittivity7_wallThickness1mm.xlsx');
catalogue{7,2} = xlsread('honeycombEpsilon_wallPermittivity7_wallThickness1.5mm.xlsx');
catalogue{7,3} = xlsread('honeycombEpsilon_wallPermittivity7_wallThickness2mm.xlsx');
catalogue{7,4} = xlsread('honeycombEpsilon_wallPermittivity7_wallThickness3mm.xlsx');
catalogue{8,1} = xlsread('honeycombEpsilon_wallPermittivity8_wallThickness1mm.xlsx');
catalogue{8,2} = xlsread('honeycombEpsilon_wallPermittivity8_wallThickness1.5mm.xlsx');
catalogue{8,3} = xlsread('honeycombEpsilon_wallPermittivity8_wallThickness2mm.xlsx');
catalogue{8,4} = xlsread('honeycombEpsilon_wallPermittivity8_wallThickness3mm.xlsx');
catalogue{9,1} = xlsread('honeycombEpsilon_wallPermittivity9_wallThickness1mm.xlsx');
catalogue{9,2} = xlsread('honeycombEpsilon_wallPermittivity9_wallThickness1.5mm.xlsx');
catalogue{9,3} = xlsread('honeycombEpsilon_wallPermittivity9_wallThickness2mm.xlsx');
catalogue{9,4} = xlsread('honeycombEpsilon_wallPermittivity9_wallThickness3mm.xlsx');


liquidPermittivity = 50;
materialPermittivity = 1;
wallThickness = 3;
sideLength = 2.5;


for j = 1:4
    if isequal( catalogue{materialPermittivity,j}(1,1) , wallThickness )
        catalogueWallThickness = catalogue{materialPermittivity,j}(1,1);
        catalogue{materialPermittivity,j}(1,1) = 0;     
        sideLengthIndex = catalogue{materialPermittivity,j}(1,:) == ones(1 ,length(catalogue{materialPermittivity,j}(1,:)) ) *sideLength;
        sideLengthIndex = find(sideLengthIndex==1);
        liquidIndex = catalogue{materialPermittivity,j}(:,1) == ones( length(catalogue{materialPermittivity,j}(:,1)) , 1) * liquidPermittivity;
        liquidIndex = find(liquidIndex==1);  
        catalogue{materialPermittivity,j}(1,1) = catalogueWallThickness;      
        effectivePermittivity = catalogue{materialPermittivity,j}(liquidIndex,sideLengthIndex);
    end
end
fprintf( "Effective permittivity is: %.4f F/m \n ", effectivePermittivity );
