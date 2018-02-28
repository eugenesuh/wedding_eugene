class Photo < ApplicationRecord
  # Direct associations

  has_many   :plikes,
             :dependent => :destroy

  has_many   :pcomments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
