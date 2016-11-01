class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :venue
  belongs_to :category
  has_many :ticket_types

  validates_presence_of :extended_html_description, :venue_id, :category_id, :starts_at, :creator_id
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    where("ends_at > ?", Time.now).published
  end

  def self.published
    where.not(published_at: nil)
  end


  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
