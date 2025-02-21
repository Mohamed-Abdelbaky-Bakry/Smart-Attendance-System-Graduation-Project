import cv2 as c
import pyautogui as p
import numpy as np
import os
import time

# Define paths
output_folder = r"F:\GP\Smart attendance Impelementation\output"

# Ensure output folder exists
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Define filenames
screen_filename = os.path.join(output_folder, "screen_output.avi")
camera_filename = os.path.join(output_folder, "camera_output.avi")
screenshot_folder = output_folder  # Screenshots saved in the same folder

# Set recording parameters
fps = 20.0  # Frames per second
screen_size = p.size()  # Get screen resolution

# Define codecs and create VideoWriter objects
fourcc = c.VideoWriter_fourcc(*'XVID')
screen_output = c.VideoWriter(screen_filename, fourcc, fps, screen_size)
camera_output = c.VideoWriter(camera_filename, fourcc, fps, (640, 480))

# Set up the camera
camera_source = "rtsp://192.168.1.100:554/stream"
cap = c.VideoCapture(camera_source, c.CAP_FFMPEG)

if not cap.isOpened():
    print("Error: Could not open the camera.")
    exit()

print("Camera successfully connected.")

# Create a window for live feed
c.namedWindow("Screen & Camera Recording", c.WINDOW_NORMAL)

# Initialize screenshot timer
screenshot_interval = 5  # Take a screenshot every 5 seconds
last_screenshot_time = time.time()

while True:
    # Capture screen
    screen_img = p.screenshot()
    screen_frame = np.array(screen_img)
    screen_frame = c.cvtColor(screen_frame, c.COLOR_BGR2RGB)
    screen_output.write(screen_frame)

    # Capture camera
    ret, camera_frame = cap.read()
    if ret:
        camera_output.write(camera_frame)

        # Combine screen and camera in a single window
        combined_frame = np.hstack((c.resize(screen_frame, (640, 480)), camera_frame))
        c.imshow("Screen & Camera Recording", combined_frame)

    # Take a screenshot every interval
    if time.time() - last_screenshot_time > screenshot_interval:
        screenshot_path = os.path.join(screenshot_folder, f"screenshot_{int(time.time())}.png")
        p.screenshot(screenshot_path)
        print(f"Screenshot saved: {screenshot_path}")
        last_screenshot_time = time.time()

    # Exit condition
    if c.waitKey(1) & 0xFF == ord("q"):
        break

# Release resources
cap.release()
screen_output.release()
camera_output.release()
c.destroyAllWindows()
