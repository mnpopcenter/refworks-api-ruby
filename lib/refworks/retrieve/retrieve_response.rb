# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class RetrieveResponse < Response

  attr_reader :total_hits, :total_returned, :references

  def initialize(raw_response)
    super(raw_response)
    if result_code != "200"
      @total_hits = "0"
      @total_returned = "0"
      return
    end

    # If results returned, process the references and metadata

    @total_hits = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["totalHits"]
    @total_returned = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["totalReturned"]

    refs = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["reference"]

    # here we parse out references into an array of actual Reference objects (even if only 1 ref returned)
    @references = Array.new

    # The RefWorks API can return an array or a single element depending on how many references were returned.
    if refs.class == Array
      refs.each do |ref|
        @references << Reference.new(ref)
      end
    else
      # here, "refs" is just a hash representing a single reference
      # in other words, only one reference was returned
      @references << Reference.new(refs)
    end
  end
end