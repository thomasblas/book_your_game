class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.date :rent_start_at
      t.date :rent_end_at
      t.string :state
      t.references :user, null: false, foreign_key: true
      t.references :video_game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
