class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.integer :status, default: 0
      t.string  :description
      t.string  :identifier
      t.integer :user_id
      t.integer :department, default: 0
      t.string  :customer_name
      t.string  :customer_email
    end
  end
end