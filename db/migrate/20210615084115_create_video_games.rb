class CreateVideoGames < ActiveRecord::Migration[6.0]
  def change
    create_table :video_games do |t|
      t.string :title
      t.string :plateform
      t.float :price
      t.string :photo
      t.references :user, null: false, foreign_key: true
      t.boolean :available
      t.string :category

      t.timestamps
    end
  end
end
