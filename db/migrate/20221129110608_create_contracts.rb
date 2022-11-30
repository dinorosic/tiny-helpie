class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.references :account
      t.datetime :expires_at
      t.string :status
      t.boolean :notified, default: false

      t.timestamps
    end
  end
end
