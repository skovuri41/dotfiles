{:user {:plugins [[lein-try "0.4.3"]
                  [lein-ancient "0.6.10"]
                  [lein-exec "0.3.6"]]
        :repl-options {:init (set! *print-length* 100)}}
 :repl {:plugins [[cider/cider-nrepl "0.14.0"]]}}
