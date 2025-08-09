# cl-sdl3-image

This is a (currently) brief but usable wrap for SDL3_image.  Currently, this exports the following:

* `(sdl3-image:load-image FILENAME)`: This calls `IMG_Load()` on the filename, and returns an `SDL-SURFACE`.

These functions act more or less like their wrapped equivalents; see the SDL_image 2.0 documentation for details.

## Regenerating CFFI Bindings

This library uses [cl-autowrap](https://github.com/rpav/cl-autowrap) to generate CFFI bindings. If you need to regenerate the bindings, follow these steps:

1. Delete the existing bindings:

```
$ rm -f src/spec/SDL_image.*.spec
```

2. Reload the system in a REPL. This action will automatically regenerate the bindings:

```
${LISP-sbcl} \
    --eval "(asdf:load-system :sdl3-image)" \
    --eval "(uiop:quit)"
```

In most cases, this process should work without issues. However, if you
encounter problems (usually due to environment-specific factors like missing
include headers), you can use the `EXTRA_INCLUDES` environment variable to
specify additional include paths:

```
EXTRA_INCLUDES=/data1/include:/data1/lib/include \
    ${LISP-sbcl} \
        --eval "(asdf-load-system :sdl3-image)" \
        --eval "(uiop:quit)"
```

This approach allows you to provide the necessary include paths without modifying the source code.

## Issues

If you require further functions, please file an issue, **pull request**, or inquire in `#lispgames` on freenode.

If you can't load `libSDL3_image`, please ensure that you have SDL_image 3.0
installed, and not just 2.x.  Earlier versions will not work correctly.  In the
case of Windows, please ensure this, along with SDL3's DLLs, are installed in
the same directory as your Lisp `.exe`.

If you are sure all of this is correct, and it still will not load, please [file
an issue](https://github.com/lispgames/cl-sdl3-image/issues/new) and specify:

* Your platform and architecture
* Your lisp
* The absolute path to your installed `.so`, `.dll`, or the appropriate OSX framework

# Running the sdl3-image examples
Start your lisp:

```lisp
(asdf:load-system :sdl3-image-examples)
(sdl3-image-examples:image-test)
```

## OSX

Currently, initialisation must take place on your main thread:

```lisp
(asdf:load-system :sdl3-image-examples)

;; We should be able to run examples as normal on CCL
#-sbcl (sdl3-image-examples:image-test)

;; SBCL requires that we initialise in the main thread
#+sbcl (sdl3:make-this-thread-main #'sdl3-image-examples:image-test)
```

