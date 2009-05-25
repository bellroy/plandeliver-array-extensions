module ArrayExtensions
  def to_html_json; ActiveSupport::JSON.encode(self).gsub(/"/, '\'') end
end