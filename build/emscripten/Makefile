SRC = \
	../../src/cmd_bg.c \
	../../src/cmd_bgm.c \
	../../src/cmd_ch.c \
	../../src/cmd_cha.c \
	../../src/cmd_chapter.c \
	../../src/cmd_chs.c \
	../../src/cmd_click.c \
	../../src/cmd_gosub.c \
	../../src/cmd_goto.c \
	../../src/cmd_gui.c \
	../../src/cmd_if.c \
	../../src/cmd_load.c \
	../../src/cmd_menu.c \
	../../src/cmd_message.c \
	../../src/cmd_retrospect.c \
	../../src/cmd_return.c \
	../../src/cmd_se.c \
	../../src/cmd_set.c \
	../../src/cmd_setsave.c \
	../../src/cmd_shake.c \
	../../src/cmd_skip.c \
	../../src/cmd_switch.c \
	../../src/cmd_video.c \
	../../src/cmd_vol.c \
	../../src/cmd_wait.c \
	../../src/cmd_wms.c \
	../../src/conf.c \
	../../src/emopenal.c \
	../../src/event.c \
	../../src/file.c \
	../../src/glrender.c \
	../../src/glyph.c \
	../../src/gui.c \
	../../src/history.c \
	../../src/image.c \
	../../src/log.c \
	../../src/main.c \
	../../src/mixer.c \
	../../src/readimage.c \
	../../src/readjpeg.c \
	../../src/save.c \
	../../src/scbuf.c \
	../../src/script.c \
	../../src/seen.c \
	../../src/stage.c \
	../../src/vars.c \
	../../src/wave.c \
	../../src/wms_core.c \
	../../src/wms_impl.c \
	../../src/wms_lexer.yy.c \
	../../src/wms_parser.tab.c \
	../../src/emmain.c

all:
	rm -f html/index.*
	mkdir -p html
	emcc $(SRC) -o html/index.html -O3 -DUSE_OPENGL -s USE_ZLIB=1 -s USE_LIBPNG=1 -s USE_OGG=1 -s USE_VORBIS=1 -s USE_FREETYPE=1 -s USE_LIBJPEG=1 -s TOTAL_MEMORY=536870912 -s NO_EXIT_RUNTIME=1 -s EXPORTED_RUNTIME_METHODS=["ccall","UTF8ToString"] -lz -lpng -logg -lvorbis -lfreetype -lopenal -lidbfs.js --shell-file shell.html --pre-js pre.js --use-preload-plugins

run:
	python3 -m http.server

clean:
	rm -rf html
