# require modules here
require "yaml"
require "pry"
def load_library (data)
  # code goes here
  rawdata = {}
  rawdata = YAML.load(File.read("#{data}"))
  library = {}
  
  rawdata.each {|key, value|
  value.each{|emote|
    
  
  if !library[key]
    library[key]= {}
  end
  if !library[key][:english]
    library[key][:english]= emote
  end
  
  if !library[key][:japanese] && !library[key][:english][emote]
    library[key][:japanese]= emote
  end

  }
  }
  library
end

def get_japanese_emoticon (filepath, emoticon)
  # code goes here
  newlibrary = load_library(filepath)
  newlibrary.each {|key, value|
  value.each{|language, emote|
  
  if emoticon == emote
    return newlibrary[key][:japanese]
  end
  if emote == newlibrary["wink"][:japanese]
    return "Sorry, that emoticon was not found"
  end
  }
  }
end

def get_english_meaning(filepath, emoticon)
  # code goes here
  anyemote = {}

  newlibrary = load_library(filepath)
  newlibrary.each{|key, value|
  value.each{|language, emote|
  
  
  if emoticon == emote
     return "#{key}"
  end 
     
  if emote == newlibrary["wink"][:japanese]
     return "Sorry, that emoticon was not found"
  end

  }
  }
end