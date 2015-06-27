class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.references :user, null: false
      t.integer    :hours      #何時間やったか
      t.date       :post_date  #投稿した日時
    
      t.timestamps null: false
    end
    add_index :hours, :user_id
  end
end
