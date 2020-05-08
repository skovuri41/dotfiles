{:user {:plugins      [[cider/cider-nrepl "0.24.0"]
                       [lein-pprint "1.1.2"]
                       [lein-try "0.4.3"]
                       [lein-ancient "0.6.14"]
                       [lein-exec "0.3.6"]
                       [lein-kibit "0.1.6"]
                       [com.jakemccrary/lein-test-refresh "0.20.0"]
                       [walmartlabs/vizdeps "0.1.6"]]
        :repl-options {:init (set! *print-length* 100)}
        :dependencies [[clj-kondo "RELEASE"]]
        :aliases      {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}}
