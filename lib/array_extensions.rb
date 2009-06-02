module ArrayExtensions
  def to_html_json; ActiveSupport::JSON.encode(self).gsub(/"/, '\'') end
  
  # combination method of Ruby 1.9
  def combination(num)
    return [] if num < 1 || num > size
    return map{ |e| [e] } if num == 1
    
    tmp = self.dup
    self[0, size - (num - 1)].inject([]) do |ret, e|
      tmp.shift
      ret += tmp.combination(num - 1).map{ |a| a.unshift(e) }
    end
  end
  
  # adds reverse entries for the combination, only works with pairs
  def combination_plus_reverse
    combs = combination(2)
    combs.to_a + combs.map { |c| c.reverse } 
  end
end