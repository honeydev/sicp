(defn make-pair [x y]
    (fn [value-type]
        (cond (= value-type "numer") x
            (= value-type "denom") y
            :else (print "Unknown value type " value-type))))

(defn car [pair-value] (pair-value "numer"))
(defn cdr [pair-value] (pair-value "denom"))

(defn make-interval [a b] (make-pair a b))
(defn lower-bound [interval] (car interval))
(defn upper-bound [interval] (cdr interval))
(defn print-interval [interval]
    (println 
        "lower"
        (lower-bound interval)
        " / "
        "upper"
        (upper-bound interval)))

(defn sub-interval [i1 i2]
    (make-interval 
        (- (lower-bound i1) (lower-bound i2))
        (- (upper-bound i1) (upper-bound i2))))

(print-interval 
    (sub-interval 
        (make-interval 8 4)
        (make-interval 1 2)))
