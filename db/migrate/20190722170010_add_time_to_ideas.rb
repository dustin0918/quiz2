class AddTimeToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :created_at, :datetime
    add_column :ideas, :updated_at, :datetime
  end
end
