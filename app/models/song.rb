class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: { in: [true, false] }

    with_options if: :released do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { allow_nil: true, less_than_or_equal_to: Date.current.year }
    end

    # def released?
    #     song = Song.new 
    #     if !song.released.nil?    
    #         true
    #     end 
    # end 
end