import cv2

image = cv2.imread("color.jpg", 0)
if cv2.countNonZero(image) == 0:
    print ("image is black")
else:
    print ("the image is colored")