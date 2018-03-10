(define filter
    (lambda (proc iter)
      (cond
        ((null? iter) '())
        ((proc (car iter))
         (cons (car iter) (filter proc (cdr iter))))
        (else (filter proc (cdr iter))))))

(display (filter even? '(1 2 3 4)))
(newline)
;;; => (2 4)


(let ((words '("People" "Daily" "Online" "focuses" "on" "China" "news"))
      (find (lambda (word)
              (if (string? word)
                  (> (string-length word) 5)
                  #f))))
  (display (filter find words))
  (newline))
;;; => (People Online focuses)
