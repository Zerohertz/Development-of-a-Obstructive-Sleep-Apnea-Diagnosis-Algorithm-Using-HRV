%1

for N = ["a01", "a02", "a03", "a04", "a05", "a06", "a07", "a08", "a09", "a10", "a11", "a12", "a13", "a14", "a15", "a16", "a17", "a18", "a19", "a20", "b01", "b02", "b03", "b04", "b05", "c01", "c02", "c03", "c04", "c05", "c06", "c07", "c08", "c09", "c10"]
    checkRR(1, char(N), 1000, 30, 0.1);
end

%2

for N = ["slp01a", "slp01b", "slp02a", "slp02b", "slp03", "slp04", "slp14", "slp16", "slp32", "slp37", "slp41", "slp45", "slp48", "slp59", "slp60", "slp61", "slp66", "slp67x"]
    checkRR(2, char(N), 1000, 30, 0.1);
end