.PHONY: help
help:
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install build watch serve clean

install: ## install npm
	npm install

build: ## build the minified css file
	npx tailwindcss -i ./src/input.css -o ./css/tailwind.min.css --minify

watch: ## watch for HTML changes and rebuild CSS automatically
	npx tailwindcss -i ./src/input.css -o ./css/tailwind.min.css --watch

serve: ## start local development server on port 8000
	@echo "Starting server at http://localhost:8000"
	npx serve -l 8000

clean: ## remove generated CSS files
	rm -f css/tailwind.min.css
