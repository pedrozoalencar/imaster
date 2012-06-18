class Ask < ActiveRecord::Base
  resourcify
  include Workflow
  attr_accessible :description, :details
  
  validates_presence_of :description, :details

  
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
