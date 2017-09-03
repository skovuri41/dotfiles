{:user {:dependencies [[pjstadig/humane-test-output "0.8.2"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :plugins [[lein-try "0.4.3"]
                  [lein-ancient "0.6.10"]
                  [lein-exec "0.3.6"]
                  [lein-kibit "0.1.5"]
                  [com.jakemccrary/lein-test-refresh "0.20.0"]
                  [walmartlabs/vizdeps "0.1.6"]
                  [venantius/ultra "0.5.1"]
                  [lein-pprint "1.1.2"]]
        :repl-options {:init (set! *print-length* 100)}}}
