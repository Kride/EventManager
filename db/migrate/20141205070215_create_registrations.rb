class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.string :status

      t.timestamps
    end
  end
end
