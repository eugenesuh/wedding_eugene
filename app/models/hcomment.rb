class Hcomment < ApplicationRecord
  # Direct associations

  belongs_to :hotel

  belongs_to :user

  # Indirect associations

  # Validations

end
