class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :string
      t.string :attachment
      t.string :string

      t.timestamps null: false
    end
  end
end
