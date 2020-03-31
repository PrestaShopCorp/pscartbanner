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
	cp -Ra $(PWD) /tmp/ps_cartbanner
	rm -rf /tmp/ps_cartbanner/.env.test
	rm -rf /tmp/ps_cartbanner/.php_cs.*
	rm -rf /tmp/ps_cartbanner/.travis.yml
	rm -rf /tmp/ps_cartbanner/cloudbuild.yaml
	rm -rf /tmp/ps_cartbanner/composer.*
	rm -rf /tmp/ps_cartbanner/.gitignore
	rm -rf /tmp/ps_cartbanner/deploy.sh
	rm -rf /tmp/ps_cartbanner/.editorconfig
	rm -rf /tmp/ps_cartbanner/.git
	rm -rf /tmp/ps_cartbanner/.github
	rm -rf /tmp/ps_cartbanner/_dev
	rm -rf /tmp/ps_cartbanner/tests
	rm -rf /tmp/ps_cartbanner/docker-compose.yml
	rm -rf /tmp/ps_cartbanner/Makefile
	mv -v /tmp/ps_cartbanner $(PWD)/ps_cartbanner
	zip -r ps_cartbanner.zip ps_cartbanner
	rm -rf $(PWD)/ps_cartbanner

# target: build-zip-prod                   - Launch prod zip generation of the module (will not work on windows)
build-zip-prod: build-back-prod build-zip
