(in-package :sdl3-image-examples)

(defun image-test ()
  "Test the SDL_image API"
  (with-init (:everything)
    (with-window (win :title "SDL3 Image Demo")
      (with-renderer (renderer win)
        (set-render-vsync renderer t)

        (let ((texture (sdl3-image:load-texture renderer (asdf:system-relative-pathname 'sdl3-image-examples "examples/lisplogo_fancy_256.png"))))

          (with-event-loop (:method :poll)
            (:key-up (:scancode scancode)
                     (when (scancode= scancode :escape)
                       (push-event :quit)))
            (:idle ()
                   (set-render-draw-color renderer 0 0 0 255)
                   (render-clear renderer)
                   (set-render-draw-color renderer 255 255 255 255)
                   (render-debug-text renderer 340.0 100.0 "Image Test")

                   (with-f-rects ((dest-rect 278.0 150.0 256.0 223.0))
                     (render-texture renderer texture :dest-f-rect dest-rect))
             (render-present renderer))
            (:quit () t)))))))
