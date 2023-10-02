(defn product-recursive [a, b, next, term]
  (if (> a b)
    1
    (* (term a) (product-recursive (next a) b next term))))


(defn f-recursive [n]
  (product-recursive 1 n inc (fn [v] v)))


(defn product-iter [a, b, next, term]
  (defn iter [a, result]
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))


(defn f-iter [n]
  (product-iter 1 n inc (fn [v] v)))
