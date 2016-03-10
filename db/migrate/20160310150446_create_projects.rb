class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :account, index: true, foreign_key: { on_delete: :cascade }, null: false
      t.string :name, null: false
      t.string :slug, null: false, index: true

      t.timestamps null: false
    end

    add_index :projects, [:account_id, :slug], unique: true
  end
end
