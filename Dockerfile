FROM continuumio/anaconda3:4.4.0
COPY . /usr/app/
EXPOSE 80
WORKDIR /usr/app/
RUN pip install --upgrade pip==20.0.2
RUN apt-get update && apt-get install -y gcc
RUN pip --no-cache-dir install -r requirements.txt
CMD python flask_api.py
