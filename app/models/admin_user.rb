class AdminUser < ApplicationRecord

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

  FORBIDDEN_USERNAMES = %['littlebopeep' 'humptydumpty' 'marymary']
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50
  validates_presence_of :username
  validates_length_of :username, :within => 8..25
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email
  validate :username_is_allowed
  validate :no_new_users_on_friday, :on => :create
private
def username_is_allowed
  if FORBIDDEN_USERNAMES.include?(username)
    errors.add(:username, ' has been restricted from use')
  end

  def no_new_users_on_friday
    if Time.new.wday == 5
      errors.add(:base, 'No new users on Fridays')
    end
  end



end

end
