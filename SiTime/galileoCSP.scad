// Dimensions (mm)
cmosW = 0.845;
cmosL = 1.545;
cmosT = 0.250;
ballXSpacing = 0.410;
ballYSpacing = 1.000;
ballZShift = 0.060;
ballD = 0.315;
memsW = 0.420;
memsL = 0.420;
memsT = 0.125;

ballX1 = cmosW/2 - ballXSpacing/2;
ballX2 = cmosW/2 + ballXSpacing/2;
ballY1 = cmosL/2 - ballYSpacing/2;
ballY2 = cmosL/2 + ballYSpacing/2;
ballZ = cmosT + ballD/2 - ballZShift;

memsX = cmosW/2 - memsW/2;
memsY = cmosL/2 - memsL/2;
memsZ = cmosT;

$fn = 40;

union() {
  cube([cmosW, cmosL, cmosT]);
  translate([memsX,memsY,memsZ]) cube([memsW, memsL, memsT]);
  translate([ballX1,ballY1,ballZ]) sphere(d = ballD);
  translate([ballX1,ballY2,ballZ]) sphere(d = ballD);
  translate([ballX2,ballY1,ballZ]) sphere(d = ballD);
  translate([ballX2,ballY2,ballZ]) sphere(d = ballD);
}