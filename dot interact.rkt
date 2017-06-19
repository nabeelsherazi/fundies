;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |dot interact|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define BACKGROUND (empty-scene 500 500))
(define DOT (circle 3 "solid" "red"))

(define (main y)
  (big-bang y  ;; initialize big bang at state y, the y position of the dot
    [on-tick sub1]  ;; on tick subtract 1 from state, lowering the dot's y posn by 1
    [stop-when zero?]  ;; stop when the y posn becomes zero (at the top of the box)
    [to-draw place-dot-at]  ;; render a dot at posn y
    [on-key stop]))  ;; on key, immediately change state to zero

(define (place-dot-at y) (place-image DOT 250 y BACKGROUND))  ;; dot has a constant x posn

(define (stop y ke) 0)