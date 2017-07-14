json.partial! "setlists/setlist", setlist: @setlist
json.songs @setlist.songs.each do |song|
  json.song song.name
  json.url song_url(song, format: json)
end
