---
title: 三个基本构造单元
date: 2018-03-10 18:22:23
tags:
---

代码: [https://github.com/ltoddy/beautiful-code/tree/master/basic-structural-unit](https://github.com/ltoddy/beautiful-code/tree/master/basic-structural-unit)

- ## 过滤(filter)

过滤(filter)是列表的一种基本操作,根据我们给出的条件,从一个大集合中选出符合我们条件的小集合.

```scheme
(define filter
    (lambda (proc iter)
      (cond
        ((null? iter) '())
        ((proc (car iter))
         (cons (car iter) (filter proc (cdr iter))))
        (else (filter proc (cdr iter))))))
```
过滤函数将我们(通常体现于高阶函数)给定的布尔逻辑作用于集合,返回由原来符合条件
的元素组成的子集合,filter操作常与查找(find)函数关系密切.


> 根据过滤条件来产生一个子集合的时候用filter

- ## 映射(map)

  映射(map)操作是对原集合的每一个元素执行给定的函数,从而转变成一个新集合.
  传给映射函数的是一个高阶函数和一个集合,它在对集合中每一个元素使用传入的函数后,产生另一个集合返回值.
  返回集合的大小与原来传入的集合相同,只是元素的值变了.

```scheme
(define map
    (lambda (proc iter)
      (if (null? iter)
          '()
          (cons (proc (car iter)) (map proc (cdr iter))))))
```

> 需要变换一个集合的时候,用map

- ## 折叠(reduce)

  折叠(reduce)用一个积累量来“收集”集合元素.reduce一般需要一个为积累量使用的初始值.

```scheme
(define reduce
    (lambda (proc init iter)
      (if (null? iter)
          init
          (proc (car iter) (reduce proc init (cdr iter))))))
```

> 把集合一小块一小块的处理的时候,用reduce

---------------

学习新范式的困难有一部分在于学习新的术语.假如遇到不同社群使用不同的术语的情况,想搞清楚就更难了.
不过只要抓住不同语言的共同点去观察,就能够看穿在形形色色的语法遮挡之下,其实功能大同小异.
