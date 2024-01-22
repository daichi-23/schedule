class AddMemoToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :memo, :text, after: :all_day
  end
end
