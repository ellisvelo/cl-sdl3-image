(asdf:defsystem #:sdl3-image-examples
  :description "Simple examples to demonstrate common usage of SDL3."
  :author "Shawn Ellis"
  :license "MIT"
  :depends-on (:sdl3-image)
  :pathname "examples"
  :serial t
  :components ((:file "package")
	       (:file "image-test")))
