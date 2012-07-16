class ResponseSet < ActiveRecord::Base
  attr_accessible :client_id, :test_id
  belongs_to :client
  belongs_to :test
end
