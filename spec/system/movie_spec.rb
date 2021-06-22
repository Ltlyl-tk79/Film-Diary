# frozen_string_literal: true

require 'rails_helper'

describe '機能のテスト' do
  let(:user) { create(:user) }
  let!(:movie) { create(:movie, title:'hoge',body:'body', user_id: user.id) }

  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe '新規投稿画面のテスト' do
    before do
      visit new_movie_path
    end
    context '表示の確認' do
      it 'new_movie_pathが"movies/new"であるか' do
        expect(current_path).to eq('/movies/new')
      end
      it '投稿ボタンの表示はされているか' do
        expect(page).to have_button 'Create Movie'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'movie[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'movie[body]', with: Faker::Lorem.characters(number:20)
#         # 上記と同様にmovie_imageも記述する必要かあるか?
        click_button 'Create Movie'
        expect(page).to have_current_path movies_path
      end
      it '投稿に失敗する' do
        click_button 'Create Movie'
        expect(page).to have_content 'error'
        expect(current_path).to eq('/movies')
      end
    end
  end

  describe '投稿一覧画面のテスト' do
    before do
      visit movies_path
    end
    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content movie.title
      end
    end
  end

  # describe '投稿詳細画面のテスト' do
  #   before do
  #     visit movie_path(movie)
  #   end

  #   context 'リンクの遷移先の確認' do
  #     it 'Editの遷移先は編集画面か' do

  #       #edit_link = find_all('a')[5]
  #       # 上記の記述は何を意味しているか確認
  #       #edit_link.click

  #       click_link 'Edit'
  #       expect(current_path).to eq('/movies/' + movie.id.to_s + '/edit')
  #     end
  #   end
  #   context 'movie削除のテスト' do
  #     it 'movieの削除' do
  #       expect{ movie.destroy }.to change{ Movie.count }.by(-1)
  #     end
  #   end
  # end
  describe '編集画面のテスト' do
    before do
      visit edit_movie_path(movie)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示されている' do
        expect(page).to have_field 'movie[title]', with: movie.title
        expect(page).to have_field 'movie[body]', with: movie.body
      end
      it '保存ボタンが表示される' do
        expect(page).to have_button 'Update Movie'
      end
    end
    context '更新処理に関するテスト' do
      it '更新に失敗しエラーメッセージが表示される' do
        fill_in 'movie[title]', with: ""
        fill_in 'movie[body]', with: ""
        click_button 'Update Movie'
        expect(page).to have_content 'error'
      end
    # context '更新処理に関するテスト' do
    #   it '更新後のリダイレクト先は正しいか' do
    #     fill_in 'movie[title]', with: Faker::Lorem.characters(number:5)
    #     fill_in 'movie[body]', with: Faker::Lorem.characters(number:20)
    #     click_button 'Update Movie'
    #     expect(page).to have_current_path movie_path(movie)
    #   end
    # end
    end
  end
end



