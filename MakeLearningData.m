%1

%a01 = makeCIofHRV(1, 'a01', 0.1);
%a02 = makeCIofHRV(1, 'a02', 0.1);
a03 = makeCIofHRV(1, 'a03', 0.1);
a04 = makeCIofHRV(1, 'a04', 0.1);
a05 = makeCIofHRV(1, 'a05', 0.1);
%a06 = makeCIofHRV(1, 'a06', 0.1);
a07 = makeCIofHRV(1, 'a07', 0.1);
a08 = makeCIofHRV(1, 'a08', 0.1);
%a09 = makeCIofHRV(1, 'a09', 0.1);
%a10 = makeCIofHRV(1, 'a10', 0.1);
%a11 = makeCIofHRV(1, 'a11', 0.1);
%a12 = makeCIofHRV(1, 'a12', 0.1);
a13 = makeCIofHRV(1, 'a13', 0.1);
%a14 = makeCIofHRV(1, 'a14', 0.1);
a15 = makeCIofHRV(1, 'a15', 0.1);
a16 = makeCIofHRV(1, 'a16', 0.1);
%a17 = makeCIofHRV(1, 'a17', 0.1);
%a18 = makeCIofHRV(1, 'a18', 0.1);
a19 = makeCIofHRV(1, 'a19', 0.1);
%a20 = makeCIofHRV(1, 'a20', 0.1);
%b01 = makeCIofHRV(1, 'b01', 0.1);
b02 = makeCIofHRV(1, 'b02', 0.1);
%b03 = makeCIofHRV(1, 'b03', 0.1);
%b04 = makeCIofHRV(1, 'b04', 0.1);
%b05 = makeCIofHRV(1, 'b05', 0.1);
c01 = makeCIofHRV(1, 'c01', 0.1);
c02 = makeCIofHRV(1, 'c02', 0.1);
%c03 = makeCIofHRV(1, 'c03', 0.1);
%c04 = makeCIofHRV(1, 'c04', 0.1);
%c05 = makeCIofHRV(1, 'c05', 0.1);
c06 = makeCIofHRV(1, 'c06', 0.05);
%c07 = makeCIofHRV(1, 'c07', 0.1);
%c08 = makeCIofHRV(1, 'c08', 0.1);
%c09 = makeCIofHRV(1, 'c09', 0.1);
%c10 = makeCIofHRV(1, 'c10', 0.1);


%2

slp01a = makeCIofHRV(2, 'slp01a', 0.1);
slp01b = makeCIofHRV(2, 'slp01b', 0.1);
%slp02a = makeCIofHRV(2, 'slp02a', 0.1);
%slp02b = makeCIofHRV(2, 'slp02b', 0.1);
slp03 = makeCIofHRV(2, 'slp03', 0.1);
slp04 = makeCIofHRV(2, 'slp04', 0.1);
slp14 = makeCIofHRV(2, 'slp14', 0.1);
slp16 = makeCIofHRV(2, 'slp16', 0.1);
slp32 = makeCIofHRV(2, 'slp32', 0.1);
%slp37 = makeCIofHRV(2, 'slp37', 0.1);
slp41 = makeCIofHRV(2, 'slp41', 0.1);
slp45 = makeCIofHRV(2, 'slp45', 0.1);
slp48 = makeCIofHRV(2, 'slp48', 0.1);
%slp59 = makeCIofHRV(2, 'slp59', 0.1);
slp60 = makeCIofHRV(2, 'slp60', 0.1);
slp61 = makeCIofHRV(2, 'slp61', 0.1);
slp66 = makeCIofHRV(2, 'slp66', 0.1);
%slp67x = makeCIofHRV(2, 'slp67x', 0.1);



slp01a = getECGcell(2, 'slp01a');
slp01b = getECGcell(2, 'slp01b');
slp02a = getECGcell(2, 'slp02a');
slp02b = getECGcell(2, 'slp02b');
slp03 = getECGcell(2, 'slp03');
slp04 = getECGcell(2, 'slp04');
slp14 = getECGcell(2, 'slp14');
slp16 = getECGcell(2, 'slp16');
slp32 = getECGcell(2, 'slp32');
slp37 = getECGcell(2, 'slp37');
slp41 = getECGcell(2, 'slp41');
slp45 = getECGcell(2, 'slp45');
slp48 = getECGcell(2, 'slp48');
slp59 = getECGcell(2, 'slp59');
slp60 = getECGcell(2, 'slp60');
slp61 = getECGcell(2, 'slp61');
slp66 = getECGcell(2, 'slp66');
slp67x = getECGcell(2, 'slp67x');





makeIMGdata(slp01a, 'slp01a');
makeIMGdata(slp01b, 'slp01b');
makeIMGdata(slp02a, 'slp02a');
makeIMGdata(slp02b, 'slp02b');
makeIMGdata(slp03, 'slp03');
makeIMGdata(slp04, 'slp04');
makeIMGdata(slp14, 'slp14');
makeIMGdata(slp16, 'slp16');
makeIMGdata(slp32, 'slp32');
makeIMGdata(slp37, 'slp37');
makeIMGdata(slp41, 'slp41');
makeIMGdata(slp45, 'slp45');
makeIMGdata(slp48, 'slp48');
makeIMGdata(slp59, 'slp59');
makeIMGdata(slp60, 'slp60');
makeIMGdata(slp61, 'slp61');
makeIMGdata(slp66, 'slp66');
makeIMGdata(slp67x, 'slp67x');