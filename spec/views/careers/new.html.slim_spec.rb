require 'rails_helper'

RSpec.describe "careers/new", :type => :view do
  before(:each) do
    assign(:career, Career.new())
  end

  it "renders new career form" do
    render

    assert_select "form[action=?][method=?]", careers_path, "post" do
    end
  end
end
