FROM ruby

RUN apt-get update -y && \
    apt-get install -y nodejs vim && \
    gem install rails -v 4.2.6 && \
    rails new hydra && cd hydra/ && \
    echo "gem 'hydra', '10.0.0'" >> Gemfile && \
    bundle install && \
    rails generate hydra:install

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["hydra"]
