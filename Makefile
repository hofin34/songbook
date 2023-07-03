FROM_FILE=songbook_main
TO_FILE=ZPEVNIK_S_AKORDY
FROM_LYR_FILE=lyricbook_main
TO_LYR_FILE=ZPEVNIK_POUZE_TEXTY
MERGED_CZ_SONGS=merged_cze_songs.sbd
MERGED_OTHER_SONGS=merged_eng_songs.sbd
STYLES=styles.tex

all:
	rm -f songs/$(MERGED_CZ_SONGS)
	rm -f songs/$(MERGED_OTHER_SONGS)
	cat ${STYLES} > songs/${MERGED_CZ_SONGS}
	ls songs/cze/* | sort | xargs cat >> songs/$(MERGED_CZ_SONGS)
	ls songs/eng/* | sort | xargs cat >> songs/$(MERGED_OTHER_SONGS)
	pdflatex --jobname=$(TO_FILE) $(FROM_FILE)
	texlua songidx.lua cbtitle.sxd cbtitle.sbx
	texlua songidx.lua encbtitle.sxd encbtitle.sbx
	pdflatex --jobname=$(TO_FILE) $(FROM_FILE)
	pdflatex --jobname=$(TO_LYR_FILE) $(FROM_LYR_FILE)
	xdg-open $(TO_FILE).pdf
	

