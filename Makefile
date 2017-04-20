train-local-debug:
	docker exec -it jupyter jupyter nbconvert --to script tumornormal/train.ipynb
	docker exec -it jupyter /bin/bash -c "cd tumornormal && DEBUG=False python3 train.py"

train:
	docker run -it --rm --name tf \
		-v `pwd`:/notebooks \
		-v /data/scratch/rcurrie/tumornormal:/notebooks/data \
		gcr.io/tensorflow/tensorflow bash