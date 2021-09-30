{:user {:plugins      [[cider/cider-nrepl "0.25.9"]
                       [lein-pprint "1.3.2"]
                       [lein-try "0.4.3"]
                       [lein-ancient "0.7.0"]
                       [lein-exec "0.3.7"]
                       [lein-kibit "0.1.8"]
                       [com.jakemccrary/lein-test-refresh "0.24.1"]
                       [walmartlabs/vizdeps "0.2.0"]]
        :repl-options {:init (set! *print-length* 100)}
        :dependencies [[clj-kondo "RELEASE"]]
        :aliases      {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}}
