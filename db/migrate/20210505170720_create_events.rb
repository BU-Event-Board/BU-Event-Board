class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.timestamps null: false
      t.string :description
    end
  end
end
