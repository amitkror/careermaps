require 'rails_helper'

RSpec.describe "careers/index", :type => :view do
  before(:each) do
    assign(:careers, [
      Career.create!(),
      Career.create!()
    ])
  end

  it "renders a list of careers" do
    render
  end
end
