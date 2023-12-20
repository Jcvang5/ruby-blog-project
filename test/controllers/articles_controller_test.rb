# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  describe 'DELETE #destroy' do
  let(:category) { create(:category) }
  let(:article) { create(:article, category: category) }

  it 'destroys the requested article' do
    expect {
      delete :destroy, params: { category_id: category.id, id: article.id }
    }.to change(Article, :count).by(-1)
  end

  it 'redirects to the root path' do
    delete :destroy, params: { category_id: category.id, id: article.id }
    expect(response).to redirect_to(root_path)
  end
end
end
