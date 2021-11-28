#lang racket
(require pollen/tag pollen/decode racket/date txexpr)
(provide (all-defined-out))

(module setup racket/base 
  (provide (all-defined-out))
  (define linebreak-separator ""))

(define (root . elements)
   (decode-elements
     elements
     #:txexpr-elements-proc decode-paragraphs
     #:exclude-tags '(ul ol code pre style script)))

(define year (date-year (current-date)))

(define bold  (default-tag-function 'strong))
(define italic(default-tag-function 'em))
(define item  (default-tag-function 'li))
(define list  (default-tag-function 'ul))

(define (link url text)     `(a ((href ,url)) ,text))
(define (codeblock . lines) `(code (pre ,@lines)))

(define (section name . elements)
  `(section ((id ,(string-downcase name)))
            (h2 (span ,name))
            ,@elements))

(define parameters (default-tag-function 'span #:class "parameters"))
(define command    (default-tag-function 'span #:class "command"))
(define describe   (default-tag-function 'p    #:class "describe"))

(define (parameter class-names name)
  (let ([classes (string-join `("parameter" ,class-names) " ")])
  `(span ((class ,classes)) ,name)))
