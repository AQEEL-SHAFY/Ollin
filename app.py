import numpy
from flask import Flask, request, jsonify, abort
import cv2

import OllinRuntimeMethods

app = Flask(__name__)


@app.route("/")
def test():
    return jsonify({"about": "Ollin Working"}), 201


@app.route("/ollin", methods=["POST"])
def runOllin():
    if request.method == "POST":

        try:
            imageFile = request.files['image'].read()
            npimg = numpy.fromstring(imageFile, numpy.uint8)
            img = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
        except:
            abort(400)  # Bad Request

        try:
            split_image = OllinRuntimeMethods.ollin_object_detection.splitter(img)
            # Form left side data
            left_obj_list = OllinRuntimeMethods.ollin_object_detection.scanner(split_image, True, False)
            left_data = OllinRuntimeMethods.ollin_object_detection.string_builder(left_obj_list, True, False)
            # Form right side data
            right_obj_list = OllinRuntimeMethods.ollin_object_detection.scanner(split_image, False, True)
            right_data = OllinRuntimeMethods.ollin_object_detection.string_builder(right_obj_list, False, True)
            # Identify obstacles in path
            overall_obj_list = OllinRuntimeMethods.ollin_object_detection.scanner(img, False, False)
            blocked_flag = OllinRuntimeMethods.ollin_object_detection.path_blocked(left_obj_list, right_obj_list,overall_obj_list)
        except:
            abort(400)

        if blocked_flag:
            blocked_alert = "detected obstacle in your path"
        else:
            blocked_alert = ""
        return jsonify({
            "LeftData": left_data,
            "RightData": right_data,
            "BlockedPath": blocked_alert
        }), 201


if __name__ == '__main__':
    app.run(debug=True,port=8080,host='0.0.0.0')
