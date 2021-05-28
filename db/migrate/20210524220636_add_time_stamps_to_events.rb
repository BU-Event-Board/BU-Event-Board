class AddTimeStampsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :timestamp
  end
end
