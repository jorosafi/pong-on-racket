;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname pong) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/universe)
(require 2htdp/image)
(require spd/tags)

;;-----------------Constants----------------------------
(define BALL-RAD 10)

(define MTS-HEIGHT 500)
(define MTS-WIDTH 1000)

(define MTS-COLOR (make-color 57 255 20))
(define MTS-BACK-COLOR "black")

(define MTS (overlay (rectangle 10 MTS-HEIGHT "solid" MTS-COLOR)
                     (rectangle MTS-WIDTH MTS-HEIGHT "solid" MTS-BACK-COLOR)
                     (rectangle (+ MTS-WIDTH 20)
                                (+ MTS-HEIGHT 20)
                                "solid"
                                MTS-COLOR)))

(define PADDLE-HEIGHT 70)
(define PADDLE-WIDTH 10)
(define PADDLE (rectangle PADDLE-WIDTH PADDLE-HEIGHT "solid" "white"))

(define PADDLE-SPEED 10)

;;-----------------Data Definitions---------------------

(@htdd Ball)
(define-struct ball(x y dx dy))
;; Ball is (make-ball Natural Natural Natural Natural)
;; interp position and velocity of ball
;;        - position x, y in screen coorinates
;;        - velocity dx, dy in pixels/tick

(define B1 (make-ball 0 0 10 10))
(define B2 (make-ball 500 300 5 5))
(define B3 (make-ball 1000 600 -10 -10))

(define (fn-for-ball b)
  (... (ball-x b)
       (ball-y b)
       (ball-dx b)
       (ball-dy b)))



(@htdd ListOfBall)
;; ListOfBall is one of:
;;  - empty
;;  - (cons Ball ListOfBall)
;; interp. a list of balls
(define LOB1 empty)
(define LOB2 (cons B1 empty))
(define LOB3 (cons B2 (cons B1 empty)))

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref
                    self-ref)

(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fn-for-ball (first lob))
              (fn-for-lob (rest lob)))]))


(@htdd Game)
(define-struct game (balls paddle))
;; Game is (make-game ListOfBall Number)
;; interp. the current state of a game, with all the balls in play,
;;         as well as the x-position of the paddle in screen coordinates
(define G0 (make-game empty (/ MTS-WIDTH 2)))
(define G1 (make-game (cons B1 empty) (/ MTS-WIDTH 2)))
(define G2 (make-game LOB3 (/ MTS-WIDTH 2)))

(@dd-template-rules compound ref)

(define (fn-for-game g)
  (... (fn-for-lob (game-balls g))
       (game-paddle g)))

;;----------------------Functions--------------------------

(@htdf main)
(@signature Ball -> Ball)
;; Start the world with (main B1)

