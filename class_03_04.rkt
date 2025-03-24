#lang racket

; (oddsplit '(1 2 3 4 5 6 7)) --> (1 3 5 7)
; (evensplit '(1 2 3 4 5 6 7)) --> (2 4 6)

(define (oddsplit x)
  (cond ((null? x) x)
        ((null? (cdr x)) x) ; que pasa si la lista tiene solo un elm
        (else (cons (car x) (oddsplit (cdr (cdr x)))))
  )
)

(define (evensplit x)
  (cond ((null? x) x)
        ((null? (cdr x)) '()) ; que pasa si la lista tiene solo un elm
        (else (cons (car (cdr x)) (evensplit (cdr (cdr x))))) ; tengo que acceder al 2nd elm haciendo 1st CDR a x, luego el CAR de eso
  )
)

; idea de Diego
(define (evensplit2 x)
  (cond ((null? x) x)
        (else (oddsplit (cdr x))) ; tengo que acceder al 2nd elm haciendo 1st CDR a x, luego el CAR de eso
  )
)

;; ahora usare estas dos funcs para implementar lo siguiente
;; (mergesort '(2 -3 4 6 8 -1)) --> (-3 -1 2 4 6 8)

(define (mergesort x)
  (cond ((null? x) x)
        ((null? (cdr x)) x)
        (else (mergelist (mergesort(oddsplit x))
                         (mergesort(evensplit x))))
  )
)

(define (mergelist x y)
  (cond ((null? x) y)
        ((null? y) x)
        ((> (car x)(car y)) (cons (car y) (mergelist x (cdr y)))) ;; ahora comparemos cual elm de ellas es mayor
        (else (cons (car x)(mergelist (cdr x) y)))
  )
)

;;;;;;;; EN CUANTO A FACTORIALES

(define(factorial x)
  (cond ((equal? x 0) 1)
        (else (* x (factorial (- x 1))))
  )
)

; En Racket, la representacion de los datos ens dinamica. Nota como (factorial 10000) en el terminal no tiene las limitaciones de
; C o Java (los cuales el resultado de factorial esta limitada por el hardware) y este da un resultado gigantesco.
