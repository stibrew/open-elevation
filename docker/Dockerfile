##
# geographica/gdal2
#
# This creates an Ubuntu derived base image that installs GDAL 2.
#
# Ubuntu 16.04 Xenial Xerus
FROM ubuntu:xenial

ENV ROOTDIR /usr/local/
ENV GDAL_VERSION 2.1.3

# Load assets
WORKDIR $ROOTDIR/
ADD http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz $ROOTDIR/src/

# Install basic dependencies
RUN apt-get update -y && apt-get install -y \
    software-properties-common \
    python-software-properties \
    build-essential \
    python-dev \
    python-numpy \
    python-pip \
    libspatialite-dev \
    sqlite3 \
    libpq-dev \
    libcurl4-gnutls-dev \
    libproj-dev \
    libxml2-dev \
    libgeos-dev \
    libnetcdf-dev \
    libpoppler-dev \
    libspatialite-dev \
    libhdf4-alt-dev \
    libhdf5-serial-dev \
    unar \
    bc \
    wget

# Compile and install GDAL
RUN cd src && tar -xvf gdal-${GDAL_VERSION}.tar.gz && cd gdal-${GDAL_VERSION} \
    && ./configure --with-python --with-spatialite --with-pg --with-curl \
    && make && make install && ldconfig \
    && apt-get update -y \
    && rm -Rf $ROOTDIR/src/*

ADD ./requirements.txt .
RUN pip install -r requirements.txt
RUN mkdir /code
ADD . /code/
WORKDIR /code

# Output version of gdal and its capabilities and start our elevation server
CMD bash create-dataset.sh && gdalinfo --version && gdalinfo --formats && ogrinfo --formats && python server.py
EXPOSE 8080
