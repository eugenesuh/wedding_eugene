class Activity < ApplicationRecord
  # Direct associations

  has_many   :alikes,
             :dependent => :destroy

  has_many   :acomments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
