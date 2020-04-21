RUBY_VERSIONS = %w[2.3 2.4 2.5 2.6 2.7].freeze
JRUBY_VERSIONS =%w[9]
DOCKER_IMAGE_VERSION = 1

namespace :rspec do
  desc "Build all docker images"
  multitask all: RUBY_VERSIONS.map { |v| "ruby:#{v}".to_sym } + JRUBY_VERSIONS.map { |v| "jruby:#{v}".to_sym }

  namespace :ruby do
    desc "Build all Ruby docker images"
    multitask all: RUBY_VERSIONS.map(&:to_sym)

    RUBY_VERSIONS.each do |ruby_version|
      full_tag = "#{ruby_version}-#{DOCKER_IMAGE_VERSION}"
      short_tag = ruby_version
      repository = 'adrienthebo/r10k-ruby-rspec'

      desc "Build #{repository}:#{full_tag}"
      task ruby_version.to_sym do
        dockerfile = "Dockerfile.ruby-#{ruby_version}-rspec"
        sh "docker build --no-cache " \
          "-t #{repository}:#{full_tag} " \
          "-t #{repository}:#{short_tag} " \
          "-f dockerfiles/#{dockerfile} ."
      end
    end
  end

  namespace :jruby do
    desc "Build all JRuby docker images"
    multitask all: JRUBY_VERSIONS.map(&:to_sym)

    JRUBY_VERSIONS.each do |jruby_version|
      full_tag = "#{jruby_version}-#{DOCKER_IMAGE_VERSION}"
      short_tag = jruby_version
      repository = 'adrienthebo/r10k-jruby-rspec'

      desc "Build #{repository}:#{full_tag}"
      task jruby_version.to_sym do
        dockerfile = "Dockerfile.jruby-#{jruby_version}-rspec"
        sh "docker build --no-cache " \
          "-t #{repository}:#{full_tag} " \
          "-t #{repository}:#{short_tag} " \
          "-f dockerfiles/#{dockerfile} ."
      end
    end
  end
end
