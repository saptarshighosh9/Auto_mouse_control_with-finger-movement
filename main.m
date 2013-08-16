pause(6)
clc
import java.awt.Robot;
import java.awt.event.*;
mouse = Robot;
mouse.mouseMove(0, 0);
vidDevice = imaq.VideoDevice('winvideo', 1, 'YUY2_1280x720');
hblob = vision.BlobAnalysis('AreaOutputPort', false,'CentroidOutputPort', true,'BoundingBoxOutputPort', true','MinimumBlobArea', 10,'MaximumBlobArea', 5000,'MaximumCount', 2);
a=300;
b=300;
mm=0;
while(mm<500)
img =step(vidDevice);
img = flipdim(img,2);
img=im2bw(img);
p=a;
q=b;
centroid = step(hblob, img);
centroid = uint16(centroid);
TF = isempty(centroid);
if(TF==1)
    a=p;
    q=b;
    mouse.mousePress(InputEvent.BUTTON3_MASK);
    mouse.mouseRelease(InputEvent.BUTTON3_MASK);
else
    
  a=centroid(1,1);  
  b=centroid(1,2);
 
end
 mouse.mouseMove(a,b);
 mm=mm+1;
end
release(vidDevice);
