class Activity < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :class_name => "Alike",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
