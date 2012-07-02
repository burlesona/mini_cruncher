class Question < ActiveRecord::Base
  attr_accessible :content, :test_id
  belongs_to :test
end
