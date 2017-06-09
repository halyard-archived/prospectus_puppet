require 'json'

module ProspectusPuppet
  DEP_REGEX = /^(\d+\.\d+)\.\d+$/
  DEP_FILTER = /^\d+\.\d+.\d+$/

  ##
  # Helper for automatically adding Puppet deps
  module Deps
    def extended(other) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
      dep_list = parse_deps

      other.deps do
        dep_list.each do |x|
          item do
            name x[:name]

            expected do
              github_tag
              repo x[:slug]
              regex(DEP_REGEX)
              filter(DEP_FILTER)
            end

            actual do
              static
              set x[:version]
            end
          end
        end
      end
    end

    private

    def parse_deps
      raw_deps.map do |dep|
        {
          name: parse_name(dep),
          slug: parse_slug(dep),
          version: parse_version(dep)
        }
      end
    end

    def parse_version(dep)
      dep['version_requirement'].sub(/\.x/, '')
    end

    def parse_slug(dep)
      parse_org(dep) + '/' + parse_name(dep)
    end

    def parse_name(dep)
      parse_prefix(dep) + '-' + dep['name'].split('/').last
    end

    def parse_prefix(dep)
      parse_org(dep) == 'puppetlabs' ? 'puppetlabs' : 'puppet'
    end

    def parse_org(dep)
      dep['name'].split('/').first
    end

    def raw_deps
      @raw_deps ||= JSON.parse(File.read('metadata.json'))['dependencies']
    end
  end
end
