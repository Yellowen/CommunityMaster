class CreateNamespaces < ActiveRecord::Migration[5.0]
  def change
    create_table :namespaces, id: :uuid do |t|
      t.boolean :locked, default: false
      t.string :name
      t.text :description
      t.uuid :user_id

      t.timestamps
    end
  end
end
