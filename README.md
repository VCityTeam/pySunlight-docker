# pySunlight Docker
# About The Project
It's d dockerised version of [pySunlight](https://github.com/VCityTeam/pySunlight) program.

# Getting Started
## Install
Clone the repository.
```bash
git clone https://github.com/VCityTeam/pySunlight-docker.git
```

## Build
To build pySunlight docker :
```bash
docker build -t vcity/py-sunlight Context/
```

## Run
Run the container with :
```bash
docker run -p 8000:8000 -t vcity/py-sunlight
```