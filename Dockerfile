# Docker image for citeproc-node app
# Usage: $ docker run -d -p 8085:8085 -t {this image}

FROM node
MAINTAINER LibreCat community <librecat-dev@lists.uni-bielefeld.de>

# append nodejs binaries TO PATH
ENV PATH node_modules/.bin:$PATH

# Add source
RUN git clone --recursive https://github.com/zotero/citeproc-node.git /src

# Set Working directory
WORKDIR /src

# XML to JSON for optimal performance
RUN ./xmltojson.py ./csl ./csl-json
RUN ./xmltojson.py ./csl-locales ./csl-locales-json

# Override Configuration
ADD citeServerConf.json .

# Expose port
EXPOSE 8085

# run app
CMD ["node", "lib/citeServer.js"]
