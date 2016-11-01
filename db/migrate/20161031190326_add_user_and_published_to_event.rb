class AddUserAndPublishedToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :published_at, :datetime
    add_column :events, :creator_id, :integer, index: true
  end
end
