class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.string :timestamps
    end
  end
end
