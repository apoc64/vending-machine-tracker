class AddSnacksToMachines < ActiveRecord::Migration[5.1]
  def change
    add_reference :machines, :snacks, foreign_key: true
  end
end
