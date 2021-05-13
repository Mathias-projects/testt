class Doctor < User
  has_many :medical_treatments
  default_scope { where(account_type: 2) }
end
