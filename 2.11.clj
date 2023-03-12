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
  (print (lower-bound interval) "/" (upper-bound interval) "\n"))

(defn mul-interval [a b]
  (let [
    lower-first (lower-bound a)
    upper-first (upper-bound a)
    lower-second (lower-bound b)
    upper-second (upper-bound b)
    ]
  (cond
    (>= lower-first 0) 
      (cond (>= lower-second 0) (make-interval (* lower-first lower-second) (* upper-first upper-second))
        (<= upper-second 0) (make-interval (* lower-second upper-first ) (* upper-second lower-first))
        :else (make-interval (* lower-second upper-first) (* upper-second upper-first)))
    (<= upper-first 0)
      (cond (>= lower-second 0) (make-interval (* lower-first upper-second) (* upper-first lower-second))
        (<= upper-second 0) (make-interval (* upper-first upper-second) (* lower-first lower-second))
        :else (make-interval (* lower-first upper-second) (* lower-first lower-second)))
    :else (cond (>= lower-second 0) (make-interval (* lower-first upper-second) (make-interval upper-first upper-second))
          (<= upper-second 0) (make-interval (* upper-first lower-second) (* lower-first lower-second))
          :else (make-interval (min (* lower-first upper-second) (* upper-first lower-second)) (min (* lower-first lower-second) (* upper-first upper-second)))))))

(print-interval (mul-interval (make-interval 1 2) (make-interval 3 4)))
(print-interval (mul-interval (make-interval 1 2) (make-interval -3 -4)))
(print-interval (mul-interval (make-interval 1 2) (make-interval -1 2)))
