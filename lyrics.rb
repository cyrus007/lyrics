# lyrics.rb
%w[ net/http uri rexml/document rexml/xpath sinatra].each{ |gem| require gem }
require './hitrans'
include HITRANS

class Lyrics
  attr_accessor :lyricsurl, :showurl, :page_url, :title, :composer, :lyricist, :singer, :album, :year, :lyrics
  ERRORMSG  = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<lyrics>Server is not responding to lyrics fetch instruction.</lyrics>"

  def initialize (host, port)
    self.title = self.lyrics = self.composer = self.lyricist = self.singer = self.album = self.year = ""
  end

  def format(items)
    if items.empty?
      yield
      output = "<table border=\"0\" cellpadding=\"0\" style=\"color:#000;font-size:.8em\">\n<tr><td>Song: {title} </td></tr>\n<tr><td>From: {album} {year} </td></tr>\n<tr><td>Music Director: {composer} </td></tr>\n<tr><td>Lyrics: {lyricist}</td></tr>\n<tr><td>Singers: {singer} </td></tr> </table>\n<p style=\"color:#000;font-size:.8em\"> {lyrics} </p>\n<hr/><div style=\"margin-left:1em\">{links}</div>"

      self.lyrics.sub!( /[\n]*/, "\n" )         #remove multiple blank lines
      self.lyrics.gsub!( /\n/, "\<br /\>" )     #replace line breaks with <br/>
      output.sub!( "{title}", self.title )
      output.sub!( "{album}", self.album )
      output.sub!( "{composer}", self.composer )
      output.sub!( "{lyricist}", self.lyricist )
      output.sub!( "{singer}", self.singer )
      output.sub!( "{lyrics}", self.lyrics )
      self.year ? output.sub!( "{year}", ' @ ' + self.year ) : output.sub!( "{year}", '' )
      return output
    else
      return "<suggestions page_url=\"#{self.page_url}\">\n" + items.first.map { |s| "<suggestion title=\"#{s[:title]}\" url=\"#{self.showurl}#{s[:id]}\" />\n" }.join + "</suggestions>"
    end
  end
end

class LI < Lyrics
  def initialize(host, port)
    super
    self.lyricsurl = "http://alpha.lyricsindia.net/songs/"
    self.showurl = "http://" + host + ":" + port.to_s + "/li/show/"
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

  def format(*items)
    super(items).sub!( "{links}", "<a href='http://lyricsindia.net/'>LyricsIndia</a>" )
  end
