class MatrixContentType < ActiveRecord::Base
  resourcify
  include Workflow
  
  attr_accessible :content_type_id, :matter_father_id, :matter_id

  belongs_to :matter
  belongs_to :matter_father, :class_name => "Matter"
  belongs_to :content_type

  validates_presence_of :matter_id
  validates_presence_of :matter_father_id
  validates_presence_of :content_type_id



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
