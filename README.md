# pySunlight Docker

<!-- TOC -->

- [pySunlight Docker](#pysunlight-docker)
  - [About The Project](#about-the-project)
  - [Getting Started](#getting-started)
    - [Install](#install)
    - [Usage](#usage)
      - [Configure](#configure)
      - [With Docker Compose](#with-docker-compose)
      - [With DockerFile](#with-dockerfile)

<!-- /TOC -->

## About The Project

It's a dockerised version of [pySunlight](https://github.com/VCityTeam/pySunlight) program.  

pySunlight-docker is one repository of the Sunlight project, including :

- [Sunlight](https://github.com/VCityTeam/Sunlight)
- [pySunlight](https://github.com/VCityTeam/pySunlight)
- [pySunlight-docker](https://github.com/VCityTeam/pySunlight-docker)
- [UD-Demo-VCity-Sunlight](https://github.com/VCityTeam/UD-Demo-VCity-Sunlight)

## Getting Started

### Install

Clone the repository.

```bash
git clone https://github.com/VCityTeam/pySunlight-docker.git
```

### Usage

#### Configure

1. Copy and rename .env.example to . env.

2. Adapt the configuration to your needs. Here is a full list of all options available :^

| Arguments             | Description                                                                                                           | Example                                |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| START_DATE            | Start date of sunlight computation                                                                                    | 403224                                 |
| END_DATE              | End date of sunlight computation                                                                                      | 403248                                 |
| LOG_LEVEL             | Provide logging level depending on [logging module](https://docs.python.org/3/howto/logging.html#when-to-use-logging) | DEBUG, INFO, WARNING, ERROR, CRITICAL  |
| INPUTS_FOLDER         | Inputs folder containing 3D Tiles use for sunlight computation                                                        | ./inputs                               |
| OUTPUTS_FOLDER        | Outputs folder containing 3D Tiles with Sunlight Result in batch table                                                | ./outputs                              |
| OPTIONAL_ARGS         | Optional arguments (compute aggregate...)                                                                             | --with-aggregate                       |

3. Create two folders named `inputs` and `outputs`. Place your 3DTiles in the inputs folder (it can be in a subfolder).

#### With Docker Compose

1. Build pySunlight docker-compose :

   ```bash
   docker compose build
   ```

2. Run the container with :

   ```bash
   docker compose up
   ```

#### With DockerFile

1. Build dpySunlight DockerFile :

   ```bash
   docker build -t pysunlight --file Context/Dockerfile .
   ```

2. Run dockerfile with .env file :

   ```bash
   docker run -v ./inputs:/inputs -v ./outputs:/outputs --env-file .env pysunlight
   ```

   or run docker file with arguments :

   ```bash
   docker run -v ./inputs:/inputs -v ./outputs:/outputs -e START_DATE=403224 -e END_DATE=403248 -e LOG_LEVEL=DEBUG -e OPTIONAL_ARGS=--with-aggregate pysunlight
   ```
