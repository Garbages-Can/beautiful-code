#!/usr/bin/env scheme --script
;;;        stack(filo)
;;; 栈(queue)是先进后出的数据结构
;;;
;;; 实现:
;;; 通过一个top(哑头部)指针的移动实现出栈和入栈操作
;;; 当有元素入栈时,top指针向上移动
;;; 当有元素出栈时,top指针向下移动


; constructor
(define (make-stack)
  (cons 'top '()))


; pointer selector
(define (top-ptr stack)
  (cdr stack))

; pointer setter
(define (set-top-ptr! stack item)
  (set-cdr! stack item))

; predicate
(define (empty-stack? stack)
  (equal? (cons 'top '()) stack))


; stack selector
(define (pop-stack! stack)
  (if (empty-stack? stack)
      (error "POP called with an empty stack" stack)
      (begin
        (set-top-ptr! stack
          (cdr (top-ptr stack)))
        stack)))

(define (push-stack! stack item)
  (let ([new-pair (cons item '())])
    (cond [(empty-stack? stack)
           (set-top-ptr! stack new-pair)
           stack]
          [else
            (set-cdr! new-pair (cdr stack))
            (set-top-ptr! stack new-pair)
            stack])))

(define (print-stack stack)
  (cdr stack))


(define s (make-stack))


;;; for test
;(write (print-stack (push-stack! s 'a)))(newline)
; ==> (a)
;(write (print-stack (push-stack! s 'a)))(newline)
; ==> (a a)
;(write (print-stack (pop-stack! s)))(newline)
; ==> (a)
;(write (print-stack (pop-stack! s)))(newline)
; ==> ()
;(write (empty-stack? s))(newline)
; ==> #t
