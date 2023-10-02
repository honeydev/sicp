(defn square [x] (* x x))

(defn compose [f g] (fn [x] (f (g x))))

(print ((compose square inc) 6))
