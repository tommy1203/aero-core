# coding: utf-8
require 'spec_helper'

describe CategoriesController do

  fixtures :categories

  before do
    controller.class.skip_before_filter :authenticate_user!
  end

  describe "GET /categories" do
    it "should be successfull" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET /categories/new" do
    it "should be successfull" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET /categories/edit" do
    it "should be successfull" do
      get 'edit', {:id => 1}
      response.should be_success
    end
  end

  describe "DELETE /categories" do
    it "should be successfull" do
      delete 'destroy', {:id => 1}
      response.should redirect_to(categories_path)
    end
  end

  describe "POST /categories" do
    it "should be successfull" do
      post 'create', {:id => 4, :name => "オプションソフト"}
      response.should redirect_to(category_path(4))
    end
  end

  describe "PUT /categories" do
    it "should be successfull" do
      post 'update', {:id => 1, :name => "メインソフト"}
      response.should redirect_to(category_path(1))
    end
  end

=begin
=end

end
