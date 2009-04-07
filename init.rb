require 'array_extensions'

%w[Array Hash].each do |clazz|
  clazz.constantize.send :include, ArrayExtensions
end