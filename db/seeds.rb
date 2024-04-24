# frozen_string_literal: true

%w[users categories posts post_comments post_likes].each do |model|
  seed_file = Rails.root.join('db', 'seeds', "#{model}.rb").to_s

  Rails.logger.debug { "seeding - #{model} seed file" }

  load seed_file
end
