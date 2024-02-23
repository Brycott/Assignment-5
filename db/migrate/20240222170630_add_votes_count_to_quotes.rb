class AddVotesCountToQuotes < ActiveRecord::Migration[7.1]
  def change
    add_column :quotes, :votes_count, :integer
  end
end
