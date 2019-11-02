#lang racket
(require racket/set)
(require rackunit)
(require rackunit/text-ui)
(require math/statistics)

(define (jaccard txt1 txt2)
  (define lst0 (string-split txt1))
  (define lst1 (string-split txt2))
  (define intersectlst (set-intersect lst0 lst1))
  (define unionlst (set-union lst0 lst1))
  (exact->inexact (/ (length intersectlst) (length unionlst)))
)

(provide jaccard)