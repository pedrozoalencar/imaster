class Article < ActiveRecord::Base
  attr_accessible :content, :matrix_content_type_id, :title, :workflow_state

  resourcify
  include Workflow

  belongs_to :matrix_content_type

  workflow do
    state :new do
      event :submit, :transitions_to => :published
      event :save_as_draft, :transitions_to => :draft
    end
    state :draft do
      event :submit, :transitions_to => :published
    end
    state :published do
      event :save_as_draft, :transitions_to => :draft
      event :remove, :transitions_to => :removed
    end
    state :removed do
      event :submit, :transitions_to => :published
    end
  end
end
