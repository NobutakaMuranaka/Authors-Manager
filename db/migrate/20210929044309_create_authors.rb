class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.text :introduction
      t.string :sex

      t.timestamps
    end
  end
end
