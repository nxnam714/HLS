import Detect_plate
import cv2
import matplotlib.pyplot as plt
import matplotlib.patches as patches

imagepaths = ["images/car0.jpg", "images/car1.jpg", "images/car2.jpg", "images/car3.jpg", "images/car4.jpg",
              "images/car5.jpg", "images/car6.jpg", "images/car7.jpg", "images/car8.jpg", "images/car9.jpg" ]

result_ocvs = [(224, 198, 101, 35), (284 , 258, 81, 21), (199, 231, 108, 38), (207, 154, 111, 37), (214, 264, 81, 24),
                (138, 222, 77, 21), (283, 222, 75, 22), (267, 214, 96, 26), (240, 202, 97, 30), (232, 202, 94, 25)]

sumofpercent = 0;
numberofpercent = 0;
for idx in range(len(imagepaths)):
  imagepath = imagepaths[idx]
  print imagepath
  image=cv2.imread(imagepath)
  img = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  gray_car_image = cv2.imread(imagepath, 0)
  license_plates , b = Detect_plate.detectPlate(image)
  fig, (ax1) = plt.subplots(1)
  ax1.imshow(img);
  res_col, res_row, res_width, res_height = result_ocvs[idx]
  rectBorder_res = patches.Rectangle((res_col, res_row), res_width, res_height, edgecolor="blue", linewidth=2, fill=False)
  ax1.add_patch(rectBorder_res)

  if (len(license_plates) == 1):
    res_col, res_row, res_width, res_height = result_ocvs[idx]
    min_row, min_col, max_row, max_col = b[0]

    union_width = max((res_col + res_width), max_col) - min(res_col, min_col)
    intersection_width = min((res_col + res_width), max_col) - max(res_col, min_col)
    union_height = max((res_row + res_height), max_row) - min(res_row, min_row)
    intersection_height = min((res_row + res_height), max_row) - max(res_row, min_row)

    result = float(intersection_width * intersection_height) / union_width / union_height
    sumofpercent = sumofpercent + result;
    numberofpercent = numberofpercent + 1;
    #print "percent = ", result
  plt.show() 
  for i in range(len(license_plates)):
    print (i, imagepath)
    plt.imshow((license_plates[i]), cmap="gray")
    min_row, min_col, max_row, max_col = b[i]
    rectBorder = patches.Rectangle((min_col, min_row), max_col-min_col, max_row-min_row, edgecolor="red", linewidth=2, fill=False)
    ax1.add_patch(rectBorder)
    plt.show()
print "Average Percent = ", sumofpercent / numberofpercent
