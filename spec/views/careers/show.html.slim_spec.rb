require 'rails_helper'

RSpec.describe "careers/show", :type => :view do
  before(:each) do
    @career = assign(:career, Career.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
