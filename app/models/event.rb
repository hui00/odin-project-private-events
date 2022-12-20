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
  after_update_commit do
    broadcast_replace_to(
      "inbox_list",
      target: self,
      partial: "users/listeventforuser",
      locals: {
        event: self,
      },
    )
  end
end
