class Offset

  def initialize(key, date)
    @key = key
    @date = date.to_i

  end

  def square_date
    @date**2
  end

  def last_four_of_date
    square_date.to_s[-4..-1].to_i
  end

  def build_array_key
    a_k = @key[0..1].to_i
    b_k = @key[1..2].to_i
    c_k = @key[2..3].to_i
    d_k = @key[3..4].to_i

    [a_k,b_k,c_k,d_k]
  end

  def build_date_array
    date_string = last_four_of_date.to_s
    a_d = date_string[0].to_i
    b_d = date_string[1].to_i
    c_d = date_string[2].to_i
    d_d = date_string[3].to_i

    [a_d,b_d,c_d,d_d]
  end

  def build_offset_array
    offset_array = []
    build_array_key.each do |key|
      offset_array << key+build_date_array[offset_array.length]
    end
    return offset_array
  end

end
