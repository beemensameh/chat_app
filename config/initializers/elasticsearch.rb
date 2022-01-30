require "elasticsearch/model"

Elasticsearch::Model.client = Elasticsearch::Client.new host: ENV.fetch("ELASTIC_HOST"), log: true, transport_options: {request: {timeout: 5}}
