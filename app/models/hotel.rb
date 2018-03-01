class Hotel < ApplicationRecord
  # Direct associations

  has_many   :hcomments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
