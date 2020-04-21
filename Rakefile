RUBY_VERSIONS = %w[2.3 2.4 2.5 2.6 2.7].freeze
DOCKER_IMAGE_VERSION = 1

namespace :rspec do
  namespace :ruby do
    multitask all: RUBY_VERSIONS.map(&:to_sym)

    RUBY_VERSIONS.each do |ruby_version|
      task ruby_version.to_sym do
        full_tag = "#{ruby_version}-#{DOCKER_IMAGE_VERSION}"
        short_tag = ruby_version
        dockerfile = "Dockerfile.ruby-#{ruby_version}-rspec"
        sh "docker build --no-cache " \
          "-t adrienthebo/r10k-ruby-rspec:#{full_tag} " \
          "-t adrienthebo/r10k-ruby-rspec:#{short_tag} " \
          "-f dockerfiles/#{dockerfile} ."
      end
    end
  end
end
