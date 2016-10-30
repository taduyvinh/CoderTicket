require 'rails_helper'

RSpec.describe "events", type: :routing do
  it "route to /upcoming path" do
    expect(get: "/upcoming").to route_to(controller: "events", action: "index")
  end
end