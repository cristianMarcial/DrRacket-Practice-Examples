#lang racket

;; 2025-02-20
(define (sumlist x)
  (cond 
    ((null? x) 0)
    (else (+ (car x) (sumlist (cdr x))))
  )
) ;; (sumlist '(1 2 3 4 5))

(define (fact x)
  (cond
    ((< x 1) 1)
    (else (* x (fact(- x 1))))
  )
)