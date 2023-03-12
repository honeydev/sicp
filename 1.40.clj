(def dx 0.00001)
(defn deriv [g]
    (fn [x]
        (/ (- (g (+ x dx)) (g x))
            dx)))

(defn newton-transform [g] 
    (fn [x] (- x (/ (g x) ((deriv g) x)))))

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

(defn newtons-method [g guess]
    (fixed-point (newton-transform g) guess))

(defn tolerance [] 0.000000001)

(defn cubic [a b c]
    (fn [x] (+ (Math/pow x 3) (* a (Math/pow x 2)) (* b x) c)))

(print (newtons-method (cubic 3 -1 4) 1))