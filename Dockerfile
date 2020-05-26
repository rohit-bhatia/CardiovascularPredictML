FROM continuumio/anaconda3:4.4.0
COPY . /usr/app/
EXPOSE 80
WORKDIR /usr/app/
RUN pip install --upgrade pip==20.0.2
RUN pip --no-cache-dir install -r requirements.txt

RUN apt-get install python-setuptools -y

RUN apt-get update && apt-get -y install cmake protobuf-compiler
RUN find /usr -iname 'CMakeLists.txt'
RUN cp /usr/share/cmake-3.0/Modules/IntelVSImplicitPath/CMakeLists.txt /usr/CMakeLists.txt
RUN git clone --recursive https://github.com/dmlc/xgboost
RUN cd xgboost
RUN mkdir build
RUN cd build
RUN cmake ..
RUN make -j$(nproc)

CMD python flask_api.py