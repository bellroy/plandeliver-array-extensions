module ArrayExtensions
  def to_html_json; self.to_json.gsub(/"/, '\'') end
end