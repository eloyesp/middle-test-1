module XYZService

  # Build a filename for the target with the following format:
  #   [day of month zero-padded][three-letter prefix] \
  #   [kind]_[age_if_kind_personal]_[target.id] \
  #   _[8 random chars]_[10 first chars of title].jpg
  #
  # @params  target the filename
  # @return [String] filename of the target

  def self.xyz_filename(target)
    [ build_header(target),
      target.id.to_s,
      random_chars,
      truncate_title(target.title) ].join("_") << ".jpg"
  end

  private

    def self.build_header target
      [ target.publish_on.strftime("%d"),
        target.xyz_category_prefix.to_s,
        target.kind.gsub("_", ""),
        age_if_kind_personal(target) ].join
    end

    def self.truncate_title title
      title.downcase.gsub(/[^\[a-z\]]/, '')[0..9]
    end

    def self.random_chars
      Digest::SHA1.hexdigest(rand(10000).to_s)[0,8]
    end

    def self.age_if_kind_personal target
      "_%03d" % (target.age || 0) if target.personal?
    end

end

