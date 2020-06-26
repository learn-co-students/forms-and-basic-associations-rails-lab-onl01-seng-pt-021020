class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  def genre_id=(id)
    self.genre = Genre.find_by(id: id)
  end
  def new_notes=(notes)
    notes.each do |n|
      note = Note.create(content: n)
      note.song = self
      note.save
      self.notes << note
    end
  end
end
