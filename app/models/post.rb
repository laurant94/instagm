class Post < ApplicationRecord
  #associations
  belongs_to :user
  has_and_belongs_to_many :users

  #valdations
  validates :user_id, presence: true

  #scope
  scope :online, ->(online) { where(online: online)}
  scope :for_user, ->(user_id) { where(user_id: user_id)}
  scope :insert_author, -> { includes(:user)}

  mount_uploader :image; ImageUploader
  
  #methods de class
  def is_author?(author)
    user_id == author
  end

end
