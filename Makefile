all: deploy-dry

serve:
	zola serve --drafts --open

build:
	zola build

update:
	git pull origin main

dependencies:
	mise install

# This is a hack that makes me cry but it actually works unlike prettier
format:
	find public -name "*.html" | xargs -I {} sh -c "xq -m '{}' > '{}.out'; mv {}.out {}"

deploy-dry: update dependencies build format
	rsync --del -n -r -v public/ ${USER}@${HOST}:/var/www/mxhzl

deploy: update dependencies build format
	rsync --del -r public/ ${USER}@${HOST}:/var/www/mxhzl

.PHONY: clean
clean:
	rm -r public
