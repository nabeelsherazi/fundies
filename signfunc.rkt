;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname signfunc) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/batch-io)

(define (sign x)
  (cond
    [(> x 0) 1]
    [(= x 0) 0]
    [(< x 0) -1]))

; constants
(define WIDTH 500)
(define HEIGHT 500)
(define ROCKET (overlay (circle 10 "solid" "green") (rectangle 40 4 "solid" "green")))
(define MTSCN (empty-scene WIDTH HEIGHT "blue"))
(define V 3)

; functions
(define (rocket t)
  (cond
    [(<= (position t) TOP-TO-BOTTOM-DISTANCE) (place-image ROCKET (/ WIDTH 2) (position t) MTSCN)]
    [(> (position t) TOP-TO-BOTTOM-DISTANCE) (place-image ROCKET (/ WIDTH 2) TOP-TO-BOTTOM-DISTANCE MTSCN)]))


(define TOP-TO-BOTTOM-DISTANCE (- HEIGHT (/ (image-height ROCKET) 2)))

(define (position t) (* V t))

(define px "ayy lmao")
(define dx 42)
(define (check-convert s) (if (string? s) (string-length s) "not a string"))

(define (string-first s) (if (string? s) (substring s 0 1) "not a string"))

(define (image-classify img)
  (cond
    [(> (image-height img) (image-width img)) "tall"]
    [(< (image-height img) (image-width img)) "wide"]
    [(= (image-height img) (image-width img)) "square"]))

(define (opening firstname) (string-append "Dear " firstname ","))
(define (body fst lst) (string-append "We have discovered that everyone with the first name " fst " and the last
name " lst " have won the lottery! Please contact us to pick up your prize."))
(define (closing sig) (string-append "Sincerely, " "\n\n" sig "\n"))
(define (letter fst lst sig) (string-append (opening fst) "\n\n" (body fst lst) "\n\n" (closing sig)))

(write-file 'stdout (letter "Matthew" "Fisler" "Felleisen"))
