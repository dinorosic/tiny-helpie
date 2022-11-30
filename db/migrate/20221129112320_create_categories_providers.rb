class CreateCategoriesProviders < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :providers do |t|
      t.timestamps
    end
  end
end
