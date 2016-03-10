class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }

      t.timestamps null: false
    end
  end
end
