class YearAndNotes < ActiveRecord::Migration[7.1]
  def change
    add_column :quotes, :year, :integer
    add_column :quotes, :notes, :text
  end
end
