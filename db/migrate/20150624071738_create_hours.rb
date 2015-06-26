class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.integer  :hours      #何時間やったか
      t.date     :post_date  #投稿した日時
      t.integer  :user_id

      t.timestamps null: false
    end
  end
end
