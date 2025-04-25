all: deploy-dry

serve:
	zola serve --drafts --open

build:
	zola build

update:
	git pull origin main

dependencies:
	mise install
	yarn install

deploy-dry: update dependencies build
	cd public; \
	yarn exec -- prettier . --write; \
	neocities push --dry-run --prune .

deploy: update dependencies build
	cd public; \
	yarn exec -- prettier . --write; \
	neocities push --prune .

.PHONY: clean
clean:
	rm -r public
