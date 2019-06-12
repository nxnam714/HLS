
# coding: utf-8

# In[1]:


import cv2
import numpy as np
import matplotlib.pyplot as plt
from skimage.filters import threshold_otsu
from skimage import measure
from skimage.measure import regionprops
import matplotlib.patches as patches


# In[6]:


from skimage.segmentation import clear_border
from skimage.morphology import closing, square
from skimage.color import label2rgb
from skimage.transform import resize

import glob


# In[7]:


def detectPlate(image_input):
       img = cv2.cvtColor(image_input, cv2.COLOR_BGR2RGB)
       #plt.imshow(img)
       #plt.show()
       gray_img = cv2.cvtColor(img,cv2.COLOR_RGB2GRAY)
       #plt.imshow(gray_img, cmap = "gray")
       #plt.show()
       
       #lay nguong threshol_otsu
       threshold_value = threshold_otsu(gray_img)
       binary_car_image = gray_img > threshold_value
       #plt.imshow(binary_car_image,cmap="gray")
       #plt.show()
       
       #gan nhan cho tung khoi co the la bien so
       label_image = measure.label(binary_car_image)

       #goi han vung kich thuoc cua bien so so voi khung hinh
       plate_dimensions = (0.05*label_image.shape[0], 0.12*label_image.shape[0], 0.15*label_image.shape[1], 0.35*label_image.shape[1])
       min_height, max_height, min_width, max_width = plate_dimensions
       
       plate_objects_cordinates = []
       plate_like_objects = []
       
       for region in regionprops(label_image):
           if region.area < 50:
               continue
           Min_row, Min_col, Max_row, Max_col = region.bbox
           region_height = Max_row - Min_row
           region_width = Max_col - Min_col
           ratio = float(region_width) / region_height
           if(3<ratio<5 
            and max_height >= region_height >= min_height 
            and max_width >= region_width >= min_width):
               plate_like_objects.append(binary_car_image[Min_row:Max_row, Min_col:Max_col])
               plate_objects_cordinates.append((Min_row, Min_col, Max_row, Max_col))

       return plate_like_objects, plate_objects_cordinates
                           


# In[8]:


def SegmentCharacters(license):
    license_plate = np.invert(license)
    plt.imshow(license_plate,cmap="gray")
    plt.show()
    labelled_plate = measure.label(license_plate)
    
    character_dimensions = (0.4*license_plate.shape[0], 0.8*license_plate.shape[0], 0.01*license_plate.shape[1], 0.1*license_plate.shape[1])
    min_height, max_height, min_width, max_width = character_dimensions
    characters = []
    for region in regionprops(labelled_plate):
        y0, x0, y1, x1 = region.bbox
        region_height = y1 -y0
        region_width = x1-x0
        ratio = float(region_height) / region_width
        if(1.5<ratio<6 
            and max_height >= region_height >= min_height 
            and max_width >= region_width >= min_width):
          characters.append(license_plate[y0:y1, x0:x1])
    return characters


# In[9]:


def resize_necessary(img_resize, width_resize):
    height, width = img_resize.shape
    ratio = float(width)/ height
    width = width_resize
    height = round(width/ratio)
    img_resize = resize(img_resize,(height,width))
    return img_resize
