class CreateMactors < ActiveRecord::Migration[5.0]
  def change
    create_table :mactors do |t|
      t.integer :actor_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
