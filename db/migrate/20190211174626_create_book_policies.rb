class CreateBookPolicies < ActiveRecord::Migration[5.2]
  def change
    create_table :book_policies do |t|
      t.integer :issue_days
      t.decimal :late_fee

      t.timestamps
    end
  end
end
