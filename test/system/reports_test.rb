# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:my_report)

    visit root_url
    fill_in 'Eメール', with: 'bob@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_text '僕の感想'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '率直な感想'
    fill_in '内容', with: '驚きでいっぱい'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '率直な感想'
    assert_text '驚きでいっぱい'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: '日報の変更'
    fill_in '内容', with: '驚きだけじゃなかった'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '日報の変更'
    assert_text '驚きだけじゃなかった'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
  end
end
