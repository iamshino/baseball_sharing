require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    sign_in user
  end

  let!(:user) { create(:user) }
  let!(:article) { create(:article, user: user) }

  describe "POST /articles/:article_id/comments" do
    subject { post article_comments_path(article_id: article.id),  params: params }

    context 'params is valid' do
      let(:params) {
        {
          comment: {
            article_id: article.id,
            user_id: user.id,
            comment: 'comment'
          }
        }
      }

      it do
        expect { subject }.to change { Comment.count }.by(1)
      end
    end

    context 'when params is invalid' do
      let(:params) {
        {
          comment: {
            article_id: article.id,
            user_id: user.id,
            comment: 'a' * 101
          }
        }
      }

      it do
        expect { subject }.to change { Comment.count }.by(0)
      end
    end
  end

  describe "DELETE /articles/:article_id/comments/:id" do
    subject { delete article_comment_path(article_id: article.id, id: comment.id) }

    let(:comment) { create(:comment, user: user, article: article) }

    context 'params is valid' do
      it do
        subject
        expect(Comment.find_by(id: comment.id)).to eq(nil)
      end
    end
  end
end
