class AddIssuedByToBorrower < ActiveRecord::Migration[5.2]
  def change
    add_reference :borrowers, :issued_by, references: :users, index: true
    add_foreign_key :borrowers, :users, column: :issued_by_id
  end
end