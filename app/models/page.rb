class Page < ApplicationRecord

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users

  scope :visible, lambda {where(:visibe => true)}
  scope :invisibe, lambda { where(:visible => false)}
  scope :sorted, lambda { order("position ASC")}
  scope :newest_first, lambda { order("created_at DESC")}

end
