# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fretboard_drawer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michal Wrobel"]
  gem.email         = ["sparrovv@gmail.com"]
  gem.description   = %q{Command line fretboard drawer}
  gem.summary       = %q{Command line fretbarod drawer}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "fretboard_drawer"
  gem.require_paths = ["lib"]
  gem.version       = FretboardDrawer::VERSION
  gem.add_development_dependency('rspec')
end
