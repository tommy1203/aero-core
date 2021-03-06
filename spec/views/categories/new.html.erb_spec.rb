# coding: utf-8
require 'spec_helper'

describe "categories/new" do
  fixtures :categories
  before do
    @category = Category.new
  end

  it "カテゴリー名のテキストボックス(空)が表示される。" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "text", :name => "category[name]")
    end
  end

  it "登録ボタンが表示される。" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => "submit", :value => "　登　録　")
    end
  end
end
