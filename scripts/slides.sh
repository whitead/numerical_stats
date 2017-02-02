#!/bin/bash
docker run --net=host -it  -v /home/whitead/numerical_stats/:/home/jovyan/work jupyter/base-notebook jupyter nbconvert --to slides $1 --post serve --ServePostProcessor.reveal_cdn='https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.4.1' --ServePostProcessor.port=8000 --ServerPostProcessor.ip='*'
