class KeyGenerator

  def random_key
    random_key = Array.new(5){rand(0..9)}
    return random_key.join.to_s
  end

end
