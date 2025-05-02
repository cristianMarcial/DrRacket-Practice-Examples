#lang racket

;; (reverse '(1 2 3)) --> (3 2 1)

;; (reverse '(1 2 3)) --> append((reverse '(2 3)) (1))
;;
;; run as: (reverse '(1 2 3 4))

(define (reverse x)
  (cond ((null? x) x) ;; x es lista
     (else (append (reverse (cdr x)) (list (car x))) ;; append debe de recibir DOS listas. Hay types en racket 
     )
  )
)

;; cond hace lo sig: (cond (()())
;;                         (else () ))

;; (member 3 '(1 2 3 4 5)) --> #T

(define (member x y) ;; busca el 1st elem, si no es, busca (recursion) el sig. hasta que haya una lista vacio o lo encuentres
  (cond ((null? y) #F)
        ((equal? (car y) x) #T) ;; son iguales el elem de y & x
        (else (member x (cdr y)))
  )
) ;; test (member 3 '(1 2 3 4 5))

;; (intersect '(1 2 3 4) '(2 4 6 8)) --> (2 4) ; (intersect '() '(2 4 6 8)) --> '()

(define (intersect x y)
  (cond ((null? x) x)
        ((null? y) y)
        ((member (car x) y) (cons (car x) (intersect (cdr x) y))) ;; si car x esta en y, y si no... \/
        (else (intersect (cdr x) y))    ;; haz lo mismo pero con el sig.
  )
)

;; (diff '(1 2 3 4) '(2 4 6 8)) --> (1 3) // los elem que estan en x pero no en y; NO al reves

(define (diff x y)
  (cond ((null? x) x)
        ((null? y) x)
        ((member (car x) y) (diff (cdr x) y)) ;; LO MISMO que intersect pero al reves
        (else (cons (car x) (diff (cdr x) y))) 

  )
)

;; (union '(1 2 3 4) '(2 4 6 8)) --> (1 2 3 4 6 8)

(define (union x y)
  (append (append (diff x y)(intersect x y)) (diff y x))
)

(define (unionn x y) ;; ts better
  (append x (diff y x))
)
