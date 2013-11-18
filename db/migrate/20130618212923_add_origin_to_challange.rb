# -*- encoding : utf-8 -*-
class AddOriginToChallange < ActiveRecord::Migration
  def change
    add_column :challanges, :origin, :string
  end
end
