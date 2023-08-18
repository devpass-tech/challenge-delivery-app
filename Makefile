.PHONY: ios_environment ios_code_beautify

ios_environment:
	brew install swiftlint || true
	brew install swiftformat || true

ios_code_beautify:
	swiftformat ./; swiftlint --fix;
