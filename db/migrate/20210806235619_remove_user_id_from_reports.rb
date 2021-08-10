# frozen_string_literal: true

class RemoveUserIdFromReports < ActiveRecord::Migration[6.1]
  def change
    remove_column :reports, :user_id, :integer
  end
end
