FROM ubuntu:latest
WORKDIR /snoserve

RUN apt-get update && apt-get install -y \
    gdal-bin \
    python3-gdal \
    python3 \
    python3-pip \
    git \
    curl
RUN pip3 install gdal==3.4.1 \
    && pip3 install git+https://github.com/seesteins/geoserver-restconfig.git#egg=geoserver-restconfig \
    && pip3 install python-dotenv \
    && pip3 install pytz
COPY ./snoserve/.env ./.env
COPY ./snoserve/styles/ ./styles/
COPY ./snoserve/snoserve.py ./snoserve.py
COPY ./snoserve/filenames.txt ./filenames.txt

CMD ["python3", "snoserve.py"]