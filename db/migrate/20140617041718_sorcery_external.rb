class SorceryExternal < ActiveRecord::Migration
  def change
    create_table :authentications, :id=>false do |t|
      t.integer :user_id   #, :null => false
      t.string :provider, :uid #, :null => false

#      t.timestamps
    end
  end
end