class RetrieveQuickResponse < RetrieveResponse
  attr_reader :references

  def initialize(raw_response)
    super(raw_response)
    refs = self.parsed_response["refworks"]["RWResult"]["RetrieveResult"]["reference"]
    # here we parse out references into actual Reference objects
    @references = Array.new

    # As usual with RefWorks API, it can return an array or a single element depending on how many references were returned.
    if (refs.class == Array)
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