(in-package :sdl3-image)

(cffi:define-foreign-library libsdl3-image
  ;; I have no idea if this is the correct framework, file an issue
  ;; and let me know!
  (:darwin (:or (:framework "SDL3_image") (:default "libSDL3_image")))
  (:unix (:or "libSDL3_image.so" "libSDL3_image.so.0" "libSDL3_image.so.0.2.4"))
  (:windows "SDL3_image.dll")
  (t (:default "libSDL3_image")))

(cffi:use-foreign-library libsdl3-image)
