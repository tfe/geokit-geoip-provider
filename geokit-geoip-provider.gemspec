Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "geokit-geoip-provider"
    s.version   =   "0.2.2"
    s.authors   =   ["Jan De Poorter", "Todd Eichel"]
    s.email     =   ["geokit@defv.be", "todd@toddeichel.com"]
    s.homepage  =   "https://github.com/tfe/geokit-geoip-provider"
    s.summary   =   "GeoIP provider for geokit gem"
    s.files     =   %w(README lib/geokit-geoip-provider.rb)
    s.require_path  = "lib"
    s.has_rdoc  =   false
    s.extra_rdoc_files  = ["README"]
    s.add_dependency('geokit', '~> 1.5.0')
    s.add_dependency('geoip',  '~> 1.1.1')
end
