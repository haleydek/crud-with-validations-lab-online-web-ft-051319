class Song < ApplicationRecord
    validates :title, presence:true, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, numericality: { if: :released?, only_integer: true, less_than_or_equal_to: Date.current.year }
end