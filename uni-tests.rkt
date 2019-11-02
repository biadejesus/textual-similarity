#lang racket

(require "longest-common.rkt")
(require "jaccard.rkt")

(require rackunit)
(require rackunit/text-ui)

(define long-c-test
  (test-suite
    "long-c-test"
    (test-case "hello"
      (check-equal? (longest-common-sub "hello" "goodbye") 0.14285714285714285)    
    )

    (test-case "Star Wars"
      (check-equal? (longest-common-sub "May the Force be with you." "May the Force be with you too.") 0.8666666666666667)
    )

    (test-case "WATCHMAN"
      (check-equal? (longest-common-sub "WHO WATCHES THE WATCHMAN?" "IM WATCHING YOU") 0.28)
    )

    (test-case "Dwight"
      (check-equal? (longest-common-sub "Bears, Beets, Battlestar Galactica." "Fact, Bears eat Beets.")  0.37142857142857144)
    )

    (test-case "RACKET"
      (check-equal? (longest-common-sub "FUNCIONAL" "FUNCIONAL")  1.0)
    )
  )
)


(define jacc-test
  (test-suite
    "jacc-test"
    (test-case "hello"
      (check-equal? (jaccard "hello" "goodbye")  0.0)    
    )

    (test-case "Star Wars"
      (check-equal? (jaccard "May the Force be with you." "May the Force be with you too.")  0.625)    
    )

    (test-case "WATCHMAN"
      (check-equal? (jaccard "WHO WATCHES THE WATCHMAN?" "IM WATCHING YOU")  0.0)    
    )

    (test-case "Dwight"
      (check-equal? (jaccard "Bears, Beets, Battlestar Galactica." "Fact, Bears eat beets.")  0.0)    
    )

    (test-case "RACKET"
      (check-equal? (jaccard "FUNCIONAL" "FUNCIONAL") 1.0)    
    )
  )
)

(define (executarTestes . testes)
  (run-tests (test-suite "Testes" testes))
  (void)
)

(executarTestes long-c-test jacc-test)

