# bzip2
xpProOption(bzip2 DBG)
set(VER 1.0.6)
set(REPO github.com/LuaDist/bzip2)
set(FORK github.com/smanders/bzip2)
set(PRO_BZIP2
  NAME bzip2
  WEB "bzip2" https://en.wikipedia.org/wiki/Bzip2 "bzip2 on wikipedia"
  LICENSE "open" https://spdx.org/licenses/bzip2-1.0.6.html "bzip2 BSD-style license"
  DESC "lossless block-sorting data compression library"
  REPO "repo" https://${FORK} "forked bzip2 repo on github"
  GRAPH
  VER ${VER}
  GIT_ORIGIN git://${FORK}.git
  GIT_UPSTREAM git://${REPO}.git
  GIT_TAG xp${VER} # what to 'git checkout'
  GIT_REF v${VER} # create patch from this tag to 'git checkout'
  DLURL https://${FORK}/archive/v${VER}.tar.gz
  DLMD5 768128c6df06b779256cf93149e0cae7
  DLNAME bzip2-v${VER}.tar.gz
  PATCH ${PATCH_DIR}/bzip2.patch
  DIFF https://${FORK}/compare/
  DEPS_FUNC build_bzip2
  )
########################################
function(build_bzip2)
  if(NOT (XP_DEFAULT OR XP_PRO_BZIP2))
    return()
  endif()
  xpGetArgValue(${PRO_BZIP2} ARG VER VALUE VER)
  set(XP_CONFIGURE -DXP_NAMESPACE:STRING=xpro -DBZIP2_VER=${VER})
  configure_file(${PRO_DIR}/use/usexp-bzip2-config.cmake ${STAGE_DIR}/share/cmake/
    @ONLY NEWLINE_STYLE LF
    )
  xpCmakeBuild(bzip2 "" "${XP_CONFIGURE}" bzip2Targets)
  if(ARGN)
    set(${ARGN} "${bzip2Targets}" PARENT_SCOPE)
  endif()
endfunction()