end
class GIIT < Lyrics
  attr_accessor :cisburl

  def initialize(host, port)
    super
    self.lyricsurl = "http://giitaayan.com/"
    self.cisburl = "http://thaxi.hsc.usc.edu/rmim/giitaayan/"
    self.showurl = "http://" + host + ":" + port.to_s + "/gi/show/"
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
        src, song_no = cells[1].match(/http:\/\/thaxi\.hsc\.usc\.edu\/rmim\/giitaayan\/(.*).isb/) { |m| $1 }.split('/')
        song_no = (src == 'cisb' ? 'cisb' + song_no : song_no)
        suggestion << { :title => '<b>' + film[2..film.length-3] + '</b> : ' + HITRANS::convertHindi(cells[3][0...cells[3].index(/&nbsp;/)]), :id => song_no }
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
      self.lyrics = response.match( /#indian([^#]*)#endindian/ ) { $1 }.to_s
      self.lyrics = HITRANS::convertHindi( self.lyrics.gsub!( /%/, '' ) )
  end

  def format(*items)
    super(items).sub( "{links}", "<a href='http://giitaayan.com/'>Giitaayan</a>" )
  end

end

get '/' do
  'Welcome to Hindi lyrics fetcher ...'
end

get '/li/search/:title', :provides => 'text' do |t|

  return "Song title is empty." if t.empty?

  lyrics = LI.new(request.host, request.port)
  lyrics.page_url = ""
  title = URI.escape(t)
  content = Net::HTTP.get(URI.parse(lyrics.lyricsurl + "search?txt=#{title}&format=xml"))
  return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry" ) )
  suggestion, song_no = lyrics.extract_songs(content)
  if suggestion.size == 1
p    url = lyrics.lyricsurl + song_no + ".xml"
    content = Net::HTTP.get(URI.parse(url))
    return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry, no" ) )
    return lyrics.format { lyrics.parse(content) }
  else
    return lyrics.format(suggestion)
  end
end

get '/li/show/:id', :provides => 'text' do |id|

  return "Song id is empty." if id.empty?

  lyrics = LI.new(request.host, request.port)
  song_id = URI.escape(id)
  content = Net::HTTP.get(URI.parse(lyrics.lyricsurl + song_id + ".xml"))
  if content.empty? || content.include?( "Sorry, no" )
      return Lyrics::ERRORMSG
  end
  return lyrics.format { lyrics.parse(content) }
end

get '/gi/search/:title', :provides => 'text' do |t|

  return "Song title is empty." if t.empty?

  lyrics = GIIT.new(request.host, request.port)
  lyrics.page_url = ""
  title = URI.escape(t)
  content = Net::HTTP.get(URI.parse(lyrics.lyricsurl + "search.asp?browse=stitle&s=#{title}&submit=search"))
  return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry, no" ) )
  suggestion, song_no = lyrics.extract_songs(content)
  if suggestion.size == 1
    song_no = (song_no[0..3] == 'cisb' ? 'cisb/'+song_no[4..song_no.length] : 'files/'+song_no)
p    url = lyrics.cisburl + song_no + ".isb"
    content = Net::HTTP.get(URI.parse(url))
    return Lyrics::ERRORMSG if( content.empty? || content.include?( "Sorry, no" ) )
    return lyrics.format { lyrics.parse(content) }
  else
    return lyrics.format(suggestion)
  end
end

get '/gi/show/:id', :provides => 'text' do |id|

  return "Song id is empty." if id.empty?

  lyrics = GIIT.new(request.host, request.port)
  song_id = URI.escape( song_id = (id[0..3] == 'cisb' ? 'cisb/'+id[4..id.length] : 'files/'+id))
  content = Net::HTTP.get(URI.parse(lyrics.cisburl + song_id + ".isb"))
  if content.empty? || content.include?( "Sorry, no" )
      return Lyrics::ERRORMSG
  end
  return lyrics.format { lyrics.parse(content) }
end

get '/cu/search/:title' do |t|

#  return "Please provide the title." if t.empty?

  title = URI.escape(t)
  url = "http://192.168.1.150/itrans/" + "search?txt=#{title}&format=xml"
p url
  content = Net::HTTP.get(URI.parse(url))
  if content.empty? || content.include?( "Sorry, no" )
      return
  end

#p content
    xmlDoc = REXML::Document.new(content.to_s.gsub("\n", "")).root
    nodes = REXML::XPath.match(xmlDoc, '/songs/song')
    if nodes.size == 1
      song_id = title = lyrics = ""
      nodes[0].elements.each('id') { |child| song_id = child.text }
      url = "http://192.168.1.150/itrans/" + song_id + '.xml'
p url
      content = Net::HTTP.get(URI.parse(url))
      begin
        xmlDoc = REXML::Document.new(content).root
        xmlDoc.elements.each('/song/unititle') { |child| title = child.text.gsub!(/\n/, "") }
        xmlDoc.elements.each('/song/unidata') { |child| lyrics = child.text }
      rescue
        
      end
      return "<lyrics>\n" + lyrics + "</lyrics>"
    else
      self.page_url = suggestion = output = ""
      REXML::XPath.match(xmlDoc, '/songs/song').each do |node|
        song_no = title = ""
        node.elements.each('id') { |child| song_no = child.text }
        node.elements.each('title') { |child| title = child.text }
        suggestion += "<suggestion>#{title}</suggestion>\n"
      end
      return "<suggestions>\n" + suggestion + "</suggestions>"
    end
end

error do
  'Sorry there was some error.' + request.url
end
