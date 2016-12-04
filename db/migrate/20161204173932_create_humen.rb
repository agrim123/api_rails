class CreateHumen < ActiveRecord::Migration[5.0]
  def change
    create_table :humen do |t|
      t.string :name
      t.string :weapon

      t.timestamps
    end
  end
end
