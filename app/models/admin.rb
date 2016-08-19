class Admin < Squatter
  has_many :approved_abodes, class_name: "Abode", foreign_key: :approved_by
end
