class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name
    self.genre.name
  end

  def note_contents=(notes)
    notes.each do |note|
      if note != ""
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
