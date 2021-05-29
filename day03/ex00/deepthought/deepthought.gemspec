Gem::Specification.new do |s|
  s.name        = 'deepthought'
  s.licenses    = 'MIT'
  s.version     = '0.0.1'
  s.summary     = "ex00"
  s.description = "This project is just educational purpose."
  s.authors     = ["sashin"]
  s.email       = 'sashin@student.42seoul.kr'
  s.homepage    = 'https://guides.rubygems.org/specification-reference/'
  s.files       = ["./lib/deepthought.rb"]

  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  s.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
  s.add_development_dependency 'colorize', '~> 0.8.1'
end

