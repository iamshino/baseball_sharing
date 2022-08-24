require 'rails_helper'

RSpec.describe "Likes", type: :request do
  before do
    sign_in user
  end

  let(:user) { create(:user) }
  let(:article) do
    create(:article, user: user)
  end
  let(:params) do
    {
      like: {
        user_id: user.id
      }
    }
  end

  describe "POST /articles/:article_id/likes" do
    subject { post article_likes_path(article_id: article.id, params: params) }

    context 'params is valid' do
      it do
        expect { subject }.to change { Like.count }.by(1)
      end
    end
  end

  describe "DELETE /articles/:article_id/likes/:id" do
    subject { delete article_like_path(article_id: article.id, id: like.id), params: params }

    let(:like) { create(:like, article: article, user: user) }

    context 'params is valid' do
      it do
        subject
        expect(Like.find_by(id: like.id)).to eq(nil)
      end
    end
  end
end
