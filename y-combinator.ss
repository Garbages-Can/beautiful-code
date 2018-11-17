(define Y
  (lambda (f)
    ((lambda (mk)
       (mk mk))
     (f (lambda (x) ((mk mk) x))))))
