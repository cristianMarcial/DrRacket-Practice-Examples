#lang racket

(define (inner x) (+ x 5))

(define (outer1 x) (inner x))

(define (outer2 x) (let ((x 10))(inner x))) 

(outer1 2)
(outer2 2) ; el parametro es de 2 pero el resultado es 10+5
