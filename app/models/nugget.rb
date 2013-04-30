class Nugget < ActiveRecord::Base
  attr_accessible :answer, :question, :user_id, :tags_attributes
  belongs_to :user
  has_many :tags
  before_save :split_tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def split_tags
    tags = tags.split(',')
    tags.each {|t| Tag.new(name: t.strip)}
  end

end



# def tag_set=(tags)
# tags = tags.split(',')
# tags.each {|t| Tag.new(name: t)}
# end

# def tag_get   # I changed it from tag_set to tag_get
# model_tags.map(&:name).join(', ')
# end
