class ImportfilterFavoritesRequest < ImportfilterRequest
  def self.call_method
    'favorites'
  end

  def self.generate_request_info(params)

    # get common ImportFilters parameters
    class_params = generate_class_params(params)

    # query parameters for the favorites call
    method_params = { :method => call_method,
    }

    query_string_params = class_params.merge(method_params)

    # return the request info
    {:params => query_string_params}
  end
end