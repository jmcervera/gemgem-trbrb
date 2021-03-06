require 'test_helper'

class ThingCellTest < Cell::TestCase
  controller ThingsController
  let(:rails) { Thing::Create.(thing: {name: "Rails"}).model }
  let(:trb) { Thing::Create.(thing: {name: "Trailblazer"}).model }

  subject { concept("thing/cell", collection: [trb, rails], last: rails).to_s }

  it do
    subject.must_have_selector ".columns.end .header a", text: "Rails"
    subject.wont_have_selector ".columns.end .header a", text: "Trailblazer"
    subject.must_have_selector ".columns .header a", text: "Trailblazer"
  end
end
