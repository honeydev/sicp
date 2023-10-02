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
(defn center [interval]
  (/ (+ (lower-bound interval) (upper-bound interval))))
(defn print-interval [interval]
  (print (lower-bound interval) "/" (upper-bound interval) "\n"))

(defn make-center-percent [center percent]
  (let [
        lower-inaccuracy (float (- center (/ center percent)))
        upper-inaccuracy (float (+ center (/ center percent)))
        ]
        (make-interval lower-inaccuracy upper-inaccuracy)))
(defn percent [interval]
  (let [
        l (lower-bound interval)
        u (upper-bound interval)
        ]
    (* 100 (/ (- u l) (+ u l)))))

(def i (make-center-percent 6.8 10))
(print-interval i)
(println (center i))
(println (percent i))


