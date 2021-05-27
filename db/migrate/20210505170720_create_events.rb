class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.timestamps :date
      t.string :description
    end
  end
end
