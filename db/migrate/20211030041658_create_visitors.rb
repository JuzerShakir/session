class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      # setting null to false will abort the record to be saved if value is empty
      # however, it will save if the value is blank, this is taken care by validations
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
    add_index :visitors, :email, unique: true
  end
end
