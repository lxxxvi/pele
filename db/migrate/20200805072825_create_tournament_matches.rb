class CreateTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_matches do |t|
      t.string :uefa_match_id, null: false
      t.references :venue, foreign_key: true, null: false
      t.datetime :kickoff_at, null: false
      t.string :tournament_stage, null: false
      t.string :home_team, null: false
      t.string :guest_team, null: false
      t.integer :home_team_score, null: true
      t.integer :guest_team_score, null: true
    end
  end
end
