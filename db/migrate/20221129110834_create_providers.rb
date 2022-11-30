class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string(:name, index: {unique: true})
      t.string(:url)

      t.timestamps
    end

    add_reference(:contracts, :provider)
  end
end
