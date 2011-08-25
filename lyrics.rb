# lyrics.rb
%w[ net/http uri rexml/document rexml/xpath json sinatra].each{ |gem| require gem }
require './hitrans'
include HITRANS

class Lyrics
  attr_accessor :lyricsurl, :showurl, :page_url, :title, :composer, :lyricist, :singer, :album, :year, :lyrics
  ERRORMSG  = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<lyrics>Sorry, server is not responding to lyrics fetch instruction.</lyrics>"

  def initialize (host, port)
    self.title = self.lyrics = self.composer = self.lyricist = self.singer = self.album = self.year = ""
  end

  def format_show
      yield
      output = "<table border=\"0\" cellpadding=\"0\" style=\"color:#000;font-size:.8em\">\n<tr><td>Song: {title} </td></tr>\n<tr><td>From: {album} {year} </td></tr>\n<tr><td>Music Director: {composer} </td></tr>\n<tr><td>Lyrics: {lyricist}</td></tr>\n<tr><td>Singers: {singer} </td></tr> </table>\n<p style=\"color:#000;font-size:.8em\"> {lyrics} </p>\n<hr/><div style=\"margin-left:1em\">{links}</div>"

      self.lyrics.gsub!( /\n/, "\<br /\>" )     #replace line breaks with <br/>
      output.sub!( "{title}", self.title )
      output.sub!( "{album}", self.album )
      output.sub!( "{composer}", self.composer )
      output.sub!( "{lyricist}", self.lyricist )
      output.sub!( "{singer}", self.singer )
      output.sub!( "{lyrics}", self.lyrics )
      self.year ? output.sub!( "{year}", ' @ ' + self.year ) : output.sub!( "{year}", '' )
      return output
  end

  def format(items, artist='', film='')
      "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<suggestions page_url=\"#{self.page_url}\">\n" + items.map { |s| "<suggestion title=\"#{s[:title]}\" artist=\"#{s[:artist]}\" url=\"#{self.showurl}#{s[:id]}\" />\n" }.join + "</suggestions>"
  end
end

class LI < Lyrics
  def initialize(host, port)
    super
    self.lyricsurl = "http://alpha.lyricsindia.net/songs/"
    self.showurl = "http://" + host + ":" + port.to_s + "/show/li/"
  end

  def fetch_search(title)
p   fullurl = self.lyricsurl + "search?txt=#{title}&format=xml"
    Net::HTTP.get(URI.parse(fullurl))
  end

  def fetch_show(song_no)
    fullurl = self.lyricsurl + song_no + ".xml"
    Net::HTTP.get(URI.parse(fullurl))
  end

  def extract_songs(response)
    xmlDoc = REXML::Document.new(response.to_s.gsub("\n", "")).root
    nodes = REXML::XPath.match(xmlDoc, '/songs/song')
    suggestion = []; song_no = ""
    nodes.each do |node|
      unititle = ""
      node.elements.each('id') { |child| song_no = child.text }
      node.elements.each('unititle') { |child| unititle = child.text }
      suggestion << { :title => unititle, :id => song_no }
    end
    return suggestion.sort! { |a,b| a[:id] <=> b[:id] }, song_no
  end

  def parse(response)
    xmlDoc = REXML::Document.new(response).root
    xmlDoc.elements.each('/song/unititle') { |child| self.title = child.text.gsub!(/\n/, "") }
    REXML::XPath.match(xmlDoc, '/song/composers/composer').each do |node|
      node.elements.each('name') { |child| self.composer += (self.composer ? ','+child.text : child.text) }
    end
    REXML::XPath.match(xmlDoc, '/song/lyricists/lyricist').each do |node|
      node.elements.each('name') { |child| self.lyricist += (self.lyricist ? ','+child.text : child.text) }
    end
    REXML::XPath.match(xmlDoc, '/song/singers/singer').each do |node|
      node.elements.each('name') { |child| self.singer += (self.singer ? ','+child.text : child.text) }
    end
    xmlDoc.elements.each('/song/unidata') { |child| self.lyrics = child.text }
    xmlDoc.elements.each('/song/movie/name') { |child| self.album = child.text }
    xmlDoc.elements.each('/song/movie/year') { |child| self.year = child.text }
  end

  def format_show
    super.sub!( "{links}", "<a href='http://lyricsindia.net/'>LyricsIndia</a>" )
  end

end
class GIIT < Lyrics
  attr_accessor :cisburl

  def initialize(host, port)
    super
    self.lyricsurl = "http://giitaayan.com/"
    self.cisburl = "http://thaxi.hsc.usc.edu/rmim/giitaayan/"
    self.showurl = "http://" + host + ":" + port.to_s + "/show/gi/"
  end

  def fetch_search(title)
