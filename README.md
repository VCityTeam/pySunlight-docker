# pySunlight Docker

# About The Project

It's a dockerised version of [pySunlight](https://github.com/VCityTeam/pySunlight) program.

# Getting Started

## Install

Clone the repository.

```bash
git clone https://github.com/VCityTeam/pySunlight-docker.git
```

## Usage

### Configure
1. Copy and rename .env.example to . env.

2. Adapt the configuration to your needs.

Here is a full list of all options available :
| Arguments             | Description                                                                                                           | Example                                |
| --------------------- | --------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| PYSUNLIGHT_START_DATE | Start date of sunlight computation                                                                                    | 403224                                 |
| PYSUNLIGHT_END_DATE   | End date of sunlight computation                                                                                      | 403248                                 |
| PYSUNLIGHT_LOG_LEVEL  | Provide logging level depending on [logging module](https://docs.python.org/3/howto/logging.html#when-to-use-logging) | DEBUG, INFO, WARNING, ERROR, CRITICAL  |

3. Create two folders named `inputs` and `outputs`. Place your 3DTiles in the inputs folder (it can be in a subfolder).

### Build

To build pySunlight docker :

```bash
docker compose build
```

### Run

Run the container with :

```bash
docker compose up
```
