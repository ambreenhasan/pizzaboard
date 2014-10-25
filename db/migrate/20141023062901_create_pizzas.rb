class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string   :description
      t.date     :date

      t.timestamps
    end
  end
end
