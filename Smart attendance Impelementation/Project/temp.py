import cv2
import os
import time

# Define RTSP camera source with authentication
camera = "rtsp://admin:123456@192.168.1.114:554/stream1"

# Open RTSP camera
cap = cv2.VideoCapture(camera, cv2.CAP_FFMPEG)

if not cap.isOpened():
    print("Error: Could not open the camera.")
    exit()

print("Camera successfully connected.")

# Define output folder for screenshots
output_folder = r"F:\GP\Smart attendance Impelementation\output\screenshots"
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Initialize variables for screenshot timing
screenshot_interval = 1  # in seconds
last_screenshot_time = time.time()

# Reduce delay by setting OpenCV buffer size
cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)

while cap.isOpened():
    ret, frame = cap.read()

    if ret:
        # Display the live camera feed (optional)
        cv2.imshow('Live Camera Feed', frame)

        # Check if it's time to take a screenshot
        current_time = time.time()
        if current_time - last_screenshot_time >= screenshot_interval:
            # Save the screenshot
            screenshot_filename = os.path.join(output_folder, f"screenshot_{int(current_time)}.png")
            cv2.imwrite(screenshot_filename, frame)
            print(f"Screenshot saved: {screenshot_filename}")
            last_screenshot_time = current_time

        # Break the loop if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    else:
        print("Error: Couldn't read frame.")
        break

cap.release()
cv2.destroyAllWindows()