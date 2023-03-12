(defn make-pair [x y]
    (fn [value-type]
        (cond (= value-type "numer") x
            (= value-type "denom") y
            :else (print "Unknown value type " value-type))))

(defn car [pair-value] (pair-value "numer"))
(defn cdr [pair-value] (pair-value "denom"))
(defn make-point [x y](make-pair x y))
(defn x-point [point] (car point))
(defn y-point [point] (cdr point))
(defn make-segment [point-a point-b]
    (make-pair point-a point-b))
(defn start-segment [segment] (car segment))
(defn end-segment [segment] (cdr segment))

(defn midpoint-segment [segment]
    (defn find-mid-point [p1 p2]
        (make-point
            (/ (+ (x-point p1) (x-point p2)) 2)
            (/ (+ (y-point p1) (y-point p2)) 2)))
    (let [
        a (start-segment segment)
        b (end-segment segment)]
        (find-mid-point a b)))

(defn print-point [p]
    (println (x-point p) (y-point p)))

(def s (make-segment (make-point -2 4) (make-point 4 12)))

(print-point (midpoint-segment s))
