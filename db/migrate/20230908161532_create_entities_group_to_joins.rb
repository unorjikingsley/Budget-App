class CreateEntitiesGroupToJoins < ActiveRecord::Migration[7.0]
  def change
    create_join_table :entities, :groups do |t|
      t.index :entity_id
      t.index :group_id

      # t.references :entity, null: false, foreign_key: true
      # t.references :group, null: false, foreign_key: true

      # t.timestamps
    end
  end
end

# this to join tables of Entity and Group
