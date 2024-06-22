FROM ubuntu:jammy
WORKDIR /snoserve

RUN apt-get update && apt-get install -y \
    gdal-bin \
    python3-gdal \
    python3 \
    python3-pip \
    git \
    curl
RUN pip3 install gdal==3.4.1 git+https://github.com/seesteins/geoserver-restcon>
COPY ./snoserve/styles/ ./styles/
COPY ./snoserve/snoserve.py ./snoserve.py
COPY ./snoserve/filenames.txt ./filenames.txt

CMD ["python3", "snoserve.py"]
