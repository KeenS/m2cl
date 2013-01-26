
(defsystem m2cl
  :name "m2cl"
  :author "Nicolas Martyanoff"
  :license "BSD"
  :description "A handler for the mongrel2 HTTP server."
  :depends-on (:babel :cl-json :cl-ppcre :flexi-streams :salza2
               (:version :zmq "1.1.0"))
  :in-order-to ((test-op (load-op m2cl-test)))
  :components ((:module "src"
                :components ((:file "packages")
                             (:file "m2cl" :depends-on ("packages"))
                             (:file "resource" :depends-on ("m2cl"))))))

(defmethod perform ((o asdf:test-op) (c (eql (find-system :m2cl))))
  (funcall (intern "RUN!" :5am)
           (intern "MAIN" :m2cl-test)))
