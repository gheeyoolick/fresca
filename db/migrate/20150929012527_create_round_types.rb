class CreateRoundTypes < ActiveRecord::Migration
  def change
    create_table :round_types do |t|
      t.string :round_type
      t.boolean :matches, default: false
      t.timestamps null: false
    end
  end
end
