class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug 
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(input)
        Artist.all.find{|artist| artist.slug == input }
    end

end