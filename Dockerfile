FROM ubuntu:latest

MAINTAINER iain mackie

# Install essentials
RUN apt-get update && apt-get install \
  	-y --no-install-recommends python3 python3-virtualenv \
    	&& apt-get install git -y 


# Pull required code
RUN git clone https://github.com/gsgoncalves/bert4trec 

# Build virtualenv
RUN python3 -m virtualenv --python=/usr/bin/python3 /opt/venv
RUN . /opt/venv/bin/activate && pip install -r bert4trec/requirements.txt

# Run Experiment
CMD . /opt/venv/bin/activate && exec python bert4trec/run_treccar.py \
	--data_dir=${DATA} \
  	--bert_config_file=${BERT} \
  	--init_checkpoint=${INIT} \
  	--output_dir=${OUTPUT} \
  	--trec_output=True \
  	--do_train=False \
  	--do_eval=True \
  	--num_train_steps=400000 \
  	--num_warmup_steps=40000 \
  	--train_batch_size=32 \
  	--eval_batch_size=32 \
  	--learning_rate=1e-6 \
  	--max_dev_examples=3000 \
  	--num_dev_docs=10 \
  	--max_test_examples=None \
  	--num_test_docs=1000

