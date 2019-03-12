;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Triangle-World) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Nicholas Cain
; DrRacket Files
; Date: 3/12/2019

                                          ;;TRIANGLE WORLD;;

(require 2htdp/image)
(require 2htdp/universe)

;; GLOBAL DEFINITIONS
(define BACKGROUND(empty-scene 500 500 "orange"))
(define TRI(triangle 50 "outline" "purple"))

; A WorldState is a Number
; interp. the y-coordinate for the triangle

;draw-tri: WorldState -> Image
; Draws the triangle on the background at (250,y)
(define (draw-tri y)(place-image TRI 250 y BACKGROUND))

(check-expect (draw-tri 40)(place-image TRI 250 40 BACKGROUND))
(check-expect (draw-tri 90)(place-image TRI 250 90 BACKGROUND))

;move-tri: WorldState -> WorldState
; Move the triangle 10 pixels down each clock tick 
(define (move-tri y)(+ y 10))

(check-expect (move-tri 0)(+ 0 10))
(check-expect (move-tri 50)(+ 50 10))

;bottom?: WorldState -> Boolean
(define (bottom? y)(>= y 500))

(check-expect (bottom? 0) #false))
(check-expect (bottom? 500) #true))

;main: WorldState -> WorldState
; Creates the world, takes in the draw-tri, move-tri and bottom? functions and outputs

(define (main y0)
(big-bang y0
  [to-draw draw-tri]
  [on-tick move-tri]
  [stop-when bottom?]))

; Run
(main 0)