p   fullurl = self.lyricsurl + "search.asp?browse=stitle&s=#{title}&submit=search"
    Net::HTTP.get(URI.parse(fullurl))
  end

  def fetch_show(song_no)
    song_no = (song_no[0..3] == 'cisb' ? 'cisb/'+song_no[4..song_no.length] : 'files/'+song_no)
    fullurl = self.cisburl + song_no + ".isb"
    Net::HTTP.get(URI.parse(fullurl))
  end

  def extract_songs(response)
    response.gsub!(/[\n\r]/, "")
    response.gsub!(/<[iI][mM][gG][^>]*>/, "" )
    response.gsub!(/<[sS][cC][rR][iI][pP][tT][^>]*>[^<]*(<!--[^-]*-->)*[^<]*<\/[sS][cC][rR][iI][pP][tT]>/, "" )
    response.gsub!(/<[sS][tT][yY][lL][eE][^>]*>[^<]*(<!--[^-]*-->)*[^<]*<\/[sS][tT][yY][lL][eE]>/, "" )
    response.gsub!(/<[fF][oO][rR][mM][^>]*>[^<]*<\/[fF][oO][rR][mM]>/, "" )
    count = response.match(/Total[\s*]<b>(\d+)<\/b>[\s*]songs/).to_s.match(/(\d+)/) { |no| no.to_s.to_i }
    suggestion = []; song_no = ""
    rows = response.split("<table")[2].split("<tr>")
    i = 2; page = 0
    catch (:done) do
      while i < count+2 do
        cells = rows[i-page*50].split("<td>")
        film = cells[4].match(/">[^<]*[\/]*<\//).to_s
        artist = cells[7].match(/">[^<]*[\/]*<\//).to_s
        src, song_no = cells[1].match(/http:\/\/thaxi\.hsc\.usc\.edu\/rmim\/giitaayan\/(.*).isb/) { |m| $1 }.split('/')
        song_no = (src == 'cisb' ? 'cisb' + song_no : song_no)       #src can be either cisb or rmim
        suggestion << { :title => HITRANS::convertHindi(cells[3][0...cells[3].index(/&nbsp;/)]),
                        :id => song_no,
                        :film => film[2..film.length-3],
                        :artist => artist[2..artist.length-3] }
        i += 1
        throw :done if i == 52
      end
    end
    return suggestion.sort! { |a,b| a[:title] <=> b[:title] }, song_no
  end

  def parse(response)
      self.title = response.match( /\\stitle\{([-0-9a-zA-Z_.,()\s\/\\#]*)\}%/ ) { HITRANS::convertHindi($1) }.to_s
      self.album = response.match( /\\film\{([-0-9a-zA-Z_.,()\s\/\\#]*)\}%/ ) { $1 }.to_s
      self.year = response.match( /\\year\{([0-9]*)\}%/ ) { $1 }.to_s
      self.singer = response.match( /\\singer\{([-a-zA-Z_.,()\s\/]*)\}%/ ) { $1 }.to_s
      self.composer = response.match( /\\music\{([-a-zA-Z_.,()\s\/]*)\}%/ ) { $1 }.to_s
      self.lyricist = response.match( /\\lyrics\{([-a-zA-Z_.,()\s\/]*)\}%/ ) { $1 }.to_s
      response.gsub!(/##/, "$")
      response.gsub!( /%\((.*?)\)/ ) { "$"+$1+"$" }
      self.lyrics = response.match( /#indian[\s\n\r%]*([^#]*)[\s\n\r%]*#endindian/ ) { $1 }.to_s
      self.lyrics = HITRANS::convertHindi( self.lyrics )
      self.lyrics.gsub!( /%/, '' )
  end

  def format_show
    super.sub!( "{links}", "<a href='http://giitaayan.com/'>Giitaayan</a>" )
  end

  def format(items, artist='', film='')
      suggestions = items.delete_if { |s| (artist && !s[:artist].upcase.include?(artist)) }
      result = suggestions.map do |s|
               { :title => s[:title], :url => self.showurl+s[:id],
                 :film => s[:film],   :artist => s[:artist] }
      end
      result.to_json
  end
end
class XBMC < GIIT
  def initialize(host, port)
    super
    self.showurl = "http://" + host + ":" + port.to_s + "/show/cu/"
  end

  def format_show
      yield
      output = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<lyrics>#{self.lyrics}</lyrics>"
      output.gsub!( /^\s[\s]+/, "" )       #remove multiple blank lines
  end

#if artist or film is provided then filter out ones not matching it
  def format(items, artist='', film='')
      suggestions = items.delete_if { |s| (artist && !s[:artist].upcase.include?(artist)) || (film && !s[:film].upcase.include?(film)) }
      suggestions.to_json
  end
end

before do
  cache_control :public, :must_revalidate, :max_age => 600
end

get '/' do
  'Welcome to Hindi lyrics fetcher ...'
end

get '/search/:use?*' do

  using = params[:use] if params[:use]
  title = URI.escape( params[:title] ) if params[:title]
  title = URI.escape( params[:Title] ) if (!title) && params[:Title]
  artist = params[:artist].upcase if params[:artist]
  artist = params[:Artist].upcase if (!artist) && params[:Artist]
  film = params[:film].upcase if params[:film]
  film = params[:Film].upcase if (!film) && params[:Film]

  return Lyrics:ERRORMSG if using.empty? || title.empty?

  if using == 'li' then lyrics = LI.new(request.host, request.port) end
  if using == 'gi' then lyrics = GIIT.new(request.host, request.port) end
  if using == 'cu' then lyrics = XBMC.new(request.host, request.port) end

  content = lyrics.fetch_search(title)
  return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry" ) )
  suggestion, song_no = lyrics.extract_songs(content)
  if suggestion.size == 1
    content = lyrics.fetch_show(song_no)
    return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry" ) )
    return lyrics.format_show { lyrics.parse(content) }
  else
    return lyrics.format(suggestion, artist, film)
  end
end

get '/show/:use/:id', :provides => 'text' do |using, id|

  return Lyrics::ERRMSG if using.empty? || id.empty?

  if using == 'li' then lyrics = LI.new(request.host, request.port)   end
  if using == 'gi' then lyrics = GIIT.new(request.host, request.port) end
  if using == 'cu' then lyrics = XBMC.new(request.host, request.port) end

  content = lyrics.fetch_show( URI.escape(id) )
  return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry" ) )
  return lyrics.format_show { lyrics.parse(content) }
end

error do
  'Sorry there was some error with: ' + request.url
end
