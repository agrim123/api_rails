class CreateZombies < ActiveRecord::Migration[5.0]
  def change
    create_table :zombies do |t|
      t.string :name
      t.string :weapon

      t.timestamps
    end
  end
end
