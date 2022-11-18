class Jukebox
  def self.all_artist_names(db)
    db.execute("SELECT artists.name FROM artists")
  end

  def self.count_short_tracks(db)
    two_minutes = 120_000
    db.execute("SELECT COUNT(tracks.id) FROM tracks WHERE tracks.milliseconds < '#{two_minutes}'").flatten.first
  end

  def self.first_ten_albums(db)
    db.execute("SELECT title FROM albums ORDER BY title ASC LIMIT 10").flatten
  end
end