require './lib/aspose_words_cloud/version'

Gem::Specification.new do |s|
  s.name        = 'aspose_words_cloud'
  s.version     = AsposeWordsCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Aspose'
  s.email       = 'aspose.cloud@aspose.com'
  s.homepage    = 'https://products.aspose.cloud/words/family/'
  s.summary     = 'Ruby library for communicating with the Aspose.Words Cloud API'
  s.description = 'This SDK allows you to work with Aspose.Words Cloud REST APIs in your Ruby applications quickly and easily, with zero initial cost'
  s.license     = 'MIT'

  s.add_runtime_dependency 'faraday', '~> 1.9', '>= 1.9.3'
  s.add_runtime_dependency 'marcel', '>= 1.0.0'
  s.add_runtime_dependency 'multipart-parser', '>= 0.1.1'
  
  s.add_development_dependency 'minitest', '~> 6.0'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 3.3'
end
