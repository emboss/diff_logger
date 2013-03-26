Gem::Specification.new do |s|
  s.name = 'diff_logger'
  s.version = '1.0.0'
  s.author = 'Martin Bosslet'
  s.email = 'Martin.Bosslet@gmail.com'
  s.homepage = 'https://github.com/emboss/diff_logger'
  s.description = 'Log specific changes using either a default logger or by providing a custom logger.'
  s.summary = 'Allows flexible logging of changes during updates.'
  s.files = Dir.glob('{lib}/**/*')
  s.files += ['LICENSE']
  s.extra_rdoc_files = [ "README.md" ]
  s.require_path = 'lib'
  s.license = 'MIT'

  s.add_dependency 'activesupport'
end
