#!/usr/bin/env scheme --script
;;;        二叉树(插入数据为number类型)
;;;
;;; 树的左侧元素小于根,右侧的元素大于根

; constructor
(define (make-tree entry left right)
  (list entry left right))


; tree selector
(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (set-left-branch! tree left)
  (list-set! tree 1 left))

(define (set-right-branch! tree right)
  (list-set! tree 2 right))


; predicate
(define (empty-tree? tree)
  (and (null? (entry tree))
       (null? (left-branch tree))
       (null? (right-branch tree))))

(define (element-of-tree? elem tree)
  (if (empty-tree? tree)
      #f
      (cond ((= elem (entry tree)) #t)
            ((> elem (entry tree))
             (element-of-tree? elem (right-branch tree)))
            ((< elem (entry tree))
             (element-of-tree? elem (left-branch tree))))))


; auxiliary
(define (max-tree tree)
  (if (empty-tree? (right-branch tree))
      (entry tree)
      (max-tree (right-branch tree))))

(define (min-tree tree)
  (if (empty-tree? (left-branch tree))
      (entry tree)
      (min-tree (left-branch))))


; tree setter
(define (insert-tree! elem tree)
  (let ((new-node (make-tree elem '() '())))
    (cond ((empty-tree? tree) new-node)
          ((< elem (entry tree))
           (set-left-branch! tree (insert-tree! elem (left-branch tree))))
          ((> elem (entry tree))
           (set-right-branch! tree (insert-tree! elem (right-branch tree)))
           tree))))

(define (remove-tree! elem tree)
  (if (empty-tree? tree)
      (error
        "REMOVE called with an empty tree" tree)
      (cond ((= elem (entry tree))
             (let ((tmp (min-tree tree)))
               (set! (entry tree) tmp)
               (remove-tree! tmp (right-branch tree))))
            ((> elem (entry tree))
             (remove-tree! elem (right-branch tree)))
            ((< elem (entry tree))
             (remove-tree! elem (left-branch tree))))))
