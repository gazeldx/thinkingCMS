class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :writer, index: true
      t.string :name
      t.string :release_time
      t.text :summary

      t.timestamps
    end
  end
end
