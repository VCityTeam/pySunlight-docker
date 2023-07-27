FROM python:3.9.17-bullseye

LABEL maintainer "VCityTeam"

RUN apt-get update

# Assert that python3 is installed
RUN python3 --version

# Install SWIG
RUN apt-get install -y swig4.0
RUN ln -s /usr/bin/swig4.0 /usr/bin/swig
RUN swig -version

# Install build library
RUN apt-get install -y \
  build-essential \
  cmake \
  git

# Clone sources from release branch
RUN git clone --recursive --branch 0.2 https://github.com/VCityTeam/pySunlight.git
WORKDIR /pySunlight

# Create and enable virtual environment
RUN python3.9 -m venv venv
RUN . venv/bin/activate
RUN pip install -e .

EXPOSE 3000

# Start the app using serve command
CMD [ "python3.9", "src/Test_WrapperImport.py" ]