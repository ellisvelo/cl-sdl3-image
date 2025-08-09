(in-package :sdl3-image)

(defun version ()
  "Get the version of SDL_image that is linked against your program and return
the major, minor, and micro version."
  (let* ((version (img-version))
	 (major (floor (/ version 1000000)))
	 (minor (floor (mod (/ version 1000) 1000)))
	 (micro (mod version 1000)))
    (values major minor micro)))

(defun load-image (filename)
  (check-null (img-load (namestring (merge-pathnames filename)))))

(defun load-texture (renderer filename)
  "Load an image from an SDL data source into a GPU texture."
  (check-null (img-load-texture renderer (namestring (merge-pathnames filename)))))

(defmacro load-from-rw-wrapper (file-specifier load-macro)
  `(let ((sdl-io-object (sdl3:io-from-file (namestring ,file-specifier) "rb")))
     (unwind-protect (check-null ,load-macro)
       (sdl3:close-io sdl-io-object))))

(defmacro define-loader-function (file-type)
  (let* ((wrapper-name (intern (string-upcase (format 'nil
                                                      "load-~a-io"
                                                      file-type))))
         (original-name (intern (format 'nil
                                        "IMG-~a"
                                        (symbol-name wrapper-name)))))
    `(progn (defun ,wrapper-name (file-specifier)
              (load-from-rw-wrapper file-specifier
                                    (,original-name sdl-io-object)))
            (export ',wrapper-name))))

(defun load-type-rw (file-specifier file-type-hint)
  "Load a given file of a specified type and return an SDL surface object. The
specified file type hint is a string representing one of the file types
supported by sdl3 image. The supported types are documented in the official sdl3
image documentation. The original API had an argument indicating whether or not
to automatically free the sdl-io pointer. However since an sdl-io structure is
generated internally, this has been omitted and is automatically freed"
  (load-from-rw-wrapper file-specifier
                        (img-load-typed-io sdl-io-object
                                           0
                                           file-type-hint)))

(define-loader-function "bmp")
(define-loader-function "cur")
(define-loader-function "gif")
(define-loader-function "ico")
(define-loader-function "jpg")
(define-loader-function "lbm")
(define-loader-function "pcx")
(define-loader-function "png")
(define-loader-function "tga")
(define-loader-function "tif")
(define-loader-function "xcf")
(define-loader-function "xpm")
(define-loader-function "xv")

(defun save-png (surface filename)
  "Write a surface to a PNG file."
  (check-rc (img-save-png surface filename)))
