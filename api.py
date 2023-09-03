from flask import Flask,request
from flask_restful import Resource, Api
import json
import re
from datetime import date

import os
import time
import openai
from flask import Flask,request
from flask_restful import Resource, Api
import json

import os
import time
import openai


flask_app = Flask(__name__)
class MyApp:

    @flask_app.route('/hello', methods=['GET'])        
    def hello():
        response = {"message": "Good Morning!!!"}
        
        return response

if __name__ == "__main__":
    app = MyApp()
    flask_app.run(debug=True, port = 5000, host="0.0.0.0")