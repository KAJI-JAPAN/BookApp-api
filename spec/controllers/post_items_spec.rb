require 'rails_helper'

RSpec.describe 'Api V1 PostItemsController', type: :request do
  
  describe 'update' do
    it 'テキストを更新する' do
      book = create(:book)
      content = create(:content, post_id: book.id)
      post_params =  { id: content.id, content: 'Update-Content', status: false, post_id: book.id }

      patch "/api/v1/post_items/#{content.id}", params: { post: post_params}
      expect(response.status).to eq(200)
      expect(response.parsed_body['content']).to eq('Update-Content')
    end
  end
end