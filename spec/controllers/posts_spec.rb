require 'rails_helper'

RSpec.describe 'Api V1 PostsController', type: :request do

  # #deleteと#showで使用
  before do
    @post = create(:book)
  end

  describe '#index' do
    it '全てのポストを取得する' do
      book = create_list(:book, 4)
      get '/api/v1/posts'
      
      expect(response.status).to eq(200)
      
      # beforeでbookを1回作成しているので合計で5つ作成される
      expect(response.parsed_body.length).to eq(5)
    end
  end

  describe '#create' do
    it 'ポストを作成する' do
      post_params = { title: 'テスト', author: '著者名', image: '本の画像'}

      # 作成できている確認
      # マッチャーのchange(クラス, :count).by(1)でDB件数の変化を調べられる
      expect { post '/api/v1/posts', params: { post: post_params } }.to change(Post, :count).by(+1)
      # 作成時のstatusを確認
      expect(response.status).to eq(201)
    end
  end

  describe '#show' do
    it '特定のポストを取得する' do

      get "/api/v1/posts/#{@post.id}"
      # リクエストが成功したかどうか
      expect(response.status).to eq(200)

      # 特定のポストを取得できているかどうか
      expect(response.parsed_body['post']['title']).to eq(@post.title)
    end
  end

  describe '#delete' do
    it 'ポストを削除する' do

      # データ削除確認
      expect { delete "/api/v1/posts/#{@post.id}"}.to change(Post, :count).by(-1)

      # リクエストが成功したかどうか
      expect(response.status).to eq(200)
    end
  end
end