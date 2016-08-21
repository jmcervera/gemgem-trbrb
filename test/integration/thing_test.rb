require 'test_helper'

class ThingIntegrationTest < Trailblazer::Test::Integration
  it "allow anonymous" do
    visit "/things/new"

    # invalid
    click_button "Create Thing"
    page.must_have_css ".error"

    # correct submit.
    fill_in 'Name', with: "Bad Religion"
    click_button "Create Thing"
    page.current_path.must_equal thing_path(Thing.last)

    # edit
    thing = Thing.last
    visit "/things/#{thing.id}/edit"
    page.must_have_css "form #thing_name"
    page.wont_have_css "form #thing_name.readonly[value='Rails']"

  end
end
