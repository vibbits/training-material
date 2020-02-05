FROM bretfisher/jekyll-serve

RUN apk add git nodejs nodejs-npm

# Workaround galaxyproject bug #1739
COPY ./metadata /site/metadata

ENV RUBYOPT "-w -W2"
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "8080", "-V", "--trace" ]