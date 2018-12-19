# Docker image for citeproc-node app
# Usage: $ docker run -d -p 8085:8085 -t {this image}

FROM node
MAINTAINER LibreCat community <librecat-dev@lists.uni-bielefeld.de>

# append nodejs binaries TO PATH
ENV PATH node_modules/.bin:$PATH

# Add source
RUN git clone --recurse-submodules https://github.com/zotero/citeproc-js-server.git
WORKDIR citeproc-js-server
RUN npm install

# XML to JSON for optimal performance
RUN ./xmltojson.py ./csl ./csl-json
RUN ./xmltojson.py ./csl-locales ./csl-locales-json

# Override Configuration
ADD citeServerConf.json config/default.json

# Expose port
EXPOSE 8085

# run app
CMD ["npm", "start"]
