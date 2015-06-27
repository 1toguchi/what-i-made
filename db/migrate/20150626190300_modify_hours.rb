class ModifyHours < ActiveRecord::Migration
  def change
  	add_column :hours, :done, :string
  end
end
