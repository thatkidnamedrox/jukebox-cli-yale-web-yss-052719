songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

def help()
  message = """I accept the following commands:
  - help : displays this help message
  - list : displays a list of osongs you can play
  - play : lets you choose a song to play
  - exit : exits this program"""
  puts message
end

def list(songs)
  songs.each_with_index do |song, number|
    puts "#{(number + 1)}. #{song}"
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  user_response = gets.chomp

  song = ""
  if user_response.numeric?
    index = user_response.to_i - 1
    song = songs[index]
  else
    song = songs.find do |e|
      e.include?(user_response)
    end
  end

  if song == nil
    puts "Inavlid input, please try again"
  else
    puts song
  end
end

def exit_jukebox()
  puts "Goodbye"
end

def run(songs)
  help()
  user_response = ""
  puts "Please enter a command:"
  while user_response != "exit"

    user_response = gets.chomp
    case user_response
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "help"
      help()
    when "exit"
      exit_jukebox()
      break
    else
      puts "Invalid input, please try again"
    end
  end
end
