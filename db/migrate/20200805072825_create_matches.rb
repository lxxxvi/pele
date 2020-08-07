class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :uefa_match_id, null: false
      t.references :venue, foreign_key: true, null: false
      t.datetime :kickoff_at, null: false
      t.string :tournament_stage, null: false
      t.references :home_team, foreign_key: { to_table: :teams }, null: true
      t.references :guest_team, foreign_key: { to_table: :teams }, null: true
      t.integer :home_team_score, null: true
      t.integer :guest_team_score, null: true
    end
  end
end
