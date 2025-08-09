(in-package defpackage+-user-1)

(defpackage+ :sdl3-image
  (:use #:cl #:alexandria #:autowrap.minimal #:plus-c #:sdl3-ffi.functions)
  (:export-only

   ;; Conditions
   #:sdl-image-error

   ;; General
   #:version
   #:load-image
   #:load-texture
   #:load-type-rw
   #:save-png))

(in-package :sdl3-image)

;; Variables
