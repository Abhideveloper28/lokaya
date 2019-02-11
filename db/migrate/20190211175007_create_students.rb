class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :class
      t.string :section
      t.string :enrollment_no
      t.string :contact_no
      t.string :email_id
      t.datetime :dob

      t.timestamps
    end
  end
end
