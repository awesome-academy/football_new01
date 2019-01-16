class AddDeletedAtToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :deleted_at, :datetime
    add_index :comments, :deleted_at

    add_column :leagues, :deleted_at, :datetime
    add_index :leagues, :deleted_at

    add_column :matches, :deleted_at, :datetime
    add_index :matches, :deleted_at

    add_column :match_results, :deleted_at, :datetime
    add_index :match_results, :deleted_at

    add_column :news, :deleted_at, :datetime
    add_index :news, :deleted_at

    add_column :notifications, :deleted_at, :datetime
    add_index :notifications, :deleted_at

    add_column :rankings, :deleted_at, :datetime
    add_index :rankings, :deleted_at

    add_column :rounds, :deleted_at, :datetime
    add_index :rounds, :deleted_at

    add_column :score_bets, :deleted_at, :datetime
    add_index :score_bets, :deleted_at

    add_column :stadia, :deleted_at, :datetime
    add_index :stadia, :deleted_at

    add_column :teams, :deleted_at, :datetime
    add_index :teams, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
  end
end
