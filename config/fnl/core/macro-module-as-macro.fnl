(import-macros {: fn?} :core.macro-utils)

(lambda if-fn-hello-else-bye [x]
  (if
    (fn? x) `(print "Hello")
    `(print "Bye")))

{: if-fn-hello-else-bye}
