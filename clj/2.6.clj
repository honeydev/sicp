(defn zero [] (fn [f] (fn [x] x)))
(defn add-1 [n] 
    (fn [f] (fn [x] (f ((n f) x)))))

(def first (zero))


(print (((add-1 first) (fn [x] (+ x 1))) 0))
