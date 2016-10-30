require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "upcoming" do
    it "return nil if there are only past events" do
      expect(Event.upcoming).to eq []
    end

    it "return nil if there are only past events" do
      Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event", venue: Venue.new, category: Category.new)
      expect(Event.upcoming).to eq []
    end

    it "return only event2 if 2 is future and 1 is past" do
      a=Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: " a past event", venue: Venue.new, category: Category.new, name: "sa")
      b=Event.create!(starts_at: 2.days.ago, ends_at: 3.days.from_now, extended_html_description: " an upcoming event", venue: Venue.new, category: Category.new, name: "as")
      expect(Event.upcoming).to eq [b]
    end
  end


  describe "event#create" do
    it "create events if enough information" do
      a=Event.create!(starts_at: 15.days.ago, ends_at: 20.days.from_now, extended_html_description:"future event", venue:Venue.new, category: Category.new, name:"Some event")
      expect(Event.count).to eq 0
    end
  end
end
