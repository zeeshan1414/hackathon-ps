class AddTagRefToChallenges < ActiveRecord::Migration[6.1]
  def change
    add_reference :challenges, :tag, null: false, foreign_key: true
  end
end
