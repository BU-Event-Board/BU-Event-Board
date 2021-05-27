class AddTimeStampsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :timestamps
  end
end
