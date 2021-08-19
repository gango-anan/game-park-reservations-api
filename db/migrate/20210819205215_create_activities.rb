class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.string :park, null: false
      t.string :image_url, null: false
      t.string :details, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
