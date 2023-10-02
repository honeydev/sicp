(defn make-pair [x y]
    (fn [value-type]
        (cond (= value-type "numer") x
            (= value-type "denom") y
            :else (print "Unknown value type " value-type))))

(defn car [pair-value] (pair-value "numer"))
(defn cdr [pair-value] (pair-value "denom"))
(defn numer [rational] (car rational))
(defn denom [rational] (cdr rational))
(defn print-rat [rat]
    (println (numer rat) "/" (denom rat)))
(def pair (make-pair 1 2))



(defn make-rat [x y]
    (let [is-negative (or (< x 0) (< y 0))]
        (if is-negative
            (make-pair (-(Math/abs x)) (Math/abs y))
            (make-pair x y))))


(print-rat (make-rat -1 -2))
