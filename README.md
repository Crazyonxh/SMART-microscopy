# SMART-microscopy
SMART is short for Spinning-disk Mesoscale ARbitrarily-shaped Surface imaging Technique, an open source frame work adapted to different mesoscope and macrosopes. 


## Part list
### Spinning disk
* Disk
* Glass
* IR detector
* Rotation stage
* Motor drive
* UV glue
* Tapes
### Selective illumination
* Digital Micromirror Device (DMD)
* LED
* Relay lenses
### Synchronization
* DAQ
* Jump wire
* PC
### Macroscope
* SLR lenses
* Dichroic mirror
* Excitation filter
* Emission filter
* sCMOS detector


## Download



## Step 1: Assembly of the spinning disk
1.	Our spinning disk is made of alumina. It is recommended to oxidize and paint the surface black. We attach a stick to the edge for synchronization
2.	The cover glass is cut by the manufacturer. We designed the glass to be a fan shape with an outer radius of 110 mm and an inner radius of 50 mm at an angle of 34 degrees. 
3.	Fix the glass plates to the disk with UV glue, and secured them with tape. The arrangement of the glasses is carefully designed to keep the center of mass on the axis.
4.	Attach the disk to the rotation stage, and connect the stage to the motor driver. 
5.	Fix the U-shaped IR detector close to the disk, so that the stick can trigger a digital edge.
6.	Put the whole system in a box for high-speed applications. 

## Step 2: Assembly of the illumination
1.	Our illumination light path is identical to the conventional structured illumination light path. But we use regional illumination so it has a lower requirement for optical design
2.	First relay the illumination LED to the DMD so that a uniform pattern is formed, as instructed by the manufacturer. 
3.	Relay the DMD through the doublet lens and objective the specimen.
4.	Drop some fluorescence solution on the slide and cover it with a cover glass.
5.	Generate some patterns (points) on the DMD, and record the image on the camera.
6.	Align the coordination on the camera to the coordinate of DMD (in Matlab control point select tool), with images from the camera and the DMD.

## Step 3: Signal synchronization
1.	We develop two modes for synchronization: a master mode and a slave mode. In the master mode, the position of the spinning disk works as the trigger source, while the DMD and camera follow the time sequence of the disk. However, for systems in which we cannot control the trigger of cameras, we use a slave mode in which the disk and DMD follow the timing of the camera.
2.	In the master mode, we first set the voltage of the motor drive to control the speed of the disk. At the start of each cycle, the stick on the disk triggers a signal on the IR detector and sends the message to the counter on DAQ. Then a digital trigger signal is sent to initiate the start of camera exposure and another trigger signal is sent to the DMD to start its display.
3.	The exposure time of the camera is set to be equal to the duration of the rotation.
4.	The display time of the DMD is set to equal to the time for each cover glass. 
5.	If there are more than more cover glasses in the field of view, the LED is turned off.
6.	In the slave mode, everything is the same except that a PID process is used to set the control voltage on the motor, so that the period of rotation is equal to the exposure time of the camera. 
## Step 4: Surface detection
1.	On an initial scan, the disk rotates at a low speed and the camera takes one image at each cover glass. 
2.	The images are rearranged according to the order of the glass thickness. 
3.	Apply algorithms to extract the features. For example, to detect the position of neurons, we first use standard derivation to the time sequence, then threshold the image to make it binary and apply morphological algorithms to extract the connected regions in the image. Finally, we sort the regions by parameters such as areas and eccentricity.
4.	We fit the shape of our surface by assuming the surface is continuous in 3D space. The shape of the surfaces can be set to polynomial or any smooth surface.
5.	Discrete the surface into 10 heights, and make 10 binary masks accordingly. 
6.	Other high-speed surface detection algorithms have been developed, but not tested yet.

## Step 5: Image
1.	Apply the map-table in Step 2.6 to the illumination pattern, and set the DMD.
2.	Click start on the imaging program, and enjoy!
