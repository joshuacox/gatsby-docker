# gatsby-docker
Develop &amp; Build [GatsbyJS](https://www.gatsbyjs.org/) static sites within a [Docker](https://www.docker.com/) container.

- 🚮  **Clutter-free host machine**: No need to install Node/Gatsby/Webpack/etc on your host machine! Only Docker required (tested on `v19.03.2`).
- 🏗  **Easy setup**: Automatic GatsbyJS site initializion with [`gatsby-starter-default`](http://gatsbyjs.github.io/gatsby-starter-default/) (unless already initialized)
- 👍  **Simple CLI API**: [`develop`/`stage`/`build`](#usage)
- 🆕  **Recent NodeJS**: Container based on [NodeJS `dubnium` running in Alpine Linux](https://github.com/nodejs/docker-node/blob/db3b27c8388136b5e529861d7c3fa12fd8328301/9/alpine/Dockerfile)
- 📃  [MIT](https://github.com/joshuacox/gatsby-docker/blob/master/LICENSE)-licensed



## Setup

**NOTE**: Your GatsbyJS site will be created into `$(pwd)/site` automatically.

Add these to your `.gitignore`:
```
site/node_modules
site/public
site/.cache
```


## Usage

### Develop
```sh
docker run -it --rm -v $(pwd)/site:/site -p 8000:8000 joshuacox/gatsby-docker develop
```

### Stage

In other words, build and serve:
```sh
docker run -it --rm -v $(pwd)/site:/site -p 8000:8000 joshuacox/gatsby-docker stage
```

### Build

Builds production ready site into `site/public`:
```sh
docker run -it --rm -v $(pwd)/site:/site -p 8000:8000 joshuacox/gatsby-docker build
```

### Run arbitary command inside the container
```sh
docker run -it --rm -v $(pwd)/site:/site -p 8000:8000 joshuacox/gatsby-docker <YOUR-COMMAND-HERE>
```

For example to install a new NPM-module: `docker run -it --rm -v $(pwd)/site:/site joshuacox/gatsby-docker yarn add gatsby-transformer-yaml`
