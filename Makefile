test:
	flutter test
try-publish: test
	dart pub publish --dry-run
publish: try-publish
	dart pub publish