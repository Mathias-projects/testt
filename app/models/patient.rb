class Patient < User
  has_many :medical_treatments
  default_scope do  where(accoun t_type: 1)
  end
end
