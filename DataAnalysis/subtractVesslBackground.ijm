rename("0");
run("Duplicate...", "duplicate");
run("Gaussian Blur...", "sigma=200 stack");
imageCalculator("Divide create 32-bit stack", "0","0-1");
selectWindow("Result of 0");
run("Z Project...", "projection=[Average Intensity]");
run("Subtract Background...", "rolling=1000 create");
rename("background");
//setTool("zoom");
run("Image Calculator...");
selectWindow("Result of 0");
selectWindow("0-1");
close();
selectWindow("Result of 0");
imageCalculator("Subtract create stack", "Result of 0","background");
selectWindow("Result of Result of 0");
//setTool("rectangle");
makeRectangle(264, 490, 465, 720);
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("Z Project...", "projection=[Standard Deviation]");
run("Enhance Local Contrast (CLAHE)", "blocksize=127 histogram=256 maximum=10 mask=*None*");
//setTool("zoom");
//run("Brightness/Contrast...");
run("Enhance Contrast", "saturated=0.35");
run("Fire");
makeRectangle(291, 129, 2034, 1773);
run("Crop");
