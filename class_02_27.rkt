#lang racket

;; pr/ btw en el examen vienen preguntas como estas. 

;; (filter > '(1 2 3 4 5) 3) --> '(4 5)

(define (filter f x n)
  (cond ((null? x) x) ;;caso base si x es vacio me devuelve una lista vacia
        ((f (car x) n)(cons (car x) (filter f (cdr x) n))) ;;si la comparation elem cumple con f,
        (else (filter f (cdr x) n))
  )
)

;; (flat '((1 2 (3)) (4 5 (6) (7 8))) ) --> '(1 2 3 4 5 6 7 8)

(define (flat x)
  (cond ((null? x) x)
        ((list? (car x)) (append (flat (car x)) (flat (cdr x))))
        (else (append (list (car x)) (flat (cdr x)))) ;; si NO es una lista
  )
)

;; Notes:
;; append pega dos listas en una sola; cons pone el 1st param como primer elemento de el 2ndo param, que es una lista.
;; (cons '(1 2 3) '(4 5))
;; si haces append con un elem que no es una lista, te generara una lista impropia.


;; --- Acerca de las funciones ---

;; map: 1st param es la funcion que se aplicara en el result
(map abs '(1 -2 3 -5 6 8)) ;;--> ((1 2 3 5 6 8))

(define (square x) (* x x))
(map square '(1 2 3 4 5))


;; hay 2 formas de escribir funciones: la forma que vimos anteriormente y el lambda.

(map (lambda (y)(* y y)) '(1 2 3 4 5))
;; la funcion lambda solo existira hasta que la use. En cambio la funcion de square existe fija en la memoria.

;; -------

;; (powerset '(1 2 3)) --> (() (1) (2) (3) (1 2) (1 3) (2 3) (1 2 3)) ;; todos los posibles subconj es 2^n, siendo n = list.len()

(define (powerset x)
  (cond ((null? x) '(()) )
        (else (append (powerset (cdr x))
                      (map (lambda (y)(cons (car x) y)) (powerset (cdr x))) ;; en cada iter, lambda crea un copy diferente, y el val de x es diff
                      ;; en cambio, con cons, esto solo funcionaria en la 1st iter.
              )
        )
  )
)

;; https://docs.racket-lang.org/guide/datatypes.html