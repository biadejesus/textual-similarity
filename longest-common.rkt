#lang racket
(require racket/set)
(require rackunit)
(require rackunit/text-ui)
(require memoize)
(require math/statistics)

(define/memo (executa txt1 txt2 tam1 tam2)
  (cond
    ((equal? tam1 0) 0)
    ((equal? tam2 0) 0)
    ((equal? (string-ref txt1 (- tam1 1)) (string-ref txt2 (- tam2 1))) (+ 1 (executa txt1 txt2  (- tam1 1) (- tam2 1))))
    (else (max (executa txt1 txt2 tam1 (- tam2 1)) (executa txt1 txt2 (- tam1 1) tam2)))
  )
)

(define (longest-common-sub txt1 txt2)
  (define tam1 (string-length txt1))
  (define tam2 (string-length txt2))
  (define c (executa txt1 txt2 tam1 tam2))
  (cond
    [(< tam1 tam2) (exact->inexact (/ c tam2))]
    [(<= tam2 tam1) (exact->inexact (/ c tam1))]
  )
  )
  (provide longest-common-sub)
  (provide executa)