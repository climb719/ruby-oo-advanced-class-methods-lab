class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #instantiates the song 
    song.save #saves the song by calling .save 
    song #returns the new song that was created be calling it on last line
  end

  def self.new_by_name(name)
    song = self.new #instantiates a song with a name property
    song.name = name #sets name 
    song #returns song
  end

  def self.create_by_name(name)
    song = self.new #instantiates name
    song.name = name #sets name
    song.save #save the song
    song #return the song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name} #iterate over @@ all array, check if name equals song name in the array, if so return it
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name) #if find by name true it will return value on left, if false it will go to right side and run that method
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    new_filename = filename.chomp(".mp3").split(" - ") #create an new array that removes (.chomp) the .mp3 and splits the artist name from song name at the -
    song = Song.new #need a song object to set new properties
    song.name = new_filename[1] #access name from new_filename 
    song.artist_name = new_filename[0] #access name from new_filename 
    song #return song name 
  end

  def self.create_from_filename(filename)
    new_filename = filename.chomp(".mp3").split(" - ") 
    song = Song.new 
    song.name = new_filename[1] 
    song.artist_name = new_filename[0] 
    song.save #also saves the new song instance 
    song
  end

  def self.destroy_all
    self.all.clear
  end
 
end
