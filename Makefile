install:
	bundle install

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

test:
	bin/rails test

.PHONY: test
