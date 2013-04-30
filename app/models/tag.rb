class Tag < ActiveRecord::Base
  belongs_to :nugget
  attr_accessible :name, :nugget_id
end
