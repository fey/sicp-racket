#lang racket/base
(require rackunit)

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (solution a b c)
  (let ((biggest (max a b c)))
  (cond ((and (< a b) (< a c)) (sum-of-squares b c))
        ((and (< b a) (< b c)) (sum-of-squares a c))
        ((and (< c b) (< c a)) (sum-of-squares a b))
        (else (* 2 (square biggest))))))

(check-equal? (solution 0 0 0) 0)
(check-equal? (solution 1 0 1) 2)
(check-equal? (solution 2 0 3) 13)