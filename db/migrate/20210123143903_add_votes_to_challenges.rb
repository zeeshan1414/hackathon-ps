class AddVotesToChallenges < ActiveRecord::Migration[6.1]
  def change
    add_column :challenges, :votes, :integer, null: false, default: 0
  end
end
