# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?(target_user)" do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = Report.new(title: "今日の課題", content: "テスト書く", user_id: me.id)
    assert report.editable?(me)
  end

  test "#created_on" do

  end
end
