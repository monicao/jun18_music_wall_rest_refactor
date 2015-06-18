class Track < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :author, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))

  def total_votes
    Vote.where(["song_id = ?", id]).sum(:vote_count)
  end
end
