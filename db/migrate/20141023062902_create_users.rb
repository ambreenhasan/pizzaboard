class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string   :name
      t.string   :phone
      t.string   :last_day_sent
      t.boolean  :deliverable

      t.timestamps
    end
  end
end
