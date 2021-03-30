import cv2
import os
from matplotlib import pyplot as plt
import numpy as np
import glob

cap = cv2.VideoCapture("final14.mp4")
frame_list = []
distance = []
try:
    if not os.path.exists('data'):
        os.makedirs('data')
except OSError:
    print("Error cant make directories")

cframe = 0
ret, frame= cap.read()

while ret:
    name = 'data/' + str(cframe) + '.jpg'
    cv2.imwrite(name,frame)
    ret, frame= cap.read()
    print('Read a new frame: ', ret)
    frame_list.append(frame)
    cframe += 1

images = {}
index = {}

for imagePath in glob.glob('data/*.jpg'):
    filename = imagePath[imagePath.rfind("/") + 1:]
    
    image = cv2.imread(imagePath,1)
    images[filename] = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

    hist = cv2.calcHist([image],[0,1,2],None,[8,8,8],[0,256,0,256,0,256])
    hist = cv2.normalize(hist,None).flatten()
    index[filename] = hist


OPENCV_METHODS = (
	(cv2.HISTCMP_CORREL ),
	(cv2.HISTCMP_CHISQR),
	(cv2.HISTCMP_INTERSECT), 
	(cv2.HISTCMP_BHATTACHARYYA))
 

for method in OPENCV_METHODS:

	results = {}
	reverse = False
 
	if method in (cv2.HISTCMP_CORREL, cv2.HISTCMP_INTERSECT ):
		reverse = True


for (k, hist) in index.items():
		
		d = cv2.compareHist(index[k], hist, cv2.HISTCMP_INTERSECT)
		results[k] = d
		print(d)
       

for (k,hist) in index.items():
	        mean__ = np.mean(index[k], dtype=np.float64)

for (k,hist) in index.items():
            variance = np.var(index[k], dtype=np.float64)
            
print("variance", variance)
standard_deviation = np.sqrt(variance)
th = mean__ + standard_deviation + 3
#th = standard_deviation * 8
print("threshold value", th)

try:
    if not os.path.exists('keyframes'):
        os.makedirs('keyframes')
except OSError:
    print("Error cant make directories")


directory = 'data/'
for filename in os.listdir(directory):
    fileee = os.path.join(directory, filename)
    capp = cv2.imread(fileee)
    for k, v in results.items():
        #success, keyframe = capp.read()
        #cframee = 0
        #fileee.read()
        if (os.path.samefile(fileee, k)):
                if(results[k] > th):
                        name3 = os.path.basename(fileee)
                        namee = 'keyframes/' + name3
                        cv2.imwrite(namee, capp)
                        #print("Read new keyframe:", success)
                        #cframee += 1
                else:
                    print("difference smaller than threshold")
                    

    #print(os.path.join(directory, filename))
#for k, v in results.items():
