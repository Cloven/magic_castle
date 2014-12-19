PROJECT = magic_castle
DEPS = lager triq
dep_lager = git://github.com/basho/lager.git 2.1.0
dep_triq = git://github.com/Cloven/triq master

EXTRA_ERLC_OPTS = +'{parse_transform, lager_transform}'
include erlang.mk
