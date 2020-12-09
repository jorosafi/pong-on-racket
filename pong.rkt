;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname pong) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/universe)
(require 2htdp/image)
(require spd/tags)

;;-----------------Constants----------------------------
(define BALL-RAD 10)
(define MTS (rectangle 1000 8000 "solid" "black"))

(@htdd Ball)
(define-struct ball(x y dx dy))
;; Ball is (make-ball Natural Natural Natural Natural)
;; interp position and velocity of ball
;;        - position x, y in screen coorinates
;;        - velocity dx, dy in pixels/tick

(define b1 (make-ball 0 0 10 10))

(define (fn-for-ball b)
  (... (ball-x b)
       (ball-y b)
       (ball-dx b)
       (ball-dy b)))
