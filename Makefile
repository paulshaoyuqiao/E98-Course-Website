# starts the server locally
start:
	bin/rails server

# migrate database
migrate:
	bin/rails db:migrate RAILS_ENV=development