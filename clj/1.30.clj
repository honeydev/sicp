(defn sum [term a next b]
  (defn iter [a result]
    ; (print a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0)
)
    
(print (sum (fn [v] v) 1 inc 5))
