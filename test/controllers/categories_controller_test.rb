# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  describe 'DELETE #destroy' do
    it 'destroys the requested category' do
      category = Category.create(valid_attributes)
      expect {
        delete :destroy, params: { id: category.to_param }
      }.to change(Category, :count).by(-1)
    end

    it 'redirects to the root path' do
      category = Category.create(valid_attributes)
      delete :destroy, params: { id: category.to_param }
      expect(response).to redirect_to(root_path)
    end
  end
end
