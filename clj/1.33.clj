

(defn accamulate [stop-value, a, b, next, term, filter-condition]
  (if (> a b)
    stop-value
    (if (not (filter-condition a))
      (accamulate null (next a) b next term filter-condition)
      (term a (accamulate null (next a) b next term filter-condition)))))

(print (accamulate 0 1 5 inc (fn [a b] (+ (Math/pow a 2) b)) even?) "\n")
(print (accamulate 1 1 5 inc (fn [a b] (* (Math/pow a 3) b)) even?) "\n")