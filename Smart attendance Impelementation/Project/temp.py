import cv2  

# Define RTSP camera source  
camera = "rtsp://192.168.1.100:554/stream"  

# Open RTSP camera  
cap = cv2.VideoCapture(camera, cv2.CAP_FFMPEG)  

if not cap.isOpened():  
    print("Error: Could not open the camera.")  
    exit()  

print("Camera successfully connected.")  

# Define codec and create VideoWriter object  
fourcc = cv2.VideoWriter_fourcc(*"XVID")  
output = cv2.VideoWriter(r"F:\GP\Smart attendance Impelementation\output.avi", fourcc, 20.0, (640, 480))  

while cap.isOpened():  
    ret, frame = cap.read()  

    if ret:  
        cv2.imshow('Live Camera Feed', frame)  
        output.write(frame)  

        if cv2.waitKey(1) & 0xFF == ord('q'):  
            break  
    else:  
        print("Error: Couldn't read frame.")  
        break  

cap.release()  
output.release()  
cv2.destroyAllWindows()  
