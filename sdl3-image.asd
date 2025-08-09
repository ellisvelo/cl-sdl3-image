(defpackage :sdl3-image.asdf
  (:use #:cl #:asdf))

(in-package :sdl3-image.asdf)

(defsystem :sdl3-image
  :description "Bindings for sdl3_image using autowrap"
  :author "Ryan Pavlik"
  :maintainer ("Shawn Ellis")
  :license "MIT"
  :version "1.0"
  :depends-on (#:alexandria
               #:defpackage-plus
               #:cl-autowrap
               #:sdl3)
  :pathname "src"
  :serial t
  :components
  ((:file "package")
   (:file "library")
   (:file "autowrap")
   (:file "conditions")
   (:file "general")

   (:module autowrap-spec
    :pathname "spec"
    :components
    ((:static-file "SDL_image.h")))))
