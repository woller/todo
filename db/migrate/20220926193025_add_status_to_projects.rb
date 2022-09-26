class AddStatusToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :status, :string, default: "planned"
  end
end
