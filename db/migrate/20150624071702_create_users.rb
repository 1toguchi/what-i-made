class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name, null: false
      t.string   :email, null:false
      t.integer  :grade, null:false, default: 0
      t.integer  :bunri, null: false, default:0
      t.integer  :choice, null: false ,default: 0 #志望校
      t.string   :password_digest
      t.boolean  :administrator, null: false, default: false

      t.timestamps null: false
    end
  end
end
