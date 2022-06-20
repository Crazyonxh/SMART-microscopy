//run("Duplicate...", "duplicate range=2001-3000 use");
rename("0");
open("D:/data/20211205_ai148_visual_stimulation_2/acq_3/AVG_sCMOS1.tif");
selectWindow("AVG_sCMOS1.tif");
imageCalculator("Subtract stack", "0","AVG_sCMOS1.tif");

selectWindow("AVG_sCMOS1.tif");
close();
run("Duplicate...", "duplicate");
selectWindow("0");
//run("Gaussian Blur...");
run("Gaussian Blur 3D...", "x=0.5 y=0.5 z=1");
selectWindow("0-1");
run("Gaussian Blur 3D...", "x=10 y=10 z=1");
imageCalculator("Subtract stack", "0","0-1");
run("Z Project...", "projection=[Standard Deviation]");
makeRectangle(1389, 717, 495, 594);
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
selectWindow("0");
close();
selectWindow("0-1");
close();