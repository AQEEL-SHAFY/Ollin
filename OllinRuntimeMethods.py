from flask import Flask, request
import werkzeug
import cv2
import numpy as np
import os


class ollin_object_detection:

    def string_builder(object_string_list, left_flag, right_flag):
        print("STRING BUILDER :Generating text..")
        if left_flag == True:
            side = "left"
        elif right_flag == True:
            side = "right"
        else:
            print("STRING BUILDER : error")
            return
        comma = ", "
        return_list = []

        # generates
        object_list = ["person", "train", "bench", "cat", "dog", "chair", "sofa", "pottedplant", "bed", "dining table",
                       "toilet",
                       "tvmonitor", "sink", "vase", "bicycle", "car", "motorbike", "truck"]
        object_plural_list = ["people", "trains", "benches", "cats", "dogs", "chairs", "sofas", "potted plants", "beds",
                              "dining tables", "toilets", "tv monitors", "sinks", "vases", "bicycles", "cars",
                              "motorbikes", "trucks"]
        object_count_list = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

        # print(len(object_string_list))
        # for f in object_string_list:
        #     print(f)

        for obj in object_string_list:
            for x in range(len(object_list)):
                if obj == object_list[x]:
                    object_count_list[x] += 1

        # for v in range(len(object_list)):
        #     print(object_list[v] + " : " + str(object_count_list[v]))


        for n in range(len(object_count_list)):
            temp_count = object_count_list[n]
            temp_index = n
            if (temp_count > 0):
                if (temp_count == 1):
                    temp_string = ("one " + object_list[temp_index])
                    return_list.append(temp_string)
                elif (temp_count == 2):
                    temp_string = ("two " + object_plural_list[temp_index])
                    return_list.append(temp_string)
                elif (temp_count > 2):
                    temp_string = ("multiple " + object_plural_list[temp_index])
                    return_list.append(temp_string)
                else:
                    print("unexpected result")


        # for p in range(len(return_list)):
        #     print(return_list[p])

        print("STRING BUILDER : objects counted...")

        if len(return_list) == 0:
            return "Objects not detected on your " + side + "."
        elif len(return_list) == 1:
            return "On your " + side + comma + return_list[0] + " detected."
        elif len(return_list) == 2:
            return "On your " + side + comma + return_list[0] + " and " + return_list[1] + " detected."
        elif len(return_list) > 2:
            return_string = "On your " + side
            z = 0
            end_point = len(return_list) - 1
            while z < len(return_list):
                if z == end_point:
                    return_string = return_string + " and " + return_list[end_point] + " detected."
                    break
                return_string = return_string + comma + return_list[z]
                z = z + 1

        print("STRING BUILDER : returned string = " + return_string)
        return return_string




    def path_blocked(left, right, overall):

        if ((len(left) + len(right)) == len(overall)):
            return False
        else:
            return True

    def splitter(input_img):
        print("SPLITTER : started")
        image = input_img
        height = image.shape[0]
        width = image.shape[1]
        width_cutoff = width // 2
        leftHalf = image[:, :width_cutoff]
        rightHalf = image[:, width_cutoff:]
        split_image = [leftHalf, rightHalf]
        print("SPLITTER : success")
        return split_image

    def scanner(split_image, leftFlag, rightFlag):
        print("SCANNER : started")
        net = cv2.dnn.readNet('yolov3.weights', 'yolov3.cfg')
        classes = []

        with open('coco.names', 'r') as f:
            classes = f.read().splitlines()

        if (leftFlag == True):
            print("SCANNER : scanning left image...")
            img = split_image[0]
        elif (rightFlag == True):
            print("SCANNER : scanning right image...")
            img = split_image[1]
        else:
            print("SCANNER : scanning overall image...")
            img = split_image

        height, width, _ = img.shape
        blob = cv2.dnn.blobFromImage(img, 1 / 255, (416, 416), (0, 0, 0), swapRB=True, crop=False)
        net.setInput(blob)

        output_layers_names = net.getUnconnectedOutLayersNames()
        layerOutputs = net.forward(output_layers_names)

        boxes = []
        confidences = []
        class_ids = []

        for output in layerOutputs:
            for detection in output:
                scores = detection[5:]
                class_id = np.argmax(scores)
                confidence = scores[class_id]
                if confidence > 0.5:
                    center_x = int(detection[0] * width)
                    center_y = int(detection[1] * height)
                    w = int(detection[2] * width)
                    h = int(detection[3] * height)

                    x = int(center_x - w / 2)
                    y = int(center_y - h / 2)

                    boxes.append([x, y, w, h])
                    confidences.append((float(confidence)))
                    class_ids.append(class_id)

        indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)

        obstacleList = []

        try:
            for i in indexes:
                label = str(classes[class_ids[i]])
                obstacleList.append(label)

            print("SCANNER : success")
            return obstacleList
        except IndexError:
            print("SCANNER : this side is empty")
            return obstacleList


# class API_tools:
# 
#     def getFileName(image):
#         print("API : getting filename")
#         fileName = werkzeug.utils.secure_filename(image.filename)
#         print("API : filename : " + fileName)
#         return fileName
# 
#     def pullFromDB(fileName):
#         print("API : loading")
#         path = ('testFolder/' + fileName)
#         image = cv2.imread(path)
#         print("API : loaded " + fileName)
#         return image
# 
#     def debugImages(image):
#         print("API : placing image in debug folder")
#         file_name = werkzeug.utils.secure_filename(image.filename)
#         image.save('debug/' + file_name)
#         print("API : image placed")
# 
#     def deleteImage(file_name):
#         print("API : clearing image from cache")
#         path = ('testFolder/' + file_name)
#         os.remove(path)
#         print("API : cleared image")
