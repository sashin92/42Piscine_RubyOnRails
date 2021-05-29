Gem::Specification.new do |s|
  s.name        = 'ft_wikipedia'
  s.licenses    = 'MIT'
  s.version     = '0.0.1'
  s.summary     = "ex01"
  s.description = "Find 'Philosophy' wiki"
  s.authors     = ["sashin"]
  s.email       = 'sashin@student.42seoul.kr'
  s.homepage    = 'https://guides.rubygems.org/specification-reference/'
  s.files       = ["./lib/ft_wikipedia.rb"]

  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  s.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
  s.add_development_dependency 'nokogiri', '~> 1.11', '>= 1.11.6'
  s.add_development_dependency 'open-uri', '~> 0.1.0'
end