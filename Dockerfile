FROM continuumio/anaconda3:4.4.0
COPY . /usr/app/
EXPOSE 80
WORKDIR /usr/app/
RUN pip install --upgrade pip==20.0.2
RUN apt-get uninstall python3-sklearn python3-sklearn-lib python3-sklearn-doc
RUN pip --no-cache-dir install -r requirements.txt
CMD python flask_api.py