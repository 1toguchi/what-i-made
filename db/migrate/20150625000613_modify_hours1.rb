class ModifyHours1 < ActiveRecord::Migration
  def change
  	add_column :hours, :done ,:string
  # remove_column :hours ,:user_id　#外部キーのつもりがindexを足そうとするとabortするから消す
  #	add_colomn :hours, :users, :references , null: false #外部キー
  end

  # add_index :hours, :user_id　#追加できず
end
