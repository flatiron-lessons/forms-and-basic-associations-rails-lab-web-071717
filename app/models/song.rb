class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
  	self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
  	if self.artist
  		self.artist.name
  	end
  end

  def genre_name=(genre_name)
  	self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
  	if self.genre
  		self.genre.name
  	end
  end

  # <input name="song[note_contents][]" id="song_notes_1">

  def note_contents=(notes)
  	notes.each do |n|
  		unless n == ""
	  		song_note = Note.create(content: n)
	  		self.notes << song_note
	  	end
  	end
  end

  def note_contents
  	if self.notes
  		self.notes.map{|n| n.content}
  	end
  end
end

