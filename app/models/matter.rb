class Matter < ActiveRecord::Base
  resourcify
  include Workflow

  attr_accessible :name, :workflow_state, :icon, :matter_father_id
  belongs_to :matter_father, :class_name => "Matter"
  has_many :matrix_content_types, :dependent => :restrict
  has_attached_file :icon, 
					:styles => { 
                        :medium => "128x128>",
                        :thumb => "64x64>"
                     }
  

  validates_presence_of :name

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
