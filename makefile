readme: guessinggame.sh
	touch README.md
	echo "The title of the project: **tuw-project**" > README.md
	echo -n "The date and time at which make was run: " >> README.md
	date "+%Y-%m-%d %H:%M:%S UTC" -u >> README.md
	echo -n "The number of lines of code contained in **guessinggame.sh**: " >> README.md
	cat guessinggame.sh | grep -E "[^\S]" | wc -l >> README.md

clean:
	if [ -f README.md ]; then rm README.md; fi
