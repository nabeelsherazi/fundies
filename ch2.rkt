;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ch2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)


(define (number->square s)
  (square s "solid" "red"))

(define (reset state event-desc) 100)


(big-bang 100 ;; current state, inital value
          [to-draw number->square]  ;; this function renders current state
          [on-tick sub1]  ;; on tick, do this function to state and save return value as new value
          [on-key reset]  ;; on key, do this function to state and save return value as new value
          [stop-when zero?])  ;; check if this function, applied to state returns #true,
                              ;; stop if so