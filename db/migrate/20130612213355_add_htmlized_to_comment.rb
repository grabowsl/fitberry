# -*- encoding : utf-8 -*-
class AddHtmlizedToComment < ActiveRecord::Migration
  def change
    add_column :comments, :htmlized, :text
  end
end
