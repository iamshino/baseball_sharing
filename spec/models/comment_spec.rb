require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { build(:user) }
  let(:article) { build(:article) }

  context "commentを100文字以下で記述しているとき" do
    let(:comment) { build(:comment, user: user, article: article) }

    it "コメントを作成できる" do
      expect(comment).to be_valid
    end
  end

  context "commentを記述していないとき" do
    let(:comment) { build(:comment, comment: nil, user: user, article: article) }

    it "エラーする" do
      expect(comment).to be_invalid
      expect(comment.errors.details[:comment][0][:error]).to eq :blank
    end
  end

  context "commentが100文字を超えているとき" do
    let(:comment) { build(:comment, comment: 'a' * 101, user: user, article: article) }

    it "エラーする" do
      expect(comment).to be_invalid
      expect(comment.errors.details[:comment][0][:error]).to eq :too_long
    end
  end
end
