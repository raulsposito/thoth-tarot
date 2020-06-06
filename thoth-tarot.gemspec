require_relative 'config/environment'

Gem::Specification.new do |spec|
  spec.name          = "thoth-tarot"
  spec.version       = Thoth::Tarot::VERSION
  spec.authors       = ["'Raul Sposito'"]
  spec.email         = ["'raulsposito@gmail.com'"]

  spec.summary       = %q{This will be a CLI data Gem based on the book of Thoth}
  spec.description   = %q{Its a Data Gem for Thoth Tarot Readings}
  spec.homepage      = "https://github.com/raulsposito/thoth-tarot"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/raulsposito/thoth-tarot"
  spec.metadata["changelog_uri"] = "https://github.com/raulsposito/thoth-tarotCHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
