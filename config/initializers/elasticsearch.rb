require 'elasticsearch/model'

Elasticsearch::Model.client = Elasticsearch::Client.new host: 'localhost:9200', log: true, transport_options: { request: { timeout: 5 } }
