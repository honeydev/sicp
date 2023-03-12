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
(defn div-interval
    (let
        [
            [lower (lower-bound div-interval)]
            [upper (upper-bound div-interval)]
        ]
        (if (< (* lower upper) 0))
            (println "Interavl lower than 0")))
