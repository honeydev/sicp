(defn tolerance [] 0.000000001)

(defn fixed-point [f first-guess]
    (defn close-enough? [v1 v2]
        (< (Math/abs (- v1 v2)) (tolerance)))
    (defn try-it [guess]
        (let [next (f guess)]
            (if (close-enough? guess next)
                next
                (try-it next))))
    (try-it first-guess))


(defn nth-root [n x damp-count]
    (defn f [y] (/ x (power y (- n 1))))
    (fixed-point ((repeated average-damp damp-count) f) 1.0))


(defn exp [n] (* 2.718 n))
