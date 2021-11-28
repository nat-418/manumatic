default: clean
	raco pollen publish src/manual dist
clean:
	rm -rf dist
dev:
	raco pollen start src
