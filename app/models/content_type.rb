class ContentType < ActiveRecord::Base
  resourcify
  include Workflow

  attr_accessible :name, :workflow_state, :icon
  has_attached_file :icon, 
					:styles => { :medium => "128x128>",
                                 :thumb => "64x64>" }
  

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
