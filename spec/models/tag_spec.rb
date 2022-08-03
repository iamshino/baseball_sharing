require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:article) { build(:article) }
  let(:tag_articles) { build(:tag_articles, article: article, tag: tag) }

  context "nameを指定している時" do
    let(:tag) { build(:tag) }

    it "タグが作成できる" do
      expect(tag).to be_valid
    end
  end

  context "nameを指定していない時" do
    let(:tag) { build(:tag, name: nil) }

    it "エラーする" do
      expect(tag).to be_invalid
    end
  end
end
