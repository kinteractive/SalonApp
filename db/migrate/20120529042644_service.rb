class Service < ActiveRecord::Migration
  def change
    change_column :services, :description, :string, :limit => 10000
  end
end
