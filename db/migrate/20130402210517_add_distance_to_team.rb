# -*- encoding : utf-8 -*-
class AddDistanceToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :distance, :float
  end
end
