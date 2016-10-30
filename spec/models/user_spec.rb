
require 'rails_helper'

RSpec.describe User, type: :model do
  it "Let user sign up" do
    @user=User.create!(:email => "aslg", :password => "1234", :name => "sagsd")
    expect(User.all.size).to eq 1
  end
  
  end



