.PHONY: noop
noop:
	echo

.PHONY: deps
deps:
	npm i
	npx lerna bootstrap

.PHONY: lint
lint:
	npm run lint

.PHONY: lint-fix
lint-fix:
	npm run lint:fix

.PHONY: lint-quiet
lint-quiet:
	npm run lint:quiet

.PHONY: test
test:
	docker-compose -f docker-compose.test.yml run --rm app npx lerna run test --scope @anontown/server --stream

.PHONY: render-schema
render-schema:
	docker-compose run app ./bin/render-schema.sh

.PHONY: migrate
migrate:
	docker-compose run app ./bin/migrate.sh

.PHONY: serve
serve:
	docker-compose up --build
