# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  date       :datetime
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :bigint           not null
#
# Indexes
#
#  index_events_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#
class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :name, presence: true, length: {minimum: 3, maximum: 50}
  validates :date, presence: true
  validate :date_must_be_in_the_future

  def date_must_be_in_the_future
    if date.present? && date < Date.today
      errors.add(:date, "must be in the future")
    end
  end

  after_update_commit do
    broadcast_replace_to(
      "inbox_list",
      target: self,
      partial: "users/listeventforuser",
      locals: {
        event: self
      }
    )
  end
end
