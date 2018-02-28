class Slike < ApplicationRecord
  # Direct associations

  belongs_to :song

  belongs_to :user

  # Indirect associations

  # Validations

end
