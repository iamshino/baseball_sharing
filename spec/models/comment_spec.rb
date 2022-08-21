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
    let(:comment) { build(:comment, comment: "1234567890 2234567890 3234567890 4234567890 5234567890 6234567890 7234567890 8234567890 9234567890 0234567890", user: user, article: article) }

    it "エラーする" do
      expect(comment).to be_invalid
      expect(comment.errors.details[:comment][0][:error]).to eq :too_long
    end
  end
end
