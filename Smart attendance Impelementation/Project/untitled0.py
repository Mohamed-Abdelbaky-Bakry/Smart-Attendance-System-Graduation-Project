import cv2 as c
import payautogui as p
import numpy as np

rs = p.size()

fn = input("Please enter the file name")

fps = 60.0

fourcc = c.VideoWriter_fourcc(*'XVID')
output = c.VideoWriter(fn,fourcc,fps,rs)

c.namedWindow("Live_Recording",c.WINDOW_NORMAL)
c.resize("Live_Recording", (600,400))
 
while True:
    img = p.screenshoot()
    f = np.array(img)
    f = c.cvtColor(f,c.COLOR_BGR2RGB)
    output.write(f)
    c.imshow("Live_Reccording", f)
    if c.waitKey(1) == ord("q"):
        break
    
output.release()    
c.destroyAllWindows()