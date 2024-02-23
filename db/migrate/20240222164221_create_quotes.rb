class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.string :saying
      t.string :said_by

      t.timestamps
    end
  end
end
