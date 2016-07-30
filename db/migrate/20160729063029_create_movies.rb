class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.integer :year
      t.float :rating
      t.string :genere
      t.string :language
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
