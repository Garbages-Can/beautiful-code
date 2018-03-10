(define reduce
    (lambda (proc init iter)
      (if (null? iter)
          init
          (proc (car iter) (reduce proc init (cdr iter))))))

(display (reduce + 0 '(1 2 3)))
(newline)

;;; => 6
