require 'rails_helper'

RSpec.describe "careers/edit", :type => :view do
  before(:each) do
    @career = assign(:career, Career.create!())
  end

  it "renders the edit career form" do
    render

    assert_select "form[action=?][method=?]", career_path(@career), "post" do
    end
  end
end
