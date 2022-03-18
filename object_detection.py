# @demetre the commented lines are for the cam access on a PC


import cv2
import numpy as np
from gtts import gTTS
from playsound import playsound

#SPLITTER

# load image
img = cv2.imread('image1.jpg')
##########################################
# At first vertical devide image         #
##########################################
# start vertical devide image
height = img.shape[0]
width = img.shape[1]
# Cut the image in half
width_cutoff = width // 2
left1 = img[:, :width_cutoff]
right1 = img[:, width_cutoff:]
# finish vertical devide image

#image prep

cv2.imwrite("left.jpg" , left1)
cv2.imwrite("right.jpg" , right1)

#SCAN METHOD
    
def scanner(split_image, leftOrRight):

    net = cv2.dnn.readNet('yolov3.weights','yolov3.cfg')
    classes = []

    with open('coco.names', 'r') as f:
        classes = f.read().splitlines()

    img = cv2.imread(split_image)
    height, width, _ = img.shape

    blob = cv2.dnn.blobFromImage(img, 1/255, (416, 416), (0,0,0), swapRB=True, crop=False)

    net.setInput(blob)

    output_layers_names = net.getUnconnectedOutLayersNames()
    layerOutputs = net.forward(output_layers_names)

    boxes = []
    confidences = []
    class_ids= []

    for output in layerOutputs:
        for detection in output:
            scores = detection[5:]
            #could take class_ids as the array of objects just need to know where the label is assigned
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            if confidence > 0.5:
                center_x = int(detection[0]*width)
                center_y = int(detection[1]*height)
                w = int(detection[2]*width)
                h = int(detection[3]*height)

                x = int(center_x - w/2)
                y = int(center_y - h/2)

                boxes.append([x,y,w,h])
                confidences.append((float(confidence)))
                class_ids.append(class_id)
                print(str(classes[class_id]))

    print(len(boxes))
    indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)

    font = cv2.FONT_HERSHEY_PLAIN
    colors = np.random.uniform(0,255, size=(len(boxes), 3))

    for i in indexes.flatten():
        x, y ,w, h = boxes[i]
        label = str(classes[class_ids[i]])
        #
    
        language = 'en'
        myobj = gTTS(text=("on the " + leftOrRight + "there is " + label), lang=language, slow=False)
        myobj.save("welcome.mp3")
        playsound('welcome.mp3')
        #
        confidence = str(round(confidences[i],2))
        color = colors [i]
        cv2.rectangle(img, (x,y), (x+w, y+h), color, 2)
        cv2.putText(img, label + " " + confidence,(x, y+20), font, 2, (255,255,255),2)

    cv2.imshow('Image', img)
    cv2.waitKey(2000)
    cv2.destroyAllWindows()



scanner("left.jpg", "left")
scanner("right.jpg", "right")


