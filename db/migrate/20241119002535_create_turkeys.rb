class CreateTurkeys < ActiveRecord::Migration[7.0]
  def change
    create_table :turkeys do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.string :status

      t.timestamps
    end
  end
end
