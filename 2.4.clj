(defn make-pair [x y]
    (fn [m] (m x y)))

(defn car [z] 
    (z (fn [p q] p)))

(defn cdr [z]
    (z (fn [p q] q)))

(println (car (make-pair 1 2)))
(println (cdr (make-pair 1 2)))
