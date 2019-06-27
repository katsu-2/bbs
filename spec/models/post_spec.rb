require 'rails_helper'

RSpec.describe Post, type: :model do
  #タイトルとコンテンツがあれば有効
  it "is valid with title, content" do
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

  #タイトルがなければ無効
  it "is invalid without title" do
    post = FactoryBot.build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  #コンテンツが無ければ無効
  it "is invalid without content" do
    post = FactoryBot.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end

  #タイトルが20字以上は無効
  it "is invalid character of title over 20" do
    post = FactoryBot.build(:post, title: "a" * 21)
    post.valid?
    expect(post.errors[:title]).to include("is too long (maximum is 20 characters)")
  end

  #コンテンツが1000字以上は無効
  it "is invalid character of content over 1000" do
    post = FactoryBot.build(:post, content: "a" * 1001)
    post.valid?
    expect(post.errors[:content]).to include("is too long (maximum is 1000 characters)")
  end
end
