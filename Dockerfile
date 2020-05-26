FROM continuumio/anaconda3:4.4.0
COPY . /usr/app/
EXPOSE 80
WORKDIR /usr/app/
RUN pip install --upgrade pip==20.0.2
RUN pip --no-cache-dir install -r requirements.txt

RUN apt-get install python-setuptools
RUN python setup.py install
RUN python setup.py build 
RUN python setup.py build_ext
RUN python setup.py sdist
RUN python setup.py bdist
RUN python setup.py bdist_wheel
RUN cd dist
RUN pip install ./xgboost-1.0.0.tar.gz
RUN python setup.py develop 

CMD python flask_api.py