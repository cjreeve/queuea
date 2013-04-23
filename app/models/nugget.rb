class Nugget < ActiveRecord::Base
  attr_accessible :answer, :question, :user_id
  belongs_to :user
end
