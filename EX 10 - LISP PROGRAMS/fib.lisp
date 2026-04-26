(defun fib (n)
  (if (<= n 1)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(format t "Enter n: ")
(setq n (read))

(format t "Fibonacci number: ~a~%" (fib n))