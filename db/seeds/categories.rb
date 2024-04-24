# frozen_string_literal: true

default_categories = %w[Музыка Фильмы Программирование Игры Искусство]
default_categories.each { |category| Category.find_or_create_by(name: category) }
