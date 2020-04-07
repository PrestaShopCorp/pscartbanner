help:
	@egrep "^#" Makefile

# target: docker-build|db               - Setup/Build PHP & (node)JS dependencies
db: docker-build
docker-build: build-back

build-back:
	docker-compose run --rm php sh -c "composer install"

build-back-prod:
	docker-compose run --rm php sh -c "composer install --no-dev -o"

build-zip:
	cp -Ra $(PWD) /tmp/pscartbanner
	rm -rf /tmp/pscartbanner/.env.test
	rm -rf /tmp/pscartbanner/.php_cs.*
	rm -rf /tmp/pscartbanner/composer.*
	rm -rf /tmp/pscartbanner/.gitignore
	rm -rf /tmp/pscartbanner/deploy.sh
	rm -rf /tmp/pscartbanner/.editorconfig
	rm -rf /tmp/pscartbanner/.git
	rm -rf /tmp/pscartbanner/.github
	rm -rf /tmp/pscartbanner/_dev
	rm -rf /tmp/pscartbanner/tests
	rm -rf /tmp/pscartbanner/docker-compose.yml
	rm -rf /tmp/pscartbanner/Makefile
	mv -v /tmp/pscartbanner $(PWD)/pscartbanner
	zip -r pscartbanner.zip pscartbanner
	rm -rf $(PWD)/pscartbanner

# target: build-zip-prod                   - Launch prod zip generation of the module (will not work on windows)
build-zip-prod: build-back-prod build-zip
