class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :trigram, null: false, index: { unique: true }
      t.string :flag_svg

      t.timestamps
    end
  end
end
