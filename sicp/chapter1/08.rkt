#lang racket/base

(require "../theory.rkt")
(require rackunit)

(define (cube x) (* x x x))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (solution x)
  (cuberoot-iter 1.0 x))

(define (improve-cube guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cuberoot-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cuberoot-iter (improve-cube guess x)
                     x)))




(check-equal? (floor (solution 27)) (floor 3.0))

