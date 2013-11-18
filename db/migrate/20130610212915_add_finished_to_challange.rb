# -*- encoding : utf-8 -*-
class AddFinishedToChallange < ActiveRecord::Migration
  def change
    add_column :challanges, :finished, :boolean
  end
end
