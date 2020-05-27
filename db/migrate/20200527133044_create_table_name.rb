class CreateTableName < ActiveRecord::Migration[5.2]
  def change
    create_table "cake", id: :serial do |c|
      c.string :name, null: false, default: ""
    end
  end
end
