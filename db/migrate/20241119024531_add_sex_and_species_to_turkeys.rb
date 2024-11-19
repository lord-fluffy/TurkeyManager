class AddSexAndSpeciesToTurkeys < ActiveRecord::Migration[7.0]
  def change
    add_column :turkeys, :sex, :string
    add_column :turkeys, :species, :string
  end
end
