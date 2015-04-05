class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :questions
      t.integer :answer

      t.timestamps
    end
  end
end
