class Thing::Cell < Cell::Concept
  include ActionView::Helpers::DateHelper
  include Rails::Timeago::Helper

  property :name
  property :created_at

  def show
    render
  end

  private

  def name_link
    link_to model.name, thing_path(model)
  end

  def created_at
    timeago_tag(super)
  end

  def classes
    classes = ["large-3", "columns"]
    classes << "end" if options[:last] == model
    classes
  end
end
