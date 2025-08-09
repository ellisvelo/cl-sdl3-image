(cl:in-package :sdl3-ffi)

(autowrap:c-include
 `(sdl3-image autowrap-spec "SDL_image.h")
  :function-package :sdl3-ffi.functions
  :spec-path '(sdl3-image autowrap-spec)
  :exclude-sources ("/usr/local/lib/clang/([^/]*)/include/(?!stddef.h)"
		    "/usr/include/"
		    #+darwin "/opt/homebrew/include/SDL3"
		    "/usr/include/arm-linux-gnueabihf"
		    ".*/SDL3/SDL_.*.h"
		    "/usr/local/include/SDL3")
  :include-sources ("SDL_image.h")
  :sysincludes (cl:append
                 #+darwin '("/opt/homebrew/include")
                 (cl:when (uiop:getenv "EXTRA_INCLUDES")
                   (uiop:split-string (uiop:getenv "EXTRA_INCLUDES") :separator " ")))
  :exclude-constants ("^__")
  :no-accessors cl:t
  :release-p cl:t)
