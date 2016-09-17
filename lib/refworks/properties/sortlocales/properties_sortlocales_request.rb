# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class PropertiesSortlocalesRequest < PropertiesRequest
  def self.call_method
    'sortlocales'
  end

  def self.generate_request_info(params)

    # get common Properties parameters
    class_params = generate_class_params(params)

    # query parameters for the sortlocales call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end