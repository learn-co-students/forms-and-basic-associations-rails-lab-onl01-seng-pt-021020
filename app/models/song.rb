class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes_attributes=(notes_hash)
    notes_hash.each do |k, note|
      unless note[:content].nil? || note[:content] == ''
        self.notes.build(note)
      end
    end
  end
end
