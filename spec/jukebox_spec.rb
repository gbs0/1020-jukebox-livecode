# Importamos no teste, as gemas e arquivos que utilizamos
# p/ a funcionalidade do programa 
require 'sqlite3'
require_relative '../lib/jukebox'

DATABASE_PATH = File.join(File.dirname(__FILE__), '../db/jukebox.sqlite')

describe 'Jukebox' do
  # Primeiro, precisamos acessar o banco de dados que utilizaremos nos testes
  let(:db) { SQLite3::Database.new(DATABASE_PATH) }

  describe '#all_artist_names' do
    it 'should return a list' do
      result = Jukebox.all_artist_names(db)
      expect(result).to be_a Array
    end

    it 'should return the correct number for all artists names' do
      result = Jukebox.all_artist_names(db)
      expect(result.length).to eq 275
    end
  end

  describe '#count_short_tracks' do
    it 'should return an valid Integer' do
      count = Jukebox.count_short_tracks(db)
      expect(count.class).to eq Integer
    end
    
    it 'should count all tracks less than 2 minutes' do
      number_of_tracks = Jukebox.count_short_tracks(db)
      expect(number_of_tracks).to eq 93
    end
  end

  describe '#first_ten_albums' do
    it 'should return a list' do
      first_ten_albums = Jukebox.first_ten_albums(db)
      expect(first_ten_albums).to be_a Array
    end

    it 'should return the correct of album names' do
        expect(Jukebox.first_ten_albums(db).first).to eq "...And Justice For All"
        expect(Jukebox.first_ten_albums(db).last).to eq "Ace Of Spades"
    end
  end
end