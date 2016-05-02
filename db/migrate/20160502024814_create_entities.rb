class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :entity_type, default: 'D'
      t.references :entity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
