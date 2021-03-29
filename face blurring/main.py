import cv2
import numpy as np

#def resize(img,new_width=500):
    #height,width,_ = img.shape
    #ratio = height/width
    #new_height = int(ratio*new_width)
    #return cv2.resize(img,(new_width,new_height))

face_cascade = cv2.CascadeClassifier("haarcascade_frontalface_alt.xml")

img=cv2.imread("surv1.jpeg")

detections = face_cascade.detectMultiScale(img,scaleFactor=1.1,minNeighbors=1)



  #cap = cv2.VideoCapture("example.mp4")

  #while True:
   # _,frame = cap.read()
    #frame = resize(frame)
    #detections = face_cascade.detectMultiScale(frame,scaleFactor=1.1,minNeighbors=6)

for face in detections:
    x,y,w,h = face

        #frame[y:y+h,x:x+w] = cv2.GaussianBlur(frame[y:y+h,x:x+w],(15,15),cv2.BORDER_DEFAULT)
    img[y:y+h,x:x+w] = cv2.GaussianBlur(img[y:y+h,x:x+w],(15,15),cv2.BORDER_DEFAULT)
        #cv2.rectangle(frame,(x,y),(x+w,y+h),(255,0,0),2)
    cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)

       # cv2.imshow("output",frame)
    cv2.imshow("output",img)

        #if cv2.waitKey(1) == 27:
           # break
cv2.waitKey(0)
#cap.release()
#cv2.destroyAllWindows()

    
