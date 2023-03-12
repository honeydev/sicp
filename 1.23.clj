(defn square [n] (* n n))

(defn divides? [a b]
    (= (rem b a) 0))

(defn next-f [n]
    (if (= n 2)
        3
        (+ n 2)))

(defn find-divisor [n test-divisor]
    (cond (> (square test-divisor) n)
        n
        (divides? test-divisor n) test-divisor
        :else (find-divisor n (next-f test-divisor))))
