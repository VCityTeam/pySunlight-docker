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

2. Create two folders named `inputs` and `outputs` (Or wathever you chose in the .env file). Place your 3DTiles in the inputs folder (it can be in a subfolder).

As an example, 3DTiles datasets for the city of Lyon can be found on the LIRIS' [website](https://datasets.liris.cnrs.fr/3dtiles-tilesets-metropolis-lyon-version1). We recommend fetching the data using ftp (or filezila for example).

The input folder should be constructed as such :

```bash
├── inputs                # Or the custom name given in the .env file
      ├── tiles
            ├── tilex.b3dm
            ├── tiley.b3dm
      ├── tileset.json
```

3. Adapt the configuration to your needs. Here is a full list of all options available :

| Arguments             | Description                                                                                                           | Example                                |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| TIMESTAMP             | ISO Timestamp at wich to calculate sunlight (YYYY-MM-DDTHH:00)                                                        | 2020-05-05T12:00                       |
| LOG_LEVEL             | Provide logging level depending on [logging module](https://docs.python.org/3/howto/logging.html#when-to-use-logging) | DEBUG, INFO, WARNING, ERROR, CRITICAL  |
| INPUTS_FOLDER         | Inputs folder containing 3D Tiles use for sunlight computation                                                        | ./inputs                               |
| OUTPUTS_FOLDER        | Outputs folder containing 3D Tiles with Sunlight Result in batch table                                                | ./outputs                              |
| FORMAT                | The format with which to output the results (CSV or TILE)                                                             | CSV                                    |
| OPTIONAL_ARGS         | Optional arguments (compute aggregate...)                                                                             | --with-aggregate                       |
| START_DATE            | Start date of sunlight computation  (Only if TIMESTAMP is not defined)                                                | 403224                                 |
| END_DATE              | End date of sunlight computation  (Only if TIMESTAMP is not defined)                                                  | 403248                                 |

Explanation for START_DATE and END_DATE :
   They are a deprecated time format, that was introduced in 3DUSE. The time is represented in Hours since 1975-01-01T00:00, so 403224 translates to 2016-01-01T00:00 in ISO time format. It is recommended that you use *TIMESTAMP* as the format is standardised and human readable.

The format is CSV by defaul and should be left as is, the 3DTIles export is *broken and deprecated*.

#### Windows specific prerequisite

Sometimes, windows can be fussy with end of line terminators, we recommend you run the following command to prevent issues with reading the entrypoint.sh file

```bash
dos2unix Context/entrypoint.sh
```

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

1. Build pySunlight DockerFile :

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

## Visualising the results

To visualise the CSV results please refer to [this repository](https://github.com/VCityTeam/UD-Demo-Sunlight) which contains a POC of a visualisation.
