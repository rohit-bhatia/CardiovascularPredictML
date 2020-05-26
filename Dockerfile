FROM continuumio/anaconda3:4.4.0
COPY . /usr/app/
EXPOSE 80
WORKDIR /usr/app/
RUN pip install --upgrade pip==20.0.2
RUN pip --no-cache-dir install -r requirements.txt
RUN pip install --upgrade scikit-learn
CMD python flask_api.py