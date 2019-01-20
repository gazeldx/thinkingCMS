require "rails_helper"

RSpec.describe "Writer haha", :type => :system do
  before do
    driven_by(:rack_test)

    writer = create(:writer)
    create(:book, writer: writer)

    @writer_count = Writer.count
  end

  it "enables me to create writers" do
    visit "/writers/new"

    fill_in "writer_name", :with => "My Writer2"
    fill_in "writer_bio", :with => "Writer Bio2"
    click_button "创建作者"

    expect(page).to have_text("My Writer2 Writer Bio2")
    expect(page).to have_text("John")
    expect(Writer.count).to eq(@writer_count + 1)
    expect(Book.first.name).to eq("TheBook name")
  end
end
