module ApplicationCable
  # Class to handle connections to remote web services.
  # This class is used by ActiveResource::Base to interface with REST
  # services.
  class Connection < ActionCable::Connection::Base
  end
end
