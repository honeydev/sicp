(defn average-two [a b] (float (/ (+ a b) 2)))
(defn close-enough? [neg-point pos-point]
    (< (Math/abs (- neg-point pos-point)) 0.0001))
(defn sin [n] (Math/sin n))
(defn cos [n] (Math/cos n))

(defn search [f neg-point pos-point]
    (print "neg point" neg-point "pos point" pos-point "\n")
    (let [midpoint (average-two neg-point pos-point)]
        (if (close-enough? neg-point pos-point)
            midpoint
            (let [test-value (f midpoint)]
                (cond 
                    (> midpoint 0) (search f neg-point midpoint)
                    (< midpoint 0) (search f midpoint pos-point)
                    :else midpoint)))))

(defn half-interval-method [f a b]
    (let [[a-value b-value] [(f a) (f b)]]
       (cond (and (< a-value 0) (> b-value 0))
                (search f a b)
            (and (> a-value 0) (< b-value 0))
                (search f b a)
            :else (print "Arguments don't have different characters"))))


(defn tolerance [] 0.000000001)

(defn fixed-point [f first-guess]
    (defn close-enough? [v1 v2]
        (< (Math/abs (- v1 v2)) (tolerance)))
    (defn try-it [guess counter]
        (let [next (f guess)]
            (print "transformation number:" counter " " guess "->" next "\n")
            (if (close-enough? guess next)
                next
                (try-it next (+ counter 1)))))
    (try-it first-guess 1))

(defn fixed-point-method [x]
    (/ (Math/log 1000) (Math/log x)))

(defn fixed-point-method-avg [x]
    (average-two x (fixed-point-method x)))

(print (fixed-point fixed-point-method 2.0)) ; 56
(print (fixed-point fixed-point-method-avg 2.0)) ; 12
