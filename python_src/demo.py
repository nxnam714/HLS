import Detect_plate
import cv2
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as patches

image=cv2.imread("images/car0.jpg")
img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
plt.imshow(img)
plt.show()

license_plate , b = Detect_plate.detectPlate(image)
for i in range(len(license_plate)):
  #print i
  plt.imshow(np.invert(license_plate[i]), cmap="gray")
  #plt.show()
  characters = Detect_plate.SegmentCharacters(license_plate[i])
  # print len(characters)
  for j in range(len(characters)):
    plt.imshow(np.invert(characters[j]), cmap="gray")
    plt.show()