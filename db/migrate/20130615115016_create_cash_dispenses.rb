class CreateCashDispenses < ActiveRecord::Migration
  def change
    create_table :cash_dispenses do |t|
      t.decimal :amount_due
      t.decimal :captured_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
