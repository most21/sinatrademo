class CreateCakes < ActiveRecord::Migration[5.2]
  def change
    create_table "cakes", id: :serial do |c|
      c.string :name, null: false, default: ""
    end
  end
end
