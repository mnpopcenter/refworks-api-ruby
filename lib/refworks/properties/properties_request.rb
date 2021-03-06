# This file is part of the Minnesota Population Center's refworks-api-ruby project.
# For copyright and licensing information, see the NOTICE and LICENSE files
# in this project's top-level directory, and also online at:
#   https://github.com/mnpopcenter/refworks-api-ruby

class PropertiesRequest < Request
  def self.call_class
    "properties"
  end

  def self.generate_class_params(params)
    # handle params common to all Properties calls
    class_name = call_class()

    # query parameters common to all Properties calls
    {
        :class => class_name,
    }
  end
end