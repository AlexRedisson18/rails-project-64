# frozen_string_literal: true

require 'faker'

default_categories = %w[Music Movies Programming Games Art]
default_categories.each { |category| Category.create(name: category) }
