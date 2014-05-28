class CreateStandupdesks < ActiveRecord::Migration
  def change
    create_table :standupdesks do |t|
      t.string :desklocation
      t.boolean :deskwant

      t.timestamps
    end
  end
end
