class Hero < ApplicationRecord
    validates :name, presence: true

    scope :sorted_by_name, -> { order(:name) }
    #scope :sorted_desc_by_name, -> { order(name: :desc) }
    scope :search, -> (term) { where('LOWER(name)LIKE ?', "%#{term.downcase}%") if term.present? }
end
