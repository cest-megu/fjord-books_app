# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:harry_potter)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    assert_text 'ハリーポッターと賢者の石'
    assert_text '魔法の世界'
    assert_text 'J・K・ローリング'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'ハリーポッターとアズカバンの囚人'
    fill_in 'メモ', with: '泣ける'
    fill_in '著者', with: 'J・K・ローリング'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'ハリーポッターとアズカバンの囚人'
    assert_text '泣ける'
    assert_text 'J・K・ローリング'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: 'ハリーポッターと秘密の部屋'
    fill_in 'メモ', with: '感動した'
    fill_in '著者', with: 'J・K・ローリング'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'ハリーポッターと秘密の部屋'
    assert_text '感動した'
    assert_text 'J・K・ローリング'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
  end
end
