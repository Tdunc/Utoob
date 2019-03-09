class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :duration
      t.string :genre
      t.text :description
      t.string :trailer

      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
