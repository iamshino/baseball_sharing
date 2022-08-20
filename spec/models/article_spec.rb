require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { build(:user) }

  context "titleとcontentを記述している時" do
    let(:article) { build(:article, user: user) }

    it "記事が作成できる" do
      expect(article).to be_valid
    end
  end

  context "titleのみ記述している時" do
    let(:article) { build(:article, user: user, content: nil) }

    it "エラーする" do
      expect(article).to be_invalid
      expect(article.errors.details[:content][0][:error]).to eq :blank
    end
  end

  context "contentのみ記述している時" do
    let(:article) { build(:article, user: user, title: nil) }

    it "エラーする" do
      expect(article).to be_invalid
      expect(article.errors.details[:title][0][:error]).to eq :blank
    end
  end

  context "どちらも記述していない時" do
    let(:article) { build(:article, user: user, title: nil, content: nil) }

    it "エラーする" do
      expect(article).to be_invalid
      expect(article.errors.details[:title][0][:error]).to eq :blank
      expect(article.errors.details[:content][0][:error]).to eq :blank
    end
  end
end
