class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :guest, class_name: "User", foreign_key: "user_id"

  validates :content, presence: true

  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end
end
