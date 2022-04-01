from flask import Flask, request
import werkzeug
import cv2
import numpy as np
import os

app = Flask(__name__)

@app.route("/")
def test():
    return "Working"


@app.route("/ollin", methods=["POST"])
def runOllin():
    if request.method == "POST":
        image = request.files["image"]


        fileName = API_tools.store(image)
        imageForProcessing = API_tools.pullFromDB(fileName)


        split_image = ollin_object_detection.splitter(imageForProcessing)
        left_obj_list = ollin_object_detection.scanner(split_image, True, False)
        right_obj_list = ollin_object_detection.scanner(split_image, False, True)
        overall_obj_list = ollin_object_detection.scanner(imageForProcessing, False, False)

        left_data = ollin_object_detection.string_builder(left_obj_list, True, False)
        right_data = ollin_object_detection.string_builder(right_obj_list, False, True)

        blocked_flag = ollin_object_detection.path_blocked(left_obj_list,right_obj_list,overall_obj_list)

        if blocked_flag:
            blocked_alert = "There is an obstacle in your way"
        else:
            blocked_alert = ""
        return {
                "LeftData": left_data,
                "RightData": right_data,
                "BlockedPath": blocked_alert
                }



class ollin_object_detection:

    def string_builder(object_string_list , left_flag, right_flag):
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

        #FIND A WAY TO COUNT OBSTACLES DETECTED AND GENERATE A DECENT TTS
        object_list = ["person", "bench", "chair", "cat", "dog", "sofa",
                       "potted plant", "bed", "dining table", "toilet", "tv monitor", "sink", "vase"]
        object_plural_list = ["people", "benches", "chairs", "cats", "dogs", "sofas",
                       "potted plants", "beds", "dining tables", "toilets", "tv monitors", "sinks", "vases"]
        object_count_list = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

        for i in object_string_list:
            index = object_list.index(i)
            object_count_list[index] = object_count_list[index] + 1

        y = 0
        while y < len(object_count_list):
            temp_index = y
            temp_count = object_count_list[y]
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
            y = y + 1

        print("STRING BUILDER : objects counted...")
        if len(return_list) == 0:
            return "Objects not detected on your " + side
        elif len(return_list) == 1:
            return "On your " + side + comma + return_list[0] + " was detected."
        elif len(return_list) == 2:
            return "On your " + side + comma + return_list[0] + " and " + return_list[1] + " was detected."
        elif len(return_list) > 2:
            return_string = "On your " + side + comma
            z = 0
            end_point = len(return_string) - 2
            last_index = len(return_string) - 1
            while z < len(return_list):
                if z == end_point:
                    return_string = return_string + " and " + return_list[last_index] + " was detected."
                    break
            return_string = return_string + comma + return_list[z]
            z = z + 1
        print("STRING BUILDER : returned string = " + return_string)
        return return_string

    def path_blocked(left, right, overall):

        if ((len(left)+len(right)) == len(overall)):
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
        split_image = [leftHalf,rightHalf]
        print("SPLITTER : success")
        return split_image

    def scanner(split_image, leftFlag, rightFlag):
        print("SCANNER : started")
        net = cv2.dnn.readNet('yolov3.weights', 'yolov3.cfg')
        classes = []

        with open('coco.names', 'r') as f:
            classes = f.read().splitlines()

        if(leftFlag == True):
            print("SCANNER : scanning left image...")
            img = split_image[0]
        elif (rightFlag == True):
            print("SCANNER : scanning right image...")
            img = split_image[1]
        else :
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



class API_tools:

    def store(image):
        print("API : storing")
        fileName= werkzeug.utils.secure_filename(image.filename)
        image.save('testFolder/' + fileName)
        print("API : stored " + fileName )
        return fileName

    def pullFromDB(fileName):
        print("API : loading")
        path = ('testFolder/' + fileName)
        image = cv2.imread(path)
        print("API : loaded " + fileName)
        return image

    def debugImages(image):
        print("API : placing image in debug folder")
        file_name = werkzeug.utils.secure_filename(image.filename)
        image.save('debug/' + file_name)
        print("API : image placed")

    def deleteImage(file_name):
        print("API : clearing image from cache")
        path = ('testFolder/' + file_name)
        os.remove(path)
        print("API : cleared image")



if __name__ == '__main__':
    app.run(debug=True)
