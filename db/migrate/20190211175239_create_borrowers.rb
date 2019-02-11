class CreateBorrowers < ActiveRecord::Migration[5.2]
  def change
    create_table :borrowers do |t|
      t.references :book, foreign_key: true
      t.references :student, foreign_key: true
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end
end
