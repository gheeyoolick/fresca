class CreateRoundTypes < ActiveRecord::Migration
  def change
    create_table :round_types do |t|
      t.string :round_type

      t.timestamps null: false
    end
  end
end
