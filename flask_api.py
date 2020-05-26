from flask import Flask, request
import numpy as np
import pandas as pd
import pickle
import flasgger
from flasgger import Swagger

app = Flask(__name__)
Swagger(app)

pickle_in = open('classifier.pkl','rb')
classifier = pickle.load(pickle_in)         

@app.route('/')
def welcome():
    a= 10
    return "str" + " helper1"


if __name__=='__main__':
    app.run(host='0.0.0.0',port=80)
