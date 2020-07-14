class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.belongs_to :subject
      t.integer :position
      t.string :name
      t.boolean :visible
      t.string :permalink
      t.text :content

      t.timestamps
    end
  end
end
