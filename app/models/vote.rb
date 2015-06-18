class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  validate :user_can_only_vote_once

  def user_can_only_vote_once
    if !Vote.where("user_id = ? AND song_id = ?", user_id, song_id).empty?
      errors.add(:user_id, 'You can only vote once per song.')
    end
  end
end
