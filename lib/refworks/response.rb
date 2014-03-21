
class Response
  attr_reader :body, :parsed_response, :result_code, :result_msg, :process_time

  def initialize(raw_response)
    # The RefWorks API emits invalid XML.  Specifically, when the session is invalid, the ResultMsg field
    # which comes back contains some illegal raw characters.  This is the only set of transformations I
    # could find which completely eliminate the junk characters, but it may be breaking other things.

    # Trying to work around the malformed response bug
    #p raw_response.body
    #raw_response.body.encode!('UTF-8', 'binary', :invalid => :replace, :undef => :replace, :replace => '?')
    #raw_response.body.gsub!(/[\u0001-\u0019]/,'?')
    #p raw_response.body

    @body = raw_response.body
    @parsed_response = raw_response.parsed_response
    @result_code = parsed_response["refworks"]["RWResult"]["result"]
    @process_time = parsed_response["refworks"]["RWResult"]["processTime"]
    @result_msg = parsed_response["refworks"]["RWResult"]["resultMsg"]
  end
end