#! /bin/bash
cp `pwd`/include/custom.css `dirname $1`
sudo docker run -p 8888:8888 -it -v `pwd`:/home/jovyan/work jupyter/scipy-notebook jupyter nbconvert --to slides $1 --post serve --ServePostProcessor.port=8888 --ServePostProcessor.ip=0.0.0.0 --template=include/custom_slides.tpl  --ServePostProcessor.reveal_cdn=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.4.1

#windows
#docker run --rm -it -p 8889:8888 -v C:\Users\white\numerical_stats:/home/jovyan jupyter/scipy-notebook jupyter nbconvert --to slides unit_11/lectures/lecture_2.ipynb --post serve --ServePostProcessor.port=8888 --ServePostProcessor.ip=0.0.0.0 --template=include/custom_slides.tpl  --ServePostProcessor.reveal_cdn=https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.6.0