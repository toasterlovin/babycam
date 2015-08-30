(defproject babycam "0.1.0-SNAPSHOT"
  :description "Spy on thy child"
  :dependencies [[org.clojure/clojure "1.7.0"]
		 [opencv/opencv "3.0.0"]
		 [opencv/opencv-native "3.0.0"]]
  :plugins [[lein-localrepo "0.5.3"]]
  :main ^:skip-aot babycam.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all}})
