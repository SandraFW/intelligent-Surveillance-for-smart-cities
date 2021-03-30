import cv2
import numpy as np

imagedata_original = cv2.imread('sharpness.png')
cv2.imshow('Original image', imagedata_original)
cv2.waitKey(0)

sharpening_filter = np.array([[-1,-1,-1],
                             [-1,9,-1],
                             [-1,-1,-1]])

sharpened_image = cv2.filter2D(imagedata_original, -1, sharpening_filter)
cv2.imshow('Sharpened Image', sharpened_image)

cv2.waitKey(0)
cv2.destroyAllWindows()




# from PIL import Image
#
# image_path = "sharpness.png"
# image_file = Image.open(image_path)
#
# image_file.save("sharpness.png", quality=95)



# from PIL import Image, ImageEnhance
#
# im = Image.open("sharpness.png")
# enhancer = ImageEnhance.Sharpness(im)
# enhanced_im = enhancer.enhance(10.0)
# enhanced_im.save("enhanced.sharpness.png")
