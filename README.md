# ss3om
- Version: 0.4.7.9002
- Date: 2020-11-18
- Author: Iago Mosqueira, EC JRC
- Maintainer: Iago Mosqueira <iago.mosqueira@ec.europa.eu>
- Repository: <https://github.com/iagomosqueira/ss3om/>
- Bug reports: <https://github.com/iagomosqueira/ss3om/issues>

## Overview
Tools for conditioning of Operating Models based on SS3 by considering structural uncertainty in input parameters and assumptions, jackknifing of models and use of McMC output. A grid of SS3 runs is created and results are loaded on various FLR objects using functions from the [r4ss](https://github.com/r4ss/r4ss) package.

To install this package, start R and enter:

  # INSTALL FLR pkgs and depedencies
  source("http://flr-project.org/R/instFLR.R")

  # and then select mse, ggplotFL and FLFishery

  # INSTALL devtools
  install.packages("devtools")

  # INSTALL recent r4ss
  devtools::install_github('r4ss/r4ss')

  # DISABLE install_github turning warnings into errors
  Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)

  # INSTALL ss3om
  devtools::install_github('iagomosqueira/ss3om')

## Usage

## Build Status
[![Travis Build Status](https://travis-ci.org/iagomosqueira/ss3om.svg?branch=master)](https://travis-ci.org/iagomosqueira/ss3om)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/iagomosqueira/ss3om?branch=master&svg=true)](https://ci.appveyor.com/project/iagomosqueira/ss3om)

## Releases
- [All release](https://github.com/iagomosqueira/ss3om/releases/)

## License
Copyright (c) 2017 European Union. Released under the [European Union Public License 1.2](https://joinup.ec.europa.eu/page/eupl-text-11-12).

## Contact
You are welcome to:

- Submit suggestions and bug-reports at: <https://github.com/iagomosqueira/ss3om/issues>
- Send a pull request on: <https://github.com/iagomosqueira/ss3om/>
- Compose a friendly e-mail to: <me@my.com>
