# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "#editable?(target_user)" do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = Report.new(title: "今日の課題", content: "テスト書く", user_id: me.id)
    assert report.editable?(me)
  end

  test "#created_on" do
    report = Report.new(title: "今日の課題", content: "テスト書く")
    report.created_at = "Sun, 22 Aug 2021 09:56:51.976710000 JST +09:00"
    assert_equal "2021-08-22", "#{report.created_on}"
  end
end
