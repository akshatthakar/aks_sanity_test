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
from flask import Flask, jsonify

import os

import io
import re
import time
import fitz
import openai
import base64
import logging
import tiktoken
import requests
import pandas as pd
from io import BytesIO
from bs4 import BeautifulSoup
from selenium import webdriver
from azure.storage.blob import BlobServiceClient
import pyodbc
import magic
import json
flask_app = Flask(__name__)

from selenium import webdriver
import time
from bs4 import BeautifulSoup

def extract_using_selenium(url):
    options = webdriver.ChromeOptions()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    driver = webdriver.Chrome(options=options)
    driver.get(url)
    time.sleep(10)
    page_src = driver.page_source
    soup = BeautifulSoup(page_src, 'html.parser')
    driver.quit()
    return soup.text

class MyApp:

    @flask_app.route('/hello', methods=['GET'])        
    def hello():
        response = {"message": "Good Morning!!!"}
        return response

if __name__ == "__main__":
    app = MyApp()
    print(extract_using_selenium("https://www.irs.gov/newsroom/irs-taxpayers-now-have-more-options-to-correct-amend-returns-electronically"))
    flask_app.run(debug=True, port = 5000, host="0.0.0.0")
    