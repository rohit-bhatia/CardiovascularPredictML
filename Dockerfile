FROM continuumio/anaconda3:4.4.0
COPY . /usr/app/
EXPOSE 80
WORKDIR /usr/app/
RUN pip install --upgrade pip==20.0.2
RUN pip --no-cache-dir install -r requirements.txt
RUN git clone --recursive https://github.com/dmlc/xgboost;cd xgboost;mkdir build;cd build;cmake ..;make -j$(nproc)
CMD python flask_api.py