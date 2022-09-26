class CreateProjectsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_tags do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
