class CreateNamespaces < ActiveRecord::Migration[5.0]
  def change
    create_table :namespaces do |t|
      t.boolean :locked
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
