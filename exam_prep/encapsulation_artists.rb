# class Song
#     attr_reader :title, :artist, :inspiration
  
#     def initialize(title)
#       @title = title
#       @artist
#     end
  
#     def artist=(name)
#       @artist = name.upcase
#     end
#   end
  
#   p song = Song.new("Superstition")
#   p song.artist = "Stevie Wonder"
#   p song.artist
  
  
class Artist
  
  attr_reader :kind
  
  def initialize(kind, inspiration)
    @kind = kind
    @inspiration = inspiration
  end
  
  
  def reveal_inspiration
    inspiration
  end
  
  def compare_inspiration(other_artist)
    inspiration == other_artist.inspiration
  end
  
  private
  
    

  # def inspiration
  #   @inspiration
  # end
  
  protected

    attr_reader :inspiration
  
end
  
bob_dylan = Artist.new('musician', "Jack Karowac")
bob_marley = Artist.new('musician', 'Jack Karowac')

p bob_dylan.kind
# p bob_dylan.inspiration
p bob_dylan.reveal_inspiration
p bob_dylan.compare_inspiration(bob_marley)