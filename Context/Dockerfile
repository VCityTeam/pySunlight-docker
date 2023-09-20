FROM python:3.9.17-bullseye

LABEL maintainer "VCityTeam"
LABEL source.repo "https://github.com/VCityTeam/pySunlight-docker"

RUN apt-get update

# Assert that python3 is installed
RUN python3 --version

# Install SWIG
RUN apt-get install -y swig4.0
RUN ln -s /usr/bin/swig4.0 /usr/bin/swig
RUN swig -version

# Install build libraries
RUN apt-get install -y \
  build-essential \
  cmake \
  git

# Clone sources from release branch
RUN git clone --recursive --branch 0.3.1 https://github.com/VCityTeam/pySunlight.git
WORKDIR /pySunlight

# Install requirements
RUN pip install -e .

# Env values are converted in argument to set default parameters on build
ENV START_DATE=${START_DATE}
ENV END_DATE=${END_DATE}
ENV LOG_LEVEL=${LOG_LEVEL}

# Start the app using serve command
CMD [ "sh", "-c", "python3.9 src/main.py -i /inputs -o /outputs -s ${START_DATE} -e ${END_DATE} -log ${LOG_LEVEL}"]