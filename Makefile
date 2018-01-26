.PHONY: deploy

clean:
	rm -rf public

public:
	hugo

deploy: public
	cd public ; \
	rm -rf .git ; \
	git init ; \
	git remote add origin `cd .. && git remote -v | grep origin | head -n1 | sed -E 's/origin[[:space:]]+([^ ]+)[[:space:]]+[^ ]+/\1/g'` ; \
	git add --all ; \
	git commit -m "deploy" ; \
	git push -f origin HEAD:refs/heads/gh-pages
