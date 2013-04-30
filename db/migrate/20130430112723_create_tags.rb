class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :nugget

      t.timestamps
    end
    add_index :tags, :nugget_id
  end
end
