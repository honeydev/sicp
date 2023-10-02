(defn make-pair [a b] 
  (fn [] (int (* (Math/pow 2 a) (Math/pow 3 b)))))

(defn car [pair] (find-multiplicity 2 (pair)))
(defn cdr [pair] (find-multiplicity 3 (pair)))

(defn make-interval [a b] (make-pair a b))
(defn lower-bound [interbal] (car interval))
(defn upper-bound [interval] (cdr interval))
