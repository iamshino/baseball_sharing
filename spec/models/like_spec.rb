require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'user_idとarticle_idの組み合わせが1つのとき' do
    let(:user) { create(:user) }
    let(:article) { create(:article, user: user) }
    let(:like) { build(:like, user: user, article: article) }

    it 'いいねできる' do
      expect(like).to be_valid
    end
  end

  context 'user_idとarticle_idの組み合わせが被っているとき' do
    let(:user) { create(:user, id: 1) }
    let(:article) { create(:article, id: 1, user: user) }

    it 'エラーする' do
      Like.create!(user: user, article: article)
      like = Like.new(user: user, article: article)

      expect(like).to be_invalid
      expect(like.errors.details[:article_id][0][:error]).to eq :taken
    end
  end

  context 'user_idがないとき' do
    let(:user) { create(:user, id: nil) }
    let(:article) { create(:article, user: user) }

    it 'エラーする' do
      like = Like.new(user: user, user_id: nil, article: article)

      expect(like).to be_invalid
      expect(like.errors.details[:user][0][:error]).to eq :blank
    end
  end

  context 'article_idがないとき' do
    let(:user) { create(:user) }
    let(:article) { create(:article, id: nil, user: user) }

    it 'エラーする' do
      like = Like.new(user: user, article: article, article_id: nil)

      expect(like).to be_invalid
      expect(like.errors.details[:article][0][:error]).to eq :blank
    end
  end
end
