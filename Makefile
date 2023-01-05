.DEFAULT_GOAL := help
.PHONY: help 

help: ## This prints help text for all the existing commands
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%25s:\033[0m %s\n", $$1, $$2}'

prepare: ## installs all the prereqs for building
	@echo "Run it before building the site."
	pip install -r requirements.txt 

build: ## Builds the website. It is in the folder site
	@mkdocs build

serve: ## Runs a local server on port 1313
	@mkdocs serve
